package com.topcoder.web.codinginterface.longcontest.controller.request;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.StringReader;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.*;

import javax.ejb.EJBException;
import javax.naming.Context;
import javax.naming.InitialContext;

import com.topcoder.web.codinginterface.CodingInterfaceConstants;
import com.topcoder.web.codinginterface.ServerBusyException;
import com.topcoder.web.codinginterface.longcontest.controller.request.Base;
import com.topcoder.web.codinginterface.longcontest.Constants;
import com.topcoder.server.common.Results;
import com.topcoder.server.ejb.DBServices.DBServices;
import com.topcoder.server.ejb.DBServices.DBServicesHome;
import com.topcoder.server.ejb.TestServices.TestServices;
import com.topcoder.server.ejb.TestServices.TestServicesHome;
import com.topcoder.shared.common.ApplicationServer;
import com.topcoder.shared.security.ClassResource;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.TCWebException;
import com.topcoder.shared.messaging.TimeOutException;
import com.topcoder.shared.messaging.messages.LongCompileRequest;
import com.topcoder.shared.messaging.messages.LongCompileResponse;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.web.common.TCRequest;
import com.topcoder.web.ejb.roundregistration.RoundRegistration;

public class Submit extends Base {
	private static final Set waiting = new HashSet();

	private static final String PROGRESS_COMPILING_HTML = "<html>"
			+ "<title>TopCoder</title>"
			+ "<head>"
			+ "<STYLE TYPE=\"text/css\">"
			+ ".html, body"
			+ "{font-family: Arial, Helvetica, Verdana, sans-serif;font-size: 12px;color: #333;}"
			+ "</STYLE>"
			+ "</head>"
			+ "<body>"
			+ "<div align=\"center\">"
			+ "<br><br>"
			+ "Please wait while your solution is submitted."
			+ "<br><br>"
			+ "<img src=\"http://www.topcoder.com/i/interface/processing.gif\" alt=\"Processing\" border=\"0\" />"
			+ "</div>" + "</body>" + "</html>";

	protected void businessProcessing() throws TCWebException {
		TCRequest request = getRequest();

		if (getUser().isAnonymous()) {
			throw new PermissionException(getUser(), new ClassResource(this
					.getClass()));
		}

		long uid = getUser().getId();
		
		try {
			
			int cid = Integer.parseInt(request.getParameter(Constants.COMPONENT_ID));
			int rid = Integer.parseInt(request.getParameter(Constants.ROUND_ID));
			int cd = Integer.parseInt(request.getParameter(Constants.CONTEST_ID));			
			int language = Integer.parseInt((request.getParameter(Constants.LANGUAGE_ID) == null ? "-1" : request.getParameter(Constants.LANGUAGE_ID)));			 
			String action = request.getParameter(Constants.ACTION_KEY);
			String code = request.getParameter(Constants.CODE);
			
			if (!isUserRegistered(uid, rid)) {
				throw new TCWebException("User not registered for contest.");
			}

			Request r = new Request();
			r.setContentHandle("long_submission");
			r.setProperty(Constants.CODER_ID, String.valueOf(uid));
			r.setProperty(Constants.COMPONENT_ID, String.valueOf(cid));
			r.setProperty(Constants.ROUND_ID, String.valueOf(rid));
			DataAccessInt dataAccess = getDataAccess(false);
			Map m = dataAccess.getData(r);
			
			// Check to make sure the contest has begun and is not over
			ResultSetContainer lang = (ResultSetContainer) m.get("long_languages");
			boolean started = ((ResultSetContainer) m.get("long_contest_started")).getBooleanItem(0, 0);
			boolean over = ((ResultSetContainer) m.get("long_contest_over")).getBooleanItem(0, 0);
			if (!started) {
				throw new TCWebException("The contest has not started yet.");
			}
			if (over) {
				throw new TCWebException("The contest is over.");
			}
			
			String className = ((ResultSetContainer) m.get("long_class_name")).getStringItem(0, 0);
			
			// Put these objects into session
			request.getSession().setAttribute(Constants.LANGUAGES, lang);
			request.getSession().setAttribute(Constants.CLASS_NAME, className);
			request.getSession().setAttribute(Constants.CODE, code);
			request.getSession().setAttribute(Constants.SELECTED_LANGUAGE, new Integer(language));
			
			if(action == null) { // no action specified
				// any code in session?
				code = (String) request.getSession().getAttribute(Constants.CODE);
				if (code == null) { // try and load the most recent code
					ResultSetContainer rsc = (ResultSetContainer) m.get("long_contest_recent_compilation");
					// default values
					code = "";
					language = -1;
					if (rsc.size() > 0) {
						code = rsc.getStringItem(0, "compilation_text");
						if(!isNull(rsc, 0, "language_id")) {
							language = rsc.getIntItem(0, "language_id");
						} else {
							language = -1;
						}
					}
					// put the updates values back into session
					request.getSession().setAttribute(Constants.CODE, code);
					request.getSession().setAttribute(Constants.SELECTED_LANGUAGE, new Integer(language));
				}
				setNextPage(Constants.SUBMISSION_JSP);
				setIsNextPageInContext(true);
				return;
			} else if(action.equals("submit")) { // user is submiting code
				// The request info for the compiler
				LongCompileRequest lcr = new LongCompileRequest((int) uid, cid, rid, cd, language, ApplicationServer.WEB_SERVER_ID, code);

				try {
					// Send the request!
					send(lcr);
				} catch(ServerBusyException sbe) {
					throw new TCWebException("A submit request is already being processed.");
				}

				// Tell the user that the code is compiling...
				showProcessingPage(PROGRESS_COMPILING_HTML);

				try {
					// Get the compilation response
					LongCompileResponse res = receive(30 * 1000, uid, cid);
					
//					Records errors and other info
					if(res.getCompileStatus() == true) { // everything went ok! :)
						cleanSession();
						// Go to standings!
						closeProcessingPage(buildProcessorRequestString("ViewStandings",
								new String[] { Constants.ROUND_ID }, new String[] { String
										.valueOf(rid) }));
					} else { // Compilation errors!						
						request.getSession().setAttribute(Constants.COMPILE_STATUS, new Boolean(res.getCompileStatus()));
						request.getSession().setAttribute(Constants.COMPILE_MESSAGE, htmlEncode(res.getCompileError()));
//						 Go back to coding.
						closeProcessingPage(buildProcessorRequestString("Submit",
								new String[]{Constants.ROUND_ID,Constants.CONTEST_ID,Constants.COMPONENT_ID,Constants.LANGUAGE_ID},
								new String[]{String.valueOf(rid),String.valueOf(cd),String.valueOf(cid),String.valueOf(language)}));
					}
				} catch (TimeOutException e) {
					throw new TCWebException("Your code compilation timed out.");
				}
				
			} else if(action.equals("save")) { // user is saving code
				saveCode(code, language, (int)uid, cd, rid, cid);		
				// save complete
				// go back to coding!
				request.setAttribute("saved", "true");
				setNextPage(Constants.SUBMISSION_JSP);
				setIsNextPageInContext(true);
			}		
		} catch (TCWebException e) {
			log.error("Unexpected error in code submit module.", e);
			throw e;
		} catch (Exception e) {
			log.error("Unexpected error in code submit module.", e);
			throw new TCWebException("An error occurred while compiling your code", e);
		}		
	}
	
