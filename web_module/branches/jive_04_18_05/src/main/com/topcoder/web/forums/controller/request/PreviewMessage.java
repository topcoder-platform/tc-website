/*
 * Created on Apr 29, 2005
 */
package com.topcoder.web.forums.controller.request;

import com.jivesoftware.forum.Forum;
import com.jivesoftware.forum.ForumMessage;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.forums.ForumConstants;

/**
 * @author mtong
 */
public class PreviewMessage extends ForumsProcessor {
	protected void businessProcessing() throws Exception {
		super.businessProcessing();
		
        long forumID = Long.parseLong(getRequest().getParameter(ForumConstants.FORUM_ID));
        long threadID = -1;
        long messageID = -1;
        
        Forum forum = forumFactory.getForum(forumID);
        
        String threadIDStr = StringUtils.checkNull(getRequest().getParameter(ForumConstants.THREAD_ID));
        String messageIDStr = StringUtils.checkNull(getRequest().getParameter(ForumConstants.MESSAGE_ID));
        String postMode = getRequest().getParameter(ForumConstants.POST_MODE);
        String subject = getRequest().getParameter(ForumConstants.MESSAGE_SUBJECT).trim();
        String body = getRequest().getParameter(ForumConstants.MESSAGE_BODY).trim();
        
        getRequest().setAttribute("forumFactory", forumFactory);
        getRequest().setAttribute("user", user);
        getRequest().setAttribute("forum", forum);
        getRequest().setAttribute("postMode", postMode);
        
        setDefault(ForumConstants.FORUM_ID, getRequest().getParameter(ForumConstants.FORUM_ID));
        setDefault(ForumConstants.THREAD_ID, getRequest().getParameter(ForumConstants.THREAD_ID));
        setDefault(ForumConstants.MESSAGE_ID, getRequest().getParameter(ForumConstants.MESSAGE_ID));
        setDefault(ForumConstants.POST_MODE, postMode);
        setDefault(ForumConstants.MESSAGE_SUBJECT, subject);
        setDefault(ForumConstants.MESSAGE_BODY, body);
        
        if (threadIDStr.equals("") || messageIDStr.equals("")) {
            getRequest().setAttribute("thread", null);
            getRequest().setAttribute("message", null);
        } else {
            ForumMessage message = forumFactory.getMessage(Long.parseLong(messageIDStr));
            getRequest().setAttribute("thread", message.getForumThread());
            getRequest().setAttribute("message", message);
            if (postMode.equals("Reply")) {
            	getRequest().setAttribute("parentMessage", message);
            } else {
            	getRequest().setAttribute("parentMessage", null);
            }
        }
        
		if (getRequest().getParameter(ForumConstants.MESSAGE_SUBJECT).trim().equals("")) {
			addError(ForumConstants.MESSAGE_SUBJECT, ForumConstants.ERR_EMPTY_MESSAGE_SUBJECT);
		}
		if (getRequest().getParameter(ForumConstants.MESSAGE_BODY).trim().equals("")) {
			addError(ForumConstants.MESSAGE_BODY, ForumConstants.ERR_EMPTY_MESSAGE_BODY);
		}
        if (body.length() > ForumConstants.MESSAGE_BODY_MAX_LENGTH) {
            addError(ForumConstants.MESSAGE_BODY, ForumConstants.ERR_LONG_MESSAGE_BODY);
        }
		if (hasErrors()) {
            setNextPage("/post.jsp");
            setIsNextPageInContext(true);
            return;
		}
        
        ForumMessage message = forum.createMessage(user);
        message.setSubject(getRequest().getParameter(ForumConstants.MESSAGE_SUBJECT));
        message.setBody(getRequest().getParameter(ForumConstants.MESSAGE_BODY));
		
        getRequest().setAttribute("message", message);        
        
		setNextPage("/preview.jsp");
		setIsNextPageInContext(true);
	}
}