package com.mit.order.bo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import net.sf.json.JSONObject;

/**
 * T_REVIEW 实体类 Thu Nov 10 13:45:17 CST 2016 刘鹏飞
 */

public class Review {
	private Long id;
	private Long cus_id;
	private Long order_id;
	private Long link_id;
	private Long ans_id;
	private String rvw_con;
	@DateTimeFormat(pattern="yyyy-MM-dd HH:mm") 
	private Date rvw_time;
	private String sati;
	@DateTimeFormat(pattern="yyyy-MM-dd HH:mm") 
	private Date next_rvw;
	private String bak;
	private String del_flag;
	private String answer;
	private String car_id;
	private String tel;
	private String cus_name;
	private String link_name;
	private String car_plates;
	private String ask_name;
	private String status;

	public void setId(Long id) {
		this.id = id;
	}

	public Long getId() {
		return id;
	}

	public void setCus_id(Long cus_id) {
		this.cus_id = cus_id;
	}

	public Long getCus_id() {
		return cus_id;
	}

	public void setOrder_id(Long order_id) {
		this.order_id = order_id;
	}

	public Long getOrder_id() {
		return order_id;
	}

	public void setLink_id(Long link_id) {
		this.link_id = link_id;
	}

	public Long getLink_id() {
		return link_id;
	}

	public void setAns_id(Long ans_id) {
		this.ans_id = ans_id;
	}

	public Long getAns_id() {
		return ans_id;
	}

	public void setRvw_con(String rvw_con) {
		this.rvw_con = rvw_con;
	}

	public String getRvw_con() {
		return rvw_con;
	}

	public void setRvw_time(Date rvw_time) {
		this.rvw_time = rvw_time;
	}

	public Date getRvw_time() {
		return rvw_time;
	}

	public void setSati(String sati) {
		this.sati = sati;
	}

	public String getSati() {
		return sati;
	}

	public void setNext_rvw(Date next_rvw) {
		this.next_rvw = next_rvw;
	}

	public Date getNext_rvw() {
		return next_rvw;
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

	public void setAnswer(String answer) {
		this.answer = answer;
	}

	public String getAnswer() {
		return answer;
	}
	
	public String getCar_id() {
		return car_id;
	}

	public void setCar_id(String car_id) {
		this.car_id = car_id;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getCus_name() {
		return cus_name;
	}

	public void setCus_name(String cus_name) {
		this.cus_name = cus_name;
	}

	public String getLink_name() {
		return link_name;
	}

	public void setLink_name(String link_name) {
		this.link_name = link_name;
	}

	public String getCar_plates() {
		return car_plates;
	}

	public void setCar_plates(String car_plates) {
		this.car_plates = car_plates;
	}

	public String getAsk_name() {
		return ask_name;
	}

	public void setAsk_name(String ask_name) {
		this.ask_name = ask_name;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String toString() {
		return JSONObject.fromObject(this).toString();
	}
}
