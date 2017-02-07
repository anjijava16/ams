package com.mit.common.model;

import java.io.Serializable;

import net.sf.json.JSONObject;

public class ViewWplace implements Serializable {

	/**
	 * 展示器与工位联系
	 */
	private static final long serialVersionUID = 1L;
	private Long wplace_id;
	private Long view_id;
	public Long getWplace_id() {
		return wplace_id;
	}
	public void setWplace_id(Long wplace_id) {
		this.wplace_id = wplace_id;
	}
	
	  public Long getView_id() {
		return view_id;
	}
	public void setView_id(Long view_id) {
		this.view_id = view_id;
	}
	public ViewWplace(){
		
	}
	public ViewWplace(Long view_id,Long wplace_id){
		this.view_id=view_id;
		this.wplace_id=wplace_id;
	}
	public String toString(){
	    	return JSONObject.fromObject(this).toString();
	    }
}
