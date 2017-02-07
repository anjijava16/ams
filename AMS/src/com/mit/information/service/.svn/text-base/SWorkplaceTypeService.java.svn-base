package com.mit.information.service;

import java.util.List;
import java.util.Map;

import com.mit.common.model.WorkplaceType;
import com.mit.core.mybatis.page.Pagination;



/**
 * @author yejianming
 */
public interface SWorkplaceTypeService {
	WorkplaceType selectByPrimaryKey(Long id);
	 int deleteByPrimaryKey(Long id);
	 int insertSelective(WorkplaceType workplaceType);
	 int updateStatusById(Long id);
	 int updateByPrimaryKeySelective(WorkplaceType workplaceType);
	 Map<String, Object> deleteWorkplaceTypeByid(String ids);
	 Pagination<WorkplaceType> findByPage(Map<String, Object> resultMap, Integer pageNo,
				Integer pageSize);
	 List<WorkplaceType> ListWorkplaceType(Map<String, Object> resultMap);
}