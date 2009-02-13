/*
 * Created on Apr 27, 2005
 */
package com.topcoder.web.forums.controller;

import com.jivesoftware.base.AuthFactory;
import com.jivesoftware.base.AuthToken;
import com.jivesoftware.base.UnauthorizedException;
import com.jivesoftware.forum.ForumFactory;
import com.topcoder.security.TCSubject;
import com.topcoder.shared.security.Persistor;
import com.topcoder.shared.security.Resource;
import com.topcoder.shared.security.SimpleResource;
import com.topcoder.shared.util.ApplicationServer;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.*;
import com.topcoder.web.common.model.CoderSessionInfo;
import com.topcoder.web.common.security.SessionPersistor;
import com.topcoder.web.common.security.StudioForumsAuthentication;
import com.topcoder.web.common.security.TCForumsAuthentication;
import com.topcoder.web.common.security.WebAuthentication;
import com.topcoder.web.forums.controller.request.ForumsProcessor;
import com.topcoder.web.tc.controller.request.authentication.Login;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.Constructor;
import java.util.Set;

/**
 * @author mtong
 *         <p/>
 *         Provides session and authentication information to the forum's processors.
 */
public class ForumsServlet extends BaseServlet {
    private final static Logger log = Logger.getLogger(ForumsServlet.class);

    private static String AUTHENTICATION_IMPLEMENTATION;

    public synchronized void init(ServletConfig config) throws ServletException {
        super.init(config);
        AUTHENTICATION_IMPLEMENTATION = config.getInitParameter("authentication_implementation");
    }

    protected boolean hasPermission(WebAuthentication auth, Resource r) throws Exception {
        return true;
    }

