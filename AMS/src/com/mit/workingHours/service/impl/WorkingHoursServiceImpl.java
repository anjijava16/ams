package com.mit.workingHours.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.mit.core.mybatis.BaseMybatisDao;
import com.mit.core.mybatis.page.Pagination;
import com.mit.workingHours.service.WorkingHoursService;
import com.mit.common.dao.WorkingHoursMapper;
import com.mit.common.model.WorkingHours;
import com.mit.common.utils.LoggerUtils;


/**
 * @author yejianming
 */

@Service
public class WorkingHoursServiceImpl extends  BaseMybatisDao<WorkingHoursMapper> implements WorkingHoursService{
@Autowired
WorkingHoursMapper workingHoursMapper;

@Override
public WorkingHours selectByPrimaryKey(Long id) {

	return workingHoursMapper.selectByPrimaryKey(id);
}

@Override
public int deleteByPrimaryKey(Long id) {

	return workingHoursMapper.deleteByPrimaryKey(id);
}

@Override
public int insertSelective(WorkingHours workingHours) {
	
	return workingHoursMapper.insertSelective(workingHours);
}

@Override
public int updateStatusById(Long id) {
	
	return workingHoursMapper.updateStatusById(id);
}

@Override
public int updateByPrimaryKeySelective(WorkingHours workingHours) {
	
	return workingHoursMapper.updateByPrimaryKeySelective(workingHours);
}

@Override
public Map<String, Object> deleteWorkingHoursByid(String ids) {
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
		LoggerUtils.fmtError(getClass(), e, "根据IDS删除基础标准工时出现错误，ids[%s]", ids);
		resultMap.put("status", 500);
		resultMap.put("message", "删除出现错误，请刷新后再试！");
	}
	return resultMap;
}

@SuppressWarnings("unchecked")
@Override
public Pagination<WorkingHours> findByPage(Map<String, Object> resultMap,
		Integer pageNo, Integer pageSize) {
	return super.findPage(resultMap, pageNo, pageSize);
}

@SuppressWarnings("unchecked")
@Override
public List<WorkingHours> ListWorkingHours(Map<String, Object> resultMap) {
	return super.findNoPageList("findAll", resultMap);
}


}