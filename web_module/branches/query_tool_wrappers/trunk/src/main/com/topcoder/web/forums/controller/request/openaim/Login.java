/*
 * Created on Aug 11, 2006
 */
package com.topcoder.web.forums.controller.request.openaim;

import com.topcoder.web.forums.controller.request.ForumsProcessor;


/**
 * @author mtong
 *         <p/>
 *         Forwards the user to the main page (does nothing).
 */
public class Login extends ForumsProcessor {
    protected void businessProcessing() throws Exception {
        super.businessProcessing();

        setNextPage(getSessionInfo().getServletPath() + "?module=Main");
        setIsNextPageInContext(false);
    }
}