/*
 * Created on May 10, 2005
 */
package com.topcoder.web.forums;

import com.jivesoftware.base.AuthFactory;
import com.jivesoftware.base.AuthToken;
import com.jivesoftware.base.User;
import com.jivesoftware.base.UnauthorizedException;

import com.jivesoftware.forum.ForumFactory;

import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.forums.controller.ForumsServlet;

import com.topcoder.shared.security.SimpleResource;

/**
 * @author mtong
 */
public abstract class ForumsProcessor extends BaseProcessor {
    protected AuthToken authToken;
    protected ForumFactory forumFactory;
    protected User user;
    
    /**
     * Subclasses should do their work by implementing this method.
     */
    protected void businessProcessing() throws Exception {
    	//authToken = (AuthToken)getRequest().getAttribute(ForumsServlet.AUTH_TOKEN_KEY);
    	authToken = AuthFactory.getAuthToken("tomek","password");
    	forumFactory = ForumFactory.getInstance(authToken);
    	user = forumFactory.getUserManager().getUser(authToken.getUserID());
    	//throw new PermissionException(getUser(), new SimpleResource("JiveForums"));
    }
}
