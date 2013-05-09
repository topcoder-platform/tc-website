/**
 * Copyright (C) 2012 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.reg;

/**
 * This class models the captcha entity stored in ServletContext.
 * 
 * <p>
 * <p>
 * <strong>Thread Safety:</strong> This class is a POJO, not thread-safe.
 * 
 * @author leo_lol
 * @since 1.0
 * @version 1.0
 */
public final class Captcha {
	/**
	 * The UUID.
	 */
	private String uuid;

	/**
	 * Create Date of this captcha.
	 */
	private long createdDate;

	/**
	 * File path of the captcha image.
	 */
	private String path;

	/**
	 * Captcha word.
	 */
	private String word;

	/**
	 * Getter of the name-sake field.
	 * 
	 * @return the value of name-sake field.
	 */
	public String getUuid() {
		return uuid;
	}

	/**
	 * Setter of the name-sake field.
	 * 
	 * @param uuid
	 *            the name-sake field to set
	 */
	public void setUuid(String uuid) {
		this.uuid = uuid;
	}

	/**
	 * Getter of the name-sake field.
	 * 
	 * @return the value of name-sake field.
	 */
	public String getPath() {
		return path;
	}

	/**
	 * Setter of the name-sake field.
	 * 
	 * @param path
	 *            the name-sake field to set
	 */
	public void setPath(String path) {
		this.path = path;
	}

	/**
	 * Getter of the name-sake field.
	 * 
	 * @return the value of name-sake field.
	 */
	public long getCreatedDate() {
		return createdDate;
	}

	/**
	 * Setter of the name-sake field.
	 * 
	 * @param createdDate
	 *            the name-sake field to set
	 */
	public void setCreatedDate(long createdDate) {
		this.createdDate = createdDate;
	}

	/**
	 * Getter of the name-sake field.
	 * @return the value of name-sake field.
	 */
	public String getWord() {
		return word;
	}

	/**
	 * Setter of the name-sake field.
	 * @param word the name-sake field to set
	 */
	public void setWord(String word) {
		this.word = word;
	}
}
