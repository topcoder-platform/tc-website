package com.topcoder.web.query.servlet;

import com.topcoder.shared.util.TCContext;
import com.topcoder.shared.util.logging.Logger;

import com.topcoder.web.query.common.Constants;
import com.topcoder.web.query.common.AuthenticationException;
import com.topcoder.web.query.bean.Task;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.Enumeration;

/**
 * The servlet to handle query tool http requests.
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
        com.topcoder.web.query.common.Constants.init(getServletConfig());
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

        String taskName = request.getParameter(Constants.TASK_PARAM);
        String stepName = request.getParameter(Constants.STEP_PARAM);
        if (taskName!=null && !isLegal(taskName)) {
            throw new ServletException("Illegal task: " + taskName);
        }

        InitialContext ctx = null;
        try {
            ctx = (InitialContext) TCContext.getInitial();
            if (taskName != null && taskName.trim().length() > 0) {
                log.info("[**** query **** " + taskName + " **** " + (stepName==null?"":stepName) + " **** " + request.getRemoteHost() + " ****]");

                // process a task
                Task task = null;
                Class taskClass = null;
                taskClass = Class.forName(Constants.QUERY_PACKAGE + "." + taskName);
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

                task.setServletPath(request.getContextPath() + request.getServletPath());

                task.servletPreAction(request, response);

                task.process(stepName);

                task.servletPostAction(request, response);

                request.setAttribute(taskName, task);

                log.debug("next page is " + task.getNextPage());

                if (task.isInternalResource()) {
                    getServletContext().getRequestDispatcher(
                            response.encodeURL("/"+task.getNextPage())).forward(request, response);
                } else {
                    response.sendRedirect(response.encodeURL(task.getNextPage()));
                }

            }
            else {
                forwardToLoginPage(request, response);
                return;
            }
        } catch (AuthenticationException authex) {
            log.debug(authex.getMessage());
            forwardToLoginPage(request, response);
        } catch (ClassNotFoundException cnfex) {
            forwardToErrorPage(request, response, cnfex);
        } catch (NamingException ex) {
            forwardToErrorPage(request, response, ex);
        } catch (InstantiationException e) {
            forwardToErrorPage(request, response, e);
        } catch (IllegalAccessException e) {
            forwardToErrorPage(request, response, e);
        } catch (Exception e) {
            forwardToErrorPage(request, response, e);
        }
    }

    private void forwardToLoginPage(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        getServletContext().getRequestDispatcher(response.encodeURL("/"+Constants.LOGIN_PAGE)).forward(request, response);
    }

    private void forwardToErrorPage(HttpServletRequest request, HttpServletResponse response,
                                    Throwable exception) throws ServletException, IOException {

        log.error("Controller error - forwarding to error page", exception);
        request.setAttribute("Exception", exception);
        getServletContext().getRequestDispatcher(
                response.encodeURL("/"+Constants.ERROR_PAGE)).forward(request, response);
    }

    private static boolean isLegal(String s) {
        for (int i=0; i<s.length(); i++) {
            char ch = s.charAt(i);
            if ("0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ_".indexOf(ch) < 0) {
                return false;
            }
        }
        return true;
    }
}




