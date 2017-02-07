package com.mit.information.controller;

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

import com.mit.common.controller.BaseController;
import com.mit.common.model.CarParts;
import com.mit.common.utils.LoggerUtils;
import com.mit.core.mybatis.page.Pagination;
import com.mit.information.service.SCarPartsService;

/**
 * @author yejianming
 * 配件管理
 */
@Controller
@Scope(value="prototype")
@RequestMapping("parts")
public class PartsController extends BaseController{
	@Autowired

	SCarPartsService sCarPartsService;
	 /***
	    * 配件列表
	    * */
		@RequestMapping(value="listParts")
		public ModelAndView listParts(ModelMap map,Integer pageNo,String findContent,String centerid){	
			map.put("findContent", findContent);
			map.put("findCenterId",centerid==null?findCenterId:centerid);
			Pagination<CarParts> page = sCarPartsService.findByPage(map,pageNo,pageSize);
			map.put("page", page);
			return new ModelAndView("information/parts/listCarParts");
		}
		/***
		 * 添加配件前置
		 * */
		@RequestMapping(value="toAddCarParts",method=RequestMethod.GET)
		public ModelAndView toAddCarParts(Long centerid){
			ModelAndView mv=new ModelAndView("information/parts/addCarParts");
			ArrayList<String> partstypeList=new ArrayList<String>();
			partstypeList.add("保养件");
			partstypeList.add("易损件");
			partstypeList.add("事故件");
			partstypeList.add("非常用件");
			partstypeList.add("辅料");
			partstypeList.add("精品附件");
			mv.addObject("partstypeList", partstypeList);
			mv.addObject("centerid",centerid==null?findCenterId:centerid);
			return mv;
		}
		/**
		 * 配件添加
		 * @param carParts
		 * @return
		 */
		@RequestMapping(value="addCarParts",method=RequestMethod.POST)
		@ResponseBody
		public Map<String,Object> addCarParts(CarParts carParts){
			try {
				int count = sCarPartsService.insertSelective(carParts);
				resultMap.put("status", 200);
				resultMap.put("successCount", count);
			} catch (Exception e) {
				resultMap.put("status", 500);
				resultMap.put("message", "添加配件失败，请刷新后再试！");
				LoggerUtils.fmtError(getClass(), e, "添加配件报错。source[%s]",carParts.toString());
			}
			return resultMap;
		}
		/**
		 * 根据ID查询配件信息
		 * @param id
		 * @return
		 */
		@RequestMapping(value="editCarPartsById",method=RequestMethod.GET)
		@ResponseBody
		public ModelAndView editCarPartsById(Long id){
			CarParts carParts = sCarPartsService.selectByPrimaryKey(id);
			ModelAndView mv = new ModelAndView("information/parts/editCarParts");
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
				int count = sCarPartsService.updateByPrimaryKeySelective(carParts);
				resultMap.put("status", 200);
				resultMap.put("successCount", count);
			} catch (Exception e) {
				resultMap.put("status", 500);
				resultMap.put("message", "编辑配件失败，请刷新后再试！");
				LoggerUtils.fmtError(getClass(), e, "编辑配件报错。source[%s]",carParts.toString());
			}
			return resultMap;
		}
		/**
		 * 删除车型，根据ID
		 * @param id
		 * @return
		 */
		@RequestMapping(value="deleteCarPartsById",method=RequestMethod.POST)
		@ResponseBody
		public Map<String,Object> deleteCarPartsByid(String ids){
			return sCarPartsService.deleteCarPartsByid(ids);
		}
		 /***
		    * 配件入库
		    * */
		@RequestMapping(value="inCarPartsById",method=RequestMethod.GET)
		@ResponseBody
		public ModelAndView inCarPartsById(Long id){
			CarParts carParts = sCarPartsService.selectByPrimaryKey(id);
			ModelAndView mv = new ModelAndView("information/parts/inCarParts");
			mv.addObject(carParts);
			return mv;

		}
		 /***
		    * 保存配件入库信息
		    * */
		@RequestMapping(value="inCarParts",method=RequestMethod.POST)
		@ResponseBody
		public Map<String,Object> inCarParts(CarParts carParts){
			try {
				int count = sCarPartsService.inCarPartsById(carParts);
				//插入明细
				CarParts inParts=sCarPartsService.selectByPrimaryKey(carParts.getId());
				inParts.setPartid(inParts.getId());
				inParts.setInoroutdepot("0");
				inParts.setPartsprice(carParts.getPartsprice());
				inParts.setPurchaseprice(carParts.getPurchaseprice());
				inParts.setStocknum(carParts.getStocknum());
				sCarPartsService.insertRecord(inParts);
				resultMap.put("status", 200);
				resultMap.put("successCount", count);
			} catch (Exception e) {
				resultMap.put("status", 500);
				resultMap.put("message", "配件入库失败，请刷新后再试！");
				LoggerUtils.fmtError(getClass(), e, "配件入库报错。source[%s]",carParts.toString());
			}
			return resultMap;
		}
		/**
		 * 配件出库前置
		 * */

		@RequestMapping(value="outCarPartsById")
		@ResponseBody
		public CarParts outCarPartsById(Long id){
			CarParts carParts = sCarPartsService.selectByPrimaryKey(id);
			return carParts;
		}
		/***
		    * 保存配件出库信息
		    * */
		@RequestMapping(value="outCarParts",method=RequestMethod.POST)
		@ResponseBody
		public Map<String,Object> outCarParts(CarParts carParts){
			try {
				int count = sCarPartsService.outCarPartsById(carParts);
				//插入明细
				CarParts inParts=sCarPartsService.selectByPrimaryKey(carParts.getId());
				inParts.setPartid(inParts.getId());
				inParts.setInoroutdepot("1");
				inParts.setPartsprice(carParts.getPartsprice());
				inParts.setPurchaseprice(carParts.getPurchaseprice());
				inParts.setStocknum(carParts.getStocknum());
				sCarPartsService.insertRecord(inParts);
				resultMap.put("status", 200);
				resultMap.put("successCount", count);
			} catch (Exception e) {
				resultMap.put("status", 500);
				resultMap.put("message", "配件出库失败，请刷新后再试！");
				LoggerUtils.fmtError(getClass(), e, "配件出库报错。source[%s]",carParts.toString());
			}
			return resultMap;
		}
		 /***
		    * 配件记录列表
		    * */
			@RequestMapping(value="listPartsRecord")
			public ModelAndView listPartsRecord(ModelMap map,Integer pageNo,String findContent,String centerid,String findPartId){	
				map.put("findContent", findContent);
				map.put("findCenterId",centerid==null?findCenterId:centerid);
				map.put("findPartId",findPartId);
				Pagination<CarParts> page = sCarPartsService.findByPage("findAllRecord","findCountRecord",map,pageNo,pageSize);
				map.put("page", page);
				return new ModelAndView("information/parts/listCarPartsRecord");
			}
}
