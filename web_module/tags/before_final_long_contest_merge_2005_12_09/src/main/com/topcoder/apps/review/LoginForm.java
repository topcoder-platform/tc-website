/**
 * Copyright � 2003, TopCoder, Inc. All rights reserved
 */

package com.topcoder.apps.review;

import org.apache.struts.action.ActionError;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;

import javax.servlet.http.HttpServletRequest;

/**
 * Form bean for the user login page.  This form has the following fields,
 * with default values in square brackets:
 * <ul>
 * <li><b>username</b> - Entered username value
 * <li><b>password</b> - Entered password value
 * </ul>
 *
 * @author TCSDEVELOPER
 * @version 1.0
 */

public final class LoginForm extends ActionForm {

    // --------------------------------------------------- Instance Variables

    /**
     * The password.
     */
    private String password = null;

    /**
     * The username.
     */
    private String username = null;

    // ----------------------------------------------------------- Properties

    /**
     * Return the password.
     *
     * @return the password.
     */
    public String getPassword() {
        return (this.password);
    }

    /**
     * Set the password.
     *
     * @param password The new password.
     */
    public void setPassword(String password) {
        this.password = password;
    }

    /**
     * Return the username.
     *
     * @return the username.
     */
    public String getUsername() {
        return (this.username);
    }

    /**
     * Set the username.
     *
     * @param username The new username
     */
    public void setUsername(String username) {
        this.username = username;
    }

    // --------------------------------------------------------- Public Methods

    /**
     * Reset all properties to their default values.
     *
     * @param mapping The mapping used to select this instance
     * @param request The servlet request we are processing
     */
    public void reset(ActionMapping mapping, HttpServletRequest request) {
        this.password = null;
        this.username = null;
    }

    /**
     * Validate the properties that have been set from this HTTP request,
     * and return an <code>ActionErrors</code> object that encapsulates any
     * validation errors that have been found.  If no errors are found, return
     * <code>null</code> or an <code>ActionErrors</code> object with no
     * recorded error messages.
     *
     * @param mapping The mapping used to select this instance
     * @param request The servlet request we are processing
     *
     * @return an <code>ActionErrors</code> object that encapsulates any
     * validation errors that have been found.
     */
    public ActionErrors validate(ActionMapping mapping,
                                 HttpServletRequest request) {
        ActionErrors errors = new ActionErrors();

        if ((username == null) || (username.length() < 1)) {
            errors.add("username", new ActionError("error.username.required"));
        }
        if ((password == null) || (password.length() < 1)) {
            errors.add("password", new ActionError("error.password.required"));
        }

        return errors;
    }

    // ------------------------------------------------------ Protected Methods

    /**
     * Make the LoginData from the bean form.
     *
     * @return the LoginData made from the bean form.
     */
    protected LoginData toLoginData() {
        LoginData loginData = new LoginData(username, password);
        return loginData;
    }
}
