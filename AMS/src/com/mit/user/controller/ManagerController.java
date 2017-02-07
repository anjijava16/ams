package com.mit.user.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mit.centerInfo.service.CenterInfoService;
import com.mit.common.controller.BaseController;
import com.mit.common.model.CenterInfo;
import com.mit.common.model.User;
import com.mit.common.utils.LoggerUtils;
import com.mit.core.mybatis.page.Pagination;
import com.mit.core.shiro.session.CustomSessionManager;
import com.mit.core.shiro.token.manager.TokenManager;
import com.mit.user.manager.UserManager;
import com.mit.user.service.UserService;
/**
 * 管理用户操作相关
 */
@Controller
@Scope(value="prototype")
@RequestMapping("manager")
public class ManagerController extends BaseController {
	/***
	 * 用户手动操作Session
	 * */
	@Autowired
	CustomSessionManager customSessionManager;
	@Autowired
	UserService userService;
	@Autowired
	CenterInfoService centerInfoService;
	/**
	 * 管理用户列表管理
	 * @return
	 */
	@RequestMapping(value="list")
	public ModelAndView list(ModelMap map,Integer pageNo,String findContent){

		map.put("findContent", findContent);
		map.put("findCenterId", findCenterId);
		Pagination<User> page = userService.findByPage(map,pageNo,pageSize);
		List<CenterInfo> centerList=new ArrayList<CenterInfo>();
		centerList=centerInfoService.ListCenterInfo(map);
		map.put("centerList", centerList);
		map.put("page", page);
		return new ModelAndView("manager/list");
	}
	
	/**
	 * 管理用户添加
	 * @return
	 */
	@RequestMapping(value="insert",method=RequestMethod.POST)
	@ResponseBody
         public Map<String,Object> insert(User user){
			try {
				//加工密码
				user = UserManager.md5Pswd(user);
				User entity = userService.insertSelective(user);
				resultMap.put("status", 200);
				resultMap.put("entity", entity);
			} catch (Exception e) {
				resultMap.put("status", 500);
				resultMap.put("message", "添加管理用户失败，请刷新后再试！");
				LoggerUtils.fmtError(getClass(), e, "添加管理用户报错。source[%s]", user.toString());
			}
			return resultMap;
		}

	/**
	 * 改变Session状态
	 * @param status
	 * @param sessionId
	 * @return
	 */
	@RequestMapping(value="changeSessionStatus",method=RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> changeSessionStatus(Boolean status,String sessionIds){
		return customSessionManager.changeSessionStatus(status,sessionIds);
	}
	/**
	 * 根据ID删除管理用户，
	 * @param ids	如果有多个，以“,”间隔。
	 * @return
	 */
	@RequestMapping(value="deleteManagerById",method=RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> deleteUserById(String ids){
		return userService.deleteUserById(ids);
	}
	/**
	 * 禁止登录
	 * @param id		用户ID
	 * @param status	1:有效，0:禁止登录
	 * @return
	 */
	@RequestMapping(value="forbidManagerById",method=RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> forbidUserById(Long id,Long status){
		return userService.updateForbidUserById(id,status);
	}
	/**
	 * 密码修改跳转
	 * @return
	 */
	@RequestMapping(value="editPswd",method=RequestMethod.GET)
	public ModelAndView ediPswd(Long userid){
		return new ModelAndView("manager/updatePwd");
	}
	/**
	 * 密码修改
	 * @return
	 */
	@RequestMapping(value="updatePswd",method=RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> updatePswd(String pswd,String newPswd){
		//根据当前登录的用户帐号 + 老密码，查询。
		String username = TokenManager.getToken().getUsername();
				pswd = UserManager.md5Pswd(username, pswd);
		User	user = userService.login(username, pswd);
		
		if("admin".equals(username)){
			resultMap.put("status", 300);
			resultMap.put("message", "管理员不准修改密码。");
			return resultMap;
		}
		
		if(null == user){
			resultMap.put("status", 300);
			resultMap.put("message", "密码不正确！");
		}else{
			user.setPassword(newPswd);
			//加工密码
			user = UserManager.md5Pswd(user);
			//修改密码
			userService.updateByPrimaryKeySelective(user);
			resultMap.put("status", 200);
			resultMap.put("message", "修改成功!");
			//重新登录一次
			TokenManager.login(user, Boolean.TRUE);
		}
		return resultMap;
	}
	/**
	 * 资料修改跳转
	 * @return
	 */
	@RequestMapping(value="editManager",method=RequestMethod.GET)
	public ModelAndView editManager(Long userid){
		User user=userService.selectByPrimaryKey(userid);
		ModelAndView mv = new ModelAndView("manager/updateInfo");
		mv.addObject(user);
		ModelMap map=new ModelMap();
		map.put("findCenterId", findCenterId);
		List<CenterInfo> centerList=new ArrayList<CenterInfo>();
		centerList=centerInfoService.ListCenterInfo(map);
		mv.addObject("centerList", centerList);
		return mv;
	}
	/**
	 * 资料修改
	 * @return
	 */
	@RequestMapping(value="updateManger",method=RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> updateManger(User entity){
		try {
			userService.updateByPrimaryKeySelective(entity);
			resultMap.put("status", 200);
			resultMap.put("message", "修改成功!");
		} catch (Exception e) {
			resultMap.put("status", 500);
			resultMap.put("message", "修改失败!");
			LoggerUtils.fmtError(getClass(), e, "修改信息出错。[%s]", JSONObject.fromObject(entity).toString());
		}
		return resultMap;
	}
}
