package com.topcoder.web.common.model;

import java.util.Date;

/**
 * Class holding data for each password recovery event.
 * 
 * @author cucu
 *
 */
public class PasswordRecovery extends Base {
	
	private Long id = null;
	private User user = null;
	private String recoveryAddress = null;
	private Date expireDate = null;
	private boolean used = false;
	
	public Date getExpireDate() {
		return expireDate;
	}
	public void setExpireDate(Date expireDate) {
		this.expireDate = expireDate;
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getRecoveryAddress() {
		return recoveryAddress;
	}
	public void setRecoveryAddress(String recoveryAddress) {
		this.recoveryAddress = recoveryAddress;
	}
	public boolean isUsed() {
		return used;
	}
	public void setUsed(boolean used) {
		this.used = used;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
}
