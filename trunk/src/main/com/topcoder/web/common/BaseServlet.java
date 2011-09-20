/*
 * Copyright (C) 2001-2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.common;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Set;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.topcoder.security.TCSubject;
import com.topcoder.shared.security.Authorization;
import com.topcoder.shared.security.Resource;
import com.topcoder.shared.security.SimpleResource;
import com.topcoder.shared.security.User;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.error.RequestRateExceededException;
import com.topcoder.web.common.security.BasicAuthentication;
import com.topcoder.web.common.security.SessionPersistor;
import com.topcoder.web.common.security.TCSAuthorization;
import com.topcoder.web.common.security.WebAuthentication;
import com.topcoder.web.common.throttle.Throttle;

/**
 * <p>A base implementation for TC servlets.  It should provide all the basic functionality.</p>
 *
 * <p>
 * Version 1.1 (Upload Progress Bar Assembly 1.0) Change notes:
 *   <ol>
 *     <li>Re-factored the logic for creating the request wrapper into {@link #createRequest(HttpServletRequest)} method
 *     so it could be overridden by subclasses if necessary.</li>
 *   </ol>
 * </p>
 *
 * @author Greg Paul, isv
 * @version 1.1
 */
public abstract class BaseServlet extends HttpServlet {
    protected String ERROR_PAGE = null;
    protected String MODULE = null;
    protected String PATH = null;
    protected String DEFAULT_PROCESSOR = null;
    protected String LOGIN_PROCESSOR = null;
    protected String LOGIN_SERVLET = null;
    public static final String MESSAGE_KEY = "message";
    public static final String URL_KEY = "url";
    public static final String NEXT_PAGE_KEY = "nextpage";
    public static final String SESSION_INFO_KEY = "sessionInfo";

    private final Logger log = Logger.getLogger(getClass());

    protected static final Throttle throttle = new Throttle(10, 5000);
    protected static boolean throttleEnabled = true;

    /**
     * Initializes the servlet.
     *
     * @throws javax.servlet.ServletException
     */
    public synchronized void init(ServletConfig config) throws ServletException {
        super.init(config);
        ERROR_PAGE = config.getInitParameter("error_page");
        MODULE = config.getInitParameter("module_key");
        PATH = config.getInitParameter("processor_path");
        DEFAULT_PROCESSOR = config.getInitParameter("default_processor");
        LOGIN_PROCESSOR = config.getInitParameter("login_processor");
        try {
            LOGIN_SERVLET = config.getInitParameter("login_servlet");
        } catch (Exception e) {
            //ignore and set it to be null as default
            LOGIN_SERVLET = null;
        }
        StringBuffer buf = new StringBuffer(200);
        buf.append("Servlet Initialized with the following:\n");
        buf.append(" ERROR_PAGE = ");
        buf.append(ERROR_PAGE);
        buf.append("\n");
        buf.append(" MODULE = ");
        buf.append(MODULE);
        buf.append("\n");
        buf.append(" PATH = ");
        buf.append(PATH);
        buf.append("\n");
        buf.append(" DEFAULT_PROCESSOR = ");
        buf.append(DEFAULT_PROCESSOR);
        buf.append("\n");
        buf.append(" LOGIN_PROCESSOR = ");
        buf.append(LOGIN_PROCESSOR);
        buf.append("\n");
        buf.append(" LOGIN_SERVLET = ");
        buf.append(LOGIN_SERVLET);
        log.info(buf);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        process(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        process(request, response);
    }

    protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        notAllowed(req, resp);
    }

    protected void doHead(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        notAllowed(req, resp);
    }

    protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        notAllowed(req, resp);
    }

    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if (req.getMethod().equals("GET")) doGet(req, resp);
        else if (req.getMethod().equals("POST")) doPost(req, resp);
        else if (req.getMethod().equals("DELETE")) doDelete(req, resp);
        else if (req.getMethod().equals("HEAD")) doHead(req, resp);
        else if (req.getMethod().equals("PUT")) doPut(req, resp);
        else notAllowed(req, resp);
    }

    protected void notAllowed(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        resp.setStatus(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
        resp.setContentType("text/html");
    }

    protected void process(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {
        RequestProcessor rp;
        WebAuthentication authentication;
        SessionInfo info;

        try {
            try {

                request.setCharacterEncoding("utf-8");

                TCRequest tcRequest = createRequest(request);
                TCResponse tcResponse = HttpObjectFactory.createResponse(response);

                if (throttleEnabled) {
                    if (throttle.throttle(request.getSession().getId())) {
                        authentication = createAuthentication(tcRequest, tcResponse);
                        throw new RequestRateExceededException(request.getSession().getId(),
                                authentication.getActiveUser().getUserName());
                    }
                }

                if (log.isDebugEnabled()) {
                    log.debug("content type: " + request.getContentType());
                }
                //set up security objects and session info
                authentication = createAuthentication(tcRequest, tcResponse);
                TCSubject user = getUser(authentication.getActiveUser().getId());
                info = createSessionInfo(tcRequest, authentication, user.getPrincipals());
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
                tcRequest.setAttribute(SESSION_INFO_KEY, info);
                //todo perhaps this should be configurable...so implementing classes
                //todo don't have to do it if they don't want to
                RequestTracker.trackRequest(authentication.getActiveUser(), tcRequest);

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
                    //log.debug("got module attribute " + cmd);
                    if (cmd.equals("")) {
                        cmd = StringUtils.checkNull(tcRequest.getParameter(MODULE));
                    }

                    if (cmd.equals("")) {
                        cmd = DEFAULT_PROCESSOR;
                    }
                    if (!isLegalCommand(cmd)) {
                        throw new NavigationException();
                    }

                    //log.debug("path " + PATH);
                    String processorName = getFullProcessorName(cmd);

                    if (log.isDebugEnabled()) {
                        log.debug("creating request processor for " + processorName);
                    }
                    try {
                        SimpleResource resource = new SimpleResource(processorName);
                        if (hasPermission(authentication, resource)) {
                            rp = callProcess(processorName, tcRequest, tcResponse, authentication);
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
                //if there is an exception in post processing, and we've already started writting the response
                //we're not going to be able to forward to the error page.
                rp.postProcessing();
            } catch (Throwable e) {
                handleException(request, response, e);
            }

            /* things are extremely broken, or perhaps some of the response
             * buffer had already been flushed when an error was thrown,
             * and the forward to error page failed.  in any event, make
             * one last attempt to get an error message to the browser
             */
        } catch (Exception e) {
            log.fatal("forwarding to error page failed", e);
            response.setContentType("text/html");
            response.setStatus(500);
            PrintWriter out = response.getWriter();
            out.println("<html><head><title>Internal Error</title></head>");
            out.println("<body><h4>Your request could not be processed.  Please inform TopCoder.</h4>");
            out.println("</body></html>");
            out.flush();
        }
    }

    /**
     * <p>Creates the wrapper around the specified incoming request from the client.</p>
     * 
     * @param request an <code>HttpServletRequest</code> representing incoming request. 
     * @return a <code>TCRequest</code> wrapping the specified request.
     * @since 1.1
     */
    protected TCRequest createRequest(HttpServletRequest request) {
        return HttpObjectFactory.createRequest(request);
    }

    protected String getFullProcessorName(String cmd) {
        return PATH + (PATH.endsWith(".") ? "" : ".") + getProcessor(cmd);
    }

    protected final void fetchRegularPage(HttpServletRequest request, HttpServletResponse response, String dest,
                                          boolean forward) throws Exception {

        if (forward) {
            if (!dest.startsWith("/")) {
                dest = "/" + dest;
            }
            if (log.isDebugEnabled()) {
                log.debug("forwarding to " + dest);
            }
            getServletContext().getRequestDispatcher(response.encodeURL(dest)).forward(request, response);
        } else {
            if (log.isDebugEnabled()) {
                log.debug("redirecting to " + dest);
            }
            response.sendRedirect(response.encodeRedirectURL(dest));
        }
    }


    protected RequestProcessor callProcess(String processorName, TCRequest request, TCResponse response,
                                           WebAuthentication authentication) throws Exception {
        RequestProcessor rp;

        rp = (RequestProcessor) Class.forName(processorName).newInstance();
        rp.setRequest(request);
        rp.setResponse(response);
        rp.setAuthentication(authentication);
        rp.process();
        return rp;
    }


    protected SessionInfo createSessionInfo(TCRequest request,
                                            WebAuthentication auth, Set groups) throws Exception {
        SessionInfo ret;
        ret = new SessionInfo(request, auth, groups);
        return ret;
    }

    protected WebAuthentication createAuthentication(TCRequest request,
                                                     TCResponse response) throws Exception {
        return new BasicAuthentication(new SessionPersistor(request.getSession()), request, response, BasicAuthentication.MAIN_SITE);
    }

    protected Authorization createAuthorization(User user) throws Exception {
        return new TCSAuthorization(SecurityHelper.getUserSubject(user.getId()));
    }

    protected boolean isLegalCommand(String s) {
        if (s == null) return false;
        if (s.equals("")) return false;
        char[] c = s.toCharArray();
        for (int i = 0; i < c.length; i++)
            //TODO make an init param?
            if (0 > "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz-_".indexOf(c[i]))
                return false;
        return true;
    }

    protected void handleException(HttpServletRequest request, HttpServletResponse response, Throwable e)
            throws Exception {
        if (response.isCommitted()) {
            log.error("caught exception, forwarding to error page: ",e); 
        } else {
            log.error("caught exception, forwarding to error page: " + e);
        }
        if (e instanceof PermissionException) {
            response.setStatus(HttpServletResponse.SC_FORBIDDEN);
            request.setAttribute(MESSAGE_KEY, "Sorry, you do not have permission to access the specified resource.");
        } else if (e instanceof NavigationException) {
            if (e instanceof RequestRateExceededException) {
                RequestRateExceededException rre = (RequestRateExceededException) e;
                StringBuffer buf = new StringBuffer(100);
                buf.append("session ").append(rre.getSessionId());
                buf.append("(").append(rre.getHandle()).append(")");
                buf.append(" exceeded the request rate limit.");
                log.warn(buf.toString());
            } else {
                response.setStatus(HttpServletResponse.SC_NOT_FOUND);
                if (((NavigationException) e).hasUrl())
                    request.setAttribute(URL_KEY, ((NavigationException) e).getUrl());
            }
            request.setAttribute(MESSAGE_KEY, e.getMessage());
        } else {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            request.setAttribute(MESSAGE_KEY, "An error has occurred when attempting to process your request.");
        }
        request.setAttribute("exception", e);
        fetchRegularPage(request, response, ERROR_PAGE, true);
    }

    protected String getParameter(HttpServletRequest request, String name) throws Exception {
        return request.getParameter(name);
    }

    protected boolean hasPermission(WebAuthentication auth, Resource r) throws Exception {
        return createAuthorization(auth.getActiveUser()).hasPermission(r);
    }

    protected String getProcessor(String key) {
        String ret;
        ret = getServletConfig().getInitParameter(key);
        if (ret == null) {
            ret = key;
        }
        return ret;
    }

    protected void handleLogin(HttpServletRequest request, HttpServletResponse response, SessionInfo info) throws Exception {
        if (request.getMethod().equals("POST")) {
            throw new NavigationException("Sorry, you must be logged in order to perform the specified request.");
        } else {
            /* forward to the login page, with a message and a way back */
            request.setAttribute(MESSAGE_KEY, "In order to continue, you must provide your user name " +
                    "and password.");
            if (log.isDebugEnabled()) {
                log.debug("going to " + info.getRequestString() + " on successful login");
            }
            request.setAttribute(NEXT_PAGE_KEY, info.getRequestString());

            request.setAttribute(MODULE, LOGIN_PROCESSOR);
            fetchRegularPage(request, response, LOGIN_SERVLET == null ? info.getServletPath() : LOGIN_SERVLET, true);
        }
    }

    protected TCSubject getUser(long id) throws Exception {
        return SecurityHelper.getUserSubject(id);
    }
}
