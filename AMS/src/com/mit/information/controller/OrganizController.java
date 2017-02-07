package com.mit.information.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mit.centerInfo.service.CenterInfoService;
import com.mit.common.controller.BaseController;
import com.mit.common.model.CenterInfo;
import com.mit.common.model.Department;
import com.mit.common.model.Employee;
import com.mit.common.model.EmployeeRest;
import com.mit.common.model.Profession;
import com.mit.common.model.Stations;
import com.mit.common.utils.LoggerUtils;
import com.mit.core.mybatis.page.Pagination;
import com.mit.core.shiro.token.manager.TokenManager;
import com.mit.information.service.DepartmentService;
import com.mit.information.service.EmployeeService;
import com.mit.information.service.ProfessionService;
import com.mit.information.service.StationsService;
import com.mit.workplaceType.service.WorkplaceTypeService;
/**
 * @author yejianming
 * 组织结构
 */

@Controller
@Scope(value="prototype")
@RequestMapping("organiz")
public class OrganizController extends BaseController{
	@Autowired

	CenterInfoService centerInfoService;
	@Autowired

	WorkplaceTypeService workplaceTypeService;
	@Autowired

	DepartmentService departmentService;
	@Autowired

	StationsService stationsService;
	@Autowired

	ProfessionService professionService;
	@Autowired

