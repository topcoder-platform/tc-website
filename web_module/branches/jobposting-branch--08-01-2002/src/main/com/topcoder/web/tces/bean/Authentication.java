package com.topcoder.web.tces.bean;

import com.topcoder.shared.dataAccess.*;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;

import javax.naming.InitialContext;
import javax.servlet.http.*;
import java.io.Serializable;
import java.util.Map;

public class Authentication implements Serializable {

    public static int USER_NOT_LOGGED_IN = -1;

    private int userId;
    private String errorMessage;


    public static boolean attemptLogin(String handle, String password, InitialContext ctx, HttpSession session) {
        try {
            Authentication auth = new Authentication();

            session.setAttribute("tces_auth", auth);

            auth.setUserId(USER_NOT_LOGGED_IN);

            Request dataRequest = new Request();
            dataRequest.setContentHandle("tces_user_and_pw");
            dataRequest.setProperty("hn", handle );
            DataAccessInt dai = new DataAccess((javax.sql.DataSource)ctx.lookup(DBMS.OLTP_DATASOURCE_NAME));
            Map resultMap = dai.getData(dataRequest);
            ResultSetContainer rsc = (ResultSetContainer) resultMap.get("TCES_User_And_Password");

            if (rsc.getRowCount() == 0) {
                auth.setErrorMessage("Incorrect handle.  Please retry.");
                return false;
            }

            ResultSetContainer.ResultSetRow rRow = rsc.getRow(0);
            String actualPassword = rRow.getItem("password").toString();
            if (actualPassword == null) {
                auth.setErrorMessage("Incorrect login.  Please retry.");
                return false;
            }

            if (!actualPassword.trim().equals(password.trim())) {
                auth.setErrorMessage("Incorrect password.  Please retry.");
                return false;
            }

            // record in this session that we have authenticated a user.

            auth.setUserId( ((Long)rRow.getItem("user_id").getResultData()).intValue() );
            return true;
        } catch (Exception e) {
        }
        return false;
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

    public static String getErrorMessage(HttpSession session) {
        Authentication auth = (Authentication)session.getAttribute("tces_auth");

        if (auth==null)
            return "";
        else
            return auth.errorMessage;
    }

    private void setUserId(int userId) {
        this.userId=userId;
    }

    private int getUserId() {
        return userId;
    }

}