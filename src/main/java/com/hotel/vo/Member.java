package com.hotel.vo;

public class Member {
	
	// MEMBER TABLE
	private String name;
	private String loginid; // PK
	private String passcode;
	
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getLoginid() {
		return loginid;
	}
	public void setLoginid(String loginid) {
		this.loginid = loginid;
	}
	public String getPasscode() {
		return passcode;
	}
	public void setPasscode(String passcode) {
		this.passcode = passcode;
	}
	
	@Override
	public String toString() {
		return "Member [name=" + name + ", loginid=" + loginid + ", passcode=" + passcode + "]";
	}
	
	
	
	
	
}
