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
 * Processes the "login" command.
 * @author bigjake <kitz@mit.edu>
 *
 */

public class LoginTask extends BaseTask implements Task, Serializable {

    private static Logger log = Logger.getLogger(LoginTask.class);

    private String handleInput;
    private String passwordInput;
    private String message;

    public LoginTask() {
        super();
        setHandleInput("");
        setPasswordInput("");
        setNextPage(TCESConstants.LOGIN_PAGE);
    }

    public void setHandleInput(String handleInput) {
        this.handleInput=handleInput;
    }

    public String getHandleInput() {
        return handleInput;
    }

    public void setPasswordInput(String passwordInput) {
        this.passwordInput=passwordInput;
    }

    public String getPasswordInput() {
        return passwordInput;
    }

    public void setMessage(String message) {
        this.message=message;
    }

    public String getMessage() {
        return message;
    }

	public void servletPreAction(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
	}

    public void servletPostAction(HttpServletRequest request, HttpServletResponse response) throws Exception
    {
        HttpSession session = request.getSession(true);

        if (Authentication.attemptLogin( getHandleInput(), getPasswordInput(), session)) {
            setNextPage(TCESConstants.LOGIN_OK_PAGE );
        }
        else {
            setMessage(Authentication.getErrorMessage);
            setNextPage(TCESConstants.LOGIN_OK_PAGE );
        }
    }

    public void processStep(String step)
        throws Exception
    {
    }


    private void viewLogin() throws Exception
    {
        setNextPage(TCESConstants.LOGIN_PAGE);
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


