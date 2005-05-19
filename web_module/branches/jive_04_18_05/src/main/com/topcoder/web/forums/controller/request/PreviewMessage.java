/*
 * Created on Apr 29, 2005
 */
package com.topcoder.web.forums.controller.request;

import com.topcoder.web.forums.ForumConstants;

/**
 * @author mtong
 */
public class PreviewMessage extends ForumsProcessor {
	protected void businessProcessing() throws Exception {
		super.businessProcessing();
		
		if (getRequest().getParameter(ForumConstants.MESSAGE_SUBJECT).trim().equals("")) {
			addError(ForumConstants.MESSAGE_SUBJECT, "Message subject is empty");
		}
		if (getRequest().getParameter(ForumConstants.MESSAGE_BODY).trim().equals("")) {
			addError(ForumConstants.MESSAGE_BODY, "Message body is empty");
		}
		if (hasErrors()) {
			getRequest().setAttribute("forumFactory", forumFactory);
			getRequest().setAttribute("user", user);
			getRequest().setAttribute("forum", getRequest().getParameter(ForumConstants.FORUM_ID));
			getRequest().setAttribute("thread", getRequest().getParameter(ForumConstants.THREAD_ID));
			getRequest().setAttribute("message", getRequest().getParameter(ForumConstants.MESSAGE_ID));
			getRequest().setAttribute("postHeading", "Message Preview");
			getRequest().setAttribute("postDesc", "Message Preview");
			
			setNextPage("/post.jsp");
			setIsNextPageInContext(true);
			return;
		}
		
		
		
		setNextPage("/preview.jsp");
		setIsNextPageInContext(true);
	}
}