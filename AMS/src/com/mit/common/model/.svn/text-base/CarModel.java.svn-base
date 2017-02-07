package com.mit.common.model;

import java.io.Serializable;
import java.util.Date;

import net.sf.json.JSONObject;

/**
 * 基础车型及分中心车型
 */
public class CarModel implements Serializable {
	private static final long serialVersionUID = 1L;
	private Long id;
	private String carbrand;
	private String carmodel;
	private String caryear;
	public Long getId() {
		return id;
	}



	public void setId(Long id) {
		this.id = id;
	}



	public String getCarbrand() {
		return carbrand;
	}



	public void setCarbrand(String carbrand) {
		this.carbrand = carbrand;
	}



	public String getCarmodel() {
		return carmodel;
	}



	public void setCarmodel(String carmodel) {
		this.carmodel = carmodel;
	}



	public String getCaryear() {
		return caryear;
	}



	public void setCaryear(String caryear) {
		this.caryear = caryear;
	}



	public int getCarprice() {
		return carprice;
	}



	public void setCarprice(int carprice) {
		this.carprice = carprice;
	}



	



	public Long getStatus() {
		return status;
	}



	public void setStatus(Long status) {
		this.status = status;
	}



	public Date getAddtime() {
		return addtime;
	}



	public void setAddtime(Date addtime) {
		this.addtime = addtime;
	}



	public Long getCenterid() {
		return centerid;
	}



	public void setCenterid(Long centerid) {
		this.centerid = centerid;
	}



	private int carprice;//车辆价格精确到个位
	 private Long status;
	private Date addtime;
	private Long centerid;//分中心编号
	private Long basicid;//原始数据编号



	public Long getBasicid() {
		return basicid;
	}



	public void setBasicid(Long basicid) {
		this.basicid = basicid;
	}



	public String toString() {
		return JSONObject.fromObject(this).toString();
	}
}