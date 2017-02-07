package com.mit.common.dao;

import com.mit.common.model.Stations;



/**
 * @author yejianming
 */
public interface StationsMapper {
	Stations selectByPrimaryKey(Long id);
	 int deleteByPrimaryKey(Long id);
	 int insertSelective( Stations  stations);
	 int updateByPrimaryKeySelective( Stations  stations);
	 int updateStatusById(Long id);
}