	private boolean isNull(ResultSetContainer r, int row, String colName) {
		return r.getItem(row, colName).getResultData() == null;
	}
	
	protected String htmlEncode(String s) throws Exception {
		StringBuffer sb = new StringBuffer();
		BufferedReader br = new BufferedReader(new StringReader(s));
		while(true) {
			String l = br.readLine();
			if(l==null) break;
			sb.append(l);
			sb.append("<br>");			
		}
		return sb.toString();		
	}
	
	private void cleanSession() { // remove junk session variables that this class put into session
		getRequest().getSession().removeAttribute(Constants.LANGUAGES);
		getRequest().getSession().removeAttribute(Constants.CLASS_NAME);
		getRequest().getSession().removeAttribute(Constants.CODE);
		getRequest().getSession().removeAttribute(Constants.SELECTED_LANGUAGE);
		getRequest().getSession().removeAttribute(Constants.COMPILE_STATUS);
		getRequest().getSession().removeAttribute(Constants.COMPILE_MESSAGE);		
	}

	private void saveCode(String code, int lang, int uid, int cd, int rid, int cid) throws Exception {
		log.debug("saveCode called... lang=" + lang + " uid=" + uid + " cd=" + cd + " rid="
				+ rid + " cid=" + cid);
		
		InitialContext ctx = getInitialContext();
		DBServicesHome dbsHome = (DBServicesHome)ctx.lookup(ApplicationServer.DB_SERVICES);
		DBServices dbs = dbsHome.create();
		if(!dbs.isComponentOpened(uid, rid, cid)) { // Is there a record of the user opening the question?
			dbs.coderOpenComponent(uid, cd, rid, 0, cid);
		}
		
		TestServicesHome t = (TestServicesHome)ctx.lookup(ApplicationServer.TEST_SERVICES);
		TestServices ts = t.create();
		Results r = ts.saveComponent(cd, rid, cid, uid, code);
	}

	protected boolean isUserRegistered(long userID, long roundID)
			throws Exception {
		boolean ret = false;
		try {
			RoundRegistration reg = (RoundRegistration) createEJB(
					getInitialContext(), RoundRegistration.class);
			ret = reg.exists(userID, roundID);
		} catch (Exception e) {
			log.error("Error isUserRegistered user: " + userID + " for round: "
					+ roundID, e);
			throw e;
		}
		return ret;
	}
}