    protected void process(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {

        RequestProcessor rp = null;
        WebAuthentication authentication = null;
        SessionInfo info = null;

        try {
            try {
                request.setCharacterEncoding("utf-8");
                if (log.isDebugEnabled()) {
                    log.debug("content type: " + request.getContentType());
                }

                AuthToken authToken = AuthFactory.getAnonymousAuthToken();
                try {
                    authToken = AuthFactory.getAuthToken(request, response);
                } catch (UnauthorizedException uae) {
                }

                TCRequest tcRequest = HttpObjectFactory.createRequest(request);

                TCResponse tcResponse = HttpObjectFactory.createResponse(response);
                //set up security objects and session info
                authentication = createAuthentication(tcRequest, tcResponse);
                TCSubject user = getUser(authentication.getActiveUser().getId());
                info = createSessionInfo(tcRequest, authentication, user.getPrincipals());
                tcRequest.setAttribute(SESSION_INFO_KEY, info);
                //we can let browsers/proxies cache pages if the user is anonymous or it's https (they don't really cache https setuff)
                if (log.isDebugEnabled()) {
                    log.debug("uri: " + request.getRequestURL().toString());
                }
                if (!authentication.getActiveUser().isAnonymous() &&
                        !request.getRequestURL().toString().toLowerCase().startsWith("https")) {
                    if (log.isDebugEnabled()) {
                        log.debug("using an uncached response");
                    }
                    tcResponse = HttpObjectFactory.createUnCachedResponse(response);
                }
                //todo perhaps this should be configurable...so implementing classes
                //todo don't have to do it if they don't want to
                RequestTracker.trackRequest(authentication.getActiveUser(), tcRequest);

                com.jivesoftware.base.User forumUser = null;
                ForumFactory forumFactory = ForumFactory.getInstance(authToken);
                if (!authToken.isAnonymous()) {
                    forumUser = forumFactory.getUserManager().getUser(authToken.getUserID());
                }

                StringBuffer loginfo = new StringBuffer(100);
                loginfo.append("[* ");
                loginfo.append(info.getHandle());
                loginfo.append(" * ");
                loginfo.append(request.getRemoteAddr());
                loginfo.append(" * ");
                loginfo.append(request.getMethod());
                loginfo.append(" ");
                loginfo.append(info.getRequestString());
                loginfo.append(" *]");
                log.info(loginfo);

                try {
                    String cmd = StringUtils.checkNull((String) tcRequest.getAttribute(MODULE));
                    if (cmd.equals(""))
                        cmd = StringUtils.checkNull(tcRequest.getParameter(MODULE));

                    if (cmd.equals(""))
                        cmd = DEFAULT_PROCESSOR;
                    if (!isLegalCommand(cmd))
                        throw new NavigationException();

                    String processorName = getProcessor(cmd);
                    if (processorName.indexOf(".") == -1) {
                        processorName = PATH + (PATH.endsWith(".") ? "" : ".") + processorName;
                    }

                    if (log.isDebugEnabled()) {
                        log.debug("creating request processor for " + processorName);
                    }
                    try {
                        SimpleResource resource = new SimpleResource(processorName);
                        if (hasPermission(authentication, resource)) {
                            rp = callProcess(processorName, request, response, tcRequest, tcResponse, authentication, authToken, forumUser, forumFactory);
                        } else {
                            throw new PermissionException(authentication.getActiveUser(), resource);
                        }
                    } catch (ClassNotFoundException e) {
                        throw new NavigationException("Invalid request", e);
                    }
                } catch (PermissionException pe) {
                    if (log.isDebugEnabled()) {
                        log.debug("caught PermissionException");
                    }
                    if (authentication.getUser().isAnonymous()) {
                    	if (authentication instanceof TCForumsAuthentication) {
                    		handleLogin(request, response, info, ApplicationServer.SERVER_NAME);
                    	} else if (authentication instanceof StudioForumsAuthentication) {
                    		handleLogin(request, response, info, request.getServerName());
                    	}
                        return;
                    } else {
                        if (log.isDebugEnabled()) {
                            log.debug("already logged in, rethrowing");
                        }
                        throw pe;
                    }
                }
                if (!response.isCommitted()) {
                    fetchRegularPage(request, response, rp.getNextPage(), rp.isNextPageInContext());
                    return;
                }
            } catch (Throwable e) {
                handleException(request, response, e);
            }

            /* things are extremely broken, or perhaps some of the response
                * buffer had already been flushed when an error was thrown,
                * and the forward to error page failed.  in any event, make
                * one last attempt to get an error message to the browser
                */
        } catch (Throwable e) {
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

    protected void handleLogin(HttpServletRequest request, HttpServletResponse response,
    		SessionInfo info, String serverName) throws Exception {
        /* forward to the login page, with a message and a way back */
        StringBuffer nextPage = new StringBuffer("http://").append(serverName).append(LOGIN_SERVLET).
        	append("?module=").append(LOGIN_PROCESSOR);
        nextPage.append("&").append(BaseServlet.NEXT_PAGE_KEY).append("=").append(info.getRequestString());
        nextPage.append("&").append(Login.STATUS).append("=").append(Login.STATUS_START);
        fetchRegularPage(request, response, nextPage.toString(), false);

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
                                           WebAuthentication authentication, AuthToken authToken, com.jivesoftware.base.User user,
                                           ForumFactory factory) throws Exception {
        ForumsProcessor rp = null;

        rp = (ForumsProcessor) Class.forName(processorName).newInstance();
        rp.setHttpRequest(httpRequest);
        rp.setHttpResponse(httpResponse);
        rp.setRequest(request);
        rp.setResponse(response);
        rp.setAuthentication(authentication);
        rp.setAuthToken(authToken);
        rp.setUser(user);
        rp.setForumFactory(factory);
        rp.process();
        return rp;
    }

    protected SessionInfo createSessionInfo(TCRequest request,
                                            WebAuthentication auth, Set groups) throws Exception {
        CoderSessionInfo ret = null;
        ret = new CoderSessionInfo(request, auth, groups);
        return ret;
    }

    protected WebAuthentication createAuthentication(TCRequest request,
                                                     TCResponse response) throws Exception {
        Class authClass = Class.forName(AUTHENTICATION_IMPLEMENTATION);
        Constructor c = authClass.getDeclaredConstructor(
                new Class[]{Persistor.class, TCRequest.class, TCResponse.class});
        return (WebAuthentication) c.newInstance(
                new Object[]{new SessionPersistor(request.getSession()), request, response});
    }


}
