package com.topcoder.web.tc.controller.legacy.jobposting.servlet;

import com.topcoder.shared.util.TCContext;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.tc.controller.legacy.jobposting.common.Constants;
import com.topcoder.web.tc.controller.legacy.jobposting.bean.TaskInt;
import com.topcoder.web.tc.model.CoderSessionInfo;
import com.topcoder.web.common.*;
import com.topcoder.web.common.security.WebAuthentication;
import com.topcoder.security.TCSubject;
import com.topcoder.common.web.data.Navigation;

import javax.naming.InitialContext;
import javax.servlet.ServletException;
import javax.servlet.ServletConfig;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.*;

/**
 * The servlet to handle job posting http requests.
 * @author Greg Paul
 * @version $Revision$
 *
 */

public class Controller extends BaseServlet {
    private static Logger log = Logger.getLogger(Controller.class);


    /**
     * Initializes the servlet.
     * @throws javax.servlet.ServletException
     */
    public synchronized void init(ServletConfig config) throws ServletException {
        super.init(config);
        Constants.init(getServletConfig());
    }

    protected void process(HttpServletRequest request, HttpServletResponse response )
            throws IOException  {

        WebAuthentication authentication = null;
        SessionInfo info = null;

        String taskName = request.getParameter(Constants.TASK_PARAM);
        String taskStepName = request.getParameter(Constants.STEP_PARAM);

        InitialContext ctx = null;
        try {
            try {
                TCRequest tcRequest = HttpObjectFactory.createRequest(request);
                TCResponse tcResponse = HttpObjectFactory.createResponse(response);
                //set up security objects and session info
                authentication = createAuthentication(tcRequest, tcResponse);
                TCSubject user = getUser(authentication.getActiveUser().getId());
                info = createSessionInfo(tcRequest, authentication, user.getPrincipals());
                tcRequest.setAttribute(SESSION_INFO_KEY, info);


                StringBuffer loginfo = new StringBuffer(100);
                loginfo.append("[**** ");
                loginfo.append(info.getHandle());
                loginfo.append(" **** ");
                loginfo.append(request.getRemoteAddr());
                loginfo.append(" **** ");
                loginfo.append(request.getMethod());
                loginfo.append(" ");
                loginfo.append(info.getRequestString());
                loginfo.append(" ****]");
                log.info(loginfo);

                ctx = TCContext.getInitial();

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
                } else {
                    throw new Exception("missing " + Constants.TASK_PARAM + " parameter in request");
                }
            } catch (PermissionException pe) {
                log.debug("caught PermissionException");
                if (authentication.getUser().isAnonymous()) {
                    handleLogin(request, response, info);
                    return;
                } else {
                    log.debug("already logged in, rethrowing");
                    throw pe;
                }
            } catch (Exception ex) {
                handleException(request, response, ex);
                return;
            }

        } catch (Exception e) {
            log.fatal("forwarding to error page failed", e);
            e.printStackTrace();

            response.setStatus(500);
            PrintWriter out = response.getWriter();
            out.println("<html><head><title>Internal Error</title></head>");
            out.println("<body><h4>Your request could not be processed.  Please inform TopCoder.</h4>");
            out.println("</body></html>");
            out.flush();
        }
    }

    protected SessionInfo createSessionInfo(TCRequest request,
                                            WebAuthentication auth, Set groups) throws Exception {
        //todo get rid of this junk, we end up doing all the same stuff anyway, when the navigation object
        //goes, so does this crap
        Navigation nav = (Navigation)request.getSession(true).getAttribute("navigation");
        CoderSessionInfo ret = null;
        ret = new CoderSessionInfo(request, auth, groups);
        if (nav == null) {
            nav = new Navigation(request, ret);
            nav.setCoderSessionInfo(ret);
            request.getSession(true).setAttribute("navigation", nav);
        } else {
            nav.setCoderSessionInfo(ret);
            request.setAttribute("navigation", nav);
        }
        return ret;
    }

}



