package com.topcoder.web.tc.controller.legacy;

import com.topcoder.shared.util.logging.Logger;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 *  A servlet to allow us a pretty link to give sun
 *
 * @version $Revision$
 * @author Greg Paul
 */

public final class SunNetworkChallenge extends HttpServlet {

    private static Logger log = Logger.getLogger(SunNetworkChallenge.class);

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

    public void process(HttpServletRequest request, HttpServletResponse response) {
        try {
/*  if you forward, the old address will remain in the get line, if you redirect, it will be changed */
//            getServletContext().getContext("/").getRequestDispatcher(
//                response.encodeURL("/index/?&t=schedule&c=2002sunnetwork")).forward(request, response);
            response.sendRedirect("http://" + request.getServerName() + "/?&t=schedule&c=2002sunnetwork");
//            response.sendRedirect("http://sunnetwork.sun.com/sf2002/topcoder/index.jsp");
            return;
        } catch (Exception e) {
            e.printStackTrace();
        }

    }
}
