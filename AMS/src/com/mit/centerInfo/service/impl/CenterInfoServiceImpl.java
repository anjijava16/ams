package com.mit.centerInfo.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.mit.core.mybatis.BaseMybatisDao;
import com.mit.core.mybatis.page.Pagination;
import com.mit.centerInfo.service.CenterInfoService;
import com.mit.common.dao.CenterInfoMapper;
import com.mit.common.model.CenterInfo;
import com.mit.common.utils.LoggerUtils;


/**
 * @author yejianming
 */

@Service
public class CenterInfoServiceImpl extends  BaseMybatisDao<CenterInfoMapper> implements CenterInfoService{
@Autowired
CenterInfoMapper centerInfoMapper;

@Override
public CenterInfo selectByPrimaryKey(Long id) {
	
	return centerInfoMapper.selectByPrimaryKey(id);
}

@Override
public int deleteByPrimaryKey(Long id) {
	
	return centerInfoMapper.deleteByPrimaryKey(id);
}

@Override
public int insertSelective(CenterInfo centerInfo) {

	return centerInfoMapper.insertSelective(centerInfo);
}

@Override
public int updateStatusById(Long id) {
	
	return centerInfoMapper.updateStatusById(id);
}

@Override
public int updateByPrimaryKeySelective(CenterInfo centerInfo) {
	return centerInfoMapper.updateByPrimaryKeySelective(centerInfo);
}

@Override
public Map<String, Object> deleteCenterInfoByid(String ids) {
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
		LoggerUtils.fmtError(getClass(), e, "根据IDS删除中心出现错误，ids[%s]", ids);
		resultMap.put("status", 500);
		resultMap.put("message", "删除出现错误，请刷新后再试！");
	}
	return resultMap;
}

@SuppressWarnings("unchecked")
@Override
public Pagination<CenterInfo> findByPage(Map<String, Object> resultMap,
		Integer pageNo, Integer pageSize) {
	return super.findPage(resultMap, pageNo, pageSize);
}
@SuppressWarnings("unchecked")
@Override
public List<CenterInfo> ListCenterInfo(Map<String, Object> resultMap) {
	return super.findNoPageList("findAll", resultMap);
}


}