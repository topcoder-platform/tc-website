/*
 * Created on May 10, 2005
 */
package com.topcoder.web.forums.controller.request;

import com.jivesoftware.base.AuthToken;
import com.jivesoftware.base.User;

import com.jivesoftware.forum.ForumFactory;

import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.forums.controller.ForumsServlet;

import com.topcoder.shared.security.SimpleResource;
import com.topcoder.shared.util.logging.Logger;

/**
 * @author mtong
 * 
 * Base class for forum-related processors, providing message and user data.
 */
public abstract class ForumsProcessor extends BaseProcessor {
    protected AuthToken authToken;
    protected ForumFactory forumFactory;
    protected User user;
    
    private final static Logger log = Logger.getLogger(ForumsProcessor.class);
    
    /**
     * Subclasses should do their work by implementing this method.
     */
    protected void businessProcessing() throws Exception {
    	forumFactory = ForumFactory.getInstance(authToken);
    	user = forumFactory.getUserManager().getUser(authToken.getUserID());
        log.debug("*** Obtaining user: " + user.getUsername() + " | Email: " + user.getEmail());
    	//throw new PermissionException(getUser(), new SimpleResource("Forums"));
    }
    
    public void setAuthToken(AuthToken authToken) {
    	this.authToken = authToken;
    }
    
    public boolean isGuest() {
    	return authToken.isAnonymous();
    }
}
