package com.mit.information.service;

import java.util.List;
import java.util.Map;

import com.mit.common.model.ViewEquipment;
import com.mit.core.mybatis.page.Pagination;
import com.mit.information.bo.StationBo;



/**
 * @author yejianming
 */
public interface ViewEquipmentService {
	ViewEquipment selectByPrimaryKey(Long id);
	int deleteByPrimaryKey(Long id);
	int insertSelective(ViewEquipment viewEquipment);
	int updateByPrimaryKeySelective(ViewEquipment viewEquipment);
	int updateStatusById(Long id);
	 Map<String, Object> deleteViewEquipmentById(String ids);
	 List<StationBo> selectViewWplaceById(StationBo stationbo);
	 Pagination<ViewEquipment> findByPage(Map<String, Object> resultMap, Integer pageNo,
				Integer pageSize);
	 Map<String, Object> addViewWplace(Long viewId,String ids);
	 int deleteByViewId(Long id);
	 Map<String, Object> deleteByViewIds(String viewIds);
	//int insertContact(ViewWplace viewwplace);
	//List<ViewWplace> findByWplaceid(Long id);
	//List<ViewWplace> findByViewid(Long id);
}