package com.topcoder.web.tces.servlet;

import com.topcoder.shared.util.ApplicationServer;
import com.topcoder.shared.util.TCContext;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.dataAccess.*;
import com.topcoder.shared.dataAccess.resultSet.*;
import com.topcoder.web.tces.common.*;
import com.topcoder.web.tces.ejb.TCESServices.TCESServices;
import com.topcoder.web.tces.ejb.TCESServices.TCESServicesHome;

import javax.naming.InitialContext;
import javax.servlet.ServletException;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.*;

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
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
log.debug("in doPost");

        String command = request.getParameter(DataAccessConstants.COMMAND);
        String taskName = request.getParameter(TCESConstants.TASK_PARAM);
        String taskStepName = request.getParameter(TCESConstants.STEP_PARAM);

        InitialContext ctx = null;
        try {
log.debug("getting initial context");
            ctx = (InitialContext) TCContext.getInitial();

            if (taskName != null && taskName.trim().length() > 0) {
                // process a task
                Task task = null;
                Class taskClass = null;
                taskClass = Class.forName(TCESConstants.TCES_PACKAGE + "." + taskName);
                task = (Task) taskClass.newInstance();
                task.setInitialContext(ctx);
                task.processStep(taskStepName);

log.debug(">>>params: ");
                Enumeration parameterNames = request.getParameterNames();
                while (parameterNames.hasMoreElements()) {
                    String parameterName = parameterNames.nextElement().toString();
                    String[] parameterValues = request.getParameterValues(parameterName);
log.debug("n: "+parameterName+" v: "+parameterValues[0]);
                    if (parameterValues != null) {
                        task.setAttributes(parameterName, parameterValues);
                    }
                }
log.debug("<<<");

                task.servletAction(this, request, response);

                request.setAttribute( taskName, task );

                getServletContext().getRequestDispatcher( response.encodeURL(task.getNextPage()) ).forward(request, response);

            }
            else if (command != null && command.trim().length() > 0) {
                // process command (old code)
                processCommand(command,request,response);
            }
            else {
                forwardToErrorPage(request, response,
                        new Exception("missing " + DataAccessConstants.COMMAND + " or " + TCESConstants.TASK_PARAM + " parameter in request"));
            }
        } catch (ClassNotFoundException cnfex) {
            log.debug("Unable to dispatch task! "+cnfex.getMessage());
            forwardToErrorPage(request, response, cnfex);
            return;
        } catch (Exception ex) {
            forwardToErrorPage(request, response, ex);
            return;
        }
    }

    public void processCommand(String command, HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException
    {
        InitialContext ctx = null;

        if (command.equals("job_posting") || command.equals("click_thru")) {
            String tempJobId = request.getParameter(TCESConstants.JOB_ID_PARAM);
            String tempUserId = request.getParameter(TCESConstants.USER_ID_PARAM);
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
                        new Exception("missing " + TCESConstants.JOB_ID_PARAM + " parameter " +
                        " in request"));
                return;
            } else if (tempUserId == null || tempUserId.trim().equals("")) {
                forwardToErrorPage(request, response,
                        new Exception("missing " + TCESConstants.USER_ID_PARAM + " parameter " +
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
            } catch (Exception ex) {
                forwardToErrorPage(request, response, ex);
            }
        } else {
            forwardToErrorPage(request, response,
                    new Exception("Don't recognize command: " + command));
            return;
        }
    }


    private boolean isWord(String s) {
        if (s == null || s.length() == 0) return false;
        for (int i = 0; i < s.length(); i++) {
            if (!Character.isLetter(s.charAt(i))) return false;
        }
        return true;
    }

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



