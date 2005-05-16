/*
 * Created on Apr 29, 2005
 */
package com.topcoder.web.forums.controller.request;

import com.jivesoftware.forum.ForumMessage;

import com.topcoder.web.forums.ForumsProcessor;
import com.topcoder.web.forums.ForumConstants;


/**
 * @author mtong
 */
public class Post extends ForumsProcessor {

	protected void businessProcessing() throws Exception {
		super.businessProcessing();
		
		String postMode = getRequest().getParameter(ForumConstants.POST_MODE);
		
		setDefault(ForumConstants.FORUM_ID, getRequest().getParameter(ForumConstants.FORUM_ID));
		setDefault(ForumConstants.THREAD_ID, getRequest().getParameter(ForumConstants.THREAD_ID));
		setDefault(ForumConstants.MESSAGE_ID, getRequest().getParameter(ForumConstants.MESSAGE_ID));
		setDefault(ForumConstants.POST_MODE, postMode);
		
		if (postMode.equals("Reply")) {
			ForumMessage message = forumFactory.getMessage(Long.parseLong(getRequest().getParameter(ForumConstants.MESSAGE_ID)));
			setDefault(ForumConstants.MESSAGE_SUBJECT, "Re: " + message.getSubject());
		}
		if (postMode.equals("Edit")) {
			ForumMessage message = forumFactory.getMessage(Long.parseLong(getRequest().getParameter(ForumConstants.MESSAGE_ID)));
			setDefault(ForumConstants.MESSAGE_SUBJECT, message.getSubject());
			setDefault(ForumConstants.MESSAGE_BODY, message.getBody());
		}
		
		//if (hasParameter(ForumConstants.MESSAGE_ID)) {
		//	ForumMessage message = forumFactory.getMessage(getRequest().getParameter(ForumConstants.MESSAGE_ID));			
		//}
		
		String postHeading = "";
		String postDesc = "";
		
		if (postMode.equals("NewThread")) {
			postHeading = "New Thread";
			postDesc = "Create a new thread";
		} else if (postMode.equals("NewMessage")) {
			postHeading = "New Message";
			postDesc = "Post a new message";
		} else if (postMode.equals("Reply")) {
			ForumMessage message = forumFactory.getMessage(Long.parseLong(getRequest().getParameter(ForumConstants.MESSAGE_ID)));
			postHeading = "Re: " + message.getSubject();
			postDesc = "Reply";
		} else if (postMode.equals("Edit")) {
			ForumMessage message = forumFactory.getMessage(Long.parseLong(getRequest().getParameter(ForumConstants.MESSAGE_ID)));
			postHeading = "Edit: " + message.getSubject();
			postDesc = "Edit message";
		}
		
		getRequest().setAttribute("forumFactory", forumFactory);
		getRequest().setAttribute("user", user);
		getRequest().setAttribute("postHeading", postHeading);
		getRequest().setAttribute("postDesc", postDesc);
		
		setNextPage("/post.jsp");
		setIsNextPageInContext(true);
	}
}