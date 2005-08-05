/*
 * Created on Jun 6, 2005
 */
package com.topcoder.web.forums.controller.request;

import com.jivesoftware.base.AuthFactory;
import com.topcoder.web.common.BaseServlet;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.TCWebException;

/**
 * @author mtong
 * 
 * Logs out of the forums.
 */
public class Logout extends ForumsProcessor {

    protected void businessProcessing() throws TCWebException {
        String dest = StringUtils.checkNull(getRequest().getParameter(BaseServlet.NEXT_PAGE_KEY));

        AuthFactory.logoutUser(getHttpRequest(), getHttpResponse());
        getAuthentication().logout();
        getRequest().getSession().invalidate();

        setNextPage(dest);
        setIsNextPageInContext(false);
    }
}
