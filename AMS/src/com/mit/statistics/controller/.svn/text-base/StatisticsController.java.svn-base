package com.mit.statistics.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.mit.common.controller.BaseController;
import com.mit.common.model.Employee;
import com.mit.common.utils.DateUtil;
import com.mit.common.utils.StringUtils;
import com.mit.core.shiro.token.manager.TokenManager;
import com.mit.information.service.EmployeeService;
import com.mit.order.bo.Order;
import com.mit.order.bo.OrderItem;
import com.mit.order.bo.OrderParts;
import com.mit.statistics.service.StatisticsService;

/**
 * @author 刘鹏飞
 * @date 2016-11-24
 */

@Controller
@Scope(value = "prototype")
@RequestMapping("statistics")
public class StatisticsController extends BaseController {

	@Autowired
	StatisticsService statisticsService;
	@Autowired
	EmployeeService employeeService;
	
	/**
	 * 工单统计
	 * @return
	 */
	@RequestMapping(value="/orderSta")
	public ModelAndView orderSta(String cus_name, String car_plates, String start_time, String end_time){
		ModelAndView mv = new ModelAndView("statistics/list");
		try {
			resultMap.put("centerid", findCenterId==null?"0":findCenterId);
			resultMap.put("cus_name", cus_name);
			resultMap.put("car_plates", car_plates);
			if(StringUtils.isNotBlank(start_time)){
				resultMap.put("start_time", timeFormat.parse(start_time + " 00:00:00"));
			}
			if(StringUtils.isNotBlank(end_time)){
				resultMap.put("end_time", timeFormat.parse(end_time + " 23:59:59"));
			}
			List<Order> orderList = statisticsService.findOrderStatistics(resultMap);
			mv.addObject("orderList", orderList);
			mv.addObject("start_time", start_time);
			mv.addObject("end_time", end_time);
		} catch (Exception e) {
			e.printStackTrace();
		}
		TokenManager.setVal2Session("menuFlag", "sorder");//菜单选中判断
		return mv;
	}
	/**
	 * 备件统计
	 * @return
	 */
	@RequestMapping(value="/partsSta")
	public ModelAndView partsSta(String start_time, String end_time){
		ModelAndView mv = new ModelAndView("statistics/listParts");
		try {
			resultMap.put("centerid", findCenterId==null?"0":findCenterId);
			if(StringUtils.isNotBlank(start_time)){
				resultMap.put("start_time", timeFormat.parse(start_time + " 00:00:00"));
			}
			if(StringUtils.isNotBlank(end_time)){
				resultMap.put("end_time", timeFormat.parse(end_time + " 23:59:59"));
			}
			List<OrderParts> partsList = statisticsService.findPartsStatistics(resultMap);
			mv.addObject("partsList", partsList);
			mv.addObject("start_time", start_time);
			mv.addObject("end_time", end_time);
		} catch (Exception e) {
			e.printStackTrace();
		}
		TokenManager.setVal2Session("menuFlag", "sparts");//菜单选中判断
		return mv;
	}
	/**
	 * 工作量统计
	 * @return
	 */
	@RequestMapping(value="/empSta")
	public ModelAndView empSta(String start_time, String end_time){
		ModelAndView mv = new ModelAndView("statistics/listEmp");
		try {
			List<OrderItem> oiList = new ArrayList<OrderItem>();
			resultMap.put("findCenterId", findCenterId==null?"0":findCenterId);
			List<Employee> empList = employeeService.ListEmployee(resultMap);//所有工人
			for (Employee employee : empList) {
				if(StringUtils.isNotBlank(start_time)){
					resultMap.put("start_time", timeFormat.parse(start_time + " 00:00:00"));
				}
				if(StringUtils.isNotBlank(end_time)){
					resultMap.put("end_time", timeFormat.parse(end_time + " 23:59:59"));
				}
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
			mv.addObject("start_time", start_time);
			mv.addObject("end_time", end_time);
		} catch (Exception e) {
			e.printStackTrace();
		}
		TokenManager.setVal2Session("menuFlag", "semp");//菜单选中判断
		return mv;
	}

}