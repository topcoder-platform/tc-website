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

public class LoginCommand implements TCESCommand, Serializable {

	boolean isStepAuth;
	boolean isStepView;

	private static Logger log = Logger.getLogger(LoginCommand.class);

	String message;

	public LoginCommand() {
		isStepView = true;

		setMessage("");
	}

	public LoginCommand(String step) {
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

		setMessage("");
	}

	public void setMessage(String message) {
		this.message=message;
	}

	public String getMessage() {
		return message;
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


	private void goLoginPage(HttpServletRequest request, HttpServletResponse response,
					 	  	   ServletContext servCtx) throws Exception
	{
		request.setAttribute("LoginCommand",this);

		servCtx.getContext("/").getRequestDispatcher(
			response.encodeURL("/es/login.jsp")).forward(request, response);
	}

	private void goMainPage(HttpServletRequest request, HttpServletResponse response,
					 	  	   ServletContext servCtx) throws Exception
	{
		response.sendRedirect(response.encodeURL("http://" + request.getServerName() + "/tces/tces?c=main"));
	}



	private void viewAuth(HttpServletRequest request, HttpServletResponse response,
					 	  	   InitialContext ctx, ServletContext servCtx)  throws Exception
	{
		HttpSession session = request.getSession(true);

        String handle = request.getParameter(TCESConstants.HANDLE_PARAM);
        String password = request.getParameter(TCESConstants.PASSWORD_PARAM);

        if (handle == null)
            throw new Exception("missing " + TCESConstants.JOB_ID_PARAM + " parameter " + " in request");

        if (password == null)
            throw new Exception("missing " + TCESConstants.JOB_ID_PARAM + " parameter " + " in request");

		Request dataRequest = new Request();
		dataRequest.setProperty("c", "tces_user_and_pw");
		dataRequest.setProperty("hn", "\'"+handle+"\'");
		DataAccessInt dai = new CachedDataAccess((javax.sql.DataSource)ctx.lookup(DBMS.OLTP_DATASOURCE_NAME));

		Map resultMap = dai.getData(dataRequest);
		ResultSetContainer rsc = (ResultSetContainer) resultMap.get("TCES_User_And_Password");

		if (rsc.getRowCount() == 0) {
			setMessage("User handle incorrect.  Please retry.");

			session.setAttribute("user_id", null);  // record the user as not being logged-in.

			goLoginPage(request,response,servCtx);

			return;
		}

		ResultSetContainer.ResultSetRow rRow = rsc.getRow(0);

		String actualPassword = TCData.getTCString(rRow, "password");
		if (actualPassword == null) {
			throw new Exception("Unable to read user data from DB in handleLogin");
		}

		if (!actualPassword.trim().equals(password)) {
			setMessage("Password incorrect.  Please retry.");

			session.setAttribute("user_id", null);  // record the user as not being logged-in.

			goLoginPage(request,response,servCtx);

			return;
		}

		// record in this session that we have authenticated a user.
		session.setAttribute( "user_id", new Integer(TCData.getTCInt(rRow,"user_id")) );

		goMainPage(request,response,servCtx);
	}



	private void viewLogin(HttpServletRequest request, HttpServletResponse response,
					 	  	   InitialContext ctx, ServletContext servCtx)  throws Exception
	{
		if (log!=null) log.debug("LoginCommand: forwarding to login page...");

		goLoginPage(request,response,servCtx);
	}

}


