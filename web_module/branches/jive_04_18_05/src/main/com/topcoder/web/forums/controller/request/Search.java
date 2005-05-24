/*
 * Created on Apr 29, 2005
 */
package com.topcoder.web.forums.controller.request;

/**
 * @author mtong
 * 
 * Forwards to the search page.
 */
public class Search extends ForumsProcessor {
	protected void businessProcessing() throws Exception {
		super.businessProcessing();
		
		setNextPage("/search.jsp");
		setIsNextPageInContext(true);
	}
}