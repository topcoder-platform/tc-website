package com.topcoder.web.query.bean;

import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.query.common.AuthenticationException;
import com.topcoder.web.query.common.Constants;
import com.topcoder.web.query.common.Authentication;

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

    private HttpSession session;
    private String redirectPage;

    /* Creates a new LoginTask */
    public LoginTask() {
        super();
        setHandleInput("");
        setPasswordInput("");
        setRedirectPage("");
    }

	public void servletPreAction(HttpServletRequest request, HttpServletResponse response)
            throws AuthenticationException, Exception {
        super.setAuthentication(Authentication.getAuthentication(request.getSession(true)));
        session = request.getSession(true);
    }

    public void servletPostAction(HttpServletRequest request, HttpServletResponse response) throws Exception {
    }

    public void process(String step) throws Exception {
        if (getRedirectPage().length()>0) {
            setNextPage(getRedirectPage());
        } else {
            setNextPage(getServletPath()+"?"+Constants.TASK_PARAM+"="+Constants.DB_SELECTION_TASK);
        }

        try {
            super.getAuthentication().attemptLogin(getHandleInput(), getPasswordInput(), getInitialContext(), session);
        } catch (AuthenticationException e) {
            setNextPage(Constants.LOGIN_PAGE );
        }
        super.setInternalResource(false);
    }

    public void setAttributes(String paramName, String paramValues[]) {
        String value = paramValues[0];
        value = (value == null?"":value.trim());

        if (paramName.equalsIgnoreCase(Constants.HANDLE_PARAM))
            setHandleInput(value);
        else if (paramName.equalsIgnoreCase(Constants.PASSWORD_PARAM))
            setPasswordInput(value);
        else if (paramName.equalsIgnoreCase(Constants.REDIRECT_PAGE_PARAM))
            setRedirectPage(value);
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

    public String getRedirectPage() {
        return redirectPage;
    }

    public void setRedirectPage(String redirectPage) {
        this.redirectPage = redirectPage;
    }

}


