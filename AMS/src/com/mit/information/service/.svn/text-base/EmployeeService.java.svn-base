package com.mit.information.service;

import java.util.List;
import java.util.Map;

import com.mit.common.model.Employee;
import com.mit.common.model.EmployeeRest;
import com.mit.core.mybatis.page.Pagination;



/**
 * @author yejianming
 */
public interface EmployeeService {
	Employee selectByPrimaryKey(Long id);
	 int deleteByPrimaryKey(Long id);
	 int insertSelective(Employee employee);
	 int updateStatusById(Long id);
	 int updateByPrimaryKeySelective(Employee employee);
	 Map<String, Object> deleteEmployeeByid(String ids);
	 Pagination<Employee> findByPage(Map<String, Object> resultMap, Integer pageNo,
				Integer pageSize);
	 List<Employee> ListEmployee(Map<String, Object> resultMap);
	 /**
	  * 排班信息
	  * */
	 int insertRest( EmployeeRest  employeeRest);
	 int updateRestStatusById(Long id);
	 Map<String, Object> deleteRestByid(String ids);
	 Pagination<EmployeeRest> findByPage(String sqlId, String countId,
				Map<String, Object> params, Integer pageNo, Integer pageSize);
}