package com.topcoder.web.tces.bean;

import com.topcoder.shared.dataAccess.*;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.tces.common.TCData;
import com.topcoder.web.tces.common.TCESConstants;

import javax.servlet.http.*;
import java.io.Serializable;
import java.util.Map;

/**
 * Processes the login task
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


    /* Creates a new LoginTask */
    public LoginTask() {
        super();
        setHandleInput("");
        setPasswordInput("");
        setNextPage(TCESConstants.LOGIN_PAGE);
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

	public void servletPreAction(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
	}

    public void servletPostAction(HttpServletRequest request, HttpServletResponse response) throws Exception
    {
        if (request.getParameter(TCESConstants.STEP_PARAM)!=null &&
            (request.getParameter(TCESConstants.STEP_PARAM).equals(TCESConstants.LOGIN_TASK_STEP_AUTH) ||
             request.getParameter(TCESConstants.STEP_PARAM).equals(TCESConstants.LOGIN_TASK_STEP_AUTHREDIR)) ) {
            HttpSession session = request.getSession(true);

            if (Authentication.attemptLogin( getHandleInput(), getPasswordInput(), getInitialContext(), session)) {
                if (request.getParameter(TCESConstants.STEP_PARAM).equals(TCESConstants.LOGIN_TASK_STEP_AUTH))
                    setNextPage(TCESConstants.LOGIN_OK_PAGE );
                else if (request.getParameter(TCESConstants.STEP_PARAM).equals(TCESConstants.LOGIN_TASK_STEP_AUTHREDIR))
                    setNextPage( request.getRequestURL() );
            }
            else {
                setMessage(Authentication.getErrorMessage(session));
                setNextPage(TCESConstants.LOGIN_PAGE );
            }
        }
    }

    public void processStep(String step)
        throws Exception
    {
    }

    public void setAttributes(String paramName, String paramValues[]) {
        String value = paramValues[0];
        value = (value == null?"":value.trim());

        if (paramName.equalsIgnoreCase(TCESConstants.HANDLE_PARAM))
            setHandleInput(value);
        else if (paramName.equalsIgnoreCase(TCESConstants.PASSWORD_PARAM))
            setPasswordInput(value);

    }

}


