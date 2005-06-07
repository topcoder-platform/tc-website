/*
 * Created on Apr 27, 2005
 */
package com.topcoder.web.forums.controller;

import com.topcoder.shared.security.Resource;
import com.topcoder.shared.security.SimpleResource;
import com.topcoder.shared.security.User;
import com.topcoder.shared.util.logging.Logger;

import com.topcoder.web.forums.controller.request.ForumsProcessor;

import com.topcoder.web.common.*;
import com.topcoder.web.common.security.SessionPersistor;
import com.topcoder.web.common.security.WebAuthentication;
import com.topcoder.web.common.security.BasicAuthentication;
import com.topcoder.security.TCSubject;

import com.topcoder.web.common.model.CoderSessionInfo;
import com.topcoder.web.forums.model.TCAuthFactory;
import com.topcoder.web.forums.model.TCAuthToken;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Set;

import com.jivesoftware.base.AuthFactory;
import com.jivesoftware.base.AuthToken;
import com.jivesoftware.base.UnauthorizedException;

/**
 * @author mtong
 * 
 * Provides session and authentication information to the forum's processors.
 */
public class ForumsServlet extends BaseServlet {
	private final static Logger log = Logger.getLogger(ForumsServlet.class);
    
    protected boolean hasPermission(WebAuthentication auth, Resource r) throws Exception {
        return true;
    }

    protected void process(HttpServletRequest request, HttpServletResponse response)
    	throws IOException {

		RequestProcessor rp = null;
		WebAuthentication authentication = null;
		SessionInfo info = null;

		try {
			TCSubject user = null;
            
		    TCRequest tcRequest = HttpObjectFactory.createRequest(request);
		    TCResponse tcResponse = HttpObjectFactory.createResponse(response);
            
            //set up security objects and session info
		    authentication = createAuthentication(tcRequest, tcResponse);
            //log.debug("@@@@@@@@ Active user ID: " + authentication.getActiveUser().getId());
			//AuthToken authToken = TCAuthFactory.getAuthToken(request, response);     // calls BA.getActiveUser()
		    AuthToken authToken = AuthFactory.getAnonymousAuthToken();
            try {
		        authToken = AuthFactory.getAuthToken(request, response);
            } catch (UnauthorizedException uae) {}
            //AuthToken authToken = AuthFactory.getAuthToken("tomek","password");
            if (log.isDebugEnabled()) {
                if (authToken instanceof TCAuthToken) {
                    log.debug("*** Uses custom auth ***");
                } else {
                    log.debug("*** Does not use custom auth ***");
                }
            }
	    	user = getUser(authToken.getUserID());
            
		    info = createSessionInfo(tcRequest, authentication, user.getPrincipals());
		    tcRequest.setAttribute(SESSION_INFO_KEY, info);
		    //todo perhaps this should be configurable...so implementing classes
		    //todo don't have to do it if they don't want to
		    RequestTracker.trackRequest(authentication.getActiveUser(), tcRequest);
            
		    StringBuffer loginfo = new StringBuffer(100);
		    loginfo.append("[**** ");
		    loginfo.append(info.getHandle());
		    loginfo.append(" **** ");
		    loginfo.append(request.getRemoteAddr());
		    loginfo.append(" **** ");
		    loginfo.append(request.getMethod());
		    loginfo.append(" ");
		    loginfo.append(info.getRequestString());
		    loginfo.append(" ****]");
		    log.info(loginfo);

		    try {
		        try {
		            String cmd = StringUtils.checkNull((String) tcRequest.getAttribute(MODULE));
		            if (cmd.equals(""))
		                cmd = StringUtils.checkNull(tcRequest.getParameter(MODULE));

		            if (cmd.equals(""))
		                cmd = DEFAULT_PROCESSOR;
		            if (!isLegalCommand(cmd))
		                throw new NavigationException();
                    
                    String processorName = PATH + (PATH.endsWith(".") ? "" : ".") + getProcessor(cmd);

		            log.debug("creating request processor for " + processorName);
		            try {
		                SimpleResource resource = new SimpleResource(processorName);
		                if (hasPermission(authentication, resource)) {
		                    rp = callProcess(processorName, request, response, tcRequest, tcResponse, authentication, authToken);
		                } else {
		                    throw new PermissionException(authentication.getActiveUser(), resource);
		                }
		            } catch (ClassNotFoundException e) {
		                throw new NavigationException("Invalid request", e);
		            }
		        } catch (PermissionException pe) {
		            log.debug("caught PermissionException");
		            if (authentication.getUser().isAnonymous()) {
		                handleLogin(request, response, info);
		                return;
		            } else {
		                log.debug("already logged in, rethrowing");
		                throw pe;
		            }
		        }
		        if (!response.isCommitted()) {
		            fetchRegularPage(request, response, rp.getNextPage(), rp.isNextPageInContext());
		            return;
		        }
		    } catch (Exception e) {
		        handleException(request, response, e);
		    }

		    /* things are extremely broken, or perhaps some of the response
		     * buffer had already been flushed when an error was thrown,
		     * and the forward to error page failed.  in any event, make
		     * one last attempt to get an error message to the browser
		     */
		} catch (Exception e) {
		    log.fatal("forwarding to error page failed", e);
		    e.printStackTrace();
		    response.setContentType("text/html");
		    response.setStatus(500);
		    PrintWriter out = response.getWriter();
		    out.println("<html><head><title>Internal Error</title></head>");
		    out.println("<body><h4>Your request could not be processed.  Please inform TopCoder.</h4>");
		    out.println("</body></html>");
		    out.flush();
		}
	}
    
    protected void handleLogin(HttpServletRequest request, HttpServletResponse response, SessionInfo info) throws Exception {
        /* forward to the login page, with a message and a way back */
        fetchRegularPage(request, response, LOGIN_SERVLET + "?module=Login&" + BaseServlet.NEXT_PAGE_KEY + 
                "=" + info.getRequestString(), false);
                
        //request.setAttribute(MESSAGE_KEY, "In order to continue, you must provide your user name " +
        //        "and password.");
        //log.debug("going to " + info.getRequestString() + " on success login");
        //request.setAttribute(NEXT_PAGE_KEY, info.getRequestString());
           
        //request.setAttribute(MODULE, LOGIN_PROCESSOR);
        //fetchRegularPage(request, response, "/login.jsp", true);
        //fetchRegularPage(request, response, LOGIN_SERVLET == null ? info.getServletPath() : LOGIN_SERVLET, true);
    }

    protected RequestProcessor callProcess(String processorName, HttpServletRequest httpRequest,
            HttpServletResponse httpResponse, TCRequest request, TCResponse response,
            WebAuthentication authentication, AuthToken authToken) throws Exception {
		ForumsProcessor rp = null;

		rp = (ForumsProcessor)Class.forName(processorName).newInstance();
        rp.setHttpRequest(httpRequest);
        rp.setHttpResponse(httpResponse);
		rp.setRequest(request);
		rp.setResponse(response);
		rp.setAuthentication(authentication);
		rp.setAuthToken(authToken);
		rp.process();
		return rp;
	}

    protected SessionInfo createSessionInfo(TCRequest request,
            WebAuthentication auth, Set groups) throws Exception {
		CoderSessionInfo ret = null;
		ret = new CoderSessionInfo(request, auth, groups);
		return ret;
	}
}
