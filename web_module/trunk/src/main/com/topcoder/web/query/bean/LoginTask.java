package com.topcoder.web.query.bean;

import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.query.common.Authentication;
import com.topcoder.web.query.common.AuthenticationException;
import com.topcoder.web.query.common.Constants;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.Serializable;

/**
 * @author Greg Paul
 * @author bigjake <kitz@mit.edu>
 *
 */

public class LoginTask extends BaseTask implements Task, Serializable {

    private static Logger log = Logger.getLogger(LoginTask.class);

    /* Holds user input from the handle field */
    private String handleInput;

    /* Holds user input from the password field */
    private String passwordInput;

    /* Holds a message to be displayed on the login page */
    private String message;

    /* Holds a boolean indicating whether the login task should perform custom redirection */
    private boolean customRedir;

    private HttpSession session;

    /* Creates a new LoginTask */
    public LoginTask() {
        super();
        customRedir=false;
        setHandleInput("");
        setPasswordInput("");
    }

	public void servletPreAction(HttpServletRequest request, HttpServletResponse response)
            throws AuthenticationException, Exception {
            setSession(request.getSession(true));
	}

    public void servletPostAction(HttpServletRequest request, HttpServletResponse response) throws Exception {
    }

    public void process(String step) throws Exception {
        if (Authentication.getRequestedURL(session).trim().length()>0) {
            setNextPage(Authentication.getRequestedURL(session).trim());
            customRedir=true;
            Authentication.resetRequestedURL(session);
        } else {
            setNextPage(getServletPath()+"?"+Constants.TASK_PARAM+"="+Constants.DB_SELECTION_TASK);
            super.setInternalResource(false);
        }
        try {
            Authentication.attemptLogin( getHandleInput(), getPasswordInput(), getInitialContext(), session, "");
        } catch (AuthenticationException e) {
            setMessage(Authentication.getErrorMessage(session));
            setNextPage(Constants.LOGIN_PAGE );
        }
    }

    public void setAttributes(String paramName, String paramValues[]) {
        String value = paramValues[0];
        value = (value == null?"":value.trim());

        if (paramName.equalsIgnoreCase(Constants.HANDLE_PARAM))
            setHandleInput(value);
        else if (paramName.equalsIgnoreCase(Constants.PASSWORD_PARAM))
            setPasswordInput(value);
    }

    /** Setter for property handleInput.
     * @param handleInput New value of property handleInput.
     */
    public void setHandleInput(String handleInput) {
        this.handleInput=handleInput;
    }

    /** Getter for property handleInput
     * @return Value of property handleInput
     */
    public String getHandleInput() {
        return handleInput;
    }

    /** Setter for property passwordInput.
     * @param passwordInput New value of property passwordInput.
     */
    public void setPasswordInput(String passwordInput) {
        this.passwordInput=passwordInput;
    }

    /** Getter for property passwordInput
     * @return Value of property passwordInput
     */
    public String getPasswordInput() {
        return passwordInput;
    }

    /** Setter for property message.
     * @param message New value of property message.
     */
    public void setMessage(String message) {
        this.message=message;
    }

    /** Getter for property message
     * @return Value of property message
     */
    public String getMessage() {
        return message;
    }

    public void setSession(HttpSession session) {
        this.session = session;
    }


}


