package com.topcoder.web.tces.servlet;

import com.topcoder.shared.util.TCContext;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.tces.bean.Task;
import com.topcoder.web.tces.common.TCESConstants;

import javax.naming.InitialContext;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.Enumeration;

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

        String taskName = request.getParameter(TCESConstants.TASK_PARAM);
        String taskStepName = request.getParameter(TCESConstants.STEP_PARAM);

        InitialContext ctx = null;
        try {
            ctx = (InitialContext) TCContext.getInitial();

            if (taskName != null && taskName.trim().length() > 0) {
                // process a task
                Task task = null;
                Class taskClass = null;
                taskClass = Class.forName(TCESConstants.TCES_PACKAGE + "." + taskName);
                task = (Task) taskClass.newInstance();
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

                request.setAttribute( taskName, task );

                getServletContext().getRequestDispatcher( response.encodeURL(task.getNextPage()) ).forward(request, response);

            }
            else {
                forwardToErrorPage(request, response,
                        new Exception("missing " + TCESConstants.TASK_PARAM + " parameter in request"));
            }
        } catch (TCESAuthenticationException authex) {
            log.debug("User not authenticated to access TCES resource.");
            forwardToLoginPage(request, response, authex);
            return;
        } catch (ClassNotFoundException cnfex) {
            log.debug("Unable to dispatch task! "+cnfex.getMessage());
            forwardToErrorPage(request, response, cnfex);
            return;
        } catch (Exception ex) {
            forwardToErrorPage(request, response, ex);
            return;
        }
    }

    private void forwardToErrorPage(HttpServletRequest request, HttpServletResponse response,
                                    Throwable exception) throws ServletException, IOException {
        getServletContext().getContext("/").getRequestDispatcher(
                response.encodeURL(TCESConstants.LOGIN_PAGE)).forward(request, response);
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



