package com.topcoder.web.test;

import com.topcoder.shared.security.User;

/**
 * @author Misha
 *
 * To change this generated comment edit the template variable "typecomment":
 * Window>Preferences>Java>Templates.
 * To enable and disable the creation of type comments go to
 * Window>Preferences>Java>Code Generation.
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
