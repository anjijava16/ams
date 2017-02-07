package com.mit.information.service;

import java.util.List;
import java.util.Map;

import com.mit.common.model.CarModel;
import com.mit.core.mybatis.page.Pagination;



/**
 * @author yejianming
 */
public interface SCarModelService {
	 CarModel selectByPrimaryKey(Long id);
	 int deleteByPrimaryKey(Long id);
	 int insertSelective(CarModel carModel);
	 int updateStatusById(Long id);
	 int updateByPrimaryKeySelective(CarModel carModel);
	 Map<String, Object> deleteCarModelByid(String ids);
	 Pagination<CarModel> findByPage(Map<String, Object> resultMap, Integer pageNo,
				Integer pageSize);
	 List<CarModel> listCarModels(Map<String, Object> resultMap);
	 

}