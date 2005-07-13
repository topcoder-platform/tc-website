/*
 * Created on May 10, 2005
 */
package com.topcoder.web.forums.controller.request;

import com.jivesoftware.base.AuthToken;
import com.jivesoftware.base.User;

import com.jivesoftware.forum.ForumFactory;

import com.topcoder.web.tc.controller.request.Base;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @author mtong
 * 
 * Base class for forum-related processors, providing message and user data.
 */
public abstract class ForumsProcessor extends Base {
    protected HttpServletRequest httpRequest;
    protected HttpServletResponse httpResponse;
    protected AuthToken authToken;
    protected ForumFactory forumFactory;
    protected User user;
    
    /**
     * Subclasses should do their work by implementing this method.
     */
    protected void businessProcessing() throws Exception {
        getRequest().setAttribute("authToken", authToken);
        getRequest().setAttribute("user", user);
    }
    
    public HttpServletRequest getHttpRequest() {
        return httpRequest;
    }
    
    public void setHttpRequest(HttpServletRequest httpRequest) {
        this.httpRequest = httpRequest;
    }
    
    public HttpServletResponse getHttpResponse() {
        return httpResponse;
    }
    
    public void setHttpResponse(HttpServletResponse httpResponse) {
        this.httpResponse = httpResponse;
    }
    
    public void setAuthToken(AuthToken authToken) {
    	this.authToken = authToken;
    }
    
    public void setUser(User user) {
        this.user = user;
    }
    
    public void setForumFactory(ForumFactory forumFactory) {
        this.forumFactory = forumFactory;
    }
    
    public boolean isGuest() {
    	return authToken.isAnonymous();
    }
}
