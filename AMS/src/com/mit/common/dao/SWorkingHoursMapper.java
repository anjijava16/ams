package com.mit.common.dao;

import java.util.List;

import com.mit.common.model.WorkingHours;



/**
 * @author yejianming
 */
public interface SWorkingHoursMapper {
	 WorkingHours selectByPrimaryKey(Long id);
	 int deleteByPrimaryKey(Long id);
	 int insertSelective( WorkingHours  workingHours);
	 int updateByPrimaryKeySelective( WorkingHours  workingHours);
	 int updateStatusById(Long id);
	 
	 List<WorkingHours> selectOrderHour(WorkingHours workingHours);
}