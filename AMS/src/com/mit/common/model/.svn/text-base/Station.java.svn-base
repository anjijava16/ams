package com.mit.common.model;

import java.io.Serializable;

import net.sf.json.JSONObject;

/**
 *工位
 */
public class Station implements Serializable{

	private static final long serialVersionUID = 1L;
	private Long id;
	private Long workplace_type_id;//工位类别号
    private Long status;
    private Long centerid;
    private Long w_no;//工位号
    private String w_name;
    public String getEquipment_id() {
		return equipment_id;
	}
	public void setEquipment_id(String equipment_id) {
		this.equipment_id = equipment_id;
	}
	private String place_name;//工位子类
    private String place_parent_name;//工位父类
    private String equipment_id;//工位对应检测设备序列号，一个工位只对应一个检测设备
	public String getPlace_name() {
		return place_name;
	}
	public void setPlace_name(String place_name) {
		this.place_name = place_name;
	}
	public String getPlace_parent_name() {
		return place_parent_name;
	}
	public void setPlace_parent_name(String place_parent_name) {
		this.place_parent_name = place_parent_name;
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public Long getWorkplace_type_id() {
		return workplace_type_id;
	}
	public void setWorkplace_type_id(Long workplace_type_id) {
		this.workplace_type_id = workplace_type_id;
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
	public Long getW_no() {
		return w_no;
	}
	public void setW_no(Long w_no) {
		this.w_no = w_no;
	}
	public String getW_name() {
		return w_name;
	}
	public void setW_name(String w_name) {
		this.w_name = w_name;
	}
	  public String toString(){
	    	return JSONObject.fromObject(this).toString();
	    }
}
