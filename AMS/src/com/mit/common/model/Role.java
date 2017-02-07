package com.mit.common.model;

import java.io.Serializable;
import java.util.LinkedList;
import java.util.List;

import net.sf.json.JSONObject;
/**
 */
public class Role  implements Serializable{
	private static final long serialVersionUID = 1L;
    private Long id;
    /**角色名称*/
    private String name;
    /**角色类型*/
    private String type;
    
    public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
	private String content;
    //***做 role --> permission 一对多处理
    private List<Permission> permissions = new LinkedList<Permission>();
    
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getType() {
        return type;
    }

    public List<Permission> getPermissions() {
		return permissions;
	}

	public void setPermissions(List<Permission> permissions) {
		this.permissions = permissions;
	}

	public void setType(String type) {
        this.type = type;
    }
    public String toString(){
    	return JSONObject.fromObject(this).toString();
    }
}