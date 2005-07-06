/*
 * Created on Apr 29, 2005
 */
package com.topcoder.web.forums.controller.request;

import java.util.Iterator;

import com.jivesoftware.forum.ResultFilter;
import com.jivesoftware.base.JiveConstants;

/**
 * @author mtong
 * 
 * Provides the root list of forums.
 */
public class ForumList extends ForumsProcessor {
	protected void businessProcessing() throws Exception {
		super.businessProcessing();
		
        ResultFilter resultFilter = new ResultFilter();
        resultFilter.setSortField(JiveConstants.MODIFICATION_DATE);
        resultFilter.setSortOrder(ResultFilter.DESCENDING);
        
		Iterator itForums = forumFactory.getRootForumCategory().getForums(resultFilter);
        Iterator itSponsorForums = forumFactory.getForumCategory(6).getForums(resultFilter);

		getRequest().setAttribute("forums", itForums);
        getRequest().setAttribute("sponsorForums", itSponsorForums);
		
		setNextPage("/main.jsp");
		setIsNextPageInContext(true);
	}
}