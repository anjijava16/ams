package com.mit.permission.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mit.common.controller.BaseController;
import com.mit.core.mybatis.page.Pagination;
import com.mit.permission.bo.RoleBo;
import com.mit.permission.bo.UserRoleAllocationBo;
import com.mit.permission.service.PermissionService;
import com.mit.user.service.UserService;
/**
 * 
 */
@Controller
@Scope(value="prototype")
@RequestMapping("role")
public class UserRoleAllocationController extends BaseController {
	@Autowired
	UserService userService;
	@Autowired
	PermissionService permissionService;
	/**
	 * 用户角色权限分配
	 * @param modelMap
	 * @param pageNo
	 * @param findContent
	 * @return
	 */
	@RequestMapping(value="allocation")
	public ModelAndView allocation(ModelMap modelMap,Integer pageNo,String findContent){
		modelMap.put("findContent", findContent);
		modelMap.put("findCenterId", findCenterId);
		Pagination<UserRoleAllocationBo> boPage = userService.findUserAndRole(modelMap,pageNo,pageSize);
		modelMap.put("page", boPage);
		return new ModelAndView("role/allocation");
	}
	
	/**
	 * 根据用户ID查询权限
	 * @param id
	 * @return
	 */
	@RequestMapping(value="selectRoleByUserId")
	@ResponseBody
	public List<RoleBo> selectRoleByUserId(Long id){
		ModelMap modelMap=new ModelMap();
		modelMap.put("id", id);
		modelMap.put("type", findCenterId);
		List<RoleBo> bos = userService.selectRoleByUserId(modelMap);
		return bos;
	}
	/**
	 * 操作用户的角色
	 * @param userId 	用户ID
	 * @param ids		角色ID，以‘,’间隔
	 * @return
	 */
	@RequestMapping(value="addRole2User")
	@ResponseBody
	public Map<String,Object> addRole2User(Long userId,String ids){
		return userService.addRole2User(userId,ids);
	}
	/**
	 * 根据用户id清空角色。
	 * @param userIds	用户ID ，以‘,’间隔
	 * @return
	 */
	@RequestMapping(value="clearRoleByUserIds")
	@ResponseBody
	public Map<String,Object> clearRoleByUserIds(String userIds){
		return userService.deleteRoleByUserIds(userIds);
	}
}
