package com.mit.common.dao;

import com.mit.common.model.EmployeeWplace;
import com.mit.common.model.Station;

public interface StationMapper {
	Station selectByPrimaryKey(Long id);
	 int deleteByPrimaryKey(Long id);
	 int insertSelective(Station  station);
	 int updateByPrimaryKeySelective(Station  station);
	 int updateStatusById(Long id);
	 /**
	  * 工位绑定员工
	  * */
	 int insertEwplace(EmployeeWplace employeeWplace);
	 int updateEwplaceStatusById(Long id);
}
