package com.topcoder.web.tces.servlet;

import com.topcoder.shared.util.TCContext;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.tces.bean.Task;
import com.topcoder.web.tces.bean.LoginTask;
import com.topcoder.web.tces.common.TCESConstants;
import com.topcoder.web.tces.common.TCESAuthenticationException;
import com.topcoder.common.web.util.Data;

import com.topcoder.web.common.security.BasicAuthentication;
import com.topcoder.web.common.security.SessionPersistor;
import com.topcoder.web.common.security.WebAuthentication;
import com.topcoder.web.common.security.TCESAuthorization;
import com.topcoder.security.NotAuthorizedException;
import com.topcoder.security.TCSubject;
import com.topcoder.shared.security.Authorization;
import com.topcoder.shared.security.Resource;
import com.topcoder.shared.security.ProcessorResource;
import com.topcoder.web.corp.Util;

import javax.naming.InitialContext;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.Enumeration;


/**
 * The servlet to handle job posting http requests.
 * @author Greg Paul, modified by swif0ne
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
        try {
            Data.initializeDataTypes();
        } catch (Exception e) {
            e.printStackTrace();
        }
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
                log.info("[**** tces **** " + taskName + " **** " + request.getRemoteHost() + " ****]");  
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

                task.setServletPath(request.getContextPath() + request.getServletPath());

//---------
                /* Code for initializing WebAuthentication tokens in each task */
                SessionPersistor persistor = SessionPersistor.getInstance(
                    request.getSession(true)
                );
                WebAuthentication authToken;
                authToken = new BasicAuthentication(persistor, request, response); 
                task.setAuthToken(authToken);
                TCSubject tcUser = Util.retrieveTCSubject(
                    authToken.getActiveUser() 
                );
                Authorization authorize = new TCESAuthorization(tcUser);
                Resource taskResource = new ProcessorResource(task);
                if (!authorize.hasPermission(taskResource)) {
                    throw new NotAuthorizedException(
                        "User not Authorized for access to resource: "
                            + taskName);
                }

//----------

                task.servletPreAction(request, response);

                task.processStep(taskStepName);

                task.servletPostAction(request, response);

                request.setAttribute( taskName, task );

                getServletContext().getRequestDispatcher( response.encodeURL(task.getNextPage()) ).forward(request, response);

            }
            else {
                forwardToLoginPage(request, response,
                        new Exception("missing " + TCESConstants.TASK_PARAM + " parameter in request"));
            }
        } catch (TCESAuthenticationException authex) {
            log.error("User authenticated error in TCES resource.\n" + authex.getMessage());
            forwardToLoginPage(request, response, authex);
            return;
        } catch (NotAuthorizedException ae) {
            log.debug("TCES Authorization failure! ", ae);
            forwardToErrorPage(request, response, ae);
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

//
//    private void forwardToLoginPage(HttpServletRequest request, HttpServletResponse response,
//                                    Throwable exception) throws ServletException, IOException {
//        getServletContext().getRequestDispatcher(response.encodeURL(TCESConstants.AUTH_FAILED_PAGE)).forward(request, response);
//    }


    private void forwardToLoginPage(HttpServletRequest request, HttpServletResponse response,
                                    Throwable exception) throws ServletException, IOException {
        response.sendRedirect("/corp/?module=Login");
    }

    private void forwardToErrorPage(HttpServletRequest request, HttpServletResponse response,
                                    Throwable exception) throws ServletException, IOException {

        log.error("Controller error - forwarding to error page", exception);
        request.setAttribute("caught-exception", exception);

        getServletContext().getRequestDispatcher(
                response.encodeURL(TCESConstants.ERROR_PAGE)).forward(request, response);
    }
}




