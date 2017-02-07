package com.mit.user.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mit.common.controller.BaseController;
import com.mit.common.model.Employee;
import com.mit.common.model.User;
import com.mit.common.utils.DateUtil;
import com.mit.common.utils.LoggerUtils;
import com.mit.common.utils.StringUtils;
import com.mit.core.shiro.token.manager.TokenManager;
import com.mit.information.service.EmployeeService;
import com.mit.order.bo.Order;
import com.mit.order.bo.OrderItem;
import com.mit.order.bo.OrderParts;
import com.mit.statistics.service.StatisticsService;
import com.mit.user.manager.UserManager;
import com.mit.user.service.UserService;

/**
 * @author yejianming 
 */
@Controller
@Scope(value="prototype")
@RequestMapping("user")
public class UserCoreController extends BaseController {

	@Resource
	UserService userService;
	@Autowired
	StatisticsService statisticsService;
	@Autowired
	EmployeeService employeeService;
	/**
	 * 个人资料
	 * @return
	 */
	@RequestMapping(value="index",method=RequestMethod.GET)
	public ModelAndView userIndex(){
		ModelAndView mv = new ModelAndView("views/index");
		resultMap.put("centerid", findCenterId==null?"0":findCenterId);
		List<Order> orderList = statisticsService.findOrderStatistics(resultMap);
		mv.addObject("orderList", orderList);
		
		List<OrderParts> partsList = statisticsService.findPartsStatistics(resultMap);
		mv.addObject("partsList", partsList);
		
		List<OrderItem> oiList = new ArrayList<OrderItem>();
		resultMap.put("findCenterId", findCenterId==null?"0":findCenterId);
		List<Employee> empList = employeeService.ListEmployee(resultMap);//所有工人
		for (Employee employee : empList) {
			resultMap.put("emp_id", employee.getId());
			List<OrderItem> orderItems = statisticsService.getEmpWorkHour(resultMap);//每个工人对应的工单项目
			long workHour = 0;
			for (OrderItem orderItem : orderItems) {
				long itemHour = DateUtil.getDiff(orderItem.getStart_time(), orderItem.getEnd_time());
				workHour += itemHour;
			}
			OrderItem oi = new OrderItem();
			oi.setRep_emp_name(employee.getE_name());
			oi.setHour_total(workHour);
			oiList.add(oi);
		}
		mv.addObject("oiList", oiList);
		if(null != oiList && oiList.size() > 0){
			mv.addObject("empNum", oiList.size());
		} else {
			mv.addObject("empNum", 0);
		}
		return mv;
	}
	
	
	/**
	 * 偷懒一下，通用页面跳转
	 * @param page
	 * @return
	 */
	@RequestMapping(value="{page}",method=RequestMethod.GET)
	public ModelAndView toPage(@PathVariable("page")String page){
		return new ModelAndView(String.format("user/%s", page));
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
	 * 个人资料修改
	 * @return
	 */
	@RequestMapping(value="updateSelf",method=RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> updateSelf(User entity){
		try {
			userService.updateByPrimaryKeySelective(entity);
			resultMap.put("status", 200);
			resultMap.put("message", "修改成功!");
		} catch (Exception e) {
			resultMap.put("status", 500);
			resultMap.put("message", "修改失败!");
			LoggerUtils.fmtError(getClass(), e, "修改个人资料出错。[%s]", JSONObject.fromObject(entity).toString());
		}
		return resultMap;
	}
}
