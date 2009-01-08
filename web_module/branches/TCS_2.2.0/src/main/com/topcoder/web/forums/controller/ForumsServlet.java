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
import com.topcoder.shared.util.TCContext;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.*;
import com.topcoder.web.common.error.RequestRateExceededException;
import com.topcoder.web.common.security.SessionPersistor;
import com.topcoder.web.common.security.WebAuthentication;
import com.topcoder.web.ejb.forums.ForumsLocal;
import com.topcoder.web.ejb.forums.ForumsLocalHome;
import com.topcoder.web.forums.controller.request.ForumsProcessor;

import javax.naming.Context;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.Constructor;

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

        // Delete orphaned attachments daily
        Thread tOrphaned = new Thread() {
            public void run() {
                while (true) {
                    try {
                        log.info("Deleting orphaned attachments...");
                        ForumsLocal forumsBean = getForumsBean();
                        if (forumsBean != null) {
                            forumsBean.deleteOrphanedAttachments();
                        } else {
                            log.error("Could not delete orphaned attachments: forumsBean is null");
                        }
                        sleep(86400000);
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                }
            }
        };
        tOrphaned.start();

        // Convert software group permissions into user permissions - pages load slowly for users 
        // who are in many permission groups. When this is fixed (probably by Jive), the user permissions
        // can be converted back into group permissions, and this thread can be removed.
        Thread tConvertTCSPerms = new Thread() {
            public void run() {
                while (true) {
                    try {
                        log.info("Converting software group permissions into user permissions...");
                        ForumsLocal forumsBean = getForumsBean();
                        if (forumsBean != null) {
                            forumsBean.convertTCSPerms();
                        } else {
                            log.error("Could not convert software group permissions: forumsBean is null");
                        }
                        sleep(86400000);
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                }
            }
        };
        tConvertTCSPerms.start();
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

                if (throttleEnabled) {
                    if (throttle.throttle(request.getSession().getId())) {
                        authentication = createAuthentication(tcRequest, tcResponse);
                        throw new RequestRateExceededException(request.getSession().getId(),
                                authentication.getActiveUser().getUserName());
                    }
                }

                //set up security objects and session info
                authentication = createAuthentication(tcRequest, tcResponse);
                TCSubject user = getUser(authentication.getActiveUser().getId());
                info = createSessionInfo(tcRequest, authentication, user.getPrincipals());
                tcRequest.setAttribute(SESSION_INFO_KEY, info);

                //we can let browsers/proxies cache pages if the user is anonymous or it's https (they don't really cache https setuff)
                if (!authentication.getActiveUser().isAnonymous() &&
                        !request.getRequestURL().toString().toLowerCase().startsWith("https")) {
                    log.debug("using an uncached response");
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
                    if (authentication.getUser().isAnonymous()) {
                        log.info(info.getHandle() + " does not have access to " + pe.getResource().getName() + " sending to login");
                        handleLogin(request, response, info);
                        return;
                    } else {
                        log.info(info.getHandle() + " does not have access to " + pe.getResource().getName() + " sending to error");
                        throw pe;
                    }
                }
                if (!response.isCommitted()) {
                    fetchRegularPage(request, response, rp.getNextPage(), rp.isNextPageInContext());
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


    protected RequestProcessor callProcess(String processorName, HttpServletRequest httpRequest,
                                           HttpServletResponse httpResponse, TCRequest request, TCResponse response,
                                           WebAuthentication authentication, AuthToken authToken, com.jivesoftware.base.User user,
                                           ForumFactory factory) throws Exception {
        ForumsProcessor rp = null;

        rp = (ForumsProcessor) Class.forName(processorName).newInstance();
        rp.setRequest(request);
        rp.setResponse(response);
        rp.setAuthentication(authentication);
        rp.setAuthToken(authToken);
        rp.setUser(user);
        rp.setForumFactory(factory);
        rp.process();
        return rp;
    }

    protected WebAuthentication createAuthentication(TCRequest request,
                                                     TCResponse response) throws Exception {
        Class authClass = Class.forName(AUTHENTICATION_IMPLEMENTATION);
        Constructor c = authClass.getDeclaredConstructor(
                new Class[]{Persistor.class, TCRequest.class, TCResponse.class});
        return (WebAuthentication) c.newInstance(
                new Object[]{new SessionPersistor(request.getSession()), request, response});
    }

    private ForumsLocal getForumsBean() {
        ForumsLocal forumsBean = null;
        try {
            Context context = TCContext.getInitial();
            ForumsLocalHome forumsLocalHome = (ForumsLocalHome) context.lookup(ForumsLocalHome.EJB_REF_NAME);
            forumsBean = forumsLocalHome.create();
        } catch (Exception e) {
            log.error(e);
        }
        return forumsBean;
    }
}