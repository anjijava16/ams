package com.mit.common.model;

import java.io.Serializable;

import net.sf.json.JSONObject;

public class Profession implements Serializable{

	/**
	 * 工种
	 */
	private static final long serialVersionUID = 1L;
	private Long id;
	private String p_name;
	private String p_code;
	private String p_type;
	private String p_level;
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getP_name() {
		return p_name;
	}
	public void setP_name(String p_name) {
		this.p_name = p_name;
	}
	public String getP_code() {
		return p_code;
	}
	public void setP_code(String p_code) {
		this.p_code = p_code;
	}
	public String getP_type() {
		return p_type;
	}
	public void setP_type(String p_type) {
		this.p_type = p_type;
	}
	public String getP_level() {
		return p_level;
	}
	public void setP_level(String p_level) {
		this.p_level = p_level;
	}
	public Long getCenterid() {
		return centerid;
	}
	public void setCenterid(Long centerid) {
		this.centerid = centerid;
	}
	private Long status;
	public Long getStatus() {
		return status;
	}
	public void setStatus(Long status) {
		this.status = status;
	}
	private Long centerid;
	 public String toString(){
	    	return JSONObject.fromObject(this).toString();
	    }
}
