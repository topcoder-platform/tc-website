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

        /* once for things we can handle, and once for things we can't */
        try {
            RequestProcessor rp;
            try {

System.out.println("getRemoteHost() = "+request.getRemoteHost());
System.out.println("getMethod() = "+request.getMethod());
System.out.println("getProtocol() = "+request.getProtocol());

System.out.println("getRequestURI() = "+request.getRequestURI());
System.out.println("getRequestURL() = "+HttpUtils.getRequestURL(request));

System.out.println("getContextPath() = "+request.getContextPath());
System.out.println("getServletPath() = "+request.getServletPath());
System.out.println("getPathInfo() = "+request.getPathInfo());
System.out.println("getPathTranslated() = "+request.getPathTranslated());
System.out.println("getQueryString() = "+request.getQueryString());

                String query = request.getQueryString();
                System.out.println("query \"" + query + "\" from host " + request.getRemoteHost());

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
                String nextpage = request.getContextPath()+request.getServletPath();
                if(request.getQueryString() != null)
                    nextpage += "?"+request.getQueryString();
                request.setAttribute("nextpage", nextpage);
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
