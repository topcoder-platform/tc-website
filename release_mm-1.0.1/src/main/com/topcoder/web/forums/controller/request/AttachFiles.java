/*
 * Created on Apr 29, 2005
 */
package com.topcoder.web.forums.controller.request;

import com.jivesoftware.base.UnauthorizedException;
import com.jivesoftware.forum.AttachmentException;
import com.jivesoftware.forum.Forum;
import com.jivesoftware.forum.ForumMessage;
import com.jivesoftware.forum.ForumPermissions;
import com.jivesoftware.forum.ForumThread;
import com.jivesoftware.forum.database.DbAttachment;
import com.topcoder.shared.security.ClassResource;
import com.topcoder.web.common.BaseServlet;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.forums.ForumConstants;
import com.topcoder.web.forums.controller.ForumsUtil;

/**
 * @author billy
 *         <p/>
 *         Forwards to attachfiles.jsp
 */
public class AttachFiles extends ForumsProcessor {
    protected void businessProcessing() throws Exception {
        super.businessProcessing();
        if (isGuest()) {
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));
        }

        long forumID = -1;
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
        } else if (postMode.equals("Reply")) {
            messageID = Long.parseLong(messageIDStr);
            message = forumFactory.getMessage(messageID);
            forum = message.getForum();
            forumID = forum.getID();
            thread = message.getForumThread();
        } else {
            addError(ForumConstants.MESSAGE_SUBJECT, ForumConstants.ERR_POST_MODE_UNRECOGNIZED);
        }

        if (!forum.isAuthorized(ForumPermissions.CREATE_MESSAGE_ATTACHMENT)) {
            getRequest().setAttribute(BaseServlet.MESSAGE_KEY, ForumConstants.ERR_ATTACHMENT_PERMS);
            setNextPage("/errorPage.jsp");
            setIsNextPageInContext(true);
            return;
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

        if (hasErrors()) {
            ForumMessage tempMessage = (ForumMessage) getRequest().getSession().getAttribute("tempMessage_" + tempMessageIDStr);
            getRequest().setAttribute("tempMessage", tempMessage);
            setNextPage("/post.jsp");
            setIsNextPageInContext(true);
            return;
        }

        ForumMessage tempMessage =
                (ForumMessage) getRequest().getSession().getAttribute("tempMessage_" + tempMessageIDStr);
        if (tempMessage == null) {
            tempMessage = forum.createMessage(user);
        }
        tempMessage.setSubject(subject);
        tempMessage.setBody(body);

        getRequest().setAttribute("message", tempMessage);

        String status = StringUtils.checkNull(getRequest().getParameter(ForumConstants.STATUS));
        if (status.equals(ForumConstants.STATUS_DELETE)) {
            // deleted specified attachment
            String attachmentIDStr = StringUtils.checkNull(getRequest().getParameter(ForumConstants.ATTACHMENT_ID));
            long attachmentID = Long.parseLong(attachmentIDStr);
            DbAttachment attachment = new DbAttachment(attachmentID);

            boolean correctUser = (tempMessage.getUser().getID() == user.getID());
            if (!correctUser) {
                getRequest().setAttribute(BaseServlet.MESSAGE_KEY, ForumConstants.ERR_CANNOT_EDIT_FOREIGN_POST);
                setNextPage("/errorPage.jsp");
                setIsNextPageInContext(true);
                return;
            }

            try {
                tempMessage.deleteAttachment(attachment);
            } catch (Exception e) {
                if (e instanceof UnauthorizedException) {
                    getRequest().setAttribute(BaseServlet.MESSAGE_KEY, ForumConstants.ERR_ATTACHMENT_DELETE_PERMS);
                } else if (e instanceof AttachmentException) {
                    getRequest().setAttribute(BaseServlet.MESSAGE_KEY, ForumConstants.ERR_ATTACHMENT_NOT_FOUND);
                }
                setNextPage("/errorPage.jsp");
                setIsNextPageInContext(true);
                return;
            }
        }

        setNextPage("/attachfiles.jsp");
        setIsNextPageInContext(true);
    }
}