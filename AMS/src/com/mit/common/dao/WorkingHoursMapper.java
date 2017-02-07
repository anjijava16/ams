package com.mit.common.dao;

import com.mit.common.model.WorkingHours;



/**
 * @author yejianming
 */
public interface WorkingHoursMapper {
	 WorkingHours selectByPrimaryKey(Long id);
	 int deleteByPrimaryKey(Long id);
	 int insertSelective( WorkingHours  workingHours);
	 int updateByPrimaryKeySelective( WorkingHours  workingHours);
	 int updateStatusById(Long id);
}