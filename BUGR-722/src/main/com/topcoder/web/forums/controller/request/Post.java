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
import com.topcoder.web.forums.controller.ForumsUtil;

/**
 * @author mtong
 *         <p/>
 *         Provides logic to work with a message after a user decides to create a new thread, or edit/reply
 *         to an existing message.
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
        String tempMessageIDStr = StringUtils.checkNull(getRequest().getParameter(ForumConstants.TEMP_MESSAGE_ID));

        long forumID = -1;
        if (postMode.equals("New")) {
            forumID = Long.parseLong(forumIDStr);
        } else if (postMode.equals("Edit") || postMode.equals("Reply")) {
            long messageID = Long.parseLong(messageIDStr);
            ForumMessage message = forumFactory.getMessage(messageID);
            forumID = message.getForum().getID();
        }

        setDefault(ForumConstants.FORUM_ID, String.valueOf(forumID));
        setDefault(ForumConstants.MESSAGE_ID, getRequest().getParameter(ForumConstants.MESSAGE_ID));
        setDefault(ForumConstants.POST_MODE, postMode);

        Forum forum = forumFactory.getForum(forumID);
        if (!messageIDStr.equals("")) {
            ForumMessage message = forumFactory.getMessage(Long.parseLong(messageIDStr));
            String replySubject = message.getSubject();
            if (!replySubject.startsWith("Re: ")) {
                replySubject = "Re: " + replySubject;
            }

            if (postMode.equals("Reply")) {
                setDefault(ForumConstants.MESSAGE_SUBJECT, replySubject);
            }
            if (postMode.equals("Edit")) {
                if (!message.getUser().equals(user)) {
                    setNextPage(getSessionInfo().getServletPath() + "?module=Main");
                    setIsNextPageInContext(false);
                    return;
                }

                setDefault(ForumConstants.MESSAGE_SUBJECT, message.getUnfilteredSubject());
                setDefault(ForumConstants.MESSAGE_BODY, message.getUnfilteredBody());
            }
            getRequest().setAttribute("message", message);
            getRequest().setAttribute("thread", message.getForumThread());
        }

        if (postMode.equals("New") || postMode.equals("Reply")) {
            ForumMessage tempMessage = (ForumMessage) getRequest().getSession().
                    getAttribute("tempMessage_" + tempMessageIDStr);
            if (tempMessage == null) {
                getRequest().setAttribute(ForumConstants.TEMP_MESSAGE_ID, String.valueOf(ForumsUtil.tempMessageID));
                setDefault(ForumConstants.TEMP_MESSAGE_ID, String.valueOf(ForumsUtil.tempMessageID));
                tempMessage = forum.createMessage(user);
                getRequest().getSession().setAttribute("tempMessage_" + ForumsUtil.tempMessageID++, tempMessage);
            } else {
                getRequest().setAttribute(ForumConstants.TEMP_MESSAGE_ID, tempMessageIDStr);
                setDefault(ForumConstants.MESSAGE_SUBJECT, tempMessage.getSubject());
                setDefault(ForumConstants.MESSAGE_BODY, ForumsUtil.createTextAreaBody(tempMessage.getUnfilteredBody()));
                setDefault(ForumConstants.TEMP_MESSAGE_ID, getRequest().getParameter(ForumConstants.TEMP_MESSAGE_ID));
            }
            getRequest().setAttribute("tempMessage", tempMessage);
        }

        getRequest().setAttribute("forum", forum);
        getRequest().setAttribute("postMode", postMode);

        setNextPage("/post.jsp");
        setIsNextPageInContext(true);
    }
}