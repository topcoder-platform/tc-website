package com.topcoder.web.email.servlet;

import com.topcoder.security.TCSubject;
import com.topcoder.security.admin.PrincipalMgrRemote;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.*;
import com.topcoder.web.common.security.BasicAuthentication;
import com.topcoder.web.common.security.Constants;
import com.topcoder.web.common.security.SessionPersistor;
import com.topcoder.web.common.security.WebAuthentication;
import com.topcoder.web.email.bean.Task;
import com.topcoder.web.email.bean.TaskFactory;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Controller.java
 *
 * Description: Controller servlet for the e-mail app.
 *
 * @author    James Lee (jameslee@cs.stanford.edu)
 * @version    1.0
 *
 */
public class Controller
        extends HttpServlet {
    private static Logger log = Logger.getLogger(Controller.class);

    // TaskFactory for creating tasks
    private TaskFactory taskFactory;

    /**
     * Initializes the servlet.
     *
     * @throws ServletException
     */
    public void init()
            throws ServletException {
        taskFactory = TaskFactory.getTaskFactory();
        EmailConstants.initialize(getServletConfig());
    }

    /**
     * This method handles requests by getting the appropropriate task
     * bean, having that bean perform its task, and then routing to the
     * resulting page.  Tasks are specified by their class name in the
     * TASK parameter.
     *
     * @param request the servlet request object
     * @param response the servlet response object
     *
     * @throws ServletException
     * @throws IOException
     */
    public void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String taskName = request.getParameter(EmailConstants.TASK);
            log.debug("Requested task: " + taskName);

            // if there's no task parameter, go home
            if (taskName == null) {
                log.debug("No task parameter - going home");
                taskName = EmailConstants.HOME_TASK;
            }

            String taskClassName = EmailConstants.TASK_PACKAGE + "." + taskName;
            log.debug("Task bean: " + taskClassName);

            TCRequest tcRequest = HttpObjectFactory.createRequest(request);
            TCResponse tcResponse = HttpObjectFactory.createResponse(response);
            WebAuthentication auth = new BasicAuthentication(new SessionPersistor(tcRequest.getSession(true)), tcRequest, tcResponse, BasicAuthentication.MAIN_SITE);
            PrincipalMgrRemote pmgr = (PrincipalMgrRemote) Constants.createEJB(PrincipalMgrRemote.class);
            //todo perhaps find a better way to do this.  maybe we can beat min one ejb call per request
            TCSubject user = SecurityHelper.getUserSubject(auth.getActiveUser().getId());
            SessionInfo info = new SessionInfo(tcRequest, auth, user.getPrincipals());
            if (info.isAdmin()) {
                try {
                    Task task = taskFactory.getTask(taskClassName, getClass().getClassLoader());
                    TaskRouter taskRouter = task.perform(this, request, response);
                    taskRouter.route(this, request, response);
                } catch (Exception e) {
                    forwardToErrorPage(request, response, e);
                }
            } else {
                request.setAttribute(BaseServlet.MESSAGE_KEY, "In order to continue, you must provide your user name " +
                        "and password.");
                request.setAttribute(BaseServlet.NEXT_PAGE_KEY, info.getRequestString());

                request.setAttribute("module", "Login");
                fetchRegularPage(request, response, "/tc", true);
            }

        } catch (Exception e) {
            throw new ServletException(e.toString());
        }
    }

    protected final void fetchRegularPage(HttpServletRequest request, HttpServletResponse response, String dest,
                                          boolean forward) throws Exception {

        if (forward) {
            if (!dest.startsWith("/")) {
                dest = "/" + dest;
            }
            log.debug("forwarding to " + dest);
            getServletContext().getContext("/").getRequestDispatcher(response.encodeURL(dest)).forward(request, response);
        } else {
            log.debug("redirecting to " + dest);
            response.sendRedirect(response.encodeRedirectURL(dest));
        }
    }

    /**
     * Forwards to the navigation error page.  This method is called when an exception
     * occurs while instantiating a Task object and routing to the appropriate page.
     *
     * @param request the servlet request object
     * @param response the servlet response object
     *
     * @throws ServletException
     * @throws IOException
     */
    private void forwardToErrorPage(HttpServletRequest request, HttpServletResponse response,
                                    Throwable exception)
            throws ServletException, IOException {
        log.error("Controller error - forwarding to error page", exception);
        request.setAttribute("Exception", exception);
        getServletContext().getRequestDispatcher(
                response.encodeURL(EmailConstants.ERROR_PAGE)
        ).forward(request, response);
    }
}
