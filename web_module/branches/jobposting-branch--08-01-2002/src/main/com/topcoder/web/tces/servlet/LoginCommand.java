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
 * A base interface for
 * @author bigjake <kitz@mit.edu>
 *
 */

public class LoginCommand implements TCESCommand, Serializable {

	boolean isStepAuth;
	boolean isStepView;

	Logger log;

	public LoginCommand() {
		isStepView = true;

		setLog(null);
	}

	public LoginCommand(String step, Logger log) {
		if (step==null) {
			isStepView=true;
			isStepAuth=false;
		}
		else if (step.equals("v")) {
			isStepAuth=false;
			isStepView=true;
		}
		else if (step.equals("a")) {
			isStepAuth=true;
			isStepView=false;
		}

		setLog(log);
	}

	public void setLog(Logger log) {
		this.log=log;
	}

	public Logger getLog(Logger log) {
		return log;
	}

	public void processCommand(HttpServletRequest request,
					 	  	   HttpServletResponse response,
					 	  	   InitialContext ctx,
					 	  	   ServletContext servCtx)  throws Exception
	{
		if (isStepView) {
			viewLogin(request,response,ctx,servCtx);
			return;
		}

		if (isStepAuth) {
			viewAuth(request,response,ctx,servCtx);
			return;
		}
	}


	public void viewAuth(HttpServletRequest request, HttpServletResponse response,
					 	  	   InitialContext ctx, ServletContext servCtx)  throws Exception
	{
        String handle = request.getParameter(TCESConstants.HANDLE_PARAM);
        String password = request.getParameter(TCESConstants.PASSWORD_PARAM);

        if (handle == null)
            throw new Exception("missing " + TCESConstants.JOB_ID_PARAM + " parameter " + " in request");

        if (password == null)
            throw new Exception("missing " + TCESConstants.JOB_ID_PARAM + " parameter " + " in request");

		Request dataRequest = new Request();
		dataRequest.setProperty("c", "tces_user_and_pw");
		dataRequest.setProperty("hn", "" + handle);
		DataAccessInt dai = new DataAccess((javax.sql.DataSource)ctx.lookup(DBMS.OLTP_DATASOURCE_NAME));

		Map resultMap = dai.getData(dataRequest);
		ResultSetContainer rsc = (ResultSetContainer) resultMap.get("TCES_User_And_Password");

		if (rsc.getRowCount() == 0) {
			request.setAttribute(TCESConstants.MSG_ATTR_KEY, "User handle incorrect.  Please retry.");

			servCtx.getContext("/").getRequestDispatcher(
				response.encodeURL("/es/login.jsp")).forward(request, response);

			return;
		}

		ResultSetContainer.ResultSetRow rRow = rsc.getRow(0);

		String actualPassword = TCData.getTCString(rRow, "password");
		if (actualPassword == null) {
			log.debug("Exception occured getting user data in handleLogin.");
			throw new Exception("Unable to read user data from DB in handleLogin");
		}

		if (!actualPassword.trim().equals(password)) {
			request.setAttribute(TCESConstants.MSG_ATTR_KEY, "Password incorrect.  Please retry.");

			servCtx.getContext("/").getRequestDispatcher(
				response.encodeURL("/es/login.jsp")).forward(request, response);

			return;
		}

		HttpSession session = request.getSession(true);
		session.setAttribute( "user_id", new Integer(TCData.getTCInt(rRow,"user_id")) );
		request.setAttribute("LoginCommand",this);
	}

	public void viewLogin(HttpServletRequest request, HttpServletResponse response,
					 	  	   InitialContext ctx, ServletContext servCtx)  throws Exception
	{
		if (log!=null) log.debug("LoginCommand: forwarding to login page...");

		servCtx.getContext("/").getRequestDispatcher(
			response.encodeURL("/es/login.jsp")).forward(request, response);
	}

}


