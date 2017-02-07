package com.mit.common.dao;

import java.util.List;
import java.util.Map;
import java.util.Set;

import com.mit.common.model.Permission;
import com.mit.permission.bo.PermissionBo;

public interface PermissionMapper {
    int deleteByPrimaryKey(Long id);

    int insert(Permission record);

    int insertSelective(Permission record);

    Permission selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(Permission record);

    int updateByPrimaryKey(Permission record);

	List<PermissionBo> selectPermissionById(Map<String, Object> resultMap);
	//根据用户ID获取权限的Set集合
	Set<String> findPermissionByUserId(Long id);
}