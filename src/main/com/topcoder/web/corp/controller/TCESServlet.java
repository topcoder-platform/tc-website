package com.topcoder.web.corp.controller;

import com.topcoder.common.web.util.Data;
import com.topcoder.security.NotAuthorizedException;
import com.topcoder.security.TCSubject;
import com.topcoder.shared.security.Authorization;
import com.topcoder.shared.security.Resource;
import com.topcoder.shared.security.SimpleResource;
import com.topcoder.shared.util.TCContext;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.security.BasicAuthentication;
import com.topcoder.web.common.security.SessionPersistor;
import com.topcoder.web.common.security.TCSAuthorization;
import com.topcoder.web.common.security.WebAuthentication;
import com.topcoder.web.corp.Util;
import com.topcoder.web.common.SessionInfo;
import com.topcoder.web.common.BaseServlet;
import com.topcoder.web.corp.controller.request.tces.Task;
import com.topcoder.web.corp.common.TCESAuthenticationException;
import com.topcoder.web.corp.common.TCESConstants;

import javax.naming.InitialContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpUtils;
import java.io.IOException;
import java.util.Enumeration;


/**
 * The servlet to handle TCES http requests.  This controller also handles
 * setting up the tasks Authentication token to find userId, and checks to
 * make sure the user has proper Authorization to access the specified task.
 * @author Greg Paul
 * @author Dan Cohn
 * @version $Revision$
 *
 */

public class TCESServlet extends HttpServlet {
    private static Logger log = Logger.getLogger(TCESServlet.class);

    /**
     * Initializes the servlet.
     * @throws javax.servlet.ServletException
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
     * This method handles Get requests same as Post by calling doPost.
     *
     * @param request the servlet request object
     * @param response the servlet response object
     *
     * @throws javax.servlet.ServletException
     * @throws java.io.IOException
     */
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    /**
     * This method handles http requests, sets up the authorization token in
     * each task, and ensures the logged in user has access to task.  If user
     * is unauthorized and not logged in they are sent to login page.
     *
     * @param request the servlet request object
     * @param response the servlet response object
     *
     * @throws javax.servlet.ServletException
     * @throws java.io.IOException
     */
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String taskName = request.getParameter(TCESConstants.TASK_PARAM);
        String taskStepName = request.getParameter(TCESConstants.STEP_PARAM);

        InitialContext ctx = null;
        SessionInfo info = null;
        try {
            ctx = (InitialContext) TCContext.getInitial();

            if (taskName != null && taskName.trim().length() > 0) {
                log.info("[**** tces **** " + taskName + " **** " +
                        request.getRemoteHost() + " ****]");

                String taskClassName = TCESConstants.TCES_PACKAGE + "."
                        + taskName;

                /* User authorization checking */
                SessionPersistor persistor = new SessionPersistor(
                        request.getSession(true)
                );
                WebAuthentication authToken
                        = new BasicAuthentication(persistor, request, response, BasicAuthentication.CORP_SITE);

                TCSubject tcUser = Util.retrieveTCSubject(
                        authToken.getActiveUser().getId()
                );
                Authorization authorize = new TCSAuthorization(tcUser);

                info = new SessionInfo(request, authToken, tcUser.getPrincipals());
                request.setAttribute(BaseServlet.SESSION_INFO_KEY, info);

                Resource taskResource = new SimpleResource(taskClassName);
                Task task = null;
                try {
                    if (!authorize.hasPermission(taskResource)) {
                        if (authToken.getActiveUser().isAnonymous()) {
                            throw new TCESAuthenticationException(
                                    "Anonymous user does not have permision");
                        }
                        throw new NotAuthorizedException(
                                "User " + tcUser.getUserId() + " not Authorized for access to resource: "
                                + taskName);
                    }

                    // process a task
                    Class taskClass = null;
                    taskClass = Class.forName(taskClassName);
                    task = (Task) taskClass.newInstance();
                    task.setInitialContext(ctx);
                    task.setSessionInfo(info);

                    Enumeration parameterNames = request.getParameterNames();
                    while (parameterNames.hasMoreElements()) {
                        String parameterName =
                                parameterNames.nextElement().toString();
                        String[] parameterValues =
                                request.getParameterValues(parameterName);
                        if (parameterValues != null) {
                            task.setAttributes(parameterName, parameterValues);
                        }
                    }

                    task.setServletPath(request.getContextPath()
                            + request.getServletPath());

                    task.setAuthToken(authToken);

                    task.servletPreAction(request, response);

                    task.processStep(taskStepName);
                } catch (TCESAuthenticationException authex) {
                    request.setAttribute("message", "In order to continue, you must provide your user name " +
                            "and password, even if you’ve logged in already.");
                    request.setAttribute(BaseServlet.NEXT_PAGE_KEY,
                            HttpUtils.getRequestURL(request) + "?" + request.getQueryString());
                    request.setAttribute(com.topcoder.web.corp.Constants.KEY_MODULE, "Login");
                    boolean forward = true;
                    fetchRegularPage(request, response, "/", forward);
                    return;
                }

                task.servletPostAction(request, response);

                request.setAttribute(taskName, task);

                if (!response.isCommitted()) {
                    fetchRegularPage(request, response, task.getNextPage(), true);
                }

            } else {
                forwardToErrorPage(request, response,
                        new Exception("missing " + TCESConstants.TASK_PARAM
                        + " parameter in request"), false);
            }
        } catch (NotAuthorizedException ae) {
            log.debug("TCES Authorization failure! ", ae);
            forwardToErrorPage(request, response, ae, true);
            return;
        } catch (ClassNotFoundException cnfex) {
            log.debug("Unable to dispatch task! " + cnfex.getMessage());
            forwardToErrorPage(request, response, cnfex, false);
            return;
        } catch (Exception ex) {
            forwardToErrorPage(request, response, ex, false);
            return;
        }
    }


    /**
     * private method for forward user to one of the two error pages.  If a
     * general error occured then they are sent to ERROR_PAGE, if an
     * authorization error occured they are sent to AUTH_FAILED_PAGE.
     *
     * @param request the servlet request object
     * @param response the servlet response object
     * @param exception the exception that caused the forwarding to error page
     * @param authorizeError true = authorization erorr, false = general error
     *
     * @throws javax.servlet.ServletException
     * @throws java.io.IOException
     */
    private void forwardToErrorPage(HttpServletRequest request,
                                    HttpServletResponse response, Throwable exception,
                                    boolean authorizeError) throws ServletException, IOException {

        exception.printStackTrace();
        request.setAttribute("exception", exception);

        if (authorizeError)
            request.setAttribute(BaseServlet.MESSAGE_KEY, "Sorry, you do not have permission to access the specified resource.");

        getServletContext().getRequestDispatcher(
                response.encodeURL(TCESConstants.ERROR_PAGE)).forward(request, response);
    }

    /**
     *
     * @param req
     * @param resp
     * @param dest
     * @param forward
     * @throws java.io.IOException
     * @throws javax.servlet.ServletException
     */
    private void fetchRegularPage(
            HttpServletRequest req,
            HttpServletResponse resp,
            String dest,
            boolean forward
            )
            throws IOException, ServletException {
        if (dest == null) {
            dest = req.getContextPath() + "/"; // default page is web app root
        }
        log.debug((forward ? "forwarding" : "redirecting") + " to " + dest);

        if (forward) {
            getServletContext().getRequestDispatcher(resp.encodeURL(dest)).forward(req, resp);
        } else {
            resp.sendRedirect(resp.encodeRedirectURL(dest));
        }
    }

}
