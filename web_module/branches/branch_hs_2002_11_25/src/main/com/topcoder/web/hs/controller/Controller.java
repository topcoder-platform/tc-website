package com.topcoder.web.hs.controller;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import com.topcoder.web.common.RequestProcessor;

/**
 * All requests to the HS website pass through this servlet.
 * It creates a RequestProcessor based on the query part of the URI, which
 * then selects another servlet to which the request should be passed.
 *
 * @author Greg Paul, Ambrose Feinstein
 * @version $Revision$
 */
public final class Controller extends HttpServlet {

    public synchronized void init(ServletConfig config) throws ServletException {
        super.init(config);
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
//@@@ debug things here to clean up later
                //System.out.println("request.getContextPath()="+request.getContextPath());
                //System.out.println("request.getServletPath()="+request.getServletPath());

                String query = request.getQueryString();
                System.out.println("query \"" + query + "\" from host " + request.getRemoteHost());

                String cmd = checkNull(request.getParameter("module"));
                System.out.println("cmd="+cmd);

                /* one way of making empty requests end up at the front page */
                if(cmd.equals("")) cmd = "Static";

                if(!isLegal(cmd)) throw new IllegalArgumentException("invalid command: "+cmd);

                rp = (RequestProcessor)Class.forName("com.topcoder.web.hs.controller.requests."+cmd).newInstance();
                rp.setRequest(request);
                rp.process();

            } catch(Exception e) {

                /* try to forward to the error page */
                request.setAttribute("exception", e);
                rp = new com.topcoder.web.hs.controller.requests.Error();
                rp.setRequest(request);
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

    private static String checkNull(String s) {
        return s==null?"":s;
    }

    private static boolean isLegal(String s) {
        if(s==null) return false;
        if(s.equals("")) return false;
        char[] c = s.toCharArray();
        for(int i=0; i<c.length; i++)
            if(0 > "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz-_".indexOf(c[i]))
                return false;
        return true;
    }
}
