package com.topcoder.web.common;

import com.topcoder.security.TCSubject;
import com.topcoder.security.admin.PrincipalMgrRemote;
import com.topcoder.shared.distCache.CacheClient;
import com.topcoder.shared.distCache.CacheClientFactory;
import com.topcoder.shared.security.Authorization;
import com.topcoder.shared.security.Resource;
import com.topcoder.shared.security.SimpleResource;
import com.topcoder.shared.security.User;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.security.*;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Set;

/**
 * A base implementation for TC servlets.  It should provide
 * all the basic functionality.
 * @author Greg Paul
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
    public static final String USER_SUBJECT_PREFIX = "user_subject:";

    private static Logger log = Logger.getLogger(BaseServlet.class);

    /**
     * Initializes the servlet.
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
            throws IOException {
        RequestProcessor rp = null;
        WebAuthentication authentication = null;
        SessionInfo info = null;

        try {

            TCRequest tcRequest = HttpObjectFactory.createRequest(request);
            TCResponse tcResponse = HttpObjectFactory.createResponse(response);
            //set up security objects and session info
            authentication = createAuthentication(tcRequest, tcResponse);
            TCSubject user = getUser(authentication.getActiveUser().getId());
            info = createSessionInfo(tcRequest, authentication, user.getPrincipals());
            tcRequest.setAttribute(SESSION_INFO_KEY, info);
            //todo perhaps this should be configuraable...so implementing classes
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
                            rp = callProcess(processorName, tcRequest, tcResponse, authentication);
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

    protected final void fetchRegularPage(HttpServletRequest request, HttpServletResponse response, String dest,
                                          boolean forward) throws Exception {

        if (forward) {
            if (!dest.startsWith("/")) {
                dest = "/" + dest;
            }
            log.debug("forwarding to " + dest);
            getServletContext().getRequestDispatcher(response.encodeURL(dest)).forward(request, response);
        } else {
            log.debug("redirecting to " + dest);
            response.sendRedirect(response.encodeRedirectURL(dest));
        }
    }

    protected RequestProcessor callProcess(String processorName, TCRequest request, TCResponse response,
                                           WebAuthentication authentication) throws Exception {
        RequestProcessor rp = null;

        rp = (RequestProcessor) Class.forName(processorName).newInstance();
        rp.setRequest(request);
        rp.setResponse(response);
        rp.setAuthentication(authentication);
        rp.process();
        return rp;
    }


    protected SessionInfo createSessionInfo(TCRequest request,
                                            WebAuthentication auth, Set groups) throws Exception {
        SessionInfo ret = null;
        ret = new SessionInfo(request, auth, groups);
        return ret;
    }

    protected WebAuthentication createAuthentication(TCRequest request,
                                                     TCResponse response) throws Exception {
        return new BasicAuthentication(new SessionPersistor(request.getSession()), request, response, BasicAuthentication.MAIN_SITE);
    }

    /* TODO implement a cached authorization object */
    protected Authorization createAuthorization(User user) throws Exception {
        return new TCSAuthorization(user);
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

    protected void handleException(HttpServletRequest request, HttpServletResponse response, Exception e)
            throws Exception {
        log.error("caught exception, forwarding to error page", e);
        if (e instanceof PermissionException) {
            response.setStatus(HttpServletResponse.SC_FORBIDDEN);
            request.setAttribute(MESSAGE_KEY, "Sorry, you do not have permission to access the specified resource.");
        } else if (e instanceof NavigationException) {
            response.setStatus(HttpServletResponse.SC_NOT_FOUND);
            request.setAttribute(MESSAGE_KEY, e.getMessage());
            if (((NavigationException) e).hasUrl())
                request.setAttribute(URL_KEY, ((NavigationException) e).getUrl());
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
        String ret = null;
        if (ret == null) {
            ret = getServletConfig().getInitParameter(key);
        }
        if (ret == null) {
            ret = key;
        }
        return ret;
    }

    protected void handleLogin(HttpServletRequest request, HttpServletResponse response, SessionInfo info) throws Exception {
        /* forward to the login page, with a message and a way back */
        request.setAttribute(MESSAGE_KEY, "In order to continue, you must provide your user name " +
                "and password.");
        log.debug("going to " + info.getRequestString() + " on success login");
        request.setAttribute(NEXT_PAGE_KEY, info.getRequestString());

        request.setAttribute(MODULE, LOGIN_PROCESSOR);
        fetchRegularPage(request, response, LOGIN_SERVLET == null ? info.getServletPath() : LOGIN_SERVLET, true);
    }

    protected TCSubject getUser(long id) throws Exception {
        TCSubject user = null;

        StringBuffer buf = new StringBuffer(40);
        buf.append(USER_SUBJECT_PREFIX);
        buf.append(id);

        CacheClient cc = null;
        boolean hasCacheConnection = true;
        try {
            cc = CacheClientFactory.createCacheClient();
            user = (TCSubject) (cc.get(buf.toString()));
        } catch (Exception e) {
            log.error("UNABLE TO ESTABLISH A CONNECTION TO THE CACHE: " + e.getMessage());
            hasCacheConnection = false;
        }
        if (user == null) {
            PrincipalMgrRemote pmgr = (PrincipalMgrRemote) Constants.createEJB(PrincipalMgrRemote.class);
            user = pmgr.getUserSubject(id);
            try {
                if (hasCacheConnection) {
                    cc.set(buf.toString(), user, 30 * 60 * 1000);
                } else {
                    log.error("UNABLE TO ESTABLISH A CONNECTION TO THE CACHE: ");
                }
            } catch (Exception e) {
                log.error("UNABLE TO ESTABLISH A CONNECTION TO THE CACHE: " + e.getMessage());
            }
        }
        return user;
    }
}
