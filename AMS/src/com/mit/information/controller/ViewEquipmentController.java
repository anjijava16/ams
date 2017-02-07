package com.mit.information.controller;

import java.util.List;
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
import com.mit.common.model.ViewEquipment;
import com.mit.common.utils.LoggerUtils;
import com.mit.core.mybatis.page.Pagination;
import com.mit.information.bo.StationBo;
import com.mit.information.service.ViewEquipmentService;

@Controller
@Scope(value="prototype")
@RequestMapping("equipment")
public class ViewEquipmentController extends BaseController{
	
	@Autowired

	ViewEquipmentService viewEquipmentService;
	@RequestMapping(value="listViewEquipment")
	public ModelAndView listViewEquipment(ModelMap map,Integer pageNo,String findContent,String centerid){
		
		map.put("findContent", findContent);
		map.put("findCenterId",centerid==null?findCenterId:centerid);
		Pagination<ViewEquipment> page = viewEquipmentService.findByPage(map,pageNo,pageSize);
		map.put("page", page);
		return new ModelAndView("information/equipment/list");
	}
	/**
	 * 添加设备
	 * @param viewEquipment
	 * @return
	 */
	@RequestMapping(value="addViewEquipment",method=RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> addViewEquipment(ViewEquipment viewEquipment){
		try {
			int count = viewEquipmentService.insertSelective(viewEquipment);
			resultMap.put("status", 200);
			resultMap.put("successCount", count);
		} catch (Exception e) {
			resultMap.put("status", 500);
			resultMap.put("message", "添加展示设备失败，请刷新后再试！");
			LoggerUtils.fmtError(getClass(), e, "添加展示设备报错。source[%s]",viewEquipment.toString());
		}
		return resultMap;
	}
	/**
	 * 删除设备，根据ID
	 * @param id
	 * @return
	 */
	@RequestMapping(value="deleteViewEquipmentById",method=RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> deleteViewEquipmentById(String ids){
		return viewEquipmentService.deleteViewEquipmentById(ids);
	}
	/**
	 * 根据ID查询设备信息
	 * @param id
	 * @return
	 */
	@RequestMapping(value="editViewEquipmentById")
	@ResponseBody
	public ViewEquipment editViewEquipmentById(Long id){
		ViewEquipment viewEquipment =viewEquipmentService.selectByPrimaryKey(id);
		return viewEquipment;
	}
	/**
	 * 保存设备编辑
	 * @param carMode
	 * @return
	 */
	@RequestMapping(value="updateViewEquipment",method=RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> updateViewEquipment(ViewEquipment viewEquipment){
		try {
			int count = viewEquipmentService.updateByPrimaryKeySelective(viewEquipment);
			resultMap.put("status", 200);
			resultMap.put("successCount", count);
		} catch (Exception e) {
			resultMap.put("status", 500);
			resultMap.put("message", "编辑展示设备失败，请刷新后再试！");
			LoggerUtils.fmtError(getClass(), e, "编辑展示设备报错。source[%s]",viewEquipment.toString());
		}
		return resultMap;
	}
	/**
	 * 根据设备ID查询工位信息
	 * @param id
	 * @return
	 */
	@RequestMapping(value="selectViewWplaceById")
	@ResponseBody
	public List<StationBo> selectViewWplaceById(StationBo stationbo){
		List<StationBo> stationBos = viewEquipmentService.selectViewWplaceById(stationbo);
		return stationBos;
	}
	/**
	 * 操作设备绑定工位
	 * @param viewId 	设备ID
	 * @param ids		工位ID，以‘,’间隔
	 * @return
	 */
	@RequestMapping(value="addViewWplace")
	@ResponseBody
	public Map<String,Object> addViewWplace(Long viewId,String ids){
		return viewEquipmentService.addViewWplace(viewId,ids);
	}
}
