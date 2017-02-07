package com.mit.information.controller;

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
import com.mit.common.model.CarModel;
import com.mit.common.utils.LoggerUtils;
import com.mit.core.mybatis.page.Pagination;
import com.mit.information.service.SCarModelService;

/**
 * @author yejianming
 * 车型管理
 */
@Controller
@Scope(value="prototype")
@RequestMapping("model")
public class ModelController extends BaseController{
	@Autowired

	SCarModelService sCarModelService;
	@RequestMapping(value="listCarModel")
	public ModelAndView listCarModel(ModelMap map,Integer pageNo,String findContent,String centerid){
		
		map.put("findContent", findContent);
		map.put("findCenterId",centerid==null?findCenterId:centerid);
		Pagination<CarModel> page = sCarModelService.findByPage(map,pageNo,pageSize);
		map.put("page", page);
		return new ModelAndView("information/model/listCarModel");
	}
	/**
	 * 车型添加
	 * @param carModel
	 * @return
	 */
	@RequestMapping(value="addCarModel",method=RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> addCarModel(CarModel carModel){
		try {
			int count = sCarModelService.insertSelective(carModel);
			resultMap.put("status", 200);
			resultMap.put("successCount", count);
		} catch (Exception e) {
			resultMap.put("status", 500);
			resultMap.put("message", "添加车型失败，请刷新后再试！");
			LoggerUtils.fmtError(getClass(), e, "添加车型报错。source[%s]",carModel.toString());
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
		return sCarModelService.deleteCarModelByid(ids);
	}
	/**
	 * 根据ID查询车型信息
	 * @param id
	 * @return
	 */
	@RequestMapping(value="editCarModelById")
	@ResponseBody
	public CarModel editCarModelById(Long id){
		CarModel carModel =sCarModelService.selectByPrimaryKey(id);
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
			int count = sCarModelService.updateByPrimaryKeySelective(carModel);
			resultMap.put("status", 200);
			resultMap.put("successCount", count);
		} catch (Exception e) {
			resultMap.put("status", 500);
			resultMap.put("message", "编辑车型失败，请刷新后再试！");
			LoggerUtils.fmtError(getClass(), e, "编辑车型报错。source[%s]",carModel.toString());
		}
		return resultMap;
	}
}
