package com.topcoder.web.hs.controller;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.util.*;
import com.topcoder.web.hs.controller.requests.*;

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
        try {
            System.out.println("request.getContextPath()="+request.getContextPath());
            System.out.println("request.getServletPath()="+request.getServletPath());
            System.out.println("query \"" + request.getQueryString() + "\" from host " + request.getRemoteHost());

            String cmd = checkNull(request.getParameter("c"));
            System.out.println("cmd="+cmd);

            if(!isLegal(cmd)) throw new IllegalArgumentException("invalid command: "+cmd);

            RequestProcessor rp = (RequestProcessor) Class.forName("com.topcoder.web.hs.controller.requests."+cmd).newInstance();
            rp.setRequest(request);
            rp.process();

            if(rp.isNextPageInContext()) {
                getServletContext().getRequestDispatcher(response.encodeURL(rp.getNextPage())).forward(request, response);
            } else {
                response.sendRedirect(response.encodeRedirectURL(rp.getNextPage()));
            }

        } catch (Exception e) {
            PrintWriter out = response.getWriter();
            out.println("<pre>");
            e.printStackTrace(out);
            out.println("</pre>");
            //@@@response.flushBuffer();
        }
    }

    private String checkNull(String s) {
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
