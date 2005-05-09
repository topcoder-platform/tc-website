/*
 * Created on Apr 29, 2005 (Eclipse)
 *
 * TODO To change the template for this generated file go to
 * Window - Preferences - Java - Code Style - Code Templates
 */
package com.topcoder.web.forums.controller.request;

import com.jivesoftware.base.AuthFactory;
import com.jivesoftware.base.AuthToken;
import com.jivesoftware.forum.ForumFactory;
import com.jivesoftware.forum.ForumMessage;

import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.forums.ForumConstants;


/**
 * @author mtong
 *
 * TODO To change the template for this generated type comment go to
 * Window - Preferences - Java - Code Style - Code Templates
 */
public class EditMessage extends BaseProcessor {

	protected void businessProcessing() throws Exception {
		AuthToken authToken = AuthFactory.getAnonymousAuthToken();
		ForumFactory forumFactory = ForumFactory.getInstance(authToken);
		
		// forumID, threadID, potentially messageID for edit
		setDefault(ForumConstants.FORUM_ID, getRequest().getParameter(ForumConstants.FORUM_ID));
		setDefault(ForumConstants.THREAD_ID, getRequest().getParameter(ForumConstants.THREAD_ID));
		setDefault(ForumConstants.MESSAGE_ID, getRequest().getParameter(ForumConstants.MESSAGE_ID));
		
		if (hasParameter(ForumConstants.MESSAGE_ID)) {
			ForumMessage message = forumFactory.getMessage(Long.parseLong(getRequest().getParameter(ForumConstants.MESSAGE_ID)));
			setDefault(ForumConstants.MESSAGE_SUBJECT, "Re: " + message.getSubject());
		}
		
		//if (hasParameter(ForumConstants.MESSAGE_ID)) {
		//	ForumMessage message = forumFactory.getMessage(getRequest().getParameter(ForumConstants.MESSAGE_ID));			
		//}
		
		getRequest().setAttribute("forumFactory", forumFactory);
		
		setNextPage("/post.jsp");
		setIsNextPageInContext(true);
	}
}