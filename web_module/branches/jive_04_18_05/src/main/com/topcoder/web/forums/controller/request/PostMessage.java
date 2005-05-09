/*
 * Created on Apr 29, 2005 (Eclipse)
 *
 * TODO To change the template for this generated file go to
 * Window - Preferences - Java - Code Style - Code Templates
 */
package com.topcoder.web.forums.controller.request;

import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.forums.ForumConstants;

import com.jivesoftware.base.AuthFactory;
import com.jivesoftware.base.AuthToken;
import com.jivesoftware.base.User;

import com.jivesoftware.forum.ForumFactory;

/**
 * @author mtong
 *
 * TODO To change the template for this generated type comment go to
 * Window - Preferences - Java - Code Style - Code Templates
 */
public class PostMessage extends BaseProcessor {
	private long forumID;
	private long threadID;
	private long messageID;
	private String mode;
	
	protected void businessProcessing() throws Exception {
		mode = getRequest().getParameter(ForumConstants.POST_MODE);
		if (mode.equals("New")) {
			forumID = Long.parseLong(getRequest().getParameter(ForumConstants.FORUM_ID));
		} else if (mode.equals("Reply")) {
			forumID = Long.parseLong(getRequest().getParameter(ForumConstants.FORUM_ID));
			threadID = Long.parseLong(getRequest().getParameter(ForumConstants.THREAD_ID));
			messageID = Long.parseLong(getRequest().getParameter(ForumConstants.MESSAGE_ID));
		}
		
		AuthToken authToken = AuthFactory.getAnonymousAuthToken();
		ForumFactory forumFactory = ForumFactory.getInstance(authToken);
		User user = forumFactory.getUserManager().getUser("mktong");
		
		getRequest().setAttribute("forumFactory", forumFactory);
		getRequest().setAttribute("user", user);
		
		setNextPage("/post.jsp");
		setIsNextPageInContext(true);
	}
}