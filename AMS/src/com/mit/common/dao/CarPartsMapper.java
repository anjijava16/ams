package com.mit.common.dao;

import com.mit.common.model.CarParts;



/**
 * @author yejianming
 */
public interface CarPartsMapper {
	CarParts selectByPrimaryKey(Long id);
	 int deleteByPrimaryKey(Long id);
	 int insertSelective(CarParts carParts);
	 int updateByPrimaryKeySelective(CarParts carParts);
	 int updateStatusById(Long id);
}