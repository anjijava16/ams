package com.mit.information.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mit.common.dao.EmployeeMapper;
import com.mit.common.model.Employee;
import com.mit.common.model.EmployeeRest;
import com.mit.common.utils.LoggerUtils;
import com.mit.core.mybatis.BaseMybatisDao;
import com.mit.core.mybatis.page.Pagination;
import com.mit.information.service.EmployeeService;


/**
 * @author yejianming
 * @date 2016-10-27
 */

@Service
public class EmployeeServiceImpl extends  BaseMybatisDao<EmployeeMapper> implements EmployeeService{
@Autowired
EmployeeMapper employeeMapper;

@Override
public Employee selectByPrimaryKey(Long id) {

	return employeeMapper.selectByPrimaryKey(id);
}

@Override
public int deleteByPrimaryKey(Long id) {

	return employeeMapper.deleteByPrimaryKey(id);
}

@Override
public int insertSelective(Employee employee) {
	
	return employeeMapper.insertSelective(employee);
}

@Override
public int updateStatusById(Long id) {
	
	return employeeMapper.updateStatusById(id);
}

@Override
public int updateByPrimaryKeySelective(Employee employee) {
	
	return employeeMapper.updateByPrimaryKeySelective(employee);
}

@Override
public Map<String, Object> deleteEmployeeByid(String ids) {
	Map<String,Object> resultMap = new HashMap<String,Object>();
	try {
		int count=0;
		String[] idArray = new String[]{};
		if(StringUtils.contains(ids, ",")){
			idArray = ids.split(",");
		}else{
			idArray = new String[]{ids};
		}
		
		for (String id : idArray) {
			count+=this.updateStatusById(new Long(id));
		}
		resultMap.put("status", 200);
		resultMap.put("count", count);
	} catch (Exception e) {
		LoggerUtils.fmtError(getClass(), e, "根据IDS删除员工出现错误，ids[%s]", ids);
		resultMap.put("status", 500);
		resultMap.put("message", "删除员工出现错误，请刷新后再试！");
	}
	return resultMap;
}

@SuppressWarnings("unchecked")
@Override
public Pagination<Employee> findByPage(Map<String, Object> resultMap,
		Integer pageNo, Integer pageSize) {
	return super.findPage(resultMap, pageNo, pageSize);
}
@SuppressWarnings("unchecked")
@Override
public List<Employee> ListEmployee(Map<String, Object> resultMap) {
	return super.findNoPageList("findAll", resultMap);
}

@Override
public int insertRest(EmployeeRest employeeRest) {
	return employeeMapper.insertRest(employeeRest);
}

@Override
public int updateRestStatusById(Long id) {
	return employeeMapper.updateRestStatusById(id);
}
@SuppressWarnings("unchecked")
@Override
public Pagination<EmployeeRest> findByPage(String sqlId, String countId,
		Map<String, Object> params, Integer pageNo, Integer pageSize) {
	
	return super.findPage(sqlId, countId, params, pageNo, pageSize);
}

@Override
public Map<String, Object> deleteRestByid(String ids) {
	Map<String,Object> resultMap = new HashMap<String,Object>();
	try {
		int count=0;
		String[] idArray = new String[]{};
		if(StringUtils.contains(ids, ",")){
			idArray = ids.split(",");
		}else{
			idArray = new String[]{ids};
		}
		
		for (String id : idArray) {
			count+=this.updateRestStatusById(new Long(id));
		}
		resultMap.put("status", 200);
		resultMap.put("count", count);
	} catch (Exception e) {
		LoggerUtils.fmtError(getClass(), e, "根据IDS删除员工休班出现错误，ids[%s]", ids);
		resultMap.put("status", 500);
		resultMap.put("message", "删除员工休班出现错误，请刷新后再试！");
	}
	return resultMap;
}

}