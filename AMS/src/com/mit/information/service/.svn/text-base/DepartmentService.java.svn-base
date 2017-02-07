package com.mit.information.service;

import java.util.List;
import java.util.Map;

import com.mit.common.model.Department;
import com.mit.core.mybatis.page.Pagination;



/**
 * @author yejianming
 */
public interface DepartmentService {
	Department selectByPrimaryKey(Long id);
	 int deleteByPrimaryKey(Long id);
	 int insertSelective(Department department);
	 int updateStatusById(Long id);
	 int updateByPrimaryKeySelective(Department department);
	 Map<String, Object> deleteDepartmentByid(String ids);
	 Pagination<Department> findByPage(Map<String, Object> resultMap, Integer pageNo,
				Integer pageSize);
	 List<Department> ListDepartment(Map<String, Object> resultMap);
}