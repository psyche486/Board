package com.jinseok.blog.mvc.model;

import java.util.Date;

public class UserVO {
	private String userId; 
	private String userPw; 
	private String userNm;
	private String userAddress;
	private String userEmail;
	private Date userRegDt;
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserPw() {
		return userPw;
	}
	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}
	public String getUserNm() {
		return userNm;
	}
	public void setUserNm(String userNm) {
		this.userNm = userNm;
	}
	public String getUserAddress() {
		return userAddress;
	}
	public void setUserAddress(String userAddress) {
		this.userAddress = userAddress;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public Date getUserRegDt() {
		return userRegDt;
	}
	public void setUserRegDt(Date userRegDt) {
		this.userRegDt = userRegDt;
	}
	
}
