package com.topcoder.web.tc.controller.legacy.jobposting.servlet;

import com.topcoder.shared.util.TCContext;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.tc.controller.legacy.jobposting.common.Constants;
import com.topcoder.web.tc.controller.legacy.jobposting.bean.TaskInt;

import javax.naming.InitialContext;
import javax.servlet.ServletException;
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
        Constants.init(getServletConfig());
    }

    /**
     * This method handles requests.
     *
     * @param request the servlet request object
     * @param  response the servlet response object
     *
     * @throws ServletException
     * @throws IOException
     */
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        log.debug("in doPost");

        String taskName = request.getParameter(Constants.TASK_PARAM);
        String taskStepName = request.getParameter(Constants.STEP_PARAM);

        log.info("[**** tces **** " + taskName + " **** " + request.getRemoteHost() + " ****]");    

        InitialContext ctx = null;
        try {
            ctx = (InitialContext) TCContext.getInitial();

            if (taskName != null && taskName.trim().length() > 0) {
                // process a task
                TaskInt task = null;
                Class taskClass = null;
                taskClass = Class.forName(Constants.JOB_POSTING_PACKAGE + "." + taskName);
                task = (TaskInt) taskClass.newInstance();
                task.setInitialContext(ctx);

                Enumeration parameterNames = request.getParameterNames();
                while (parameterNames.hasMoreElements()) {
                    String parameterName = parameterNames.nextElement().toString();
                    String[] parameterValues = request.getParameterValues(parameterName);
                    if (parameterValues != null) {
                        task.setAttributes(parameterName, parameterValues);
                    }
                }

                task.servletPreAction(request, response);

                task.processStep(taskStepName);

                task.servletPostAction(request, response);

                request.setAttribute(taskName, task);

                log.debug(task.getNextPage());

                if (task.getNextPageInternal()) {
                    getServletContext().getRequestDispatcher(
                            response.encodeURL(task.getNextPage())).forward(request, response);
                } else {
                    response.sendRedirect(response.encodeURL(task.getNextPage()));
                }
            }
            else {
                forwardToErrorPage(request, response,
                        new Exception("missing " + Constants.TASK_PARAM + " parameter in request"));
            }
        } catch (ClassNotFoundException cnfex) {
            log.debug("Unable to dispatch task! " + cnfex.getMessage());
            forwardToErrorPage(request, response, cnfex);
            return;
        } catch (Exception ex) {
            forwardToErrorPage(request, response, ex);
            return;
        }
    }

    private void forwardToErrorPage(HttpServletRequest request, HttpServletResponse response,
                                    Throwable exception) throws ServletException, IOException {

        log.error("Controller error - forwarding to error page", exception);
        request.setAttribute("Exception", exception);
        /* get the root context so we can forward to the generic error page, not just
           one within this web application
         */
        getServletContext().getContext("/").getRequestDispatcher(
                response.encodeURL(Constants.ERROR_PAGE)).forward(request, response);
    }
}



