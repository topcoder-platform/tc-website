//@@@ ok, this seems really stupid now that i read about errorPage

package com.topcoder.web.hs.controller.requests;

import java.io.*;
import com.topcoder.web.hs.common.*;

/**
 * A RequestProcessor which handles an exception which occured during a previous attempt at dispatching a request.
 *
 * @author Ambrose Feinstein
 */
public class Error extends Base {

    /** Override this to avoid all the auth stuff. */
    protected void baseProcessing() throws Exception {
    }

    protected void businessProcessing() throws Exception {

        Exception e = (Exception)request.getAttribute("exception");
        String en, et;
        if(e==null) {
            en = "Unknown Error";
            et = "No trace available";
        } else {
            en = e.toString();
            StringWriter sw = new StringWriter();
            PrintWriter pw = new PrintWriter(sw);
            e.printStackTrace(pw);
            et = sw.toString();
        }
        request.setAttribute("error_name", en);
        request.setAttribute("error_cause", et);

        nav.setFolder(null);

        setNextPage(Constants.error_page);
        setIsNextPageInContext(true);
    }
}
