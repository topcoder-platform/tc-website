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
 *  Log of Changes:
 *           $Log$
 *           Revision 1.9  2002/08/01 18:57:52  gpaul
 *           added lots of javadocs stuff and reformatted code
 *
 *           Revision 1.8  2002/07/16 19:58:08  gpaul
 *           changed job_hit to job_posting, pulled some debug
 *
 *           Revision 1.7  2002/07/16 19:54:12  gpaul
 *           use root context for error page
 *
 *           Revision 1.6  2002/07/16 18:14:26  gpaul
 *           return after forwarding to error page
 *
 *           Revision 1.5  2002/07/16 18:10:56  gpaul
 *           added a little debug info
 *
 *           Revision 1.4  2002/07/16 18:04:58  gpaul
 *           added a little debug info
 *
 *           Revision 1.3  2002/07/16 17:10:10  gpaul
 *           some addition fault tolerance for bad commands/ no command
 *
 *           Revision 1.2  2002/07/16 16:34:07  gpaul
 *           no message
 *
 *           Revision 1.1  2002/07/16 14:53:40  gpaul
 *           first add
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


        /*
          just kinda jamming this in for now, when it's written as a real
          project, this should be done a bit more elegantly.
         */
        if (command == null) {
            forwardToErrorPage(request, response,
                    new Exception("missing " + DataAccessConstants.COMMAND + " parameter " +
                    " in request"));
            return;
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



