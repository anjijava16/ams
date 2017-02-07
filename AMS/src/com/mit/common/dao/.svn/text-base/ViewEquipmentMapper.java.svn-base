package com.mit.common.dao;

import java.util.List;
import java.util.Map;

import com.mit.common.model.ViewEquipment;
import com.mit.common.model.ViewWplace;
import com.mit.information.bo.StationBo;

public interface ViewEquipmentMapper {
	ViewEquipment selectByPrimaryKey(Long id);
	int deleteByPrimaryKey(Long id);
	int insertSelective(ViewEquipment viewEquipment);
	int updateByPrimaryKeySelective(ViewEquipment viewEquipment);
	int updateStatusById(Long id);
	List<StationBo> selectViewWplaceById(StationBo stationbo);
	int insertContact(ViewWplace viewwplace);
	int deleteByViewId(Long id);
	int deleteByViewIds(Map<String,Object> resultMap);
}
