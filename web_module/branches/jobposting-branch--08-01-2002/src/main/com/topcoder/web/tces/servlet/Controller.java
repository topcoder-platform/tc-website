package com.topcoder.web.tces.servlet;

import com.topcoder.shared.util.ApplicationServer;
import com.topcoder.shared.util.TCContext;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.shared.dataAccess.DataAccessConstants;
import com.topcoder.web.tces.common.TCESConstants;
import com.topcoder.web.tces.ejb.TCESServices.TCESServices;
import com.topcoder.web.tces.ejb.TCESServices.TCESServicesHome;

import javax.naming.InitialContext;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;

/**
 * The servlet to handle job posting http requests.
 * @author Greg Paul
 * @version $Revision$
 *
 */

public class Controller extends HttpServlet {
    private static Logger log = Logger.getLogger(Controller.class);


    /**
     * Initializes the servlet.
     * @throws ServletException
     */
    public void init() throws ServletException {
        TCESConstants.init(getServletConfig());
    }

    /**
     * This method handles requests.
     *
     * @param HttpServletRequest    the servlet request object
     * @param HttpServletResponse    the servlet response object
     *
     * @throws ServletException
     */
    public void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        log.debug("service called");

        String command = request.getParameter(DataAccessConstants.COMMAND);
        InitialContext ctx = null;

        if (command == null) {
            forwardToErrorPage(request, response,
                    new Exception("missing " + DataAccessConstants.COMMAND + " parameter " +
                    " in request"));
            return;
		} else if (command.equals("login")) {
            request.setAttribute("message",new String("foo"));
            getServletContext().getRequestDispatcher(
                response.encodeURL("/es/login.jsp")).forward(request, response);

            //handleLogin(request, response);
        } else if (command.equals("job_posting") || command.equals("click_thru")) {
            String tempJobId = request.getParameter(TCESConstants.JOB_ID_KEY);
            String tempUserId = request.getParameter(TCESConstants.USER_ID_KEY);
            int jobId = -1;
            int userId = -1;
            int hitTypeId = -1;

            if (command.equals("job_posting")) {
                hitTypeId = TCESConstants.JOB_POSTING_ID;
            } else {
                hitTypeId = TCESConstants.CLICK_THRU_ID;
            }
            if (tempJobId == null || tempJobId.trim().equals("")) {
                forwardToErrorPage(request, response,
                        new Exception("missing " + TCESConstants.JOB_ID_KEY + " parameter " +
                        " in request"));
                return;
            } else if (tempUserId == null || tempUserId.trim().equals("")) {
                forwardToErrorPage(request, response,
                        new Exception("missing " + TCESConstants.USER_ID_KEY + " parameter " +
                        " in request"));
                return;
            } else {
                try {
                    jobId = Integer.parseInt(tempJobId);
                } catch (NumberFormatException nfe) {
                    forwardToErrorPage(request, response, nfe);
                    return;
                }
                try {
                    userId = Integer.parseInt(tempUserId);
                } catch (NumberFormatException nfe) {
                    forwardToErrorPage(request, response, nfe);
                    return;
                }
            }

            try {
                ctx = (InitialContext) TCContext.getInitial();
                TCESServicesHome tcesHome = (TCESServicesHome)
                        ctx.lookup(ApplicationServer.TCES_SERVICES);
                TCESServices tcesServices = tcesHome.create();
                tcesServices.addJobHit(userId, jobId, hitTypeId);
            } catch (Exception e) {
                forwardToErrorPage(request, response, e);
            }
        } else {
            forwardToErrorPage(request, response,
                    new Exception("Don't recognize command: " + command));
            return;
        }
    }


    /**
     * Handles a login request
     *
     * @param HttpServletRequest    the servlet request object
     * @param HttpServletResponse    the servlet response object
     *
     * @throws ServletException
     */

    private void handleLogin(HttpServletRequest request,
                             HttpServletResponse response) throws ServletException, IOException {

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
                                    Throwable exception) throws ServletException, IOException {

        log.error("Controller error - forwarding to error page", exception);
        request.setAttribute("Exception", exception);
        /* get the root context so we can forward to the generic error page, not just
           one within this web application
         */
        getServletContext().getContext("/").getRequestDispatcher(
                response.encodeURL(TCESConstants.ERROR_PAGE)).forward(request, response);
    }
}



