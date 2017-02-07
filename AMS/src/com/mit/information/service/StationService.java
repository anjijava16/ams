package com.mit.information.service;

import java.util.List;
import java.util.Map;

import com.mit.common.model.EmployeeWplace;
import com.mit.common.model.Station;
import com.mit.core.mybatis.page.Pagination;



/**
 * @author yejianming
 */
public interface StationService {
	Station selectByPrimaryKey(Long id);
	 int deleteByPrimaryKey(Long id);
	 int insertSelective(Station station);
	 int updateStatusById(Long id);
	 int updateByPrimaryKeySelective(Station station);
	 Map<String, Object> deleteStationByid(String ids);
	 Pagination<Station> findByPage(Map<String, Object> resultMap, Integer pageNo,
				Integer pageSize);
	 List<Station> ListStation(Map<String, Object> resultMap);
	 /**
	  * 工位绑定员工
	  * */
	 int insertEwplace(EmployeeWplace employeeWplace);
	 int updateEwplaceStatusById(Long id);
	 Map<String, Object> deleteEwplaceByid(String ids);
	 Pagination<EmployeeWplace> findByPage(String sqlId, String countId,
				Map<String, Object> params, Integer pageNo, Integer pageSize);
}