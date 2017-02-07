package com.mit.order.bo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import net.sf.json.JSONObject;


/**
 * T_ORDER_ITEM 实体类 Wed Nov 02 18:10:00 CST 2016 刘鹏飞
 */

public class OrderItem {
	private Long id;
	private Long order_id;
	private String rep_item_type;
	private String rep_type;
	private String hour_num;
	private String hour_desc;
	private Long work_hour;
	private Long add_hour;
	private float hour_price;
	private float discount;
	private float hour_total;
	private Long send_hour;
	private String rep_group;
	private String rep_station;
	private String bak;
	private String del_flag;
	@DateTimeFormat(pattern="yyyy-MM-dd HH:mm") 
	private Date pre_start_time;
	@DateTimeFormat(pattern="yyyy-MM-dd HH:mm") 
	private Date pre_end_time;
	@DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss") 
	private Date start_time;
	@DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss") 
	private Date end_time;
	private Long centerid;
	private String rep_emp_id;
	private String rep_emp_name;

	public void setId(Long id) {
		this.id = id;
	}

	public Long getId() {
		return id;
	}

	public void setOrder_id(Long order_id) {
		this.order_id = order_id;
	}

	public Long getOrder_id() {
		return order_id;
	}

	public void setRep_item_type(String rep_item_type) {
		this.rep_item_type = rep_item_type;
	}

	public String getRep_item_type() {
		return rep_item_type;
	}

	public void setRep_type(String rep_type) {
		this.rep_type = rep_type;
	}

	public String getRep_type() {
		return rep_type;
	}

	public void setHour_num(String hour_num) {
		this.hour_num = hour_num;
	}

	public String getHour_num() {
		return hour_num;
	}

	public void setHour_desc(String hour_desc) {
		this.hour_desc = hour_desc;
	}

	public String getHour_desc() {
		return hour_desc;
	}

	public void setWork_hour(Long work_hour) {
		this.work_hour = work_hour;
	}

	public Long getWork_hour() {
		return work_hour;
	}

	public void setAdd_hour(Long add_hour) {
		this.add_hour = add_hour;
	}

	public Long getAdd_hour() {
		return add_hour;
	}

	public void setHour_price(float hour_price) {
		this.hour_price = hour_price;
	}

	public float getHour_price() {
		return hour_price;
	}

	public void setDiscount(float discount) {
		this.discount = discount;
	}

	public float getDiscount() {
		return discount;
	}

	public void setHour_total(float hour_total) {
		this.hour_total = hour_total;
	}

	public float getHour_total() {
		return hour_total;
	}

	public void setSend_hour(Long send_hour) {
		this.send_hour = send_hour;
	}

	public Long getSend_hour() {
		return send_hour;
	}

	public void setRep_group(String rep_group) {
		this.rep_group = rep_group;
	}

	public String getRep_group() {
		return rep_group;
	}

	public void setRep_station(String rep_station) {
		this.rep_station = rep_station;
	}

	public String getRep_station() {
		return rep_station;
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
	public Date getPre_start_time() {
		return pre_start_time;
	}

	public void setPre_start_time(Date pre_start_time) {
		this.pre_start_time = pre_start_time;
	}

	public Date getPre_end_time() {
		return pre_end_time;
	}

	public void setPre_end_time(Date pre_end_time) {
		this.pre_end_time = pre_end_time;
	}

	public Date getStart_time() {
		return start_time;
	}

	public void setStart_time(Date start_time) {
		this.start_time = start_time;
	}

	public Date getEnd_time() {
		return end_time;
	}

	public void setEnd_time(Date end_time) {
		this.end_time = end_time;
	}

	public Long getCenterid() {
		return centerid;
	}

	public void setCenterid(Long centerid) {
		this.centerid = centerid;
	}

	public String getRep_emp_id() {
		return rep_emp_id;
	}

	public void setRep_emp_id(String rep_emp_id) {
		this.rep_emp_id = rep_emp_id;
	}

	public String getRep_emp_name() {
		return rep_emp_name;
	}

	public void setRep_emp_name(String rep_emp_name) {
		this.rep_emp_name = rep_emp_name;
	}

	public String toString() {
		return JSONObject.fromObject(this).toString();
	}
}
