/*
 * Created on May 10, 2005
 */
package com.topcoder.web.forums.controller.request;

import com.jivesoftware.base.AuthToken;
import com.jivesoftware.base.User;

import com.jivesoftware.forum.ForumFactory;

import com.topcoder.web.tc.controller.request.Base;

/**
 * @author mtong
 * 
 * Base class for forum-related processors, providing message and user data.
 */
public abstract class ForumsProcessor extends Base {
    protected AuthToken authToken;
    protected ForumFactory forumFactory;
    protected User user;
    
    /**
     * Subclasses should do their work by implementing this method.
     */
    protected void businessProcessing() throws Exception {
    	forumFactory = ForumFactory.getInstance(authToken);
        if (authToken.isAnonymous()) {
        	user = null;
        } else {
        	user = forumFactory.getUserManager().getUser(authToken.getUserID());
        }
        getRequest().setAttribute("authToken", authToken);
        getRequest().setAttribute("user", user);
    }
    
    public void setAuthToken(AuthToken authToken) {
    	this.authToken = authToken;
    }
    
    public boolean isGuest() {
    	return authToken.isAnonymous();
    }
}
