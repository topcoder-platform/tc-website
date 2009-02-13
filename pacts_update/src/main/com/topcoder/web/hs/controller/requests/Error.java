package com.topcoder.web.hs.controller.requests;

import com.topcoder.web.common.TCWebException;
import com.topcoder.web.hs.common.Constants;

import java.io.PrintWriter;
import java.io.StringWriter;

/**
 * A RequestProcessor which handles an exception which occured during
 * a previous attempt at dispatching a request.  Unfortunately I can't
 * easily integrate this with the facility provided by the errorPage
 * property of a JSP &#64;page directive.
 *
 * @author Ambrose Feinstein
 */
public class Error extends Base {

    /**
     * Overriding this to avoid all the auth stuff.
     * The beans from the first attempt at processing will hang around in the request.
     */
    protected void baseProcessing() throws TCWebException {
    }

    protected void businessProcessing() throws TCWebException {

//@@@ err, this next blob is useless because the jsp does this stuff itself
        Exception e = (Exception) getRequest().getAttribute("exception");
        String en, et;
        if (e == null) {
            en = "Unknown Error";
            et = "No trace available";
        } else {
            en = e.toString();
            StringWriter sw = new StringWriter();
            PrintWriter pw = new PrintWriter(sw);
            e.printStackTrace(pw);
            et = sw.toString();
        }
        getRequest().setAttribute("error_name", en);
        getRequest().setAttribute("error_cause", et);

        setNextPage(Constants.error_page);
        setIsNextPageInContext(true);
    }
}
