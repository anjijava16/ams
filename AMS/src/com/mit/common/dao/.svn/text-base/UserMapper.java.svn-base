package com.mit.common.dao;

import java.util.List;
import java.util.Map;

import com.mit.common.model.User;
import com.mit.permission.bo.RoleBo;

public interface UserMapper {
    int deleteByPrimaryKey(Long id);

    int insertSelective(User record);

    User selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);

	User login(Map<String, Object> map);

	User findUserByName(String username);

	List<RoleBo> selectRoleByUserId(Map<String, Object> resultMap);

}