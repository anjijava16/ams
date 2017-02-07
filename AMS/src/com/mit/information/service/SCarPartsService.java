package com.mit.information.service;

import java.util.List;
import java.util.Map;

import com.mit.common.model.CarParts;
import com.mit.core.mybatis.page.Pagination;



/**
 * @author yejianming
 */
public interface SCarPartsService {
	 CarParts selectByPrimaryKey(Long id);
	 int deleteByPrimaryKey(Long id);
	 int insertSelective(CarParts carParts);
	 int updateStatusById(Long id);
	 int updateByPrimaryKeySelective(CarParts carParts);
	 Map<String, Object> deleteCarPartsByid(String ids);
	 Pagination<CarParts> findByPage(Map<String, Object> resultMap, Integer pageNo,
				Integer pageSize);
	 List<CarParts> ListCarParts(Map<String, Object> resultMap);
	 int insertRecord(CarParts carParts);
	 Pagination<CarParts> findByPage(String sqlId, String countId,
				Map<String, Object> params, Integer pageNo, Integer pageSize);
	 int inCarPartsById(CarParts carParts);
	 int outCarPartsById(CarParts carParts);
	 
	 List<CarParts> selectCarParts(CarParts carParts);
	 
}