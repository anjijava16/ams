package com.mit.carParts.controller;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mit.carParts.service.CarPartsService;
import com.mit.common.controller.BaseController;
import com.mit.common.model.CarParts;
import com.mit.common.utils.LoggerUtils;
import com.mit.core.mybatis.page.Pagination;


/**
 * @author yejianming
 */

@Controller
@Scope(value="prototype")
@RequestMapping("carParts")
public class CarPartsController  extends BaseController{


@Autowired

CarPartsService carPartsService;

@RequestMapping(value="list")
public ModelAndView list(ModelMap map,Integer pageNo,String findContent){
	
	map.put("findContent", findContent);
	Pagination<CarParts> page = carPartsService.findByPage(map,pageNo,pageSize);
	map.put("page", page);
	return new ModelAndView("basicInfo/listBasicCarParts");
}

/**
 * 基础配件添加跳转
 * @return
 */
@RequestMapping(value="toAddCarParts",method=RequestMethod.GET)
public ModelAndView toAddCarParts(){
	ModelAndView mv=new ModelAndView("basicInfo/addBasicCarParts");
	ArrayList<String> partstypeList=new ArrayList<String>();
	partstypeList.add("保养件");
	partstypeList.add("易损件");
	partstypeList.add("事故件");
	partstypeList.add("非常用件");
	partstypeList.add("辅料");
	partstypeList.add("精品附件");
	mv.addObject("partstypeList", partstypeList);
	return mv;
}
/**
 * 基础配件添加
 * @param carParts
 * @return
 */
@RequestMapping(value="addCarParts",method=RequestMethod.POST)
@ResponseBody
public Map<String,Object> addCarParts(CarParts carParts){
	try {
		int count = carPartsService.insertSelective(carParts);
		resultMap.put("status", 200);
		resultMap.put("successCount", count);
	} catch (Exception e) {
		resultMap.put("status", 500);
		resultMap.put("message", "添加基础配件失败，请刷新后再试！");
		LoggerUtils.fmtError(getClass(), e, "添加基础配件报错。source[%s]",carParts.toString());
	}
	return resultMap;
}
/**
 * 删除基础配件，根据ID
 * @param id
 * @return
 */
@RequestMapping(value="deleteCarPartsById",method=RequestMethod.POST)
@ResponseBody
public Map<String,Object> deleteCarPartsByid(String ids){
	return carPartsService.deleteCarPartsByid(ids);
}
/**
 * 根据ID查询配件信息
 * @param id
 * @return
 */
@RequestMapping(value="editCarPartsById",method=RequestMethod.GET)
@ResponseBody
public ModelAndView editCarPartsById(Long id){
	CarParts carParts = carPartsService.selectByPrimaryKey(id);
	ModelAndView mv = new ModelAndView("basicInfo/editBasicCarParts");
	ArrayList<String> partstypeList=new ArrayList<String>();
	partstypeList.add("保养件");
	partstypeList.add("易损件");
	partstypeList.add("事故件");
	partstypeList.add("非常用件");
	partstypeList.add("辅料");
	partstypeList.add("精品附件");
	mv.addObject("partstypeList", partstypeList);
	mv.addObject(carParts);
	return mv;

}
/**
 * 保存备件编辑
 * @param carParts
 * @return
 */
@RequestMapping(value="updateCarParts",method=RequestMethod.POST)
@ResponseBody
public Map<String,Object> updateCarParts(CarParts carParts){
	try {
		int count = carPartsService.updateByPrimaryKeySelective(carParts);
		resultMap.put("status", 200);
		resultMap.put("successCount", count);
	} catch (Exception e) {
		resultMap.put("status", 500);
		resultMap.put("message", "编辑基础配件失败，请刷新后再试！");
		LoggerUtils.fmtError(getClass(), e, "编辑基础配件报错。source[%s]",carParts.toString());
	}
	return resultMap;
}
}