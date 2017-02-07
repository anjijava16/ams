package com.mit.common.dao;

import com.mit.common.model.WorkingType;



/**
 * @author yejianming
 */
public interface WorkingTypeMapper {
	 WorkingType selectByPrimaryKey(Long id);
	 int deleteByPrimaryKey(Long id);
	 int insertSelective( WorkingType  workingType);
	 int updateByPrimaryKeySelective( WorkingType  workingType);
	 int updateStatusById(Long id);
}