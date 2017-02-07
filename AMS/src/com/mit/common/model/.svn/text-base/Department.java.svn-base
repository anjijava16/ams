package com.mit.common.model;

import java.io.Serializable;

import net.sf.json.JSONObject;

public class Department implements Serializable {

	/**
	 * 钣喷中心部门信息
	 */
	private static final long serialVersionUID = 1L;
	private Long id;
	private String d_name;
	private String d_tel;
	private String d_remarks;
	private Long centerid;
	private Long seq;
    public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getD_name() {
		return d_name;
	}
	public void setD_name(String d_name) {
		this.d_name = d_name;
	}
	public String getD_tel() {
		return d_tel;
	}
	public void setD_tel(String d_tel) {
		this.d_tel = d_tel;
	}
	public String getD_remarks() {
		return d_remarks;
	}
	public void setD_remarks(String d_remarks) {
		this.d_remarks = d_remarks;
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
	private Long status;
	 public String toString(){
	    	return JSONObject.fromObject(this).toString();
	    }

}