	EmployeeService employeeService;
	/**
	 * 获取钣喷中心数据,用于查看
	 * */
	@RequestMapping(value="getCenterInfo",method=RequestMethod.GET)
	public ModelAndView getCenterInfo(Long id){
		CenterInfo centerInfo=centerInfoService.selectByPrimaryKey(id);
		ModelAndView mv = new ModelAndView("information/organiz/centerInfo");
		mv.addObject(centerInfo);
		return mv;
	}
	/**
	 * 获取钣喷中心数据用于编辑
	 * */
	@RequestMapping(value="editCenterInfo",method=RequestMethod.GET)
	public ModelAndView editCenterInfo(Long id){
		CenterInfo centerInfo=centerInfoService.selectByPrimaryKey(id);
		ModelAndView mv = new ModelAndView("information/organiz/editCenterInfo");
		mv.addObject(centerInfo);
		return mv;
	}
	/**
	 * 保存钣喷中心编辑数据
	 * */
	@RequestMapping(value="updateCenterInfo",method=RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> updateCenterInfo(CenterInfo entity){
		try {
			//从session中取用户信息赋值
			entity.setC_operator(TokenManager.getUsername());
		      entity.setC_updatetime(new Date());
			centerInfoService.updateByPrimaryKeySelective(entity);
			resultMap.put("status", 200);
			resultMap.put("message", "修改成功!");
		} catch (Exception e) {
			resultMap.put("status", 500);
			resultMap.put("message", "修改失败!");
			LoggerUtils.fmtError(getClass(), e, "修改信息出错。[%s]", JSONObject.fromObject(entity).toString());
		}
		return resultMap;
	}
	 /***
	    * 部门列表
	    * */
		@RequestMapping(value="listDepartment")
		public ModelAndView listDepartment(ModelMap map,Integer pageNo,String findContent,String centerid){	
			map.put("findContent", findContent);
			map.put("findCenterId",centerid==null?findCenterId:centerid);
			Pagination<Department> page = departmentService.findByPage(map,pageNo,pageSize);
			map.put("page", page);
			return new ModelAndView("information/organiz/listDepartment");
		}
		/**
		 * 删除部门，根据ID
		 * @param id
		 * @return
		 */
		@RequestMapping(value="deleteDepartmentById",method=RequestMethod.POST)
		@ResponseBody
		public Map<String,Object> deleteDepartmentByid(String ids){
			return departmentService.deleteDepartmentByid(ids);
		}
		/**
		 * 部门添加
		 * @return
		 */
		@RequestMapping(value="addDepartment",method=RequestMethod.POST)
		@ResponseBody
		public Map<String,Object> addDepartment(Department department){
			try {
				int count = departmentService.insertSelective(department);
				resultMap.put("status", 200);
				resultMap.put("successCount", count);
			} catch (Exception e) {
				resultMap.put("status", 500);
				resultMap.put("message", "添加部门失败，请刷新后再试！");
				LoggerUtils.fmtError(getClass(), e, "添加部门报错。source[%s]",department.toString());
			}
			return resultMap;
		}
		/**
		 * 根据ID查询部门信息
		 * @param id
		 * @return
		 */
		@RequestMapping(value="editDepartmentById")
		@ResponseBody
		public Department editDepartmentById(Long id){
			Department department = departmentService.selectByPrimaryKey(id);
			return department;
		}
		/**
		 * 保存部门信息编辑
		 * @return
		 */
		@RequestMapping(value="updateDepartment",method=RequestMethod.POST)
		@ResponseBody
		public Map<String,Object> updateDepartment(Department department){
			try {
				int count =departmentService.updateByPrimaryKeySelective(department);
				resultMap.put("status", 200);
				resultMap.put("successCount", count);
			} catch (Exception e) {
				resultMap.put("status", 500);
				resultMap.put("message", "编辑部门信息失败，请刷新后再试！");
				LoggerUtils.fmtError(getClass(), e, "编辑部门信息报错。source[%s]",department.toString());
			}
			return resultMap;
		}
		 /***
		    * 职务列表
		    * */
			@RequestMapping(value="listStations")
			public ModelAndView listStations(ModelMap map,Integer pageNo,String findContent,String centerid){	
				map.put("findContent", findContent);
				map.put("findCenterId",centerid==null?findCenterId:centerid);
				Pagination<Stations> page = stationsService.findByPage(map,pageNo,pageSize);
				map.put("page", page);
				return new ModelAndView("information/organiz/listStations");
			}
			/**
			 * 删除职务，根据ID
			 * @param id
			 * @return
			 */
			@RequestMapping(value="deleteStationsById",method=RequestMethod.POST)
			@ResponseBody
			public Map<String,Object> deleteStationsByid(String ids){
				return stationsService.deleteStationsByid(ids);
			}
			/**
			 * 职务添加
			 * @return
			 */
			@RequestMapping(value="addStations",method=RequestMethod.POST)
			@ResponseBody
			public Map<String,Object> addStations(Stations stations){
				try {
					int count = stationsService.insertSelective(stations);
					resultMap.put("status", 200);
					resultMap.put("successCount", count);
				} catch (Exception e) {
					resultMap.put("status", 500);
					resultMap.put("message", "添加职务失败，请刷新后再试！");
					LoggerUtils.fmtError(getClass(), e, "添加职务报错。source[%s]",stations.toString());
				}
				return resultMap;
			}
			/**
			 * 根据ID查询职务信息
			 * @param id
			 * @return
			 */
			@RequestMapping(value="editStationsById")
			@ResponseBody
			public Stations editStationsById(Long id){
				Stations stations = stationsService.selectByPrimaryKey(id);
				return stations;
			}
			/**
			 * 保存职务信息编辑
			 * @return
			 */
			@RequestMapping(value="updateStations",method=RequestMethod.POST)
			@ResponseBody
			public Map<String,Object> updateStations(Stations stations){
				try {
					int count =stationsService.updateByPrimaryKeySelective(stations);
					resultMap.put("status", 200);
					resultMap.put("successCount", count);
				} catch (Exception e) {
					resultMap.put("status", 500);
					resultMap.put("message", "编辑职务信息失败，请刷新后再试！");
					LoggerUtils.fmtError(getClass(), e, "编辑职务信息报错。source[%s]",stations.toString());
				}
				return resultMap;
			}
			 /***
			    * 工种列表
			    * */
				@RequestMapping(value="listProfession")
				public ModelAndView listProfession(ModelMap map,Integer pageNo,String findContent,String centerid){	
					map.put("findContent", findContent);
					map.put("findCenterId",centerid==null?findCenterId:centerid);
					Pagination<Profession> page = professionService.findByPage(map,pageNo,pageSize);
					map.put("page", page);
					
					return new ModelAndView("information/organiz/listProfession");
				}
				/**
				 * 删除工种，根据ID
				 * @param id
				 * @return
				 */
				@RequestMapping(value="deleteProfessionById",method=RequestMethod.POST)
				@ResponseBody
				public Map<String,Object> deleteProfessionByid(String ids){
					return professionService.deleteProfessionByid(ids);
				}
				/**
				 * 工种添加
				 * @return
				 */
				@RequestMapping(value="addProfession",method=RequestMethod.POST)
				@ResponseBody
				public Map<String,Object> addProfession(Profession profession){
					try {
						int count = professionService.insertSelective(profession);
						resultMap.put("status", 200);
						resultMap.put("successCount", count);
					} catch (Exception e) {
						resultMap.put("status", 500);
						resultMap.put("message", "添加工种失败，请刷新后再试！");
						LoggerUtils.fmtError(getClass(), e, "添加工种报错。source[%s]",profession.toString());
					}
					return resultMap;
				}
				/**
				 * 根据ID查询工种信息
				 * @param id
				 * @return
				 */
				@RequestMapping(value="editProfessionById")
				@ResponseBody
				public Profession editProfessionById(Long id){
					Profession profession = professionService.selectByPrimaryKey(id);
					return profession;
				}
				/**
				 * 保存工种信息编辑
				 * @return
				 */
				@RequestMapping(value="updateProfession",method=RequestMethod.POST)
				@ResponseBody
				public Map<String,Object> updateProfession(Profession profession){
					try {
						int count =professionService.updateByPrimaryKeySelective(profession);
						resultMap.put("status", 200);
						resultMap.put("successCount", count);
					} catch (Exception e) {
						resultMap.put("status", 500);
						resultMap.put("message", "编辑工种信息失败，请刷新后再试！");
						LoggerUtils.fmtError(getClass(), e, "编辑工种信息报错。source[%s]",profession.toString());
					}
					return resultMap;
				}
				/**
				 * 员工添加前置
				 * **/
				@RequestMapping(value="toAddEmployee",method=RequestMethod.GET)
				public ModelAndView toAddEmployee(Long centerid){
					ModelMap map=new ModelMap();
					map.put("findCenterId",centerid==null?findCenterId:centerid);
					ModelAndView mv = new ModelAndView("information/organiz/addEmployee");	
					//员工部门
					List<Department> listDepartment=new ArrayList<Department>();
					listDepartment=departmentService.ListDepartment(map);
					mv.addObject("listDepartment", listDepartment);
					//员工职务
					List<Stations> listStations=new ArrayList<Stations>();
					listStations=stationsService.ListStations(map);
					mv.addObject("listStations", listStations);
					//员工工种
					List<Profession> listProfession=new ArrayList<Profession>();
					listProfession=professionService.ListProfession(map);
					mv.addObject("listProfession", listProfession);
					mv.addObject("centerid",centerid==null?findCenterId:centerid);
					return mv;
				}
				/**
				 * 员工添加
				 * @return
				 */
				@RequestMapping(value="addEmployee",method=RequestMethod.POST)
				@ResponseBody
				public Map<String,Object> addEmployee(Employee employee){
					try {
						int count = employeeService.insertSelective(employee);
						resultMap.put("status", 200);
						resultMap.put("successCount", count);
					} catch (Exception e) {
						resultMap.put("status", 500);
						resultMap.put("message", "添加员工失败，请刷新后再试！");
						LoggerUtils.fmtError(getClass(), e, "添加员工报错。source[%s]",employee.toString());
					}
					return resultMap;
				}
				/**
				 * 根据ID查员工信息
				 * @param id
				 * @return
				 */
				@RequestMapping(value="editEmployeeById",method=RequestMethod.GET)
				@ResponseBody
				public ModelAndView editEmployeeById(Long id,Long centerid){
					Employee employee =employeeService.selectByPrimaryKey(id);
					ModelAndView mv = new ModelAndView("information/organiz/editEmployee");
					ModelMap map=new ModelMap();
					map.put("findCenterId",centerid==null?findCenterId:centerid);
					//员工部门
					List<Department> listDepartment=new ArrayList<Department>();
					listDepartment=departmentService.ListDepartment(map);
					mv.addObject("listDepartment", listDepartment);
					//员工职务
					List<Stations> listStations=new ArrayList<Stations>();
					listStations=stationsService.ListStations(map);
					mv.addObject("listStations", listStations);
					//员工工种
					List<Profession> listProfession=new ArrayList<Profession>();
					listProfession=professionService.ListProfession(map);
					mv.addObject("listProfession", listProfession);
					mv.addObject("centerid",centerid==null?findCenterId:centerid);
					mv.addObject(employee);
					return mv;

				}
				/**
				 * 保存员工信息
				 * @param carParts
				 * @return
				 */
				@RequestMapping(value="updateEmployee",method=RequestMethod.POST)
				@ResponseBody
				public Map<String,Object> updateEmployee(Employee employee){
					try {
						int count = employeeService.updateByPrimaryKeySelective(employee);
						resultMap.put("status", 200);
						resultMap.put("successCount", count);
					} catch (Exception e) {
						resultMap.put("status", 500);
						resultMap.put("message", "编辑员工失败，请刷新后再试！");
						LoggerUtils.fmtError(getClass(), e, "编辑员工报错。source[%s]",employee.toString());
					}
					return resultMap;
				}
				 /***
				    * 员工列表
				    * */
					@RequestMapping(value="listEmployee")
					public ModelAndView listEmployee(ModelMap map,Integer pageNo,String findContent,String centerid){	
						map.put("findContent", findContent);
						map.put("findCenterId",centerid==null?findCenterId:centerid);
						Pagination<Employee> page = employeeService.findByPage(map,pageNo,pageSize);
						map.put("page", page);
						
						return new ModelAndView("information/organiz/listEmployee");
					}
					/**
					 * 删除员工，根据ID
					 * @param id
					 * @return
					 */
					@RequestMapping(value="deleteEmployeeById",method=RequestMethod.POST)
					@ResponseBody
					public Map<String,Object> deleteEmployeeByid(String ids){
						return employeeService.deleteEmployeeByid(ids);
					}
					/**
					 * 休班设置前置
					 * @param id
					 * @return
					 */
					@RequestMapping(value="toRestById")
					@ResponseBody
					public Map<String,Object> toRestById(Long id,Long centerid){
						Map<String,Object> resultMap = new HashMap<String,Object>();
						ModelMap map=new ModelMap();
						/**
						 * 判断是id，如果有会员则差会员信息，没有则查会员列表
						 * */
						List<Employee> emlist=new ArrayList<Employee>();
						if(id==null){
							map.put("findCenterId",centerid==null?findCenterId:centerid);
							emlist=employeeService.ListEmployee(map);
							
						}
						else{
							Employee employee =employeeService.selectByPrimaryKey(id);
							emlist.add(employee);
						}
						resultMap.put("emlist", emlist);
						
						resultMap.put("centerid", centerid==null?findCenterId:centerid);
																		
						return resultMap;

					}
					/**
					 * 休班添加

					 * @return
					 */
					@RequestMapping(value="addRest",method=RequestMethod.POST)
					@ResponseBody
					public Map<String,Object> addRest(EmployeeRest employeeRest){
						try {
							int count = employeeService.insertRest(employeeRest);
							resultMap.put("status", 200);
							resultMap.put("successCount", count);
						} catch (Exception e) {
							resultMap.put("status", 500);
							resultMap.put("message", "添加休班失败，请刷新后再试！");
							LoggerUtils.fmtError(getClass(), e, "添加休班报错。source[%s]",employeeRest.toString());
						}
						return resultMap;
					}
					 /***
					    * 休班列表
					    * */
						@RequestMapping(value="listRest")
						public ModelAndView listRest(ModelMap map,Integer pageNo,String findContent,String centerid,String findEmployeeId){	
							map.put("findContent", findContent);
							map.put("findCenterId",centerid==null?findCenterId:centerid);
							map.put("findEmployeeId",findEmployeeId);
							Pagination<EmployeeRest> page = employeeService.findByPage("findRestAll","findRestCount",map,pageNo,pageSize);
							map.put("page", page);						
							return new ModelAndView("information/organiz/listRest");
						}
						/**
						 * 删除休班，根据ID
						 * @param id
						 * @return
						 */
						@RequestMapping(value="deleteRestById",method=RequestMethod.POST)
						@ResponseBody
						public Map<String,Object> deleteRestById(String ids){
							return employeeService.deleteRestByid(ids);
						}
}
