package com.mit.workplaceType.controller;

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
import com.mit.common.model.WorkplaceType;
import com.mit.common.utils.LoggerUtils;
import com.mit.core.mybatis.page.Pagination;
import com.mit.workplaceType.service.WorkplaceTypeService;


/**
 * @author yejianming
 */

@Controller
@Scope(value="prototype")
@RequestMapping("workplaceType")
public class WorkplaceTypeController  extends BaseController{


@Autowired

WorkplaceTypeService workplaceTypeService;
@RequestMapping(value="list")
public ModelAndView list(ModelMap map,Integer pageNo,String findContent){
	
	map.put("findContent", findContent);
	Pagination<WorkplaceType> page = workplaceTypeService.findByPage(map,pageNo,pageSize);
	map.put("page", page);
	return new ModelAndView("basicInfo/listBasicWorkplaceType");
}
/**
 * 删除基础工位类型，根据ID
 * @param id
 * @return
 */
@RequestMapping(value="deleteWorkplaceTypeById",method=RequestMethod.POST)
@ResponseBody
public Map<String,Object> deleteWorkplaceTypeByid(String ids){
	return workplaceTypeService.deleteWorkplaceTypeByid(ids);
}
/**
 * 基础工位类型添加
 * @param carModel
 * @return
 */
@RequestMapping(value="addWorkplaceType",method=RequestMethod.POST)
@ResponseBody
public Map<String,Object> addWorkplaceType(WorkplaceType workplaceType){
	try {
		int count = workplaceTypeService.insertSelective(workplaceType);
		resultMap.put("status", 200);
		resultMap.put("successCount", count);
	} catch (Exception e) {
		resultMap.put("status", 500);
		resultMap.put("message", "添加失败，请刷新后再试！");
		LoggerUtils.fmtError(getClass(), e, "添加基础工位分类报错。source[%s]",workplaceType.toString());
	}
	return resultMap;
}
/**
 * 根据ID查询基础工位类型信息
 * @param id
 * @return
 */
@RequestMapping(value="editWorkplaceTypeById")
@ResponseBody
public WorkplaceType editWorkplaceTypeById(Long id){
	WorkplaceType workplaceType = workplaceTypeService.selectByPrimaryKey(id);
	return workplaceType;
}
/**
 * 保存基础工位信息编辑
 * @return
 */
@RequestMapping(value="updateWorkplaceType",method=RequestMethod.POST)
@ResponseBody
public Map<String,Object> updateWorkplaceType(WorkplaceType workplaceType){
	try {
		int count =workplaceTypeService.updateByPrimaryKeySelective(workplaceType);
		resultMap.put("status", 200);
		resultMap.put("successCount", count);
	} catch (Exception e) {
		resultMap.put("status", 500);
		resultMap.put("message", "编辑基础工位类型失败，请刷新后再试！");
		LoggerUtils.fmtError(getClass(), e, "编辑基础工位类型报错。source[%s]",workplaceType.toString());
	}
	return resultMap;
}
}