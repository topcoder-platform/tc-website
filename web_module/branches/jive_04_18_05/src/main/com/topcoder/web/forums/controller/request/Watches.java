/*
 * Created on Apr 29, 2005
 */
package com.topcoder.web.forums.controller.request;

/**
 * @author mtong
 * 
 * Forwards to the user's personal watchlist page.
 */
public class Watches extends ForumsProcessor {
	protected void businessProcessing() throws Exception {
		super.businessProcessing();
        
        getRequest().setAttribute("user", user);
		
		setNextPage("/watches.jsp");
		setIsNextPageInContext(true);
	}
}