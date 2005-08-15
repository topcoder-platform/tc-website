/*
 * Created on Apr 29, 2005
 */
package com.topcoder.web.forums.controller.request;

import com.jivesoftware.forum.Forum;
import com.jivesoftware.forum.ForumMessage;
import com.topcoder.shared.security.ClassResource;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.forums.ForumConstants;

/**
 * @author mtong
 *
 * Provides logic to work with a message after a user decides to create a new thread, or edit/reply
 * to an existing message.
 */
public class Post extends ForumsProcessor {

	protected void businessProcessing() throws Exception {
		super.businessProcessing();
        if (isGuest()) {
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));
        }

		String postMode = getRequest().getParameter(ForumConstants.POST_MODE);        
        String forumIDStr = StringUtils.checkNull(getRequest().getParameter(ForumConstants.FORUM_ID));
        String messageIDStr = StringUtils.checkNull(getRequest().getParameter(ForumConstants.MESSAGE_ID));
        
        long forumID = -1;
        if (postMode.equals("New")) {
            forumID = Long.parseLong(forumIDStr);
        } else if (postMode.equals("Edit") || postMode.equals("Reply")) {
            long messageID = Long.parseLong(messageIDStr);
            ForumMessage message = forumFactory.getMessage(messageID);
            forumID = message.getForum().getID();
        }

		setDefault(ForumConstants.FORUM_ID, getRequest().getParameter(ForumConstants.FORUM_ID));
		setDefault(ForumConstants.MESSAGE_ID, getRequest().getParameter(ForumConstants.MESSAGE_ID));
		setDefault(ForumConstants.POST_MODE, postMode);

        Forum forum = forumFactory.getForum(forumID);
        if (!messageIDStr.equals("")) {
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
                setDefault(ForumConstants.MESSAGE_BODY, message.getUnfilteredBody());
            }
            getRequest().setAttribute("message", message);
            getRequest().setAttribute("thread", message.getForumThread());
        }

		getRequest().setAttribute("forumFactory", forumFactory);
        getRequest().setAttribute("forum", forum);
        getRequest().setAttribute("postMode", postMode);

        setNextPage("/post.jsp");
		setIsNextPageInContext(true);
	}
}