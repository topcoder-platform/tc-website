package com.topcoder.web.tc.controller.legacy.jobposting.bean;

import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.dataAccess.resultSet.TCTimestampResult;
import com.topcoder.shared.util.logging.Logger;

import javax.naming.InitialContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.StringTokenizer;

/**
 * A basic implementation of Task.
 * @author bigjake <kitz@mit.edu>
 *
 */

public abstract class BaseTask implements TaskInt {

    private static Logger log = Logger.getLogger(BaseTask.class);

    private InitialContext ctx;
    private String nextPage;
    private boolean nextPageInternal;

    public BaseTask() {
        setInitialContext(null);
        setNextPage(null);
        setNextPageInternal(true);
    }

    public abstract void processStep(String step) throws Exception;

    public void setInitialContext(InitialContext ctx) {
        this.ctx = ctx;
    }

    public InitialContext getInitialContext() {
        return ctx;
    }

    public void setNextPage(String nextPage) {
        this.nextPage = nextPage;
    }

    public String getNextPage() {
        return nextPage;
    }

    public void setNextPageInternal(boolean nextPageInternal) {
        this.nextPageInternal = nextPageInternal;
    }

    public boolean getNextPageInternal() {
        return this.nextPageInternal;
    }

    public void servletPreAction(HttpServletRequest request, HttpServletResponse response)
            throws Exception {
    }

    public void servletPostAction(HttpServletRequest request, HttpServletResponse response)
            throws Exception {
    }

    public abstract void setAttributes(String paramName, String paramValues[]);

}

