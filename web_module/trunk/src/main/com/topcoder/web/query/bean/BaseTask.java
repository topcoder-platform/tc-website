package com.topcoder.web.query.bean;

import com.topcoder.shared.util.logging.Logger;

import javax.naming.InitialContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * A basic implementation of Task.
 * @author Greg Paul
 * @author bigjake <kitz@mit.edu>
 *
 */

public abstract class BaseTask implements Task {

    private static Logger log = Logger.getLogger(BaseTask.class);

    /* Holds the InitialContext of a request being processed by this task */
    private InitialContext ctx;

    /* Holds the next page to which the controller should forward after task processing */
    private String nextPage;

    /* Holds the path to the servlet that instantiated this task */
    private String servletPath;

    /* Makes a new BaseTask */
    public BaseTask() {
        setInitialContext(null);
        setNextPage(null);
        setServletPath(null);
    }

    public abstract void process() throws Exception;

    public void setInitialContext(InitialContext ctx) {
        this.ctx=ctx;
    }

    InitialContext getInitialContext() {
        return ctx;
    }

    void setNextPage(String nextPage) {
        this.nextPage=nextPage;
    }

    public String getNextPage() {
        return nextPage;
    }

    public String getServletPath() {
        return servletPath;
    }

    public void setServletPath(String servletPath) {
        this.servletPath = servletPath;
    }

    public void servletPreAction(HttpServletRequest request, HttpServletResponse response)
         throws Exception {
    }

    public void servletPostAction(HttpServletRequest request, HttpServletResponse response)
        throws Exception {

    }

    public abstract void setAttributes(String paramName, String paramValues[]);

}

