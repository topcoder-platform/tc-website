/*
 * Created on Apr 29, 2005
 */
package com.topcoder.web.forums.controller.request;

import java.util.Iterator;

import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.forums.ForumsProcessor;

import com.jivesoftware.base.AuthFactory;
import com.jivesoftware.base.AuthToken;
import com.jivesoftware.forum.ForumFactory;

/**
 * @author mtong
 */
public class ForumList extends ForumsProcessor {
	protected void businessProcessing() throws Exception {
		super.businessProcessing();
		
		//AuthToken authToken = AuthFactory.getAnonymousAuthToken();
		Iterator itForums = forumFactory.getForums();
		getRequest().setAttribute("forums", itForums);
		
		setNextPage("/main.jsp");
		setIsNextPageInContext(true);
	}
}