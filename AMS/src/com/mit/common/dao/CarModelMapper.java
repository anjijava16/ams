package com.mit.common.dao;

import com.mit.common.model.CarModel;



/**
 * @author yejianming
 */
public interface CarModelMapper {
 CarModel selectByPrimaryKey(Long id);
 int deleteByPrimaryKey(Long id);
 int insertSelective(CarModel carModel);
 int updateByPrimaryKeySelective(CarModel carModel);
 int updateStatusById(Long id);
}