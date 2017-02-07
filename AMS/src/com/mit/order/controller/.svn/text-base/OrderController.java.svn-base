package com.mit.order.controller;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mit.carModel.service.CarModelService;
import com.mit.common.controller.BaseController;
import com.mit.common.model.CarModel;
import com.mit.common.model.CarParts;
import com.mit.common.model.Employee;
import com.mit.common.model.EmployeeWplace;
import com.mit.common.model.Station;
import com.mit.common.model.WorkingHours;
import com.mit.common.utils.LoggerUtils;
import com.mit.core.mybatis.page.Pagination;
import com.mit.core.shiro.token.manager.TokenManager;
import com.mit.core.statics.Constant;
import com.mit.customer.bo.CarInfo;
import com.mit.customer.bo.Customer;
import com.mit.customer.bo.Linkman;
import com.mit.customer.service.CustomerService;
import com.mit.dict.bo.DictData;
import com.mit.dict.service.DictService;
import com.mit.information.service.EmployeeService;
import com.mit.information.service.SCarModelService;
import com.mit.information.service.SCarPartsService;
import com.mit.information.service.SWorkingHoursService;
import com.mit.information.service.StationService;
import com.mit.order.bo.Order;
import com.mit.order.bo.OrderAdd;
import com.mit.order.bo.OrderItem;
import com.mit.order.bo.OrderParts;
import com.mit.order.service.OrderService;

/**
 * @author 刘鹏飞
 * @date 2016-11-02
 */

@Controller
@Scope(value = "prototype")
@RequestMapping("order")
public class OrderController extends BaseController {

	@Autowired
	OrderService orderService;
	@Autowired
	EmployeeService employeeService;
	@Autowired
	SWorkingHoursService sWorkingHoursService;
	@Autowired
	SCarPartsService carPartsService;
	@Autowired
	CustomerService customerService;
	@Autowired
	StationService stationService;
	@Autowired
	DictService dictService;
	@Autowired
	CarModelService acarModelService;
	@Autowired
	SCarModelService carModelService;
	
	/**
	 * 工单列表
	 * @return
	 */
	@RequestMapping(value="/list")
	public ModelAndView list(ModelMap map,Integer pageNo,String findContent){
		map.put("findContent", findContent);
		map.put("centerid", findCenterId==null?"0":findCenterId);
		Pagination<Order> page = orderService.findByPage(map,pageNo,pageSize);
		map.put("page", page);
		ModelAndView mv = new ModelAndView("order/list");
		TokenManager.setVal2Session("menuFlag", "order");//菜单选中判断
		return mv;
	}
	/**
	 * 工单列表for排程
	 * @return
	 */
	@RequestMapping(value="/list4schedule")
	public ModelAndView list4schedule(ModelMap map,Integer pageNo,String findContent){
		map.put("findContent", findContent);
		map.put("centerid", findCenterId==null?"0":findCenterId);
		Pagination<Order> page = orderService.findByPage(map,pageNo,pageSize);
		map.put("page", page);
		ModelAndView mv = new ModelAndView("order/list4schedule");
		TokenManager.setVal2Session("menuFlag", "schedule");//菜单选中判断
		return mv;
	}
	
	/**
	 * 工单add跳转
	 * @return
	 */
	@RequestMapping(value="/add")
	public ModelAndView add(){
		ModelAndView mv = new ModelAndView("order/add");
		resultMap.put("centerid", findCenterId == null ? 0 : findCenterId);
		List<Employee> employees = employeeService.ListEmployee(resultMap);
		mv.addObject("employees", employees);
		List<Customer> customers = customerService.findAllCustomers(resultMap);
		mv.addObject("customers", customers);
		TokenManager.setVal2Session("menuFlag", "order");//菜单选中判断
		return mv;
	}
	
