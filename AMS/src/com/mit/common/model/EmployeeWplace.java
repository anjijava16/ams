package com.mit.common.model;

import java.io.Serializable;
import java.util.Date;

import net.sf.json.JSONObject;

public class EmployeeWplace implements Serializable{

	/**
	 * 员工与工位绑定
	 */
	private static final long serialVersionUID = 1L;
	private Long id;
	private Long e_id;
	private String e_name;
	private Long status;
	private Long centerid;
	private Long w_id;
	private String w_name;
	private String id_name;
	private String wid_name;
	private Date addtime;
	public Date getAddtime() {
		return addtime;
	}
	public void setAddtime(Date addtime) {
		this.addtime = addtime;
	}
	public String getWid_name() {
		return wid_name;
	}
	public void setWid_name(String wid_name) {
		this.wid_name = wid_name;
	}
	public String getId_name() {
		return id_name;
	}
	public void setId_name(String id_name) {
		this.id_name = id_name;
	}
	public String toString() {
		return JSONObject.fromObject(this).toString();
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public Long getE_id() {
		return e_id;
	}
	public void setE_id(Long e_id) {
		this.e_id = e_id;
	}
	public String getE_name() {
		return e_name;
	}
	public void setE_name(String e_name) {
		this.e_name = e_name;
	}
	public Long getStatus() {
		return status;
	}
	public void setStatus(Long status) {
		this.status = status;
	}
	public Long getCenterid() {
		return centerid;
	}
	public void setCenterid(Long centerid) {
		this.centerid = centerid;
	}
	public Long getW_id() {
		return w_id;
	}
	public void setW_id(Long w_id) {
		this.w_id = w_id;
	}
	public String getW_name() {
		return w_name;
	}
	public void setW_name(String w_name) {
		this.w_name = w_name;
	}
}
