package com.topcoder.web.query.servlet;

import com.topcoder.shared.util.TCContext;
import com.topcoder.shared.util.logging.Logger;

import com.topcoder.web.query.common.Constants;
import com.topcoder.web.query.common.AuthenticationException;
import com.topcoder.web.query.common.LoginFailedException;
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

        log.debug("request: " + request.getQueryString());
        Task task = null;
        Class taskClass = null;
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
                taskClass = Class.forName(Constants.QUERY_PACKAGE + "." + taskName);
                task = (Task) taskClass.newInstance();
                task.setInitialContext(ctx);

                task.servletPreAction(request, response);

                Enumeration parameterNames = request.getParameterNames();
                while (parameterNames.hasMoreElements()) {
                    String parameterName = parameterNames.nextElement().toString();
                    String[] parameterValues = request.getParameterValues(parameterName);
                    if (parameterValues != null) {
                        task.setAttributes(parameterName, parameterValues);
                    }
                }

                task.setServletPath(request.getContextPath() + request.getServletPath());

                task.process(stepName);

                task.servletPostAction(request, response);

                request.setAttribute(taskName, task);

                sendToPage(request, response, task.getNextPage(), task.isInternalResource());
            }
            else {
                sendToLoginPage(request, response, true);
            }
        } catch (AuthenticationException authex) {
            log.debug("message: " + task.getAuthentication().getErrorMessage() +
                    " redirurl: " + task.getAuthentication().getRequestedURL());
            sendToLoginPage(request, response, false);
        } catch (LoginFailedException authex) {
            request.setAttribute("Authentication", task.getAuthentication());
            sendToLoginPage(request, response, true);
        } catch (ClassNotFoundException cnfex) {
            sendToErrorPage(request, response, cnfex);
        } catch (NamingException ex) {
            sendToErrorPage(request, response, ex);
        } catch (InstantiationException e) {
            sendToErrorPage(request, response, e);
        } catch (IllegalAccessException e) {
            sendToErrorPage(request, response, e);
        } catch (Exception e) {
            sendToErrorPage(request, response, e);
        }
    }

    private void sendToLoginPage(HttpServletRequest request, HttpServletResponse response, boolean forward)
            throws ServletException, IOException {
        if (forward) {
            sendToPage(request, response, Constants.LOGIN_PAGE, forward);
        } else {
            sendToPage(request,
                    response,
                    "http://" + request.getServerName() + request.getContextPath() + request.getServletPath() + "?" +
                    Constants.TASK_PARAM + "=" + Constants.LOGIN_TASK,
                    false);
        }
    }

    private void sendToPage(HttpServletRequest request, HttpServletResponse response, String page, boolean forward)
            throws ServletException, IOException {
        log.debug((forward?"forwarding ":"redirecting ") + "to " + page);
        if (forward) {
            getServletContext().getRequestDispatcher(response.encodeURL("/"+page)).forward(request, response);
        } else {
            response.sendRedirect(response.encodeRedirectURL(page));
        }
    }

    private void sendToErrorPage(HttpServletRequest request, HttpServletResponse response,
                                    Throwable exception) throws ServletException, IOException {
        log.error("Controller error - forwarding to error page", exception);
        request.setAttribute("Exception", exception);
        sendToPage(request, response, Constants.ERROR_PAGE, true);
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




