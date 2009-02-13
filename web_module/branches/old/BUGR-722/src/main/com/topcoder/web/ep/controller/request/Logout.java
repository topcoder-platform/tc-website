package com.topcoder.web.ep.controller.request;

import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.BaseProcessor;

/**
 * @author pulky
 * @version $Revision: 66662 $ Date: 2005/01/01 00:00:00
 *          Create Date: Apr 27, 2006
 */
public class Logout extends BaseProcessor {

    protected static final Logger log = Logger.getLogger(Logout.class);

    protected void businessProcessing() throws Exception {
        // Logs the user out
        getAuthentication().logout();

        // Invalidates the session
        getRequest().getSession().invalidate();

        setNextPage(getSessionInfo().getAbsoluteServletPath());
        setIsNextPageInContext(false);
    }
}
