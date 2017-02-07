package com.mit.user.service;

import java.util.List;
import java.util.Map;

import org.springframework.ui.ModelMap;

import com.mit.common.model.User;
import com.mit.core.mybatis.page.Pagination;
import com.mit.permission.bo.RoleBo;
import com.mit.permission.bo.UserRoleAllocationBo;

public interface UserService {

	int deleteByPrimaryKey(Long id);

    User insertSelective(User record);

    User selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);
    
    User login(String username ,String pswd);

	User findUserByName(String username);

	Pagination<User> findByPage(Map<String, Object> resultMap, Integer pageNo,
			Integer pageSize);

	Map<String, Object> deleteUserById(String ids);

	Map<String, Object> updateForbidUserById(Long id, Long status);

	Pagination<UserRoleAllocationBo> findUserAndRole(ModelMap modelMap,
			Integer pageNo, Integer pageSize);

	List<RoleBo> selectRoleByUserId(Map<String, Object> resultMap);

	Map<String, Object> addRole2User(Long userId, String ids);

	Map<String, Object> deleteRoleByUserIds(String userIds);
}
