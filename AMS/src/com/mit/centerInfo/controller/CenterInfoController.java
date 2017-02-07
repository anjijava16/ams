package com.mit.centerInfo.controller;

import java.util.ArrayList;
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

import com.mit.carModel.service.CarModelService;
import com.mit.carParts.service.CarPartsService;
import com.mit.centerInfo.service.CenterInfoService;
import com.mit.common.controller.BaseController;
import com.mit.common.model.CarModel;
import com.mit.common.model.CarParts;
import com.mit.common.model.CenterInfo;
import com.mit.common.model.WorkingHours;
import com.mit.common.model.WorkplaceType;
import com.mit.common.utils.LoggerUtils;
import com.mit.core.mybatis.page.Pagination;
import com.mit.core.shiro.token.manager.TokenManager;
import com.mit.information.service.SCarModelService;
import com.mit.information.service.SCarPartsService;
import com.mit.information.service.SWorkingHoursService;
import com.mit.information.service.SWorkplaceTypeService;
import com.mit.workingHours.service.WorkingHoursService;
import com.mit.workplaceType.service.WorkplaceTypeService;

/**
 * @author yejianming
 */

@Controller
@Scope(value="prototype")
@RequestMapping("centerInfo")
public class CenterInfoController  extends BaseController{


@Autowired
CenterInfoService centerInfoService;
@Autowired
CarModelService carModelService;
@Autowired
SCarModelService sCarModelService;
@Autowired
CarPartsService carPartsService;
@Autowired
SWorkingHoursService sWorkingHoursService;
@Autowired
WorkingHoursService workingHoursService;
@Autowired
SCarPartsService sCarPartsService;
@Autowired
WorkplaceTypeService workplaceTypeService;
@Autowired
SWorkplaceTypeService sWorkplaceTypeService;
@RequestMapping(value="list")
public ModelAndView list(ModelMap map,Integer pageNo,String findContent,String centerid){
	
	map.put("findContent", findContent);
	map.put("findCenterId",centerid==null?findCenterId:centerid);
	Pagination<CenterInfo> page = centerInfoService.findByPage(map,pageNo,pageSize);
	map.put("page", page);
	return new ModelAndView("centerInfo/listCenterInfo");
}
/**
 * 删除已开设中心，根据ID
 * @param id
 * @return
 */
@RequestMapping(value="deleteCenterInfoById",method=RequestMethod.POST)
@ResponseBody
public Map<String,Object> deleteCenterInfoByid(String ids){
	return centerInfoService.deleteCenterInfoByid(ids);
}
/**
 * 开设钣喷中心前置--登记中心基本信息
 * @return
 */
@RequestMapping(value="toAddCenterInfo",method=RequestMethod.GET)
public ModelAndView toAddCarParts(){
	ModelAndView mv=new ModelAndView("centerInfo/addCenterInfo");
	return mv;
}
/**
 * 开设钣喷中心--保存登记中心基本信息
 * @return
 */

@RequestMapping(value="addCenterInfo",method=RequestMethod.POST)
@ResponseBody
public Map<String,Object> addCenterInfo(CenterInfo centerInfo){
	

	try {
		//从session中取用户信息赋值
		centerInfo.setC_operator(TokenManager.getUsername());
		int count =centerInfoService.insertSelective(centerInfo);
		//开设中心的同时，将数据字典中的数据带入个钣喷中心
		Long centerid=centerInfo.getId();
		ModelMap map=new ModelMap();
		//查询所有的车型数据插入
		List<CarModel> carModelList=new ArrayList<CarModel>();
		carModelList=carModelService.ListCarModel(map);
		if(carModelList!=null&&carModelList.size()>0){
			//写车型数据
			for (CarModel carModel : carModelList){
				carModel.setBasicid(carModel.getId());
				carModel.setCenterid(centerid);
				sCarModelService.insertSelective(carModel);
			}
		}
		//查询所有配件信息插入
		List<CarParts> carPartsList=new ArrayList<CarParts>();
		carPartsList=carPartsService.ListCarParts(map);
		if(carPartsList!=null&&carPartsList.size()>0){
			//写配件数据
			for(CarParts carParts:carPartsList){
				carParts.setBasicid(carParts.getId());
				carParts.setCenterid(centerid);
				sCarPartsService.insertSelective(carParts);
			}
		}
		//插入标准工时信息
		List<WorkingHours> workingList=new ArrayList<WorkingHours>();
		workingList=workingHoursService.ListWorkingHours(map);
		if(workingList!=null&&workingList.size()>0){
			//写入标准工时信息
			for(WorkingHours workingHours:workingList){
				workingHours.setBasicid(workingHours.getId());
				workingHours.setCenterid(centerid);
				sWorkingHoursService.insertSelective(workingHours);
			}
		}
		//插入工位类型
		List<WorkplaceType> typeList=new ArrayList<WorkplaceType>();
		typeList=workplaceTypeService.ListWorkplaceType(map);
		if(typeList!=null&&typeList.size()>0){
			//写入工位类型
			for(WorkplaceType workplaceType:typeList){
				workplaceType.setBasicid(workplaceType.getId());
				workplaceType.setCenterid(centerid);
				sWorkplaceTypeService.insertSelective(workplaceType);
			}
		}
		resultMap.put("status", 200);
		resultMap.put("successCount", count);
	} catch (Exception e) {
		resultMap.put("status", 500);
		resultMap.put("message", "开设钣喷中心失败，请刷新后再试！");
		LoggerUtils.fmtError(getClass(), e, "开设钣喷中心报错。source[%s]",centerInfo.toString());
	}
	return resultMap;
}

}