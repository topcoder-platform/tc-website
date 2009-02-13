/**
 * Copyright � 2003, TopCoder, Inc. All rights reserved
 */

package com.topcoder.apps.review;

/**
 * Wrapping class for the login data.
 *
 * @author TCSDEVELOPER
 * @version 1.0
 */
public class LoginData implements ActionData {

    // --------------------------------------------------- Instance Variables

    /**
     * The username.
     */
    private String userName = null;

    /**
     * The password.
     */
    private String password = null;

    // ------------------------------------------------------------ Constructor

    /**
     * <p>
     * Creates the instance of <code>LoginData</code> class.
     * </p>
     *
     * @param userName The user name.
     * @param password The password.
     */
    protected LoginData(String userName, String password) {
        if (userName == null || password == null) {
            throw new NullPointerException();
        }

        this.userName = userName;
        this.password = password;
    }

    // --------------------------------------------------------- Public Methods

    /**
     * <p>
     * Return the user name.
     * </p>
     *
     * @return a String with the user name.
     */
    public String getUserName() {
        return userName;
    } // end getUserName

    /**
     * <p>
     * Return the password.
     * </p>
     *
     * @return a String with the password.
     */
    public String getPassword() {
        return password;
    } // end getPassword

} // end LoginData



