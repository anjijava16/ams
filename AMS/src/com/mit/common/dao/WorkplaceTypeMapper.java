package com.mit.common.dao;

import com.mit.common.model.WorkplaceType;



/**
 * @author yejianming
 */
public interface WorkplaceTypeMapper {
	 WorkplaceType selectByPrimaryKey(Long id);
	 int deleteByPrimaryKey(Long id);
	 int insertSelective( WorkplaceType  workplaceType);
	 int updateByPrimaryKeySelective( WorkplaceType  workplaceType);
	 int updateStatusById(Long id);
}