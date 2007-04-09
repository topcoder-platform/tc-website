package com.topcoder.web.reg.controller.request;

import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.BaseServlet;
import com.topcoder.web.common.TCWebException;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Apr 27, 2006
 */
public class Logout extends Base {

    protected static final Logger log = Logger.getLogger(Logout.class);

    protected void registrationProcessing() throws TCWebException {

        // Logs the user out
        getAuthentication().logout();

        // Invalidates the session
        getRequest().getSession().invalidate();
        getRequest().getSession(true);

        // Go to active contests page
        String nextpage = (String)getRequest().getAttribute(BaseServlet.NEXT_PAGE_KEY);
        if (nextpage == null) nextpage = getRequest().getParameter(BaseServlet.NEXT_PAGE_KEY);
        if (nextpage == null) nextpage = getRequest().getHeader("Referer");
        if (nextpage == null) nextpage = getSessionInfo().getAbsoluteServletPath();
        setNextPage(nextpage);
        setIsNextPageInContext(false);
    }

}
