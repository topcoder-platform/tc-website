/*
 * Created on Apr 29, 2005
 */
package com.topcoder.web.forums.controller.request;

/**
 * @author mtong
 */
public class Watches extends ForumsProcessor {
	protected void businessProcessing() throws Exception {
		super.businessProcessing();
        
        getRequest().setAttribute("user", user);
		
		setNextPage("/userSettings.jsp");
		setIsNextPageInContext(true);
	}
}