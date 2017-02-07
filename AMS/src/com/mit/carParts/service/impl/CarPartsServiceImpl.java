package com.mit.carParts.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mit.carParts.service.CarPartsService;
import com.mit.common.dao.CarPartsMapper;
import com.mit.common.model.CarParts;
import com.mit.common.utils.LoggerUtils;
import com.mit.core.mybatis.BaseMybatisDao;
import com.mit.core.mybatis.page.Pagination;


/**
 * @author yejianming
 */

@Service
public class CarPartsServiceImpl extends  BaseMybatisDao<CarPartsMapper> implements CarPartsService{
@Autowired
CarPartsMapper carPartsMapper;

@Override
public CarParts selectByPrimaryKey(Long id) {
	
	return carPartsMapper.selectByPrimaryKey(id);
}

@Override
public int deleteByPrimaryKey(Long id) {
	
	return carPartsMapper.deleteByPrimaryKey(id);
}

@Override
public int insertSelective(CarParts carParts) {
	
	return carPartsMapper.insertSelective(carParts);
}

@Override
public int updateStatusById(Long id) {
	
	return carPartsMapper.updateStatusById(id);
}

@Override
public int updateByPrimaryKeySelective(CarParts carParts) {
	
	return carPartsMapper.updateByPrimaryKeySelective(carParts);
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


}