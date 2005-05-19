/*
 * Created on Apr 29, 2005
 */
package com.topcoder.web.forums.controller.request;

import com.jivesoftware.forum.ForumMessage;

import com.topcoder.web.common.StringUtils;
import com.topcoder.web.forums.ForumConstants;

/**
 * @author mtong
 */
public class Post extends ForumsProcessor {

	protected void businessProcessing() throws Exception {
		super.businessProcessing();
		
		String postMode = getRequest().getParameter(ForumConstants.POST_MODE);
        long forumID = Long.parseLong(getRequest().getParameter(ForumConstants.FORUM_ID));
        String threadIDStr = StringUtils.checkNull(getRequest().getParameter(ForumConstants.THREAD_ID));
        String messageIDStr = StringUtils.checkNull(getRequest().getParameter(ForumConstants.MESSAGE_ID));
        
		setDefault(ForumConstants.FORUM_ID, getRequest().getParameter(ForumConstants.FORUM_ID));
		setDefault(ForumConstants.THREAD_ID, getRequest().getParameter(ForumConstants.THREAD_ID));
		setDefault(ForumConstants.MESSAGE_ID, getRequest().getParameter(ForumConstants.MESSAGE_ID));
		setDefault(ForumConstants.POST_MODE, postMode);
		
        if (threadIDStr.equals("") || messageIDStr.equals("")) {
            getRequest().setAttribute("thread", null);
            getRequest().setAttribute("message", null);
        } else {
            ForumMessage message = forumFactory.getMessage(Long.parseLong(messageIDStr));
            String replySubject = message.getSubject();
            String editSubject = message.getSubject();
            if (!replySubject.startsWith("Re: ")) {
                replySubject = "Re: " + replySubject;
            }
            if (!editSubject.startsWith("Edit: ")) {
                editSubject = "Edit: " + editSubject;
            }
            
            if (postMode.equals("Reply")) {
                setDefault(ForumConstants.MESSAGE_SUBJECT, replySubject);
            }
            if (postMode.equals("Edit")) {
                setDefault(ForumConstants.MESSAGE_SUBJECT, message.getSubject());
                setDefault(ForumConstants.MESSAGE_BODY, message.getBody());
            }
            getRequest().setAttribute("thread", message.getForumThread());
            getRequest().setAttribute("message", message);
        }
	
		getRequest().setAttribute("forumFactory", forumFactory);
		getRequest().setAttribute("user", user);
        getRequest().setAttribute("forum", forumFactory.getForum(forumID));
		
		setNextPage("/post.jsp");
		setIsNextPageInContext(true);
	}
}