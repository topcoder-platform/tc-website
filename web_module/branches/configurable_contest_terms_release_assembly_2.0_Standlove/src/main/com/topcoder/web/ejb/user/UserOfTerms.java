package com.topcoder.web.ejb.user;

import java.io.Serializable;
import java.util.Date;

public class UserOfTerms implements Serializable {
	private long userId;
	private String handle;
	private Date agreedDate;
	
	public UserOfTerms() {}

	public void setUserId(long userId) {
		this.userId = userId;
	}

	public long getUserId() {
		return userId;
	}
	
	public String getHandle() {
		return handle;
	}

	public void setHandle(String handle) {
		this.handle = handle;
	}

	public Date getAgreedDate() {
		return agreedDate;
	}

	public void setAgreedDate(Date agreedDate) {
		this.agreedDate = agreedDate;
	}

}
