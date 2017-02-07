package com.mit.information.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mit.common.dao.StationMapper;
import com.mit.common.model.EmployeeWplace;
import com.mit.common.model.Station;
import com.mit.common.utils.LoggerUtils;
import com.mit.core.mybatis.BaseMybatisDao;
import com.mit.core.mybatis.page.Pagination;
import com.mit.information.service.StationService;


/**
 * @author yejianming
 * @date 2016-10-27
 */

@Service
public class StationServiceImpl extends  BaseMybatisDao<StationMapper> implements StationService{
@Autowired
StationMapper stationMapper;

@Override
public Station selectByPrimaryKey(Long id) {

	return stationMapper.selectByPrimaryKey(id);
}

@Override
public int deleteByPrimaryKey(Long id) {

	return stationMapper.deleteByPrimaryKey(id);
}

@Override
public int insertSelective(Station station) {
	
	return stationMapper.insertSelective(station);
}

@Override
public int updateStatusById(Long id) {
	
	return stationMapper.updateStatusById(id);
}

@Override
public int updateByPrimaryKeySelective(Station station) {
	
	return stationMapper.updateByPrimaryKeySelective(station);
}

@Override
public Map<String, Object> deleteStationByid(String ids) {
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
		LoggerUtils.fmtError(getClass(), e, "根据IDS删除工位出现错误，ids[%s]", ids);
		resultMap.put("status", 500);
		resultMap.put("message", "删除出现错误，请刷新后再试！");
	}
	return resultMap;
}

@SuppressWarnings("unchecked")
@Override
public Pagination<Station> findByPage(Map<String, Object> resultMap,
		Integer pageNo, Integer pageSize) {
	return super.findPage(resultMap, pageNo, pageSize);
}
@SuppressWarnings("unchecked")
@Override
public List<Station> ListStation(Map<String, Object> resultMap) {
	return super.findNoPageList("findAll", resultMap);
}

@Override
public int insertEwplace(EmployeeWplace employeeWplace) {
	
	return stationMapper.insertEwplace(employeeWplace);
}

@Override
public int updateEwplaceStatusById(Long id) {
	return stationMapper.updateEwplaceStatusById(id);
}
@SuppressWarnings("unchecked")
@Override
public Pagination<EmployeeWplace> findByPage(String sqlId, String countId,
		Map<String, Object> params, Integer pageNo, Integer pageSize) {
	return super.findPage(sqlId, countId, params, pageNo, pageSize);
}

@Override
public Map<String, Object> deleteEwplaceByid(String ids) {
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
			count+=this.updateEwplaceStatusById(new Long(id));
		}
		resultMap.put("status", 200);
		resultMap.put("count", count);
	} catch (Exception e) {
		LoggerUtils.fmtError(getClass(), e, "根据IDS删除工位绑定员工出现错误，ids[%s]", ids);
		resultMap.put("status", 500);
		resultMap.put("message", "删除工位绑定员工出现出现错误，请刷新后再试！");
	}
	return resultMap;
}

}