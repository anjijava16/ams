package com.mit.information.controller;

import java.util.ArrayList;
import java.util.HashMap;
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
import com.mit.common.model.Employee;
import com.mit.common.model.EmployeeWplace;
import com.mit.common.model.Station;
import com.mit.common.model.WorkplaceType;
import com.mit.common.utils.LoggerUtils;
import com.mit.core.mybatis.page.Pagination;
import com.mit.information.service.EmployeeService;
import com.mit.information.service.SWorkplaceTypeService;
import com.mit.information.service.StationService;

/**
 * @author yejianming
 * 工位
 */
@Controller
@Scope(value="prototype")
@RequestMapping("station")
public class StationController extends BaseController{
	@Autowired

	SWorkplaceTypeService sWorkplaceTypeService;
	@Autowired

	StationService stationService;
	@Autowired

	EmployeeService employeeService;
	/**
	 * 钣喷中心工位设置前置
	 * **/
	@RequestMapping(value="toSetWorkplace",method=RequestMethod.GET)
	public ModelAndView toSetWorkplace(Long centerid){
		ModelMap map=new ModelMap();
		map.put("findCenterId",centerid==null?findCenterId:centerid);
		ModelAndView mv = new ModelAndView("information/station/addWorkplace");
	    //查询工位类别用于钣喷中心工位设置
		List<WorkplaceType> listType=new ArrayList<WorkplaceType>();
		listType=sWorkplaceTypeService.ListWorkplaceType(map);
		mv.addObject("listType", listType);
		mv.addObject("centerid",centerid==null?findCenterId:centerid);
		return mv;
	}
	/**
	 * 工位添加
	 * @return
	 */
	@RequestMapping(value="addWorkplace",method=RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> addWorkplace(Station station){
		try {
			int count = stationService.insertSelective(station);
			resultMap.put("status", 200);
			resultMap.put("successCount", count);
		} catch (Exception e) {
			resultMap.put("status", 500);
			resultMap.put("message", "添加工位失败，请刷新后再试！");
			LoggerUtils.fmtError(getClass(), e, "添加工位报错。source[%s]",station.toString());
		}
		return resultMap;
	}
	/**
	 * 删除工位，根据ID
	 * @param id
	 * @return
	 */
	@RequestMapping(value="deleteWorkplaceById",method=RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> deleteWorkplaceByid(String ids){
		return stationService.deleteStationByid(ids);
	}
	/**
	 * 根据ID查工位信息
	 * @param id
	 * @return
	 */
	@RequestMapping(value="editWorkplaceById",method=RequestMethod.GET)
	@ResponseBody
	public ModelAndView editWorkplaceById(Long id,Long centerid){
		Station Station =stationService.selectByPrimaryKey(id);
		ModelAndView mv = new ModelAndView("information/station/editWorkplace");
		ModelMap map=new ModelMap();
		map.put("findCenterId",centerid==null?findCenterId:centerid);
		  //查询工位类别用于钣喷中心工位设置
		List<WorkplaceType> listType=new ArrayList<WorkplaceType>();
		listType=sWorkplaceTypeService.ListWorkplaceType(map);
		mv.addObject("listType", listType);
		mv.addObject(Station);
		return mv;

	}
	/**
	 * 保存工位信息
	 * @param carParts
	 * @return
	 */
	@RequestMapping(value="updateWorkplace",method=RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> updateWorkplace(Station station){
		try {
			int count = stationService.updateByPrimaryKeySelective(station);
			resultMap.put("status", 200);
			resultMap.put("successCount", count);
		} catch (Exception e) {
			resultMap.put("status", 500);
			resultMap.put("message", "编辑工位失败，请刷新后再试！");
			LoggerUtils.fmtError(getClass(), e, "编辑工位报错。source[%s]",station.toString());
		}
		return resultMap;
	}
   /***
    * 工位列表
    * */
	@RequestMapping(value="listWorkplace")
	public ModelAndView listWorkplace(ModelMap map,Integer pageNo,String findContent,String centerid){	
		map.put("findContent", findContent);
		map.put("findCenterId",centerid==null?findCenterId:centerid);
		Pagination<Station> page = stationService.findByPage(map,pageNo,pageSize);
		map.put("page", page);
		return new ModelAndView("information/station/listWorkplace");
	}
	
	@RequestMapping(value="listWorkplaceType")
	public ModelAndView listWorkplaceType(ModelMap map,Integer pageNo,String findContent,String centerid){		
		map.put("findContent", findContent);
		map.put("findCenterId",centerid==null?findCenterId:centerid);
		Pagination<WorkplaceType> page = sWorkplaceTypeService.findByPage(map,pageNo,pageSize);
		map.put("page", page);
		return new ModelAndView("information/station/listWorkplaceType");
	}
	/**
	 * 删除工位类型，根据ID
	 * @param id
	 * @return
	 */
	@RequestMapping(value="deleteWorkplaceTypeById",method=RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> deleteWorkplaceTypeByid(String ids){
		return sWorkplaceTypeService.deleteWorkplaceTypeByid(ids);
	}
	/**
	 * 工位类型添加
	 * @param carModel
	 * @return
	 */
	@RequestMapping(value="addWorkplaceType",method=RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> addWorkplaceType(WorkplaceType workplaceType){
		try {
			int count = sWorkplaceTypeService.insertSelective(workplaceType);
			resultMap.put("status", 200);
			resultMap.put("successCount", count);
		} catch (Exception e) {
			resultMap.put("status", 500);
			resultMap.put("message", "添加失败，请刷新后再试！");
			LoggerUtils.fmtError(getClass(), e, "添加工位分类报错。source[%s]",workplaceType.toString());
		}
		return resultMap;
	}
	/**
	 * 根据ID查询工位类型信息
	 * @param id
	 * @return
	 */
	@RequestMapping(value="editWorkplaceTypeById")
	@ResponseBody
	public WorkplaceType editWorkplaceTypeById(Long id){
		WorkplaceType workplaceType = sWorkplaceTypeService.selectByPrimaryKey(id);
		return workplaceType;
	}
	/**
	 * 保存工位类型信息编辑
	 * @return
	 */
	@RequestMapping(value="updateWorkplaceType",method=RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> updateWorkplaceType(WorkplaceType workplaceType){
		try {
			int count =sWorkplaceTypeService.updateByPrimaryKeySelective(workplaceType);
			resultMap.put("status", 200);
			resultMap.put("successCount", count);
		} catch (Exception e) {
			resultMap.put("status", 500);
			resultMap.put("message", "编辑工位类型失败，请刷新后再试！");
			LoggerUtils.fmtError(getClass(), e, "编辑工位类型报错。source[%s]",workplaceType.toString());
		}
		return resultMap;
	}
	 /***
	    * 工位绑定人员列表
	    * */
		@RequestMapping(value="listEwplace")
		public ModelAndView listEwplace(ModelMap map,Integer pageNo,String findContent,String centerid,String findStationId){	
			map.put("findContent", findContent);
			map.put("findCenterId",centerid==null?findCenterId:centerid);
			map.put("findStationId",findStationId);
			Pagination<EmployeeWplace> page = stationService.findByPage("findEwplaceAll","findEwplaceCount",map,pageNo,pageSize);
			map.put("page", page);						
			return new ModelAndView("information/station/listEwplace");
		}
		/**
		 * 删除工位绑定人员，根据ID
		 * @param id
		 * @return
		 */
		@RequestMapping(value="deleteEwplaceById",method=RequestMethod.POST)
		@ResponseBody
		public Map<String,Object> deleteEwplaceById(String ids){
			return stationService.deleteEwplaceByid(ids);
		}
		/**
		 * 工位绑定人员设置前置
		 * @param id
		 * @return
		 */
		@RequestMapping(value="toEwplaceById")
		@ResponseBody
		public Map<String,Object> toEwplaceById(Long id,Long centerid){
			Map<String,Object> resultMap = new HashMap<String,Object>();
			ModelMap map=new ModelMap();
			map.put("findCenterId",centerid==null?findCenterId:centerid);	
			List<Employee> emlist=new ArrayList<Employee>();
			emlist=employeeService.ListEmployee(map);
			resultMap.put("emlist", emlist);
			List<Station> slist=new ArrayList<Station>();
			if(id==null){
				slist=stationService.ListStation(map);				
			}
			else{
				Station station=stationService.selectByPrimaryKey(id);
				slist.add(station);
			}
			resultMap.put("slist", slist);
			resultMap.put("centerid", centerid==null?findCenterId:centerid);													
			return resultMap;

		}
		/**
		 * 工位绑定人员添加

		 * @return
		 */
		@RequestMapping(value="addEwplace",method=RequestMethod.POST)
		@ResponseBody
		public Map<String,Object> addEwplace(EmployeeWplace employeeWplace){
			try {
				int count = stationService.insertEwplace(employeeWplace);
				resultMap.put("status", 200);
				resultMap.put("successCount", count);
			} catch (Exception e) {
				resultMap.put("status", 500);
				resultMap.put("message", "工位绑定人员失败，请刷新后再试！");
				LoggerUtils.fmtError(getClass(), e, "工位绑定人员报错。source[%s]",employeeWplace.toString());
			}
			return resultMap;
		}
}
