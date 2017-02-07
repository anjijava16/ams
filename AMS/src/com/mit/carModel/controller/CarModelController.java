package com.mit.carModel.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mit.carModel.service.CarModelService;
import com.mit.common.controller.BaseController;
import com.mit.common.model.CarModel;
import com.mit.common.utils.LoggerUtils;
import com.mit.core.mybatis.page.Pagination;


/**
 * @author yejianming
 */

@Controller
@Scope(value="prototype")
@RequestMapping("carModel")
public class CarModelController  extends BaseController{


@Autowired

CarModelService carModelService;
@RequestMapping(value="list")
public ModelAndView list(ModelMap map,Integer pageNo,String findContent){
	
	map.put("findContent", findContent);
	Pagination<CarModel> page = carModelService.findByPage(map,pageNo,pageSize);
	map.put("page", page);
	return new ModelAndView("basicInfo/listBasicCarModel");
}
/**
 * 基础车型添加
 * @param carModel
 * @return
 */
@RequestMapping(value="addCarModel",method=RequestMethod.POST)
@ResponseBody
public Map<String,Object> addCarModel(CarModel carModel){
	try {
		int count = carModelService.insertSelective(carModel);
		resultMap.put("status", 200);
		resultMap.put("successCount", count);
	} catch (Exception e) {
		resultMap.put("status", 500);
		resultMap.put("message", "添加失败，请刷新后再试！");
		LoggerUtils.fmtError(getClass(), e, "添加基础车型报错。source[%s]",carModel.toString());
	}
	return resultMap;
}
/**
 * 删除车型，根据ID
 * @param id
 * @return
 */
@RequestMapping(value="deleteCarModelById",method=RequestMethod.POST)
@ResponseBody
public Map<String,Object> deleteCarModelByid(String ids){
	return carModelService.deleteCarModelByid(ids);
}
/**
 * 根据ID查询车型信息
 * @param id
 * @return
 */
@RequestMapping(value="editCarModelById")
@ResponseBody
public CarModel editCarModelById(Long id){
	CarModel carModel = carModelService.selectByPrimaryKey(id);
	return carModel;
}
/**
 * 保存车型编辑
 * @param carMode
 * @return
 */
@RequestMapping(value="updateCarModel",method=RequestMethod.POST)
@ResponseBody
public Map<String,Object> updateCarModel(CarModel carModel){
	try {
		int count = carModelService.updateByPrimaryKeySelective(carModel);
		resultMap.put("status", 200);
		resultMap.put("successCount", count);
	} catch (Exception e) {
		resultMap.put("status", 500);
		resultMap.put("message", "编辑基础车型失败，请刷新后再试！");
		LoggerUtils.fmtError(getClass(), e, "编辑基础车型报错。source[%s]",carModel.toString());
	}
	return resultMap;
}
}