package com.mit.information.service;

import java.util.List;
import java.util.Map;

import com.mit.common.model.Stations;
import com.mit.core.mybatis.page.Pagination;



/**
 * @author yejianming
 */
public interface StationsService {
	Stations selectByPrimaryKey(Long id);
	 int deleteByPrimaryKey(Long id);
	 int insertSelective(Stations stations);
	 int updateStatusById(Long id);
	 int updateByPrimaryKeySelective(Stations stations);
	 Map<String, Object> deleteStationsByid(String ids);
	 Pagination<Stations> findByPage(Map<String, Object> resultMap, Integer pageNo,
				Integer pageSize);
	 List<Stations> ListStations(Map<String, Object> resultMap);
}