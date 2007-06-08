/*
 * Created on Apr 29, 2005
 */
package com.topcoder.web.forums.controller.request;

import com.jivesoftware.forum.Attachment;
import com.jivesoftware.forum.Forum;
import com.jivesoftware.forum.ForumMessage;
import com.jivesoftware.forum.ForumThread;
import com.topcoder.shared.security.ClassResource;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.forums.ForumConstants;
import com.topcoder.web.forums.controller.ForumsUtil;

import java.util.Iterator;

/**
 * @author mtong
 *         <p/>
 *         Displays a preview of the user's message, notifying the user if errors exist.
 */
public class PreviewMessage extends ForumsProcessor {
    protected void businessProcessing() throws Exception {
        super.businessProcessing();
        if (isGuest()) {
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));
        }

        long forumID = -1;
        long threadID = -1;
        long messageID = -1;

        Forum forum = null;
        ForumMessage message = null;
        ForumThread thread = null;

        String forumIDStr = StringUtils.checkNull(getRequest().getParameter(ForumConstants.FORUM_ID));
        String messageIDStr = StringUtils.checkNull(getRequest().getParameter(ForumConstants.MESSAGE_ID));
        String tempMessageIDStr = StringUtils.checkNull(getRequest().getParameter(ForumConstants.TEMP_MESSAGE_ID));
        String postMode = getRequest().getParameter(ForumConstants.POST_MODE);
        String subject = ForumsUtil.formatSubject(getRequest().getParameter(ForumConstants.MESSAGE_SUBJECT));
        String body = getRequest().getParameter(ForumConstants.MESSAGE_BODY).trim();
        String textareaBody = ForumsUtil.createTextAreaBody(body);

        if (postMode.equals("New")) {
            forumID = Long.parseLong(forumIDStr);
            forum = forumFactory.getForum(forumID);
        } else if (postMode.equals("Reply") || postMode.equals("Edit")) {
            messageID = Long.parseLong(messageIDStr);
            message = forumFactory.getMessage(messageID);
            forum = message.getForum();
            forumID = forum.getID();
            thread = message.getForumThread();
            threadID = thread.getID();
        } else {
            addError(ForumConstants.MESSAGE_SUBJECT, ForumConstants.ERR_POST_MODE_UNRECOGNIZED);
        }

        getRequest().setAttribute("forum", forum);
        getRequest().setAttribute("postMode", postMode);

        setDefault(ForumConstants.FORUM_ID, getRequest().getParameter(ForumConstants.FORUM_ID));
        setDefault(ForumConstants.MESSAGE_ID, getRequest().getParameter(ForumConstants.MESSAGE_ID));
        setDefault(ForumConstants.TEMP_MESSAGE_ID, getRequest().getParameter(ForumConstants.TEMP_MESSAGE_ID));
        setDefault(ForumConstants.POST_MODE, postMode);
        setDefault(ForumConstants.MESSAGE_SUBJECT, subject);
        setDefault(ForumConstants.MESSAGE_BODY, textareaBody);

        if (message != null && thread != null) {
            getRequest().setAttribute("thread", thread);
            getRequest().setAttribute("message", message);  // message for validation - only used if errors exist
            if (postMode.equals("Reply")) {
                getRequest().setAttribute("parentMessage", message);
            } else {
                getRequest().setAttribute("parentMessage", null);
            }
        }

        if (subject.trim().equals("")) {
            addError(ForumConstants.MESSAGE_SUBJECT, ForumConstants.ERR_EMPTY_MESSAGE_SUBJECT);
        }
        if (body.trim().equals("")) {
            addError(ForumConstants.MESSAGE_BODY, ForumConstants.ERR_EMPTY_MESSAGE_BODY);
        }
        if (subject.length() > ForumConstants.MESSAGE_SUBJECT_MAX_LENGTH) {
            addError(ForumConstants.MESSAGE_SUBJECT, ForumConstants.ERR_LONG_MESSAGE_SUBJECT);
        }
        if (body.length() > ForumConstants.MESSAGE_BODY_MAX_LENGTH) {
            addError(ForumConstants.MESSAGE_BODY, ForumConstants.ERR_LONG_MESSAGE_BODY);
        }
        if (hasErrors()) {
            ForumMessage tempMessage = (ForumMessage) getRequest().getSession().getAttribute("tempMessage_" + tempMessageIDStr);
            getRequest().setAttribute("tempMessage", tempMessage);
            setNextPage("/post.jsp");
            setIsNextPageInContext(true);
            return;
        }

        ForumMessage previewMessage = (ForumMessage) getRequest().getSession().getAttribute("tempMessage_" + tempMessageIDStr);
        if (previewMessage == null) {
            previewMessage = forum.createMessage(user);
        }
        previewMessage.setSubject(subject);
        previewMessage.setBody(body);
        if (postMode.equals("Edit")) {
            Iterator itAttachments = message.getAttachments();
            while (itAttachments.hasNext()) {
                Attachment attachment = (Attachment) itAttachments.next();
                previewMessage.createAttachment(attachment.getName(), attachment.getContentType(), attachment.getData());
            }
        }

        getRequest().setAttribute("message", previewMessage);

        setNextPage("/preview.jsp");
        setIsNextPageInContext(true);
    }
}