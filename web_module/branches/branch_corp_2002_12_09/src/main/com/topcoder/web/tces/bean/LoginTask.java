package com.topcoder.web.tces.bean;

import com.topcoder.shared.dataAccess.*;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.tces.common.TCData;
import com.topcoder.web.tces.common.TCESConstants;

import com.topcoder.shared.security.AuthenticationException;
import com.topcoder.shared.security.SimpleUser;
import com.topcoder.shared.security.User;

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

    /* Holds a boolean indicating whether the login task should perform custom redirection */
    private boolean customRedir;

    private HttpSession session;

    /* Creates a new LoginTask */
    public LoginTask() {
        super();
        customRedir=false;
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

    public void setSession(HttpSession session) {
        this.session = session;
    }
        

	public void servletPreAction(HttpServletRequest request, HttpServletResponse response) throws Exception {
            setSession(request.getSession(true));
	}

    public void servletPostAction(HttpServletRequest request, HttpServletResponse response) throws Exception {
    }

    public void processStep(String step) throws Exception {
        /* variable to hold requestedURL next page  */
        String checkNextPage = ((String)session.getAttribute("requestedURL")).trim();

        if (step!=null && step.equals(TCESConstants.LOGIN_TASK_STEP_AUTH)) {

            if (checkNextPage != null && checkNextPage.length() > 0) {
                setNextPage(checkNextPage);
                customRedir=true;
            }
            session.setAttribute("requestedURL","");

            String handle = getHandleInput();
            String passw = getPasswordInput();

            log.debug("TCES: login attempt for: "+handle);

            User possibleUser = new SimpleUser(handle, passw);

            try {
                authToken.login(possibleUser);
                log.debug("TCES: user "+possibleUser.getUserName()+" has logged in");
                if (!customRedir) {
                    setNextPage(TCESConstants.LOGIN_OK_PAGE);
                }
            }
            catch(AuthenticationException ae) {
                setMessage("Username and/or password are incorrect");
                setNextPage(TCESConstants.LOGIN_PAGE);
            }
        } else if (authToken.isLoggedIn()) {
            if (checkNextPage != null && checkNextPage.length() > 0) {
                setNextPage(checkNextPage);
                customRedir=true;
                session.setAttribute("requestedURL","");
            } else {
                setNextPage(TCESConstants.LOGIN_OK_PAGE );
            }     
        }
//            if (Authentication.getRequestedURL(session).trim().length()>0) {
//                setNextPage(Authentication.getRequestedURL(session).trim());
//                customRedir=true;
//                Authentication.resetRequestedURL(session);
//            }

//            if (Authentication.attemptLogin( getHandleInput(), getPasswordInput(), getInitialContext(), session, "")) {
//                if (!customRedir)
//                    setNextPage(TCESConstants.LOGIN_OK_PAGE );
//            }
//            else {
//                setMessage(Authentication.getErrorMessage(session));
//                setNextPage(TCESConstants.LOGIN_PAGE );
//            }
//        } else if (Authentication.isLoggedIn(session)) {
//            if (Authentication.getRequestedURL(session).trim().length()>0) {
//                setNextPage(Authentication.getRequestedURL(session).trim());
//                customRedir=true;
//                Authentication.resetRequestedURL(session);
//            } else {
//                setNextPage(TCESConstants.LOGIN_OK_PAGE );
//            }
//        }

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


