package com.mit.common.model;

import java.io.Serializable;
import java.util.Date;

import net.sf.json.JSONObject;
/**
 * @author yejianming
 */
public class User implements Serializable{
	private static final long serialVersionUID = 1L;
	//0:禁止登录
	public static final Long _0 = new Long(0);
	//1:有效
	public static final Long _1 = new Long(1);
	private Long id;
	/**用户名*/
    private String username;
    /**真实姓名*/
    private String trueName;
    /**密码*/
    private transient String password;
    /**创建时间*/
    private Date addtime;
    /**最后登录时间*/
    private Date lastLoginTime;
    /**1:有效，0:禁止登录*/
    private Long status;
    /**登录次数*/
    private int loginnum;
    private Long centerid;
    
    private String c_name;//中心名称
    
    
    
    public String getC_name() {
		return c_name;
	}
	public void setC_name(String c_name) {
		this.c_name = c_name;
	}
	public Long getCenterid() {
		return centerid;
	}
	public void setCenterid(Long centerid) {
		this.centerid = centerid;
	}
	public User() {}
    public User(User user) {
		this.id = user.getId();
		this.username = user.getUsername();
		this.trueName = user.getTrueName();
		this.password = user.getPassword();
		this.addtime = user.getAddtime();
		this.lastLoginTime = user.getLastLoginTime();
		this.loginnum=user.getLoginnum();
		this.centerid=user.getCenterid();
	}

	public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

 
    public Long getStatus() {
		return status;
	}
	public void setStatus(Long status) {
		this.status = status;
	}
	
    public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getTrueName() {
		return trueName;
	}
	public void setTrueName(String trueName) {
		this.trueName = trueName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public Date getAddtime() {
		return addtime;
	}
	public void setAddtime(Date addtime) {
		this.addtime = addtime;
	}
	public int getLoginnum() {
		return loginnum;
	}
	public void setLoginnum(int loginnum) {
		this.loginnum = loginnum;
	}
	public Date getLastLoginTime() {
        return lastLoginTime;
    }

    public void setLastLoginTime(Date lastLoginTime) {
        this.lastLoginTime = lastLoginTime;
    }
    public String toString(){
    	return JSONObject.fromObject(this).toString();
    }
}