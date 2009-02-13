package com.topcoder.web.hs.controller;

import java.io.*;
import java.lang.reflect.Method;
import javax.servlet.*;
import javax.servlet.http.*;
import com.topcoder.shared.security.*;
import com.topcoder.web.hs.common.Constants;
import com.topcoder.web.common.security.*;
import com.topcoder.web.common.RequestProcessor;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.PermissionException;
import com.topcoder.shared.util.logging.Logger;

/**
 * All requests to the HS website pass through this servlet.
 * It creates a RequestProcessor based on the query part of the URI, which
 * then selects another servlet to which the request should be passed.
 *
 * @author Greg Paul, Ambrose Feinstein
 * @version $Revision$
 */
public class Controller extends HttpServlet {

    private static Logger log = Logger.getLogger(Controller.class);
    private WebAuthentication auth = null;

    /**
     * Initializes the servlet.
     * @throws ServletException
     */
    public synchronized void init(ServletConfig config) throws ServletException {
        super.init(config);
        Constants.init(getServletConfig());
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Persistor persistor = null;

        /* for exceptions we surely cannot correct */
        try {
            persistor = new SessionPersistor(request.getSession());
            auth = new BasicAuthentication(persistor, request, response, BasicAuthentication.HS_SITE);

            RequestProcessor rp;

            String canonpath = request.getContextPath() + request.getServletPath();

            /* we need this in the login form, since we require an absolute path for https but lose it from forwarding to a jsp */
            request.setAttribute("canonpath", canonpath);

            String query = request.getQueryString();
            String qtail = (query==null) ? ("") : ("?"+query);

            StringBuffer loginfo = new StringBuffer(100);
            loginfo.append("[**** ");
            loginfo.append(auth.getActiveUser().getUserName());
            loginfo.append(" **** ");
            loginfo.append(request.getRemoteHost());
            loginfo.append(" **** ");
            loginfo.append(request.getMethod());
            loginfo.append(" ");
            loginfo.append(HttpUtils.getRequestURL(request).toString());
            loginfo.append(qtail);
            loginfo.append(" ****]");
            log.info(loginfo);

            /* and those we perhaps can */
            try {

                /* and finally for PermissionExceptions only */
                try {

                    String cmd = Constants.checkNull(request.getParameter("module"));
                    if(cmd.equals("")) cmd = "Home";
                    if(!Constants.isLegal(cmd)) throw new NavigationException();
                    cmd = "com.topcoder.web.hs.controller.requests."+cmd;

                    log.debug("creating request processor of class "+cmd);
                    try {
                        rp = (RequestProcessor)Class.forName(cmd).newInstance();
                    } catch(Exception e) {
                        log.debug("calling Class.forName()", e);
                        throw new NavigationException();
                    }
                    callProcess(rp, request);

                } catch(PermissionException pe) {
                    log.debug("caught PermissionException");  // no stack trace to the logs

                    if(pe.getUser()!=null && !pe.getUser().isAnonymous()) {
                        log.info("already logged in, rethrowing");
                        throw pe;
                    }

                    /* forward to the login page, with a message and a way back */
                    request.setAttribute("message", "You must login to view this page.");
                    request.setAttribute("nextpage", HttpUtils.getRequestURL(request) + qtail);

                    rp = new com.topcoder.web.hs.controller.requests.Login();
                    callProcess(rp, request);
                }

                /* try this once here and hopefully display a pretty error if it fails */
                if(rp.isNextPageInContext()) {
                    getServletContext().getRequestDispatcher(response.encodeURL(rp.getNextPage())).forward(request, response);
                } else {
                    response.sendRedirect(response.encodeRedirectURL(rp.getNextPage()));
                }
                return;  /* all done if we can get here */

            } catch(Exception e) {
                log.error("caught exception, forwarding to error page", e);

                request.setAttribute("exception", e);

                rp = new com.topcoder.web.hs.controller.requests.Error();
                callProcess(rp, request);
            }

            /* only reporting errors at this point */

            if(rp.isNextPageInContext()) {
                getServletContext().getRequestDispatcher(response.encodeURL(rp.getNextPage())).forward(request, response);
            } else {
                response.sendRedirect(response.encodeRedirectURL(rp.getNextPage()));
            }

        /* things are extremely broken, or perhaps some of the response
         * buffer had already been flushed when an error was thrown,
         * and the forward to error page failed.  in any event, make
         * one last attempt to get an error message to the browser
         */
        } catch(Exception e) {
            log.fatal("forwarding to error page failed", e);

            response.setStatus(500);
            PrintWriter out = response.getWriter();
            out.println("<html><head><title>Internal Error</title></head>");
            out.println("<body><h4>Your request could not be processed.  Please inform TopCoder.</h4>");
            out.println("</body></html>");
            out.flush();
        }
    }

    /** invoke the given RequestProcessor */
    private void callProcess(RequestProcessor rp, HttpServletRequest request) throws Exception {
        rp.setRequest(request);
        rp.setAuthentication(auth);
        rp.process();
    }
}
