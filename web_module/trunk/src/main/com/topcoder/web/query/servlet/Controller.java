package com.topcoder.web.query.servlet;

import com.topcoder.web.common.BaseServlet;
import com.topcoder.web.common.SessionInfo;
import com.topcoder.web.query.common.Constants;
import com.topcoder.shared.util.logging.Logger;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * The servlet to handle query tool http requests.
 * @author Greg Paul
 * @version $Revision$
 *
 */

public class Controller extends BaseServlet {

    private static Logger log = Logger.getLogger(Controller.class);

    public synchronized void init(ServletConfig config) throws ServletException {
        super.init(config);
        Constants.init(config);
    }



    protected void handleLogin(HttpServletRequest request, HttpServletResponse response, SessionInfo info) throws Exception {
        log.debug("handle login called");
        /* forward to the login page, with a message and a way back */
        request.setAttribute(MESSAGE_KEY, "In order to continue, you must provide your user name " +
                "and password.");
        request.setAttribute(NEXT_PAGE_KEY, info.getRequestString());

        request.setAttribute(MODULE, LOGIN_PROCESSOR);

        String dest = LOGIN_SERVLET == null ? info.getServletPath() : LOGIN_SERVLET;

        log.debug("forwarding to " + dest);
        getServletContext().getContext("/").getRequestDispatcher(response.encodeURL(dest)).forward(request, response);
    }

}



