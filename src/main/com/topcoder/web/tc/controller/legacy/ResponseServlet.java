package com.topcoder.web.tc.controller.legacy;

import com.topcoder.common.web.data.Authentication;
import com.topcoder.ejb.AuthenticationServices.AuthenticationServices;
import com.topcoder.ejb.AuthenticationServices.AuthenticationServicesHome;
import com.topcoder.ejb.Util.Util;
import com.topcoder.ejb.Util.UtilHome;
import com.topcoder.shared.util.ApplicationServer;
import com.topcoder.shared.util.TCContext;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.BaseProcessor;

import javax.naming.InitialContext;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 *  A servlet to insert a person's response to a question.
 *
 * @version $Revision$
 * @author Greg Paul
 */

public final class ResponseServlet extends HttpServlet {

    private static Logger log = Logger.getLogger(ResponseServlet.class);
    private static final String ERROR_PAGE = "/errorPage.jsp";

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
        int coderId = 0;
        String activationCode = null;
        int answerId = 0;
        int questionId = 0;
        InitialContext ctx = null;
        try {
            coderId = request.getParameter("cr") == null ? 0 : Integer.parseInt(request.getParameter("cr"));
            activationCode = request.getParameter("code") == null ? "" : request.getParameter("code");
            answerId = request.getParameter("ad") == null ? 0 : Integer.parseInt(request.getParameter("ad"));
            questionId = request.getParameter("qd") == null ? 0 : Integer.parseInt(request.getParameter("qd"));
            if (coderId == 0) {
                forwardToErrorPage(request, response,
                        new Exception("request missing coder id"),
                        "Sorry, invalid request, it could not be processed.");
            } else if (answerId == 0) {
                forwardToErrorPage(request, response,
                        new Exception("request missing answer id"),
                        "Sorry, invalid request, it could not be processed.");
            } else if (questionId == 0) {
                forwardToErrorPage(request, response,
                        new Exception("request missing question id"),
                        "Sorry, invalid request, it could not be processed.");
            }

            ctx = TCContext.getInitial();
            AuthenticationServices authServices = (AuthenticationServices)BaseProcessor.createEJB(ctx, AuthenticationServices.class);
            Authentication authentication = authServices.getActivation(coderId);
            if (authentication.getActivationCode().equals(activationCode)) {
                try {
                    Util util = (Util)BaseProcessor.createEJB(ctx, Util.class);
                    util.addResponse(coderId, answerId, questionId);
                    //forward to success page
                    forwardToErrorPage(request, response, new Exception(), "Thank you for your response.");
                } catch (Exception ex) {
                    forwardToErrorPage(request, response, ex,
                            "Sorry, you can only answer a question once.");
                }
            } else {
                forwardToErrorPage(request, response,
                        new Exception("their activation code doesn't match what we have.\n" +
                        "coder: " + coderId + " provided code: " + activationCode),
                        "Sorry, invalid request, it could not be processed.");
            }

        } catch (Exception e) {
            forwardToErrorPage(request, response, e,
                    "Sorry, invalid request, it could not be processed.");
        }

    }

    /**
     * Forwards to the navigation error page.
     *
     * @param request the servlet request object
     * @param response the servlet response object
     *
     * @throws javax.servlet.ServletException
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
