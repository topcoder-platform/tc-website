package com.topcoder.web.hs.controller;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import com.topcoder.shared.security.*;
import com.topcoder.web.common.*;
import com.topcoder.web.hs.common.*;
import com.topcoder.web.common.security.*;
import com.topcoder.web.hs.controller.requests.*;
import com.topcoder.shared.util.logging.Logger;

/**
 * All requests to the HS website pass through this servlet.
 * It creates a RequestProcessor based on the query part of the URI, which
 * then selects another servlet to which the request should be passed.
 *
 * @author Greg Paul, Ambrose Feinstein
 * @version $Revision$
 */
public final class Controller extends HttpServlet {

    private static Logger log = Logger.getLogger(Controller.class);

    /**
     * Initializes the servlet.
     * @throws ServletException
     */
    public synchronized void init(ServletConfig config) throws ServletException {
        super.init(config);
        Constants.init(getServletConfig());
    }

    public final void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        /* for exceptions we surely cannot correct */
        try {
            RequestProcessor rp;

            log.info("    "+request.getMethod()+" from "+request.getRemoteHost());
            log.info("--- "+HttpUtils.getRequestURL(request));

            String canonpath = request.getContextPath() + request.getServletPath();
            log.debug("canonical path to servlet = "+canonpath);
            String query = request.getQueryString();
            String qtail = (query==null) ? ("") : ("?"+query);
            log.debug("query from URL of request = "+qtail);

            /* and those we perhaps can */
            try {

                /* if im not being called by my right name, correct the client asap! */
                if(!canonpath.equals(request.getRequestURI())) {

                    String ref = request.getHeader("Referer");
                    if(ref!=null) log.warn("mangled servlet path in request linked from page "+ref);

                    /* trying to redirect a post will probably not improve the situation
                     * if we got this far, though, so only take evasive action on gets.
                     */
                    if(request.getMethod().equals("GET")) {
                        log.info("dispensing with request by redirecting to proper servlet name");
                        response.sendRedirect(response.encodeRedirectURL(canonpath+qtail));
                        return;
                    }
                }

                String cmd = Constants.checkNull(request.getParameter("module"));
                if(cmd.equals("")) cmd = "Home";
                if(!Constants.isLegal(cmd)) throw new NavigationException("invalid command: "+cmd);
                cmd = "com.topcoder.web.hs.controller.requests."+cmd;

                log.debug("creating request processor of class "+cmd);
                rp = (RequestProcessor)Class.forName(cmd).newInstance();
                callProcess(rp, request, response);

            } catch(PermissionException e) {  //@@@ any way i can put this elsewhere?  in Error?
                log.info("caught PermissionException", e);

//@@@  would like to handle this differently if they are already logged in
//@@@  nest this catch in a deeper try i think

                /* forward to the login page, with a message and a way back */

                request.setAttribute("message", e.getMessage());
                request.setAttribute("nextpage", canonpath + qtail);

                rp = new Login();
                callProcess(rp, request, response);

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
            out.println("Exception encountered:<br><pre>");
            e.printStackTrace(out);
            out.println("</pre></body></html>");
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
