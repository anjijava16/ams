package com.mit.common.dao;

import com.mit.common.model.Employee;
import com.mit.common.model.EmployeeRest;



/**
 * @author yejianming
 */
public interface EmployeeMapper {
	Employee selectByPrimaryKey(Long id);
	 int deleteByPrimaryKey(Long id);
	 int insertSelective( Employee  employee);
	 int updateByPrimaryKeySelective( Employee  employee);
	 int updateStatusById(Long id);
	 /**
	  * 排班信息
	  * */
	 int insertRest( EmployeeRest  employeeRest);
	 int updateRestStatusById(Long id);
}