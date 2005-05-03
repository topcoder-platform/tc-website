/*
 * Created on Apr 29, 2005 (Eclipse)
 *
 * TODO To change the template for this generated file go to
 * Window - Preferences - Java - Code Style - Code Templates
 */
package com.topcoder.web.forums.controller.request;

import java.util.Iterator;

import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.forums.ForumConstants;

import com.jivesoftware.base.AuthFactory;
import com.jivesoftware.base.AuthToken;
import com.jivesoftware.forum.ForumFactory;

/**
 * @author mtong
 *
 * TODO To change the template for this generated type comment go to
 * Window - Preferences - Java - Code Style - Code Templates
 */
public class ThreadList extends BaseProcessor {
	protected void businessProcessing() throws Exception {
		long forumID = Long.parseLong(getRequest().getParameter(ForumConstants.FORUM_ID));
		AuthToken authToken = AuthFactory.getAnonymousAuthToken();
		Iterator itThreads = ForumFactory.getInstance(authToken).getForum(forumID).getThreads();
		getRequest().setAttribute("threads", itThreads);
		
		setNextPage("/viewForum.jsp?" + ForumConstants.FORUM_ID + "=" + forumID);
		setIsNextPageInContext(true);
	}
}