package com.topcoder.web.tces.bean;

import javax.servlet.http.*;
import java.io.Serializable;

public class Authentication implements Serializable {

    public static int USER_NOT_LOGGED_IN = -1;

    private int userId;
    private String errorMessage;


    public static boolean attemptLogin(String handle, String password, HttpSession session) {
        Authentication auth = new Authentication();
        sessionsession

        auth.setUserId(USER_NOT_LOGGED_IN);

        Request dataRequest = new Request();
        dataRequest.setContentHandle("tces_user_and_pw");
        dataRequest.setProperty("hn", getHandleInput() );
        DataAccessInt dai = new DataAccess((javax.sql.DataSource)getInitialContext().lookup(DBMS.OLTP_DATASOURCE_NAME));
        Map resultMap = dai.getData(dataRequest);
        ResultSetContainer rsc = (ResultSetContainer) resultMap.get("TCES_User_And_Password");

        if (rsc.getRowCount() == 0) {
            setErrorMessage("Incorrect handle.  Please retry.");
            return false;
        }

        ResultSetContainer.ResultSetRow rRow = rsc.getRow(0);
        String actualPassword = TCData.getTCString(rRow, "password");
        if (actualPassword == null) {
            setErrorMessage("Incorrect login.  Please retry.");
            return false;
        }

        if (!actualPassword.trim().equals(getPasswordInput().trim())) {
            setErrorMessage("Incorrect password.  Please retry.");
            return false;
        }

        // record in this session that we have authenticated a user.

        setUserId( (int)TCData.getTCLong(rRow,"user_id", -2, true) );
        return true;
    }

    public static boolean isLoggedIn(HttpSession session) {
        Authentication auth = (Authentication)session.getAttribute("tces_auth");

        if (auth==null)
            return false;
        else if (auth.getUserId()==USER_NOT_LOGGED_IN)
            return false;
        else
            return true;
    }

    public static int userLoggedIn(HttpSession session) {
        Authentication auth = (Authentication)session.getAttribute("tces_auth");

        if (auth==null)
            return USER_NOT_LOGGED_IN;
        else
            return auth.getUserId();
    }


    private void setErrorMessage(String errorMessage) {
        this.errorMessage = errorMessage;
    }

    public String getErrorMessage() {
        return errorMessage;
    }

    private int setUserId(int userId) {
        this.userId=userId;
    }

    private int getUserId() {
        return userId;
    }

}