package com.topcoder.web.query.bean;

import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.query.common.Constants;
import com.topcoder.web.query.common.Authentication;
import com.topcoder.web.query.common.AuthenticationException;

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

    private String errorMessage;

    /* Creates a new LoginTask */
    public LoginTask() {
        super();
        setHandleInput("");
        setPasswordInput("");
        setErrorMessage("");
    }

	public void servletPreAction(HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        session = request.getSession(true);
        super.setAuthentication(Authentication.getAuthentication(session));
    }

    public void process(String step) throws Exception {

        if (step.equalsIgnoreCase(Constants.NEW_STEP)) {
            if (!super.getAuthentication().isLoggedIn()) {
                try {
                    super.getAuthentication().attemptLogin(getHandleInput(), getPasswordInput(), getInitialContext(), session);
                } catch (AuthenticationException e) {
                    setErrorMessage(e.getMessage());
                    setNextPage(Constants.LOGIN_PAGE);
                }
            } else {
                setNextPage(getServletPath() + "?" + Constants.TASK_PARAM + "=" + Constants.DB_SELECTION_TASK);
                super.setInternalResource(false);
            }
        } else {
            setNextPage(Constants.LOGIN_PAGE);
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


    public String getErrorMessage() {
        return errorMessage;
    }

    public void setErrorMessage(String errorMessage) {
        this.errorMessage = errorMessage;
    }

}


