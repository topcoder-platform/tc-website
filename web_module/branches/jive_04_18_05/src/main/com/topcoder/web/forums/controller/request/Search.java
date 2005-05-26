/*
 * Created on Apr 29, 2005
 */
package com.topcoder.web.forums.controller.request;

import java.util.Iterator;
import com.jivesoftware.base.JiveConstants;
import com.jivesoftware.forum.ResultFilter;

/**
 * @author mtong
 * 
 * Forwards to the search page.
 */
public class Search extends ForumsProcessor {
	protected void businessProcessing() throws Exception {
		super.businessProcessing();
		
        ResultFilter resultFilter = new ResultFilter();
        resultFilter.setSortField(JiveConstants.FORUM_NAME);
        resultFilter.setSortOrder(ResultFilter.ASCENDING);
        Iterator itForums = forumFactory.getForums(resultFilter);
        
        getRequest().setAttribute("forums", itForums);
        
		setNextPage("/search.jsp");
		setIsNextPageInContext(true);
	}
}