package com.topcoder.web.test;

import com.topcoder.shared.security.User;

/**
 * Helper class implementing User interface.
 * Allows to set id, name, password
 * 
 * @author Misha
 */
public class UserHelper implements User {
	public long myId;
	public String myName;
	public String myPassword;

	/**
	 * @see com.topcoder.shared.security.User#getId()
	 */
	public long getId() {
		return myId;
	}

	/**
	 * @see com.topcoder.shared.security.User#getUserName()
	 */
	public String getUserName() {
		return myName;
	}

	/**
	 * @see com.topcoder.shared.security.User#getPassword()
	 */
	public String getPassword() {
		return myPassword;
	}

}
