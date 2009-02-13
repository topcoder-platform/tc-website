package com.topcoder.web.common;

import com.topcoder.shared.util.logging.Logger;
import com.topcoder.shared.security.Authorization;
import com.topcoder.shared.security.User;
import com.topcoder.shared.security.SimpleResource;
import com.topcoder.web.common.security.*;
import com.topcoder.security.TCSubject;
import com.topcoder.security.admin.PrincipalMgrRemote;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Set;

/**
 * A base implementation for TC servlets.  It should provide
 * all the basic functionality.
 * @author Greg Paul
 */
public abstract class BaseServlet extends HttpServlet {
    private static String ERROR_PAGE = null;
    private static String MODULE = null;
    private static String PATH = null;
    private static String DEFAULT_PROCESSOR = null;
    private static String LOGIN_PROCESSOR = null;
    public static final String MESSAGE_KEY = "message";
    public static final String NEXT_PAGE_KEY = "nextpage";

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
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        RequestProcessor rp = null;
        WebAuthentication authentication = null;
        Authorization authorization = null;
        SessionInfo info = null;

        try {
            //set up security objects and session info
            authentication = createAuthentication(request, response);
            PrincipalMgrRemote pmgr = (PrincipalMgrRemote) Constants.createEJB(PrincipalMgrRemote.class);
            TCSubject user = pmgr.getUserSubject(authentication.getActiveUser().getId());
            info = createSessionInfo(request, authentication, user.getPrincipals());
            request.setAttribute("SessionInformation", info);
            authorization = createAuthorization(authentication.getActiveUser());

            StringBuffer loginfo = new StringBuffer(100);
            loginfo.append("[**** ");
            loginfo.append(info.getHandle());
            loginfo.append(" **** ");
            loginfo.append(request.getRemoteHost());
            loginfo.append(" **** ");
            loginfo.append(request.getMethod());
            loginfo.append(" ");
            loginfo.append(info.getRequestString());
            loginfo.append(" ****]");
            log.info(loginfo);

            try {
                try {
                    String cmd = StringUtils.checkNull(request.getParameter(MODULE));
                    if (cmd.equals(""))
                        cmd = StringUtils.checkNull((String) request.getAttribute(MODULE));
                    if (cmd.equals(""))
                        cmd = DEFAULT_PROCESSOR;
                    if (!isLegalCommand(cmd))
                        throw new NavigationException("Invalid module in request: " + cmd);

                    String processorName = PATH + (PATH.endsWith(".")?"":".") + cmd;

                    log.debug("creating request processor for " + processorName);
                    try {
                        SimpleResource resource = new SimpleResource(processorName);
                        if (authorization.hasPermission(resource)) {
                            rp = callProcess(processorName, request, authentication);
                        } else {
                            throw new PermissionException(authentication.getActiveUser(), resource);
                        }
                    } catch (ClassNotFoundException e) {
                        throw new NavigationException(e);
                    }
                } catch (PermissionException pe) {
                    if (pe.getUser() != null && !pe.getUser().isAnonymous()) {
                        log.info("already logged in, rethrowing");
                        throw pe;
                    } else {
                        /* forward to the login page, with a message and a way back */
                        request.setAttribute(MESSAGE_KEY, "In order to continue, you must provide your user name " +
                                "and password.");
                        request.setAttribute(NEXT_PAGE_KEY, info.getRequestString());

                        request.setAttribute(MODULE, LOGIN_PROCESSOR);
                        /* forward to self */
                        fetchRegularPage(request, response, info.getServletPath(), true);
                        return;
                    }
                }
                fetchRegularPage(request, response, rp.getNextPage(), rp.isNextPageInContext());
                return;
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

            response.setStatus(500);
            PrintWriter out = response.getWriter();
            out.println("<html><head><title>Internal Error</title></head>");
            out.println("<body><h4>Your request could not be processed.  Please inform TopCoder.</h4>");
            out.println("</body></html>");
            out.flush();
        }
    }

    private void fetchRegularPage(HttpServletRequest request, HttpServletResponse response, String dest,
                                  boolean forward) throws Exception {
        log.debug((forward ? "forwarding" : "redirecting") + " to " + dest);

        String contextPrefix = request.getContextPath();
        boolean startsWithContextPath = dest.startsWith(contextPrefix);
        if (forward) {
            // forwarded pages *must not* contain servlet context path
            if (startsWithContextPath) {
                dest = dest.substring(contextPrefix.length());
            }
            getServletContext().getRequestDispatcher(response.encodeURL(dest)).forward(request, response);
        } else {
            response.sendRedirect(response.encodeRedirectURL(dest));
        }
    }

    protected RequestProcessor callProcess(String processorName, HttpServletRequest request,
                                           WebAuthentication authentication) throws Exception {
        RequestProcessor rp = null;

        rp = (RequestProcessor) Class.forName(processorName).newInstance();
        rp.setRequest(request);
        rp.setAuthentication(authentication);
        rp.process();
        return rp;
    }


    protected SessionInfo createSessionInfo(HttpServletRequest request,
                                            WebAuthentication auth, Set groups) throws Exception {
        SessionInfo ret = null;
        ret = new SessionInfo(request, auth, groups);
        return ret;
    }

    protected WebAuthentication createAuthentication(HttpServletRequest request,
                                                     HttpServletResponse response) throws Exception {
        return new BasicAuthentication(new SessionPersistor(request.getSession()), request, response);
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
            if (0 > "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz-_".indexOf(c[i]))
                return false;
        return true;
    }

    protected void handleException(HttpServletRequest request, HttpServletResponse response, Exception e)
            throws Exception {
        log.error("caught exception, forwarding to error page", e);
        if (e instanceof PermissionException) {
            request.setAttribute(MESSAGE_KEY, "Sorry, you do not have permission to access the specified resource.");
        } else if (e instanceof NavigationException) {
            request.setAttribute(MESSAGE_KEY, e.getMessage());
        } else {
            request.setAttribute(MESSAGE_KEY, "An eror has occurred when attempting to processor you request.");
        }
        request.setAttribute("exception", e);
        fetchRegularPage(request, response, ERROR_PAGE, true);
    }

}
