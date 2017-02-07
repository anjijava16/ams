package com.mit.user.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONObject;

import org.apache.shiro.authc.DisabledAccountException;
import org.apache.shiro.web.util.SavedRequest;
import org.apache.shiro.web.util.WebUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mit.carModel.service.CarModelService;
import com.mit.common.controller.BaseController;
import com.mit.common.model.CarModel;
import com.mit.common.model.User;
import com.mit.common.utils.LoggerUtils;
import com.mit.common.utils.StringUtils;
import com.mit.common.utils.VerifyCodeUtils;
import com.mit.core.shiro.token.manager.TokenManager;
import com.mit.core.statics.Constant;
import com.mit.customer.service.CustomerService;
import com.mit.dict.bo.DictData;
import com.mit.dict.service.DictService;
import com.mit.user.manager.UserManager;
import com.mit.user.service.UserService;

/**
 * @author yejianming
 */
@Controller
@Scope(value = "prototype")
@RequestMapping("u")
public class UserLoginController extends BaseController {

	@Resource
	UserService userService;
	@Resource
	CustomerService customerService;
	@Autowired
	DictService dictService;
	@Autowired
	CarModelService carModelService;

	/**
	 * 登录跳转
	 * 
	 * @return
	 */
	@RequestMapping(value = "login", method = RequestMethod.GET)
	public ModelAndView login() {

		return new ModelAndView("views/login");
	}

	/**
	 * 注册跳转
	 * 
	 * @return
	 */
	@RequestMapping(value = "register", method = RequestMethod.GET)
	public ModelAndView register() {

		return new ModelAndView("user/register");
	}

