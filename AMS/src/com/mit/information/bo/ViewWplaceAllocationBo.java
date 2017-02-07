package com.mit.information.bo;

import java.io.Serializable;

public class ViewWplaceAllocationBo implements Serializable{

	/**
	 * 展示设备分配工位查询列表
	 */
	private static final long serialVersionUID = 1L;
	//展示设备ID
	private Long id;
	private String view_name;//展示设备名称
	private String view_equipment_id;
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getView_name() {
		return view_name;
	}
	public void setView_name(String view_name) {
		this.view_name = view_name;
	}
	
	public String getView_equipment_id() {
		return view_equipment_id;
	}
	public void setView_equipment_id(String view_equipment_id) {
		this.view_equipment_id = view_equipment_id;
	}
	public String getStationNames() {
		return stationNames;
	}
	public void setStationNames(String stationNames) {
		this.stationNames = stationNames;
	}
	public String getStationIds() {
		return stationIds;
	}
	public void setStationIds(String stationIds) {
		this.stationIds = stationIds;
	}
	//工位Name列转行，以,分割
	private String stationNames;
	//工位Id列转行，以‘,’分割
	private String stationIds;
}
