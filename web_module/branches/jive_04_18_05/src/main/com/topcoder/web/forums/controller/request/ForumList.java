/*
 * Created on Apr 29, 2005
 */
package com.topcoder.web.forums.controller.request;

import java.util.Iterator;

import com.jivesoftware.forum.ResultFilter;


/**
 * @author mtong
 */
public class ForumList extends ForumsProcessor {
	protected void businessProcessing() throws Exception {
		super.businessProcessing();
		
		Iterator itForums = forumFactory.getForums(new ResultFilter());
		getRequest().setAttribute("forums", itForums);
		
		setNextPage("/main.jsp");
		setIsNextPageInContext(true);
	}
}