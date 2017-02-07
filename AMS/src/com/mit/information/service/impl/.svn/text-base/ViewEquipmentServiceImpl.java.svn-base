package com.mit.information.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mit.common.dao.ViewEquipmentMapper;
import com.mit.common.model.ViewEquipment;
import com.mit.common.model.ViewWplace;
import com.mit.common.utils.LoggerUtils;
import com.mit.core.mybatis.BaseMybatisDao;
import com.mit.core.mybatis.page.Pagination;
import com.mit.information.bo.StationBo;
import com.mit.information.service.ViewEquipmentService;


/**
 * @author yejianming
 * @date 2016-10-27
 */

@Service
public class ViewEquipmentServiceImpl extends  BaseMybatisDao<ViewEquipmentMapper> implements ViewEquipmentService{
@Autowired
ViewEquipmentMapper viewEquipmentMapper;

@Override
public ViewEquipment selectByPrimaryKey(Long id) {

	return viewEquipmentMapper.selectByPrimaryKey(id);
}

@Override
public int deleteByPrimaryKey(Long id) {

	return viewEquipmentMapper.deleteByPrimaryKey(id);
}

@Override
public int insertSelective(ViewEquipment viewEquipment) {
	
	return viewEquipmentMapper.insertSelective(viewEquipment);
}

@Override
public int updateStatusById(Long id) {
	
	return viewEquipmentMapper.updateStatusById(id);
}

@Override
public int updateByPrimaryKeySelective(ViewEquipment viewEquipment) {
	
	return viewEquipmentMapper.updateByPrimaryKeySelective(viewEquipment);
}

@Override
public Map<String, Object> deleteViewEquipmentById(String ids) {
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
		LoggerUtils.fmtError(getClass(), e, "根据IDS删除展示设备出现错误，ids[%s]", ids);
		resultMap.put("status", 500);
		resultMap.put("message", "删除出现错误，请刷新后再试！");
	}
	return resultMap;
}

@SuppressWarnings("unchecked")
@Override
public Pagination<ViewEquipment> findByPage(Map<String, Object> resultMap,
		Integer pageNo, Integer pageSize) {
	return super.findPage(resultMap, pageNo, pageSize);
}

@Override
public List<StationBo> selectViewWplaceById(StationBo stationbo) {
	
	return viewEquipmentMapper.selectViewWplaceById(stationbo);
}

@Override
public Map<String, Object> addViewWplace(Long viewId, String ids) {
	//先删除原有的。
	viewEquipmentMapper.deleteByViewId(viewId);
	return executePermission(viewId, ids);
}
private Map<String, Object> executePermission(Long viewId, String ids){
	Map<String,Object> resultMap = new HashMap<String, Object>();
	int count = 0;
	try {
		//如果ids,工位 的id 有值，那么就添加。没值象征着：把这设备（viewId）所有绑定工位取消。
		if(StringUtils.isNotBlank(ids)){
			String[] idArray = null;
			
			//这里有的人习惯，直接ids.split(",") 都可以，我习惯这么写。清楚明了。
			if(StringUtils.contains(ids, ",")){
				idArray = ids.split(",");
			}else{
				idArray = new String[]{ids};
			}
			//添加新的。
			for (String pid : idArray) {
				//这里严谨点可以判断，也可以不判断。这个{@link StringUtils 我是重写了的} 
				if(StringUtils.isNotBlank(pid)){
					ViewWplace entity = new ViewWplace(viewId,new Long(pid));
					count += viewEquipmentMapper.insertContact(entity);
				}
			}
		}
		resultMap.put("status", 200);
		resultMap.put("message", "操作成功");
	} catch (Exception e) {
		resultMap.put("status", 200);
		resultMap.put("message", "操作失败，请重试！");
	}
	
	resultMap.put("count", count);
	return resultMap;
	
}

@Override
public int deleteByViewId(Long id) {
	// TODO Auto-generated method stub
	return 0;
}

@Override
public Map<String, Object> deleteByViewIds(String viewIds) {
	// TODO Auto-generated method stub
	return null;
}

}