package com.topcoder.web.tces.servlet;

import com.topcoder.shared.util.ApplicationServer;
import com.topcoder.shared.util.TCContext;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.dataAccess.*;
import com.topcoder.shared.dataAccess.resultSet.*;
import com.topcoder.web.tces.common.*;
import com.topcoder.web.tces.ejb.TCESServices.TCESServices;
import com.topcoder.web.tces.ejb.TCESServices.TCESServicesHome;

import javax.naming.InitialContext;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.util.*;

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
    private int userIdAuthenticated;

    public LoginTask() {
        super();
        setNextPage(TCESConstants.JSP_ROOT + TCESConstants.LOGIN_PAGE);
        setUserIdAuthenticated(-1);
    }

    private void setUserIdAuthenticated(int userIdAuthenticated) {
        this.userIdAuthenticated=userIdAuthenticated;
    }

    private int getUserIdAuthenticated() {
        return userIdAuthenticated;
    }

    public void setHandleInput(String handleInput) {
log.debug("Setting HandleInput to "+handleInput);
        this.handleInput=handleInput;
    }

    public String getHandleInput() {
log.debug("getting handleinput "+handleInput);
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

        if (userIdAuthenticated<0) {
            session.setAttribute("user_id", null);  // record the user as not being logged-in.
        }
        else {
            session.setAttribute("user_id", new Integer(userIdAuthenticated));
        }
    }

    public void processStep(String step)
        throws Exception
    {
        if (step == null) {
            viewLogin();
            return;
        }
        else if (step.equals(TCESConstants.LOGIN_TASK_STEP_VIEW)) {
            viewLogin();
            return;
        }
        else if (step.equals(TCESConstants.LOGIN_TASK_STEP_AUTH)) {
            doAuth();
            return;
        }
    }

    private void doAuth() throws Exception
    {
        Request dataRequest = new Request();
        dataRequest.setContentHandle("tces_user_and_pw");
        dataRequest.setProperty("hn", getHandleInput() );
        DataAccessInt dai = new DataAccess((javax.sql.DataSource)getInitialContext().lookup(DBMS.OLTP_DATASOURCE_NAME));
        Map resultMap = dai.getData(dataRequest);
        ResultSetContainer rsc = (ResultSetContainer) resultMap.get("TCES_User_And_Password");

        if (rsc.getRowCount() == 0) {
            setMessage("User handle incorrect.  Please retry.");

            setUserIdAuthenticated(-1);

            setNextPage(TCESConstants.JSP_ROOT + TCESConstants.LOGIN_PAGE);

            return;
        }

        ResultSetContainer.ResultSetRow rRow = rsc.getRow(0);

        String actualPassword = TCData.getTCString(rRow, "password");
        if (actualPassword == null) {
            throw new Exception("Unable to read user data from DB in handleLogin");
        }

        if (!actualPassword.trim().equals(getPasswordInput().trim())) {
            setMessage("Password incorrect.  Please retry.");

            setUserIdAuthenticated(-1);

            setNextPage(TCESConstants.JSP_ROOT + TCESConstants.LOGIN_PAGE);

            return;
        }

        // record in this session that we have authenticated a user.

        setUserIdAuthenticated( TCData.getTCInt(rRow,"user_id") );
log.debug("USER ID AUTH = "+Integer.toString(getUserIdAuthenticated()) );
        setMessage("Login OK!");
        setNextPage(TCESConstants.LOGIN_OK_PAGE );
    }



    private void viewLogin() throws Exception
    {
        setNextPage(TCESConstants.JSP_ROOT + TCESConstants.LOGIN_PAGE);
    }

    public void setAttributes(String paramName, String paramValues[]) {
        String value = paramValues[0];
        value = (value == null?"":value.trim());

log.debug("setting param "+paramName+" = "+value);

        if (paramName.equalsIgnoreCase(TCESConstants.HANDLE_PARAM))
            setHandleInput(value);
        else if (paramName.equalsIgnoreCase(TCESConstants.PASSWORD_PARAM))
            setPasswordInput(value);

    }

}


