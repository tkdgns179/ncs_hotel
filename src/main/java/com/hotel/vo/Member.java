package com.hotel.vo;

import javax.validation.constraints.Pattern;

public class Member {
	
	// 유효성검사테스트
	// TODO Validator 클래스 만들어서 존재하는 아이디 검사 구현예정
	
	// MEMBER TABLE
	@Pattern(regexp = "[가-힣]+", message = "이름은 한글로 작성해주세요")
	private String name;
	
	@Pattern(regexp = "[a-zA-Z0-9]{8,}", message = "8자리 이상의 영어와 숫자를 입력해주세요")
	private String loginid; // PK
	
	@Pattern(regexp = "[a-z0-9]{8,}", message = "8자리 이상의 영어와 숫자를 입력해주세요")
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
