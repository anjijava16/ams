package com.mit.information.service;

import java.util.List;
import java.util.Map;

import com.mit.common.model.WorkingHours;
import com.mit.core.mybatis.page.Pagination;



/**
 * @author yejianming
 */
public interface SWorkingHoursService {
	WorkingHours selectByPrimaryKey(Long id);
	 int deleteByPrimaryKey(Long id);
	 int insertSelective(WorkingHours workingHours);
	 int updateStatusById(Long id);
	 int updateByPrimaryKeySelective(WorkingHours workingHours);
	 Map<String, Object> deleteWorkingHoursByid(String ids);
	 Pagination<WorkingHours> findByPage(Map<String, Object> resultMap, Integer pageNo,
				Integer pageSize);
	 
	 /**    工单用方法 add by 刘鹏飞    **/
	 List<WorkingHours> listWorkingHours(WorkingHours workingHours);
	 
}