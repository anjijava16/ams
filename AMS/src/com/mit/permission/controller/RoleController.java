package com.mit.permission.controller;

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
import com.mit.common.model.Role;
import com.mit.common.utils.LoggerUtils;
import com.mit.core.mybatis.page.Pagination;
import com.mit.permission.service.RoleService;
import com.mit.user.manager.UserManager;
/**
 * 
 * 
 */
@Controller
@Scope(value="prototype")
@RequestMapping("role")
public class RoleController extends BaseController {
	@Autowired
	RoleService roleService;
	/**
	 * 角色列表
	 * @return
	 */
	@RequestMapping(value="list")
	public ModelAndView index(String findContent,ModelMap modelMap){
		modelMap.put("findContent", findContent);
		modelMap.put("findType", findCenterId);
		
		Pagination<Role> role = roleService.findPage(modelMap,pageNo,pageSize);
		return new ModelAndView("role/list","page",role);
	}
	/**
	 * 角色添加
	 * @param role
	 * @return
	 */
	@RequestMapping(value="addRole",method=RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> addRole(Role role){
		try {
			int count = roleService.insertSelective(role);
			resultMap.put("status", 200);
			resultMap.put("successCount", count);
		} catch (Exception e) {
			resultMap.put("status", 500);
			resultMap.put("message", "添加失败，请刷新后再试！");
			LoggerUtils.fmtError(getClass(), e, "添加角色报错。source[%s]",role.toString());
		}
		return resultMap;
	}
	/**
	 * 删除角色，根据ID，但是删除角色的时候，需要查询是否有赋予给用户，如果有用户在使用，那么就不能删除。
	 * @param id
	 * @return
	 */
	@RequestMapping(value="deleteRoleById",method=RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> deleteRoleById(String ids){
		return roleService.deleteRoleById(ids);
	}
	/**
	 * 我的权限页面
	 * @return
	 */
	@RequestMapping(value="mypermission",method=RequestMethod.GET)
	public ModelAndView mypermission(){
		return new ModelAndView("permission/mypermission");
	}
	/**
	 * 我的权限 bootstrap tree data
	 * @return
	 */
	@RequestMapping(value="getPermissionTree",method=RequestMethod.POST)
	@ResponseBody
	public List<Map<String, Object>> getPermissionTree(){
		//查询我所有的角色 ---> 权限
		List<Role> roles = roleService.findNowAllPermission();
		//把查询出来的roles 转换成bootstarp 的 tree数据
		List<Map<String, Object>> data = UserManager.toTreeData(roles);
		return data;
	}
	/**
	 * 根据角色ID查询角色信息
	 * @param id
	 * @return
	 */
	@RequestMapping(value="selectRoleById")
	@ResponseBody
	public Role selectRoleById(Long id){
		Role role = roleService.selectByPrimaryKey(id);
		return role;
	}
	/**
	 * 角色编辑
	 * @param role
	 * @return
	 */
	@RequestMapping(value="updateRole",method=RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> updateRole(Role role){
		try {
			int count = roleService.updateByPrimaryKeySelective(role);
			resultMap.put("status", 200);
			resultMap.put("successCount", count);
		} catch (Exception e) {
			resultMap.put("status", 500);
			resultMap.put("message", "编辑角色失败，请刷新后再试！");
			LoggerUtils.fmtError(getClass(), e, "编辑角色报错。source[%s]",role.toString());
		}
		return resultMap;
	}
}
