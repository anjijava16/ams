package com.mit.carModel.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mit.carModel.service.CarModelService;
import com.mit.common.dao.CarModelMapper;
import com.mit.common.model.CarModel;
import com.mit.common.utils.LoggerUtils;
import com.mit.core.mybatis.BaseMybatisDao;
import com.mit.core.mybatis.page.Pagination;


/**
 * @author yejianming
 */

@Service
public class CarModelServiceImpl extends  BaseMybatisDao<CarModelMapper> implements CarModelService{
@Autowired
CarModelMapper carModelMapper;

@Override
public CarModel selectByPrimaryKey(Long id) {

	return carModelMapper.selectByPrimaryKey(id);
}

@Override
public int deleteByPrimaryKey(Long id) {
	
	return carModelMapper.deleteByPrimaryKey(id);
}

@Override
public int insertSelective(CarModel carModel) {
	
	return carModelMapper.insertSelective(carModel);
}

@Override
public int updateByPrimaryKeySelective(CarModel carModel) {
	
	return carModelMapper.updateByPrimaryKeySelective(carModel);
}

@Override
public Map<String, Object> deleteCarModelByid(String ids) {
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
		LoggerUtils.fmtError(getClass(), e, "根据IDS删除车型出现错误，ids[%s]", ids);
		resultMap.put("status", 500);
		resultMap.put("message", "删除出现错误，请刷新后再试！");
	}
	return resultMap;

}
@SuppressWarnings("unchecked")
@Override
public Pagination<CarModel> findByPage(Map<String, Object> resultMap,
		Integer pageNo, Integer pageSize) {
	return super.findPage(resultMap, pageNo, pageSize);
}

@Override
public int updateStatusById(Long id) {
	
	return carModelMapper.updateStatusById(id);
}

@SuppressWarnings("unchecked")
@Override
public List<CarModel> ListCarModel(Map<String, Object> resultMap) {
	return super.findNoPageList("findAll", resultMap);
}


}