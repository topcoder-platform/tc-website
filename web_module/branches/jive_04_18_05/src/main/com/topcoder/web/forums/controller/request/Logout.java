/*
 * Created on Jun 6, 2005
 */
package com.topcoder.web.forums.controller.request;

import com.jivesoftware.base.AuthFactory;
import com.topcoder.web.common.TCWebException;

/**
 * @author mtong
 */
public class Logout extends ForumsProcessor {
    
    protected void businessProcessing() throws TCWebException {
        AuthFactory.logoutUser(getHttpRequest(), getHttpResponse());
        
        setNextPage("?module=ForumList");
        setIsNextPageInContext(false);
    }
}
