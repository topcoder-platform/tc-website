package com.topcoder.web.screening.controller;

import java.io.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;

import com.topcoder.shared.security.*;
import com.topcoder.web.common.*;
import com.topcoder.web.common.security.*;

/**
 * This class handles all incoming requests.
 * Utilizes similar methods and format to Controller in com.topcoder.web.query.
 * rehashed from Greg Paul with permission.
 *
 * @author Nathaniel Dean
 * @date 27-Dec-2002
 * @version 1.0.1
 *
 * History:
 * version 1.0.0 -- 27-Dec-2002 -- created.
 * version 1.0.1 -- 27-Dec-2002 -- looks up constant changes in web.xml upon initialization.
 * version 1.0.2 -- 29-Dec-2002 -- fixed RequestProcessor usage. - Porgery
 * version 1.0.3 -- 02-Jan-2003 -- fixed RequestProcessor usage again :). - Porgery
 */
 
public class MainServlet
    extends HttpServlet {
        //defaults seeded for missing config params in web.xml
    static String ERROR_PAGE         = "errorPage.jsp";
    static String PROCESSORS_PACKAGE = "com.topcoder.web.screening.request";
    static String PROCESSORS_PARAM   = "rp";

    /**
     * Init() is run the moment that the servlet is loaded into the web server.
     * Initializes the static variables.
     * 
     * @throws ServletException
     */
    public void init() throws ServletException {
        if(getServletConfig().getInitParameter("error_page")!=null)
            ERROR_PAGE = getServletConfig().getInitParameter("error_page");
        if(getServletConfig().getInitParameter("processors_package")!=null)
            PROCESSORS_PACKAGE = getServletConfig().getInitParameter("processors_package");
        if(getServletConfig().getInitParameter("processors_param")!=null)
            PROCESSORS_PARAM = getServletConfig().getInitParameter("processors_param");
    }

    /**
     * all GET requests are redirected to the doPost handler, and POST should always be used anyway.
     * 
     * @param request 
     * @param response 
     * @throws ServletException
     * @throws IOException
     */
    public void doGet(HttpServletRequest request, HttpServletResponse response)
               throws ServletException, IOException {
        doPost(request, response);
    }

    /**
     * This method takes the request and locates the appropriate RequestProcessor,
     * instantiates it, and then creates a forward call to the view (JSPs).
     * 
     * @param request 
     * @param response
     * @throws ServletException 
     * @throws IOException 
     * @throws Exception 
     */
    public void doPost(HttpServletRequest request, HttpServletResponse response)
                throws ServletException, IOException {
        try {
            String proc_param = request.getParameter(PROCESSORS_PARAM);

            if (proc_param == null || proc_param.length() == 0)
                throw new Exception("No Request Processor Set.");
            if (!isLegal(proc_param))
                throw new Exception("Request Processor in illegal format.");
            Class            proc_class = Class.forName(PROCESSORS_PACKAGE+proc_param);
            RequestProcessor rp = (RequestProcessor)proc_class.newInstance();

            Persistor p = new SessionPersistor(request.getSession());
            Authentication auth = new BasicAuthentication(p, request, response);
            
            rp.setRequest(request);
            rp.setAuthentication(auth);
            rp.process();
            String wherenow = request.getContextPath() + rp.getNextPage();
            boolean forward = rp.isNextPageInContext();

            sendToPage(request, response, wherenow, forward);
        } catch (Exception e) {
            sendToErrorPage(request, response, e);
        }
    }

    /**
     * this function actually handles the redirect/forward, as dictated by the request processor
     * 
     * @param request 
     * @param response 
     * @param page where to redirect/forward
     * @param forward true==forward, false==redirect
     * @throws ServletException 
     * @throws IOException 
     */
    private void sendToPage(HttpServletRequest request, HttpServletResponse response, String page, 
                            boolean forward)
                     throws ServletException, IOException {
        if (forward) {
            getServletContext().getRequestDispatcher(response.encodeURL(page)).forward(request, response);
        } else {
            response.sendRedirect(response.encodeRedirectURL(page));
        }
    }

    /**
     * If an error occurs, redirects to an error-handling jsp (called error.jsp for a default).
     * 
     * @param request 
     * @param response 
     * @param exception exception thrown during request processing.
     * @throws ServletException
     * @throws IOException
     */
    private void sendToErrorPage(HttpServletRequest request, HttpServletResponse response, 
                                 Throwable exception)
                          throws ServletException, IOException {
        request.setAttribute("exception", exception);
        sendToPage(request, response, request.getContextPath() + ERROR_PAGE, true);
    }

    /**
     * Basic function to assure legality of request parameters
     * 
     * @param s String to check
     * @return true==string is okay, false==string is bad
     */
    private static boolean isLegal(String s) {
        for (int i = 0; i < s.length(); i++) {
            char ch = s.charAt(i);

            if ("0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ_".indexOf(ch) < 0) {
                return false;
            }
        }
        return true;
    }
}
