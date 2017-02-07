package com.mit.information.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mit.common.dao.SWorkplaceTypeMapper;
import com.mit.common.model.WorkplaceType;
import com.mit.common.utils.LoggerUtils;
import com.mit.core.mybatis.BaseMybatisDao;
import com.mit.core.mybatis.page.Pagination;
import com.mit.information.service.SWorkplaceTypeService;


/**
 * @author yejianming
 * @date 2016-10-27
 */

@Service
public class SWorkplaceTypeServiceImpl extends  BaseMybatisDao<SWorkplaceTypeMapper> implements SWorkplaceTypeService{
@Autowired
SWorkplaceTypeMapper sWorkplaceTypeMapper;

@Override
public WorkplaceType selectByPrimaryKey(Long id) {

	return sWorkplaceTypeMapper.selectByPrimaryKey(id);
}

@Override
public int deleteByPrimaryKey(Long id) {

	return sWorkplaceTypeMapper.deleteByPrimaryKey(id);
}

@Override
public int insertSelective(WorkplaceType workingType) {
	
	return sWorkplaceTypeMapper.insertSelective(workingType);
}

@Override
public int updateStatusById(Long id) {
	
	return sWorkplaceTypeMapper.updateStatusById(id);
}

@Override
public int updateByPrimaryKeySelective(WorkplaceType workingType) {
	
	return sWorkplaceTypeMapper.updateByPrimaryKeySelective(workingType);
}

@Override
public Map<String, Object> deleteWorkplaceTypeByid(String ids) {
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
		LoggerUtils.fmtError(getClass(), e, "根据IDS删除基础工位类型出现错误，ids[%s]", ids);
		resultMap.put("status", 500);
		resultMap.put("message", "删除出现错误，请刷新后再试！");
	}
	return resultMap;
}

@SuppressWarnings("unchecked")
@Override
public Pagination<WorkplaceType> findByPage(Map<String, Object> resultMap,
		Integer pageNo, Integer pageSize) {
	return super.findPage(resultMap, pageNo, pageSize);
}
@SuppressWarnings("unchecked")
@Override
public List<WorkplaceType> ListWorkplaceType(Map<String, Object> resultMap) {
	return super.findNoPageList("findAll", resultMap);
}

}