package com.topcoder.web.tc.controller.legacy.jobposting.bean;

import javax.naming.InitialContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * A base interface for task processors called by the TCES controller.
 * @author bigjake <kitz@mit.edu>
 *
 */

public interface TaskInt {

    void processStep(String step)
            throws Exception;

    void setInitialContext(InitialContext ctx);

    InitialContext getInitialContext();

    void setNextPage(String nextPage);

    String getNextPage();

    void setNextPageInternal(boolean nextPageInternal);

    boolean getNextPageInternal();

    void servletPreAction(HttpServletRequest request, HttpServletResponse response)
            throws Exception;

    void servletPostAction(HttpServletRequest request, HttpServletResponse response)
            throws Exception;

    void setAttributes(String paramName, String paramValues[]);

}

