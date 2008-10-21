package com.topcoder.web.email.servlet;

import com.topcoder.shared.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * TaskRouter.java
 *
 * Description: Routes to a specified URL.
 *
 * @author    James Lee (jameslee@cs.stanford.edu)
 * @version    1.0
 *
 */

public class TaskRouter {
    private static Logger log = Logger.getLogger(TaskRouter.class);

    // the URL to which this router forwards/redirects
    private final String url;

    private boolean forward;

    /**
     * Constructor sets the specified URL
     *
     * @param url        a String representing the target URL
     * @param forward    if true, forwards, else, redirects
     */

    public TaskRouter(String url, boolean forward) {
        this.url = url;
        this.forward = forward;
    }

    public TaskRouter(String url) {
        this(url, true);
    }


    /**
     * This method forwards/redirects to the URL.
     *
     * @param servlet            the servlet object
     * @param request    the servlet request object
     * @param response    the servlet response object
     *
     * @throws IOException
     * @throws ServletException
     */

    public void route(HttpServlet servlet,
                      HttpServletRequest request,
                      HttpServletResponse response)
            throws ServletException, IOException {
        if (forward) {
            //response.setHeader("Cache-Control","no-store");
            //response.setHeader("Pragma","no-cache");
            //response.setDateHeader ("Expires", 0);
            log.debug("Forwarding to url: " + url);
            servlet.getServletContext().getRequestDispatcher(
                    response.encodeURL(url)
            ).forward(request, response);
        } else {
            log.debug("Redirecting to url: " + url);
            response.sendRedirect(response.encodeRedirectURL(url));
        }
    }
}
