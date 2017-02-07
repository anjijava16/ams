package com.mit.information.controller;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.mit.common.controller.BaseController;

@Controller
@Scope(value="prototype")
@RequestMapping("statequip")
public class StationEquipmentController extends BaseController{
	
	/**
	* @Title: editEquipInfo  
	* @Description: 编辑读卡设备、车上卡跳转
	* @param @return    设定文件  
	* @return ModelAndView    返回类型  
	* @throws
	 */
	@RequestMapping(value="editEquipInfo")
	public ModelAndView editEquipInfo(){
		return new ModelAndView("information/equipment/editEquipInfo");
	}
}