	/**
	 * 注册 && 登录
	 * 
	 * @param vcode
	 *            验证码
	 * @param entity
	 *            UUser实体
	 * @return
	 */
	@RequestMapping(value = "subRegister", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> subRegister(String vcode, User entity) {
		resultMap.put("status", 400);
		if (!VerifyCodeUtils.verifyCode(vcode)) {
			resultMap.put("message", "验证码不正确！");
			return resultMap;
		}
		String username = entity.getUsername();
		User user = userService.findUserByName(username);
		if (null != user) {
			resultMap.put("message", "帐号已经存在！");
			return resultMap;
		}
		// 把密码md5
		entity = UserManager.md5Pswd(entity);
		// 设置有效
		entity.setStatus(User._1);

		entity = userService.insertSelective(entity);
		LoggerUtils.fmtDebug(getClass(), "注册插入完毕！",
				JSONObject.fromObject(entity).toString());
		entity = TokenManager.login(entity, Boolean.TRUE);
		LoggerUtils.fmtDebug(getClass(), "注册后，登录完毕！",
				JSONObject.fromObject(entity).toString());
		resultMap.put("message", "注册成功！");
		resultMap.put("status", 200);
		return resultMap;
	}

	/**
	 * 登录提交
	 * 
	 * @param entity
	 *            登录的UUser
	 * @param rememberMe
	 *            是否记住
	 * @param request
	 *            request，用来取登录之前Url地址，用来登录后跳转到没有登录之前的页面。
	 * @return
	 */
	@RequestMapping(value = "submitLogin", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> submitLogin(User entity, Boolean rememberMe,
			HttpServletRequest request) {

		try {
			rememberMe = true;
			entity = TokenManager.login(entity, rememberMe);
			resultMap.put("status", 200);
			resultMap.put("message", "登录成功");

			/**
			 * shiro 获取登录之前的地址 之前0.1版本这个没判断空。
			 */
			SavedRequest savedRequest = WebUtils.getSavedRequest(request);
			String url = null;
			if (null != savedRequest) {
				url = savedRequest.getRequestUrl();
			}
			/**
			 * 我们平常用的获取上一个请求的方式，在Session不一致的情况下是获取不到的 String url = (String)
			 * request.getAttribute(WebUtils.FORWARD_REQUEST_URI_ATTRIBUTE);
			 */
			LoggerUtils.fmtDebug(getClass(), "获取登录之前的URL:[%s]", url);
			// 如果登录之前没有地址，那么就跳转到首页。
			if (StringUtils.isBlank(url)) {
				url = request.getContextPath() + "/user/index";
			}
			// 跳转地址
			resultMap.put("back_url", url);

			TokenManager.setVal2Session("adm_id", entity.getId());
			TokenManager.setVal2Session("nickName", entity.getTrueName());
			TokenManager.setVal2Session("admin_centerid", entity.getCenterid());
			// 存数据字典
			setDictData();
			/**
			 * 这里其实可以直接catch Exception，然后抛出 message即可，但是最好还是各种明细catch 好点。。
			 */
		} catch (DisabledAccountException e) {
			resultMap.put("status", 500);
			resultMap.put("message", "帐号已经禁用。");
		} catch (Exception e) {
			e.printStackTrace();
			resultMap.put("status", 500);
			resultMap.put("message", "帐号或密码错误");
		}
		return resultMap;
	}

	/**
	 * 退出
	 * 
	 * @return
	 */
	@RequestMapping(value = "logout", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> logout() {
		try {
			TokenManager.logout();
			resultMap.put("status", 200);
		} catch (Exception e) {
			resultMap.put("status", 500);
			logger.error("errorMessage:" + e.getMessage());
			LoggerUtils.fmtError(getClass(), e, "退出出现错误，%s。", e.getMessage());
		}
		// 跳转地址
		resultMap.put("back_url", "u/login");
		return resultMap;
	}

	/**
	 * 
	 * @Title: setDictData
	 * @Description: 设置数据字典到缓存
	 * @param 设定文件
	 * @return void 返回类型
	 * @throws
	 */
	public void setDictData() {
		List<DictData> dictDatas = dictService.findAllData();
		List<DictData> idType = new ArrayList<DictData>();
		List<DictData> outerColor = new ArrayList<DictData>();
		List<DictData> innerColor = new ArrayList<DictData>();
		List<DictData> useType = new ArrayList<DictData>();
		List<DictData> nation = new ArrayList<DictData>();
		List<DictData> relation = new ArrayList<DictData>();
		List<DictData> repairType = new ArrayList<DictData>();
		List<DictData> repairMethod = new ArrayList<DictData>();
		List<DictData> partsType = new ArrayList<DictData>();
		List<CarModel> carModels = carModelService.ListCarModel(null);
		for (DictData dictData : dictDatas) {
			if (Constant.ID_TYPE.equals(dictData.getDict_code())) {
				idType.add(new DictData(dictData.getDict_code(), dictData
						.getData_key(), dictData.getData_value()));
			}
			if (Constant.OUTER_COLOR.equals(dictData.getDict_code())) {
				outerColor.add(new DictData(dictData.getDict_code(), dictData
						.getData_key(), dictData.getData_value()));
			}
			if (Constant.INNER_COLOR.equals(dictData.getDict_code())) {
				innerColor.add(new DictData(dictData.getDict_code(), dictData
						.getData_key(), dictData.getData_value()));
			}
			if (Constant.USE_TYPE.equals(dictData.getDict_code())) {
				useType.add(new DictData(dictData.getDict_code(), dictData
						.getData_key(), dictData.getData_value()));
			}
			if (Constant.NATION.equals(dictData.getDict_code())) {
				nation.add(new DictData(dictData.getDict_code(), dictData
						.getData_key(), dictData.getData_value()));
			}
			if (Constant.RELATION.equals(dictData.getDict_code())) {
				relation.add(new DictData(dictData.getDict_code(), dictData
						.getData_key(), dictData.getData_value()));
			}
			if (Constant.REPAIR_TYPE.equals(dictData.getDict_code())) {
				repairType.add(new DictData(dictData.getDict_code(), dictData
						.getData_key(), dictData.getData_value()));
			}
			if (Constant.REPAIR_METHOD.equals(dictData.getDict_code())) {
				repairMethod.add(new DictData(dictData.getDict_code(), dictData
						.getData_key(), dictData.getData_value()));
			}
			if (Constant.PARTS_TYPE.equals(dictData.getDict_code())) {
				partsType.add(new DictData(dictData.getDict_code(), dictData
						.getData_key(), dictData.getData_value()));
			}
		}
		TokenManager.setVal2Session(Constant.ID_TYPE, idType);
		TokenManager.setVal2Session(Constant.OUTER_COLOR, outerColor);
		TokenManager.setVal2Session(Constant.INNER_COLOR, innerColor);
		TokenManager.setVal2Session(Constant.USE_TYPE, useType);
		TokenManager.setVal2Session(Constant.NATION, nation);
		TokenManager.setVal2Session(Constant.RELATION, relation);
		TokenManager.setVal2Session(Constant.REPAIR_TYPE, repairType);
		TokenManager.setVal2Session(Constant.REPAIR_METHOD, repairMethod);
		TokenManager.setVal2Session(Constant.CAR_MODELS, carModels);
		TokenManager.setVal2Session(Constant.PARTS_TYPE, partsType);
	}
}
