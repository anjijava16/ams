package com.mit.workingHours.service;

import java.util.List;
import java.util.Map;

import com.mit.common.model.WorkingHours;
import com.mit.core.mybatis.page.Pagination;



/**
 * @author yejianming
 */
public interface WorkingHoursService {
	WorkingHours selectByPrimaryKey(Long id);
	 int deleteByPrimaryKey(Long id);
	 int insertSelective(WorkingHours workingHours);
	 int updateStatusById(Long id);
	 int updateByPrimaryKeySelective(WorkingHours workingHours);
	 Map<String, Object> deleteWorkingHoursByid(String ids);
	 Pagination<WorkingHours> findByPage(Map<String, Object> resultMap, Integer pageNo,
				Integer pageSize);
	 List<WorkingHours> ListWorkingHours(Map<String, Object> resultMap);
	 
}