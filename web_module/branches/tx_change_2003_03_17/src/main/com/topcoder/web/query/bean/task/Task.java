package com.topcoder.web.query.bean.task;

import com.topcoder.web.query.common.Authentication;

import javax.naming.InitialContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * A base interface for task processors called by the query tool controller.
 * @author Greg Paul
 * @author bigjake <kitz@mit.edu>
 */

public interface Task {

    /** Processes the given step of a task
     * @throws Exception
     */
    void process(String step) throws Exception;

    /** Setter for property initialContext.
     * @param ctx New value of property initialContext.
     */
    void setInitialContext(InitialContext ctx);

    /** Getter for property nextPage
     * @return Value of property nextPage
     */
    String getNextPage();

    /** Performs pre-task processing operations on the request and response from the Controller
     * @param request HttpServletRequest from a Controller
     * @param response HttpServletResponse from a Controller
     * @throws Exception
     */
    void servletPreAction(HttpServletRequest request, HttpServletResponse response)	throws Exception;

    /** Performs post-task processing operations on the request and response from the Controller
     * @param request HttpServletRequest from a Controller
     * @param response HttpServletResponse from a Controller
     * @throws Exception
     */
    void servletPostAction(HttpServletRequest request, HttpServletResponse response) throws Exception;

    /** Initial setter for task-processing attributes
     * @param paramName Name of the attribute to set
     * @param paramValues Array from which the attribute is assigned its value(s).  If the attribute is not itself an array, it is set to paramValues[0]
     */
    void setAttributes(String paramName, String paramValues[]);

    void setServletPath(String servletPath);

    String getServletPath();

    void addError(String key, Object error);

    String getError(String key);

    boolean hasError(String key);

    void removeError(String key);

    void clearErrors();

    boolean hasErrors();

    boolean isInternalResource();

    Authentication getAuthentication();

}