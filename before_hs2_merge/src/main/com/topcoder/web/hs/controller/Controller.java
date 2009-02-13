package com.topcoder.web.hs.controller;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import com.topcoder.shared.security.*;
import com.topcoder.web.common.*;
import com.topcoder.web.hs.common.*;
import com.topcoder.web.common.security.*;
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

        /* for exceptions we surely cannot correct */
        try {
            RequestProcessor rp;

            log.info(request.getMethod()+" "+HttpUtils.getRequestURL(request)+" from "+request.getRemoteHost());

            String canonpath = request.getContextPath() + request.getServletPath();
            log.debug("canonical path to servlet = "+canonpath);
            String query = request.getQueryString();
            String qtail = (query==null) ? ("") : ("?"+query);
            log.debug("query from URL of request = "+qtail);

            /* and those we perhaps can */
            try {

                /* and finally for PermissionExceptions only */
                try {

                    String cmd = Constants.checkNull(request.getParameter("module"));
                    if(cmd.equals("")) cmd = "Home";
                    if(!Constants.isLegal(cmd)) throw new NavigationException("invalid command: "+cmd);
                    cmd = "com.topcoder.web.hs.controller.requests."+cmd;

                    log.debug("creating request processor of class "+cmd);
                    try {
                        rp = (RequestProcessor)Class.forName(cmd).newInstance();
                    } catch(Exception e) {
                        log.debug("calling Class.forName()", e);
                        throw new NavigationException("no such module");
                    }
                    callProcess(rp, request, response);

                } catch(PermissionException pe) {
                    log.info("caught PermissionException");  // no stack trace to the logs

                    if(pe.getUser()!=null && !pe.getUser().isAnonymous()) {
                        log.info("already logged in, rethrowing");
                        throw pe;
                    }

                    /* forward to the login page, with a message and a way back */
                    request.setAttribute("message", "You must login to view this page.");
                    request.setAttribute("nextpage", canonpath + qtail);

                    rp = new com.topcoder.web.hs.controller.requests.Login();
                    callProcess(rp, request, response);
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
                callProcess(rp, request, response);
            }

            if(rp.isNextPageInContext()) {
                getServletContext().getRequestDispatcher(response.encodeURL(rp.getNextPage())).forward(request, response);
            } else {
                response.sendRedirect(response.encodeRedirectURL(rp.getNextPage()));
            }

        /* things are extremely broken, make one last attempt to get an error message to the logs and browser */
        } catch(Exception e) {
            log.fatal("forwarding to error page failed", e);

            response.setStatus(500);
            PrintWriter out = response.getWriter();
            out.println("<html><head><title>Internal Error</title></head>");
            out.println("<body><h3>Error: "+e.getMessage()+"</h3>");
            out.println("</body></html>");
            out.flush();
        }
    }

    /** invoke the given RequestProcessor */
    private void callProcess(RequestProcessor rp, HttpServletRequest request, HttpServletResponse response) throws Exception {
        Persistor persistor = new SessionPersistor(request.getSession());
        WebAuthentication auth = new BasicAuthentication(persistor, request, response);

        rp.setRequest(request);
        rp.setAuthentication(auth);
        rp.process();
    }
}
