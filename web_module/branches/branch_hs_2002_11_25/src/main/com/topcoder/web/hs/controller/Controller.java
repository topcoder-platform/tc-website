package com.topcoder.web.hs.controller;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import com.topcoder.web.common.*;
import com.topcoder.web.hs.common.*;

/**
 * All requests to the HS website pass through this servlet.
 * It creates a RequestProcessor based on the query part of the URI, which
 * then selects another servlet to which the request should be passed.
 *
 * @author Greg Paul, Ambrose Feinstein
 * @version $Revision$
 */
public final class Controller extends HttpServlet {

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

            System.out.println();
            System.out.println("    "+request.getMethod()+" from "+request.getRemoteHost());
            System.out.println("--- "+HttpUtils.getRequestURL(request));

            String canonpath = request.getContextPath() + request.getServletPath();
            String query = request.getQueryString();
            String qtail = (query==null) ? ("") : ("?"+query);

            /* and those we perhaps can */
            try {

                /* if im not being called by my right name, correct the client asap! */
                if(!canonpath.equals(request.getRequestURI())) {

                    String ref = request.getHeader("Referer");
                    if(ref!=null) System.out.println("mangled request linked from "+ref);  //@@@ definitely make this a log

                    /* trying to redirect a post will probably not improve the situation
                     * if we got this far, though, so only take evasive action on gets.
                     */
                    if(request.getMethod().equals("GET")) {
                        response.sendRedirect(response.encodeRedirectURL(canonpath+qtail));
                        return;
                    }
                }

                String cmd = Constants.checkNull(request.getParameter("module"));
                if(cmd.equals("")) cmd = "Home";
                if(!Constants.isLegal(cmd)) throw new NavigationException("invalid command: "+cmd);
                cmd = "com.topcoder.web.hs.controller.requests."+cmd;

                rp = (RequestProcessor)Class.forName(cmd).newInstance();
                rp.setRequest(request);
                rp.setResponse(response);
                rp.process();

            } catch(com.topcoder.shared.security.PermissionException e) {  //@@@ any way i can put this elsewhere?  in Error?

                /* forward to the login page, with a message and a way back */
                request.setAttribute("message", e.getMessage());
                request.setAttribute("nextpage", canonpath + qtail);
                rp = new com.topcoder.web.hs.controller.requests.Login();
                rp.setRequest(request);
                rp.setResponse(response);
                rp.process();

            } catch(Exception e) {

                e.printStackTrace();

                /* try to forward to the error page */
                request.setAttribute("exception", e);
                rp = new com.topcoder.web.hs.controller.requests.Error();
                rp.setRequest(request);
                rp.setResponse(response);
                rp.process();
            }

            if(rp.isNextPageInContext()) {
                getServletContext().getRequestDispatcher(response.encodeURL(rp.getNextPage())).forward(request, response);
            } else {
                response.sendRedirect(response.encodeRedirectURL(rp.getNextPage()));
            }

        /* things are extremely broken, make one last attempt to get an error message to the logs and browser */
        } catch(Exception e) {
            e.printStackTrace();
            response.setStatus(500);
            PrintWriter out = response.getWriter();
            out.println("<html><head><title>Internal Error</title></head>");
            out.println("Exception encountered:<br><pre>");
            e.printStackTrace(out);
            out.println("</pre></body></html>");
        }
    }
}
