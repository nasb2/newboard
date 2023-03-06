package com.spring.board.domain;

import java.util.Date;

public class UserDto {
	private String id;
	private String pwd;
    private String name;
	/* @DateTimeFormat(pattern = "yyyy/MM/dd") */
    private Date regDate;
    
    public UserDto() {}
    public UserDto(String id, String pwd, String name) {
    	this.id = id;
    	this.pwd = pwd;
    	this.name = name;
    }
    
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	
	@Override
	public String toString() {
		return "User [id=" + id + ", pwd=" + pwd + ", name=" + name + ", regDate=" + regDate + "]";
	}
	
}
