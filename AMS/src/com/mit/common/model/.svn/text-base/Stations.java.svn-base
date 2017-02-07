package com.mit.common.model;

import java.io.Serializable;

import net.sf.json.JSONObject;

public class Stations implements Serializable {

	/**
	 * 职务
	 */
	private static final long serialVersionUID = 1L;
	private Long id;
	private String s_name;
	private String s_code;
	private String s_summary;
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getS_name() {
		return s_name;
	}
	public void setS_name(String s_name) {
		this.s_name = s_name;
	}
	public String getS_code() {
		return s_code;
	}
	public void setS_code(String s_code) {
		this.s_code = s_code;
	}
	public String getS_summary() {
		return s_summary;
	}
	public void setS_summary(String s_summary) {
		this.s_summary = s_summary;
	}
	public Long getCenterid() {
		return centerid;
	}
	public void setCenterid(Long centerid) {
		this.centerid = centerid;
	}
	public Long getSeq() {
		return seq;
	}
	public void setSeq(Long seq) {
		this.seq = seq;
	}
	public Long getStatus() {
		return status;
	}
	public void setStatus(Long status) {
		this.status = status;
	}
	private Long centerid;
	private Long seq;
	private Long status;
	 public String toString(){
	    	return JSONObject.fromObject(this).toString();
	    }

}
