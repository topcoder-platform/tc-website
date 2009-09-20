/*
 * Copyright (C) 2009 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.ejb.user;

import java.io.Serializable;
import java.util.Date;

/**
* <p>
*   Version 1.0 (Other Configurable Contest Terms Release Assembly 2.0 )
*   Represents the user who agrees the terms. 
* </p>
*
* @author ASSEMBLER
* @version 1.0
*/
public class UserOfTerms implements Serializable {
	/**
	 * The user id. 
	 */
	private long userId;
	
	/**
	 * The user handle.
	 */
	private String handle;
	
	/**
	 * The date when user agreed the terms. 
	 */
	private Date agreedDate;
	
	/**
	 * Empty constructor.
	 */
	public UserOfTerms() {}

	/**
	 * Setter for the namesake instance variable. 
	 * 
	 * @param userId the user id.
	 */
	public void setUserId(long userId) {
		this.userId = userId;
	}

	/**
	 * Getter for the namesake instance variable. 
	 * 
	 * @return the user id.
	 */
	public long getUserId() {
		return userId;
	}
	
	
	/**
	 * Getter for the namesake instance variable. 
	 * 
	 * @return the user handle.
	 */
	public String getHandle() {
		return handle;
	}

	/**
	 * Setter for the namesake instance variable. 
	 * 
	 * @param handle the user handle.
	 */
	public void setHandle(String handle) {
		this.handle = handle;
	}

	/**
	 * Getter for the namesake instance variable. 
	 * 
	 * @return the date when user agreed the terms. 
	 */
	public Date getAgreedDate() {
		return agreedDate;
	}

	/**
	 * Setter for the namesake instance variable. 
	 * 
	 * @param agreedDate the date when user agreed the terms. 
	 */
	public void setAgreedDate(Date agreedDate) {
		this.agreedDate = agreedDate;
	}

}
