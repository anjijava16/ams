package com.mit.common.model;

import java.io.Serializable;

import net.sf.json.JSONObject;
/**
 * 标准工位类型
 */
public class WorkingType implements Serializable {

	private static final long serialVersionUID = 1L;
	private Long id;
	private Long status;
	private String place_parent_name;
	private String place_name;
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public Long getStatus() {
		return status;
	}
	public void setStatus(Long status) {
		this.status = status;
	}
	public String getPlace_parent_name() {
		return place_parent_name;
	}
	public void setPlace_parent_name(String place_parent_name) {
		this.place_parent_name = place_parent_name;
	}
	public String getPlace_name() {
		return place_name;
	}
	public void setPlace_name(String place_name) {
		this.place_name = place_name;
	}
	public String toString() {
		return JSONObject.fromObject(this).toString();
	}
}