	/**
	 * 获取工位下工作人员
	 * @return
	 */
	@RequestMapping(value="/getEmpByWpId",method=RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> getEmpByWpId(Long wpId){
		try {
			List<EmployeeWplace> ewList = orderService.getEmpByWpId(wpId);
			resultMap.put("status", 200);
			resultMap.put("ewList", ewList);
		} catch (Exception e) {
			resultMap.put("status", 500);
			resultMap.put("message", "获取工位下工作人员失败，请刷新后再试！");
			LoggerUtils.fmtError(getClass(), e, "获取工位下工作人员报错。source[%s]",wpId.toString());
		}
		return resultMap;
	}
	/**
	 * 排程跳转
	 * @return
	 */
	@RequestMapping(value="/schedule")
	public ModelAndView schedule(Long orderId){
		ModelAndView mv = new ModelAndView("order/schedule");
		//获取所有进行中的工单
		resultMap.put("centerid", findCenterId == null ? 0: findCenterId);
		resultMap.put("order_status", 2);
		List<Order> orderList = orderService.getRunningOrder(resultMap);
		List<OrderItem> allItems = new ArrayList<OrderItem>();
		for (Order order : orderList) {
			List<OrderItem> orderItemList = orderService.findOrderItemByOrderId(order.getId());
			for (OrderItem orderItem : orderItemList) {
				if(null != orderItem.getPre_start_time() && null != orderItem.getPre_end_time()){
					allItems.add(orderItem);//已经进入排程的工单项目需要显示出来
				}
			}
		}
		mv.addObject("allItems", allItems);
		List<OrderItem> orderItems = orderService.findOrderItemByOrderId(orderId);
		mv.addObject("orderItems", orderItems);
		resultMap.put("findCenterId",  findCenterId == null ? 0: findCenterId);
		List<Station> stationList = stationService.ListStation(resultMap);
		mv.addObject("stationList", stationList);
		TokenManager.setVal2Session("menuFlag", "schedule");//菜单选中判断
		return mv;
	}
	
	/**
	 * 工单项目排程
	 * @return
	 */
	@RequestMapping(value="/insertSchedule",method=RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> insertSchedule(OrderItem orderItem){
		try {
			orderItem.setRep_emp_id(orderItem.getRep_emp_id() + ",");
			orderService.updateOrderItem(orderItem);
			resultMap.put("status", 200);
		} catch (Exception e) {
			resultMap.put("status", 500);
			resultMap.put("message", "工单项目排程失败，请刷新后再试！");
			LoggerUtils.fmtError(getClass(), e, "工单项目排程报错。source[%s]",orderItem.toString());
		}
		return resultMap;
	}
	
	/**
	 * 工单新增/修改
	 * @return
	 */
	@RequestMapping(value="/insert")
	public ModelAndView insert(Order order){
		if(null != order.getId() && 0 != order.getId()){
			orderService.updateBySelective(order);
		} else {
			order.setCenterid(findCenterId == null ? "0" : findCenterId.toString());
			orderService.insertSelective(order);
		}
		ModelAndView mv = new ModelAndView("redirect:/order/list");
		TokenManager.setVal2Session("menuFlag", "order");//菜单选中判断
		return mv;
	}
	/**
	 * 查询工单详情
	 * @return
	 */
	@RequestMapping(value="/detail")
	public ModelAndView detail(Long id){
		Order order = orderService.selectByPrimaryKey(id);
		ModelAndView mv = new ModelAndView("order/edit");
		mv.addObject("order", order);
		List<Employee> employees = employeeService.ListEmployee(resultMap);
		mv.addObject("employees", employees);
		Customer customer = customerService.selectByPrimaryKey(Long.parseLong(order.getCus_id()));
		mv.addObject("cus_name", customer.getCus_name());
		CarInfo carInfo = customerService.selectCarByPrimaryKey(Long.parseLong(order.getCar_id()));
		mv.addObject("car_plates", carInfo.getCar_plates());
		TokenManager.setVal2Session("menuFlag", "order");//菜单选中判断
		return mv;
	}
	/**
	 * 工单删除
	 * @return
	 */
	@RequestMapping(value="/delete")
	public ModelAndView delete(Long id){
		ModelAndView mv = new ModelAndView("redirect:list");
		Order order = new Order();
		order.setId(id);
		order.setDel_flag("1");
		orderService.updateBySelective(order);
		TokenManager.setVal2Session("menuFlag", "order");//菜单选中判断
		return mv;
	}
	/**
	 * 定损
	 * @return
	 */
	@RequestMapping(value="/addDamage")
	public ModelAndView addDamage(Long id){
		ModelAndView mv = new ModelAndView("order/addDamage");
		Order order = orderService.selectByPrimaryKey(id);
		mv.addObject("order", order);//工单详情
		resultMap.put("findCenterId", findCenterId == null ? 0 : findCenterId);
		List<Employee> employees = employeeService.ListEmployee(resultMap);
		mv.addObject("employees", employees);//服务顾问
		Customer customer = customerService.selectByPrimaryKey(Long.parseLong(order.getCus_id()));
		mv.addObject("cus_name", customer.getCus_name());
		CarInfo carInfo = customerService.selectCarByPrimaryKey(Long.parseLong(order.getCar_id()));
		mv.addObject("car_plates", carInfo.getCar_plates());
		//*工时查询准备数据*//
		WorkingHours wh = new WorkingHours();
		wh.setCenterid(findCenterId == null ? 0 : findCenterId);
		List<WorkingHours> workingHours = sWorkingHoursService.listWorkingHours(wh);
		List<String> damagePartsGroup = new ArrayList<String>();
		for (WorkingHours workingHour : workingHours) {
			damagePartsGroup.add(workingHour.getDamage_parts_group());
		}
		HashSet<String> dpgSet = new HashSet<String>(damagePartsGroup);
		mv.addObject("dpgSet", dpgSet);
		mv.addObject("damagePartsGroup", workingHours);
		List<DictData> repairType = (List<DictData>) TokenManager.getVal2Session(Constant.REPAIR_TYPE);
		if(null != repairType && repairType.size() > 0){
			mv.addObject("repairType", repairType);
		} else {
			setDictData();
			repairType = (List<DictData>) TokenManager.getVal2Session(Constant.REPAIR_TYPE);
			mv.addObject("repairType", repairType);
		}
		List<DictData> repairMethod = (List<DictData>) TokenManager.getVal2Session(Constant.REPAIR_METHOD);
		if(null != repairMethod && repairMethod.size() > 0){
			mv.addObject("repairMethod", repairMethod);
		} else {
			setDictData();
			repairMethod = (List<DictData>) TokenManager.getVal2Session(Constant.REPAIR_METHOD);
			mv.addObject("repairMethod", repairMethod);
		}
		List<CarModel> carmodelList = carModelService.listCarModels(resultMap);
		List<String> carBrandList = new ArrayList<String>();
		for (CarModel carModel : carmodelList) {
			carBrandList.add(carModel.getCarbrand());
		}
		HashSet<String> brandSet = new HashSet<String>(carBrandList);
		mv.addObject("brandSet", brandSet);
		//*备件查询准备数据*//
		List<CarParts> carPartsList = carPartsService.selectCarParts(null);
		List<String> damagePartsGroupParts = new ArrayList<String>();
		for (CarParts carParts : carPartsList) {
			damagePartsGroupParts.add(carParts.getDamage_parts_group());
		}
		HashSet<String> dpgPartsSet = new HashSet<String>(damagePartsGroup);
		mv.addObject("dpgPartsSet", dpgPartsSet);
		mv.addObject("carPartsList", carPartsList);
		List<DictData> partsType = (List<DictData>) TokenManager.getVal2Session(Constant.PARTS_TYPE);
		if(null != partsType && partsType.size() > 0){
			mv.addObject("partsType", partsType);
		} else {
			setDictData();
			partsType = (List<DictData>) TokenManager.getVal2Session(Constant.PARTS_TYPE);
			mv.addObject("partsType", partsType);
		}
		resultMap.put("order_id", id);
		Pagination<OrderItem> itemList = orderService.findOrderItemByPage(resultMap, pageNo, pageSize);
		Pagination<OrderParts> partsList = orderService.findOrderPartsByPage(resultMap, pageNo, pageSize);
		Pagination<OrderAdd> addList = orderService.findOrderAddByPage(resultMap, pageNo, pageSize);
		mv.addObject("itemPage", itemList);
		mv.addObject("partsPage", partsList);
		mv.addObject("addPage", addList);
		List<Station> stationList = stationService.ListStation(resultMap);
		mv.addObject("stationList", stationList);
		TokenManager.setVal2Session("menuFlag", "order");//菜单选中判断
		return mv;
	}
	
	/**
	 * 查询工时列表
	 * @return
	 */
	@RequestMapping(value="/listWorkingHours",method=RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> listWorkingHours(WorkingHours workingHours){
		try {
			workingHours.setCenterid(findCenterId == null ? 0 : findCenterId);
			List<WorkingHours> whList = sWorkingHoursService.listWorkingHours(workingHours);
			resultMap.put("status", 200);
			resultMap.put("whList", whList);
		} catch (Exception e) {
			resultMap.put("status", 500);
			resultMap.put("message", "查询工时失败，请刷新后再试！");
			LoggerUtils.fmtError(getClass(), e, "查询工时报错。source[%s]",workingHours.toString());
		}
		return resultMap;
	}
	/**
	 * 查询备件列表
	 * @return
	 */
	@RequestMapping(value="/listCarParts",method=RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> listCarParts(CarParts carParts){
		try {
			List<CarParts> cpList = carPartsService.selectCarParts(carParts);
			resultMap.put("status", 200);
			resultMap.put("cpList", cpList);
		} catch (Exception e) {
			resultMap.put("status", 500);
			resultMap.put("message", "查询备件失败，请刷新后再试！");
			LoggerUtils.fmtError(getClass(), e, "查询备件报错。source[%s]",carParts.toString());
		}
		return resultMap;
	}
	
	/**
	 * 插入工单项目
	 * @return
	 */
	@RequestMapping(value="/insertItem",method=RequestMethod.POST)
	@ResponseBody
	@Transactional
	public Map<String,Object> insertItem(OrderItem orderItem){
		try {
			orderItem.setCenterid(findCenterId == null ? 0 : findCenterId);
			orderService.insertOrderItem(orderItem);
			Order order = new Order();
			order.setId(orderItem.getOrder_id());
			order.setHour_total(orderItem.getHour_total());
			order.setTotal_price(orderItem.getHour_total());
			order.setOrder_status("1");
			orderService.updateOrderPrice(order);
			resultMap.put("status", 200);
			resultMap.put("orderItem", orderItem);
		} catch (Exception e) {
			resultMap.put("status", 500);
			resultMap.put("message", "插入工单项目失败，请刷新后再试！");
			LoggerUtils.fmtError(getClass(), e, "插入工单项目报错。source[%s]",orderItem.toString());
		}
		return resultMap;
	}
	
	/**
	 * 插入工单备件
	 * @return
	 */
	@RequestMapping(value="/insertParts",method=RequestMethod.POST)
	@ResponseBody
	@Transactional
	public Map<String,Object> insertParts(OrderParts orderParts){
		try {
			orderService.insertOrderParts(orderParts);
			resultMap.put("status", 200);
			resultMap.put("orderItem", orderParts);
			Order order = new Order();
			order.setId(orderParts.getOrder_id());
			order.setParts_total(orderParts.getTotal());
			order.setTotal_price(orderParts.getTotal());
			order.setOrder_status("1");
			orderService.updateOrderPrice(order);
		} catch (Exception e) {
			resultMap.put("status", 500);
			resultMap.put("message", "插入工单项目失败，请刷新后再试！");
			LoggerUtils.fmtError(getClass(), e, "插入工单项目报错。source[%s]",orderParts.toString());
		}
		return resultMap;
	}
	
	/**
	 * 插入工单附加项目
	 * @return
	 */
	@RequestMapping(value="/insertAdd",method=RequestMethod.POST)
	@ResponseBody
	@Transactional
	public Map<String,Object> insertAdd(OrderAdd add){
		try {
			orderService.insertOrderAdd(add);
			resultMap.put("status", 200);
			resultMap.put("orderItem", add);
			Order order = new Order();
			order.setId(add.getOrder_id());
			order.setAdd_total(add.getAdd_total());
			order.setTotal_price(add.getAdd_total());
			order.setOrder_status("1");
			orderService.updateOrderPrice(order);
		} catch (Exception e) {
			resultMap.put("status", 500);
			resultMap.put("message", "插入工单项目失败，请刷新后再试！");
			LoggerUtils.fmtError(getClass(), e, "插入工单项目报错。source[%s]",add.toString());
		}
		return resultMap;
	}
	
	/**
	 *删除工单项目
	 * @return
	 */
	@RequestMapping(value="/deleteItem")
	public ModelAndView deleteItem(Long id, Long orderId){
		ModelAndView mv = new ModelAndView("redirect:addDamage?id="+orderId);
		OrderItem orderItem = new OrderItem();
		orderItem.setId(id);
		orderItem.setDel_flag("1");
		orderService.updateOrderItem(orderItem);
		TokenManager.setVal2Session("menuFlag", "order");//菜单选中判断
		return mv;
	}
	/**
	 *删除工单备件
	 * @return
	 */
	@RequestMapping(value="/deleteParts")
	public ModelAndView deleteParts(Long id, Long orderId){
		ModelAndView mv = new ModelAndView("redirect:addDamage?id="+orderId);
		OrderParts orderParts = new OrderParts();
		orderParts.setId(id);
		orderParts.setDel_flag("1");
		orderService.updateOrderParts(orderParts);
		TokenManager.setVal2Session("menuFlag", "order");//菜单选中判断
		return mv;
	}
	/**
	 *删除工单附加项目
	 * @return
	 */
	@RequestMapping(value="/deleteAdd")
	public ModelAndView deleteAdd(Long id, Long orderId){
		ModelAndView mv = new ModelAndView("redirect:addDamage?id="+orderId);
		OrderAdd orderAdd = new OrderAdd();
		orderAdd.setId(id);
		orderAdd.setDel_flag("1");
		orderService.updateOrderAdd(orderAdd);
		TokenManager.setVal2Session("menuFlag", "order");//菜单选中判断
		return mv;
	}
	/**
	 * 根据cusId查询车辆信息
	 * @return
	 */
	@RequestMapping(value="/getCarByCusId",method=RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> getCarByCusId(Long id){
		try {
			List<CarInfo> carInfos = customerService.selectCarByCusId(id);
			List<Linkman> linkmans = customerService.selectLinkmanByCusId(id);
			resultMap.put("status", 200);
			resultMap.put("carInfos", carInfos);
			resultMap.put("linkmans", linkmans);
		} catch (Exception e) {
			resultMap.put("status", 500);
			resultMap.put("message", "查询车辆信息失败，请刷新后再试！");
			LoggerUtils.fmtError(getClass(), e, "查询车辆信息报错。source[%s]",id.toString());
		}
		return resultMap;
	}
	
//	/**
//	 * 查询工时列表
//	 * @return
//	 */
//	@RequestMapping(value="/readCard",method=RequestMethod.POST)
//	@ResponseBody
//	public Map<String,Object> readCard(){
//		try {
//			Thread spcommThread = new Thread(new SerialReader());
//			spcommThread.setName("Thread-MyThread");
//			spcommThread.start();
//			Thread.sleep(2000);
//			String cardNo = SerialReader.cardNo;
//			resultMap.put("status", 200);
//			resultMap.put("cardNo", cardNo);
//		} catch (Exception e) {
//			resultMap.put("status", 500);
//			resultMap.put("message", "查询工时失败，请刷新后再试！");
//			LoggerUtils.fmtError(getClass(), e, "查询工时报错。source[%s]","");
//		}
//		return resultMap;
//	}
	
	/**
	 * 
	 * @Title: setDictData
	 * @Description: 设置数据字典到缓存
	 * @param 设定文件
	 * @return void 返回类型
	 * @throws
	 */
	public void setDictData() {
		List<DictData> dictDatas = dictService.findAllData();
		List<DictData> idType = new ArrayList<DictData>();
		List<DictData> outerColor = new ArrayList<DictData>();
		List<DictData> innerColor = new ArrayList<DictData>();
		List<DictData> useType = new ArrayList<DictData>();
		List<DictData> nation = new ArrayList<DictData>();
		List<DictData> relation = new ArrayList<DictData>();
		List<DictData> repairType = new ArrayList<DictData>();
		List<DictData> repairMethod = new ArrayList<DictData>();
		List<DictData> partsType = new ArrayList<DictData>();
		List<CarModel> carModels = acarModelService.ListCarModel(null);
		for (DictData dictData : dictDatas) {
			if (Constant.ID_TYPE.equals(dictData.getDict_code())) {
				idType.add(new DictData(dictData.getDict_code(), dictData
						.getData_key(), dictData.getData_value()));
			}
			if (Constant.OUTER_COLOR.equals(dictData.getDict_code())) {
				outerColor.add(new DictData(dictData.getDict_code(), dictData
						.getData_key(), dictData.getData_value()));
			}
			if (Constant.INNER_COLOR.equals(dictData.getDict_code())) {
				innerColor.add(new DictData(dictData.getDict_code(), dictData
						.getData_key(), dictData.getData_value()));
			}
			if (Constant.USE_TYPE.equals(dictData.getDict_code())) {
				useType.add(new DictData(dictData.getDict_code(), dictData
						.getData_key(), dictData.getData_value()));
			}
			if (Constant.NATION.equals(dictData.getDict_code())) {
				nation.add(new DictData(dictData.getDict_code(), dictData
						.getData_key(), dictData.getData_value()));
			}
			if (Constant.RELATION.equals(dictData.getDict_code())) {
				relation.add(new DictData(dictData.getDict_code(), dictData
						.getData_key(), dictData.getData_value()));
			}
			if (Constant.REPAIR_TYPE.equals(dictData.getDict_code())) {
				repairType.add(new DictData(dictData.getDict_code(), dictData
						.getData_key(), dictData.getData_value()));
			}
			if (Constant.REPAIR_METHOD.equals(dictData.getDict_code())) {
				repairMethod.add(new DictData(dictData.getDict_code(), dictData
						.getData_key(), dictData.getData_value()));
			}
			if (Constant.PARTS_TYPE.equals(dictData.getDict_code())) {
				partsType.add(new DictData(dictData.getDict_code(), dictData
						.getData_key(), dictData.getData_value()));
			}
		}
		TokenManager.setVal2Session(Constant.ID_TYPE, idType);
		TokenManager.setVal2Session(Constant.OUTER_COLOR, outerColor);
		TokenManager.setVal2Session(Constant.INNER_COLOR, innerColor);
		TokenManager.setVal2Session(Constant.USE_TYPE, useType);
		TokenManager.setVal2Session(Constant.NATION, nation);
		TokenManager.setVal2Session(Constant.RELATION, relation);
		TokenManager.setVal2Session(Constant.REPAIR_TYPE, repairType);
		TokenManager.setVal2Session(Constant.REPAIR_METHOD, repairMethod);
		TokenManager.setVal2Session(Constant.CAR_MODELS, carModels);
		TokenManager.setVal2Session(Constant.PARTS_TYPE, partsType);
	}
}