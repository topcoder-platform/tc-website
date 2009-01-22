/*
 * Created on Jun 6, 2005
 * 
 * @author mktong
 */
package com.topcoder.web.forums.controller.request;

import com.jivesoftware.base.AuthFactory;
import com.topcoder.web.common.BaseServlet;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.TCWebException;

/**
 * @author mtong
 *         <p/>
 *         Logs out of the forums.
 */
public class Logout extends ForumsProcessor {

    protected void businessProcessing() throws TCWebException {
        String dest = StringUtils.checkNull(getRequest().getParameter(BaseServlet.NEXT_PAGE_KEY));

        AuthFactory.logoutUser(getRequest(), getResponse());
        getAuthentication().logout();
        getRequest().getSession().invalidate();

        setNextPage(dest);
        setIsNextPageInContext(false);
    }
}
