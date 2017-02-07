package com.mit.order.bo;

import java.util.Date;

import net.sf.json.JSONObject;

import org.springframework.format.annotation.DateTimeFormat;

/**
 * T_ORDER 实体类 Wed Nov 02 08:31:58 CST 2016 刘鹏飞
 */

public class Order {
	private Long id;
	private String car_num;
	private String order_status;
	private Long emp_id;
	@DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss") 
	private Date start_time;
	@DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss") 
	private Date pre_end_time;
	@DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss") 
	private Date end_time;
	private Long mileages;
	private String rep_desc;
	private float hour_total = 0;
	private float parts_total = 0;
	private float add_total = 0;
	private float dis_total = 0;
	private float total_price = 0;
	private String insure_num;
	private String bak;
	private String del_flag;
	private String cus_id;
	private String cus_name;
	private String e_name;
	private String car_plates;
	private String car_id;
	private String centerid;

	public void setId(Long id) {
		this.id = id;
	}
	
	public Long getId() {
		return id;
	}

	public void setCar_num(String car_num) {
		this.car_num = car_num;
	}

	public String getCar_num() {
		return car_num;
	}

	public void setOrder_status(String order_status) {
		this.order_status = order_status;
	}

	public String getOrder_status() {
		return order_status;
	}

	public void setEmp_id(Long emp_id) {
		this.emp_id = emp_id;
	}
	

	public String getCus_id() {
		return cus_id;
	}

	public void setCus_id(String cus_id) {
		this.cus_id = cus_id;
	}

	public Long getEmp_id() {
		return emp_id;
	}

	public void setStart_time(Date start_time) {
		this.start_time = start_time;
	}

	public Date getStart_time() {
		return start_time;
	}

	public void setPre_end_time(Date pre_end_time) {
		this.pre_end_time = pre_end_time;
	}

	public Date getPre_end_time() {
		return pre_end_time;
	}

	public void setEnd_time(Date end_time) {
		this.end_time = end_time;
	}

	public Date getEnd_time() {
		return end_time;
	}

	public void setMileages(Long mileages) {
		this.mileages = mileages;
	}

	public Long getMileages() {
		return mileages;
	}

	public void setRep_desc(String rep_desc) {
		this.rep_desc = rep_desc;
	}

	public String getRep_desc() {
		return rep_desc;
	}

	public void setHour_total(float hour_total) {
		this.hour_total = hour_total;
	}

	public float getHour_total() {
		return hour_total;
	}

	public void setParts_total(float parts_total) {
		this.parts_total = parts_total;
	}

	public float getParts_total() {
		return parts_total;
	}

	public void setAdd_total(float add_total) {
		this.add_total = add_total;
	}

	public float getAdd_total() {
		return add_total;
	}

	public void setDis_total(float dis_total) {
		this.dis_total = dis_total;
	}

	public float getDis_total() {
		return dis_total;
	}

	public void setTotal_price(float total_price) {
		this.total_price = total_price;
	}

	public float getTotal_price() {
		return total_price;
	}

	public void setInsure_num(String insure_num) {
		this.insure_num = insure_num;
	}

	public String getInsure_num() {
		return insure_num;
	}

	public void setBak(String bak) {
		this.bak = bak;
	}

	public String getBak() {
		return bak;
	}

	public void setDel_flag(String del_flag) {
		this.del_flag = del_flag;
	}

	public String getDel_flag() {
		return del_flag;
	}

	public String getCus_name() {
		return cus_name;
	}

	public void setCus_name(String cus_name) {
		this.cus_name = cus_name;
	}

	public String getE_name() {
		return e_name;
	}

	public void setE_name(String e_name) {
		this.e_name = e_name;
	}

	public String getCar_plates() {
		return car_plates;
	}

	public void setCar_plates(String car_plates) {
		this.car_plates = car_plates;
	}
	public String toString() {
		return JSONObject.fromObject(this).toString();
	}

	public String getCar_id() {
		return car_id;
	}

	public void setCar_id(String car_id) {
		this.car_id = car_id;
	}

	public String getCenterid() {
		return centerid;
	}

	public void setCenterid(String centerid) {
		this.centerid = centerid;
	}
	
}
