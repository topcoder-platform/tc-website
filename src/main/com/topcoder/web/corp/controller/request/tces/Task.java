package com.topcoder.web.corp.controller.request.tces;

import com.topcoder.web.common.SessionInfo;
import com.topcoder.web.common.security.WebAuthentication;

import javax.naming.InitialContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * A base interface for task processors called by the TCES controller.
 * @author bigjake <kitz@mit.edu>
 *
 */

public interface Task {

    /** Processes the given step of a task
     * @param step Token identifying the step to process, null or empty
     *             for the default step.
     */
    void processStep(String step)
            throws Exception;

    /** Setter for property initialContext.
     * @param ctx New value of property initialContext.
     */
    void setInitialContext(InitialContext ctx);

    /** Getter for property initialContext
     * @return Value of property initialContext
     */
    InitialContext getInitialContext();

    /** Setter for property nextPage.
     * @param nextPage New value of property nextPage.
     */
    void setNextPage(String nextPage);

    /** Getter for property nextPage
     * @return Value of property nextPage
     */
    String getNextPage();


    /**
     * Sets up authentication token for current http session.
     *
     * @param auth
     */
    void setAuthToken(WebAuthentication auth);


    /** Performs pre-task processing operations on the request and response
     *  from the Controller
     * @param request HttpServletRequest from a Controller
     * @param response HttpServletResponse from a Controller
     */
    void servletPreAction(HttpServletRequest request,
                          HttpServletResponse response) throws Exception;

    /** Performs post-task processing operations on the request and response
     *  from the Controller
     * @param request HttpServletRequest from a Controller
     * @param response HttpServletResponse from a Controller
     */
    void servletPostAction(HttpServletRequest request,
                           HttpServletResponse response) throws Exception;

    /** Initial setter for task-processing attributes
     * @param paramName Name of the attribute to set
     * @param paramValues Array from which the attribute is assigned its values
     * If the attribute is not itself an array, it is set to paramValues[0]
     */
    void setAttributes(String paramName, String paramValues[]);

    void setServletPath(String servletPath);

    String getServletPath();

    void setSessionInfo(SessionInfo info);

    SessionInfo getSessionInfo();
}

