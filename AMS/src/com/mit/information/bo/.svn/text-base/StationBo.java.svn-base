package com.mit.information.bo;

import java.io.Serializable;

import com.mit.common.model.Station;
import com.mit.common.utils.StringUtils;

public class StationBo extends Station implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	/**
	 * 是否勾选
	 */
	private String marker;
	/**
	 * view_equipment Id
	 */
	private String viewId;

	public boolean isCheck(){
		return StringUtils.equals(viewId,marker);
	}

	public String getMarker() {
		return marker;
	}

	public void setMarker(String marker) {
		this.marker = marker;
	}

	public String getViewId() {
		return viewId;
	}

	public void setViewId(String viewId) {
		this.viewId = viewId;
	}
}
