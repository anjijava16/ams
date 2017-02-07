package com.mit.information.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mit.common.dao.SCarPartsMapper;
import com.mit.common.model.CarParts;
import com.mit.common.utils.LoggerUtils;
import com.mit.core.mybatis.BaseMybatisDao;
import com.mit.core.mybatis.page.Pagination;
import com.mit.information.service.SCarPartsService;


/**
 * @author yejianming
 */

@Service
public class SCarPartsServiceImpl extends  BaseMybatisDao<SCarPartsMapper> implements SCarPartsService{
@Autowired
SCarPartsMapper sCarPartsMapper;

@Override
public CarParts selectByPrimaryKey(Long id) {
	
	return sCarPartsMapper.selectByPrimaryKey(id);
}

@Override
public int deleteByPrimaryKey(Long id) {
	
	return sCarPartsMapper.deleteByPrimaryKey(id);
}

@Override
public int insertSelective(CarParts carParts) {
	
	return sCarPartsMapper.insertSelective(carParts);
}

@Override
public int updateStatusById(Long id) {
	
	return sCarPartsMapper.updateStatusById(id);
}

@Override
public int updateByPrimaryKeySelective(CarParts carParts) {
	
	return sCarPartsMapper.updateByPrimaryKeySelective(carParts);
}

@Override
public Map<String, Object> deleteCarPartsByid(String ids) {
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
		LoggerUtils.fmtError(getClass(), e, "根据IDS删除配件出现错误，ids[%s]", ids);
		resultMap.put("status", 500);
		resultMap.put("message", "删除出现错误，请刷新后再试！");
	}
	return resultMap;
}
@SuppressWarnings("unchecked")
@Override
public Pagination<CarParts> findByPage(Map<String, Object> resultMap,
		Integer pageNo, Integer pageSize) {
	return super.findPage(resultMap, pageNo, pageSize);
}
@SuppressWarnings("unchecked")
@Override
public List<CarParts> ListCarParts(Map<String, Object> resultMap) {
	
	return super.findNoPageList("findAll", resultMap);
}

@Override
public int insertRecord(CarParts carParts) {
	return sCarPartsMapper.insertRecord(carParts);
}
@SuppressWarnings("unchecked")
@Override
public Pagination<CarParts> findByPage(String sqlId, String countId,
		Map<String, Object> params, Integer pageNo, Integer pageSize) {
	return super.findPage(sqlId, countId, params, pageNo, pageSize);
}

@Override
public int inCarPartsById(CarParts carParts) {
	return sCarPartsMapper.inCarPartsById(carParts);
}

@Override
public int outCarPartsById(CarParts carParts) {
	
	return sCarPartsMapper.outCarPartsById(carParts);
}

@Override
public List<CarParts> selectCarParts(CarParts carParts) {
	return sCarPartsMapper.selectCarParts(carParts);
}


}