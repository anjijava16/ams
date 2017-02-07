package com.mit.workingHours.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mit.common.controller.BaseController;
import com.mit.common.model.WorkingHours;
import com.mit.common.utils.LoggerUtils;
import com.mit.core.mybatis.page.Pagination;
import com.mit.workingHours.service.WorkingHoursService;


/**
 * @author yejianming
 * @date 2016-10-27
 */

@Controller
@Scope(value="prototype")
@RequestMapping("workingHours")
public class WorkingHoursController  extends BaseController{


@Autowired

WorkingHoursService workingHoursService;
@RequestMapping(value="list")
public ModelAndView list(ModelMap map,Integer pageNo,String findContent){
	
	map.put("findContent", findContent);
	Pagination<WorkingHours> page = workingHoursService.findByPage(map,pageNo,pageSize);
	map.put("page", page);
	return new ModelAndView("basicInfo/listBasicWorkingHours");
}

/**
 * 基础标准工时添加跳转
 * @return
 */
@RequestMapping(value="toAddWorkingHours",method=RequestMethod.GET)
public ModelAndView toAddCarParts(){
	ModelAndView mv=new ModelAndView("basicInfo/addBasicWorkingHours");
	return mv;
}
/**
 * 基础标准工时添加
 * @param carParts
 * @return
 */
@RequestMapping(value="addWorkingHours",method=RequestMethod.POST)
@ResponseBody
public Map<String,Object> addWorkingHours(WorkingHours workingHours){
	try {
		int count = workingHoursService.insertSelective(workingHours);
		resultMap.put("status", 200);
		resultMap.put("successCount", count);
	} catch (Exception e) {
		resultMap.put("status", 500);
		resultMap.put("message", "添加基础标准工时失败，请刷新后再试！");
		LoggerUtils.fmtError(getClass(), e, "添加基础标准工时报错。source[%s]",workingHours.toString());
	}
	return resultMap;
}
/**
 * 删除基础标准工时，根据ID
 * @param id
 * @return
 */
@RequestMapping(value="deleteWorkingHoursById",method=RequestMethod.POST)
@ResponseBody
public Map<String,Object> deleteWorkingHoursByid(String ids){
	return workingHoursService.deleteWorkingHoursByid(ids);
}
/**
 * 根据ID查询配件信息
 * @param id
 * @return
 */
@RequestMapping(value="editWorkingHoursById",method=RequestMethod.GET)
@ResponseBody
public ModelAndView editWorkingHoursById(Long id){
	WorkingHours workingHours =workingHoursService.selectByPrimaryKey(id);
	ModelAndView mv = new ModelAndView("basicInfo/editBasicWorkingHours");
	
	mv.addObject(workingHours);
	return mv;

}
/**
 * 保存标准工时编辑
 * @param carParts
 * @return
 */
@RequestMapping(value="updateWorkingHours",method=RequestMethod.POST)
@ResponseBody
public Map<String,Object> updateWorkingHours(WorkingHours workingHours){
	try {
		int count = workingHoursService.updateByPrimaryKeySelective(workingHours);
		resultMap.put("status", 200);
		resultMap.put("successCount", count);
	} catch (Exception e) {
		resultMap.put("status", 500);
		resultMap.put("message", "编辑基础标准工时失败，请刷新后再试！");
		LoggerUtils.fmtError(getClass(), e, "编辑基础标准工时报错。source[%s]",workingHours.toString());
	}
	return resultMap;
}
}