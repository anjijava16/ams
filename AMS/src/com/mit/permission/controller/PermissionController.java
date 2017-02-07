package com.mit.permission.controller;

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
import com.mit.common.model.Permission;
import com.mit.common.utils.LoggerUtils;
import com.mit.core.mybatis.page.Pagination;
import com.mit.permission.service.PermissionService;
/**
 * 
 * 用户权限管理
 */
@Controller
@Scope(value="prototype")
@RequestMapping("permission")
public class PermissionController extends BaseController {
	
	@Autowired
	PermissionService permissionService;
	/**
	 * 权限列表
	 * @param findContent	查询内容
	 * @param pageNo		页码
	 * @param modelMap		参数回显
	 * @return
	 */
	@RequestMapping(value="list")
	public ModelAndView index(String findContent,ModelMap modelMap,Integer pageNo){
		modelMap.put("findContent", findContent);
		Pagination<Permission> permissions = permissionService.findPage(modelMap,pageNo,pageSize);
		return new ModelAndView("permission/list","page",permissions);
	}
	/**
	 * 权限添加
	 * @param role
	 * @return
	 */
	@RequestMapping(value="addPermission",method=RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> addPermission(Permission psermission){
		try {
			Permission entity = permissionService.insertSelective(psermission);
			resultMap.put("status", 200);
			resultMap.put("entity", entity);
		} catch (Exception e) {
			resultMap.put("status", 500);
			resultMap.put("message", "添加失败，请刷新后再试！");
			LoggerUtils.fmtError(getClass(), e, "添加权限报错。source[%s]", psermission.toString());
		}
		return resultMap;
	}
	/**
	 * 删除权限，根据ID，但是删除权限的时候，需要查询是否有赋予给角色，如果有角色在使用，那么就不能删除。
	 * @param id
	 * @return
	 */
	@RequestMapping(value="deletePermissionById",method=RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> deleteRoleById(String ids){
		return permissionService.deletePermissionById(ids);
	}
	/**
	 * 根据权限ID查询权限信息
	 * @param id
	 * @return
	 */
	@RequestMapping(value="editPermissionById")
	@ResponseBody
	public Permission editPermissionById(Long id){
		Permission permission = permissionService.selectByPrimaryKey(id);
		return permission;
	}
	/**
	 * 权限编辑
	 * @param permission
	 * @return
	 */
	@RequestMapping(value="updatePermission",method=RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> updatePermission(Permission permission){
		try {
			int count = permissionService.updateByPrimaryKeySelective(permission);
			resultMap.put("status", 200);
			resultMap.put("successCount", count);
		} catch (Exception e) {
			resultMap.put("status", 500);
			resultMap.put("message", "编辑权限失败，请刷新后再试！");
			LoggerUtils.fmtError(getClass(), e, "编辑权限报错。source[%s]",permission.toString());
		}
		return resultMap;
	}
}
