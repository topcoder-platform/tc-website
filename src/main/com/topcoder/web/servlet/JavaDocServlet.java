package com.topcoder.web.servlet;

import com.topcoder.shared.util.logging.Logger;
import com.topcoder.shared.util.TCContext;
import com.topcoder.shared.util.ApplicationServer;
import com.topcoder.ejb.AuthenticationServices.*;
import com.topcoder.ejb.Util.*;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.naming.InitialContext;
import java.awt.*;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Iterator;
import java.util.Map;

/**
 * A servlet to get java docs from the ProblemServicesBean.
 *
 * @author Tim Bulat
 */

public final class JavaDocServlet extends HttpServlet {

    private static Logger log = Logger.getLogger(ResponseServlet.class);
    private static final String ERROR_PAGE = "/errorPage.jsp";
    private static final String WEB_SERVICE_NAME = "webServiceName";
    private static final String PATH = "path";

    public synchronized void init(ServletConfig config) throws ServletException {
        log.debug("SERVLET INIT CALLED");
        super.init(config);
    }

    public final void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        log.debug("get");
        process(request, response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        log.debug("post");
        process(request, response);
    }

    public void process(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        StringBuffer out = new StringBuffer();
        out.append("<html><body>");

        String webServiceName = request.getParameter(WEB_SERVICE_NAME);
        String path = request.getParameter(PATH);
        if(path == null || path.length() == 0) {
            path = "index.html";
        }
        out.append("webServiceName = " + webServiceName + "<br>");
        out.append("path = " + path + "<br>");
        out.append("<a href=\"test.html\">Click Here</a>");

        out.append("</html></body>");
        ServletOutputStream outputStream = response.getOutputStream();
        outputStream.print(out.toString());
        outputStream.flush();
    }

    /**
     * Forwards to the navigation error page.
     *
     * @param HttpServletRequest    the servlet request object
     * @param HttpServletResponse    the servlet response object
     *
     * @throws ServletException
     */
    private void forwardToErrorPage(HttpServletRequest request, HttpServletResponse response,
                                    Throwable exception, String message) throws ServletException, IOException {

        log.error("Controller error - forwarding to error page", exception);
        request.setAttribute("Exception", exception);
        if (message != null) request.setAttribute("message", message);
        /* get the root context so we can forward to the generic error page, not just
           one within this web application
         */
        getServletContext().getContext("/").getRequestDispatcher(
                response.encodeURL(ERROR_PAGE)).forward(request, response);
    }
}
