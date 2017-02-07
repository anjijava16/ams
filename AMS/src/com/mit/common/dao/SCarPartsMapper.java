package com.mit.common.dao;

import java.util.List;

import com.mit.common.model.CarParts;



/**
 * @author yejianming
 */
public interface SCarPartsMapper {
	CarParts selectByPrimaryKey(Long id);
	 int deleteByPrimaryKey(Long id);
	 int insertSelective(CarParts carParts);
	 int updateByPrimaryKeySelective(CarParts carParts);
	 int updateStatusById(Long id);
	 int insertRecord(CarParts carParts);
	 int inCarPartsById(CarParts carParts);
	 int outCarPartsById(CarParts carParts);
	 
	 List<CarParts> selectCarParts(CarParts carParts);
}