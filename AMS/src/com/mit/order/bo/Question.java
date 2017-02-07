package com.mit.order.bo;

import net.sf.json.JSONObject;


/**
 * T_QUESTION 实体类 Thu Nov 10 13:45:12 CST 2016 刘鹏飞
 */

public class Question {
	private Long id;
	private Long ask_id;
	private Long ques_no;
	private String ques_cont;
	private String del_flag;
	private String ask_name;

	public void setId(Long id) {
		this.id = id;
	}

	public Long getId() {
		return id;
	}

	public void setAsk_id(Long ask_id) {
		this.ask_id = ask_id;
	}

	public Long getAsk_id() {
		return ask_id;
	}

	public void setQues_no(Long ques_no) {
		this.ques_no = ques_no;
	}

	public Long getQues_no() {
		return ques_no;
	}

	public void setQues_cont(String ques_cont) {
		this.ques_cont = ques_cont;
	}

	public String getQues_cont() {
		return ques_cont;
	}

	public void setDel_flag(String del_flag) {
		this.del_flag = del_flag;
	}

	public String getDel_flag() {
		return del_flag;
	}

	public String getAsk_name() {
		return ask_name;
	}

	public void setAsk_name(String ask_name) {
		this.ask_name = ask_name;
	}
	
	public String toString() {
		return JSONObject.fromObject(this).toString();
	}
}
