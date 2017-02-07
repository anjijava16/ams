package com.mit.information.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mit.common.dao.DepartmentMapper;
import com.mit.common.model.Department;
import com.mit.common.utils.LoggerUtils;
import com.mit.core.mybatis.BaseMybatisDao;
import com.mit.core.mybatis.page.Pagination;
import com.mit.information.service.DepartmentService;


/**
 * @author yejianming
 * @date 2016-10-27
 */

@Service
public class DepartmentServiceImpl extends  BaseMybatisDao<DepartmentMapper> implements DepartmentService{
@Autowired
DepartmentMapper departmentMapper;

@Override
public Department selectByPrimaryKey(Long id) {

	return departmentMapper.selectByPrimaryKey(id);
}

@Override
public int deleteByPrimaryKey(Long id) {

	return departmentMapper.deleteByPrimaryKey(id);
}

@Override
public int insertSelective(Department department) {
	
	return departmentMapper.insertSelective(department);
}

@Override
public int updateStatusById(Long id) {
	
	return departmentMapper.updateStatusById(id);
}

@Override
public int updateByPrimaryKeySelective(Department department) {
	
	return departmentMapper.updateByPrimaryKeySelective(department);
}

@Override
public Map<String, Object> deleteDepartmentByid(String ids) {
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
		LoggerUtils.fmtError(getClass(), e, "根据IDS删除部门出现错误，ids[%s]", ids);
		resultMap.put("status", 500);
		resultMap.put("message", "删除部门出现错误，请刷新后再试！");
	}
	return resultMap;
}

@SuppressWarnings("unchecked")
@Override
public Pagination<Department> findByPage(Map<String, Object> resultMap,
		Integer pageNo, Integer pageSize) {
	return super.findPage(resultMap, pageNo, pageSize);
}
@SuppressWarnings("unchecked")
@Override
public List<Department> ListDepartment(Map<String, Object> resultMap) {
	return super.findNoPageList("findAll", resultMap);
}

}