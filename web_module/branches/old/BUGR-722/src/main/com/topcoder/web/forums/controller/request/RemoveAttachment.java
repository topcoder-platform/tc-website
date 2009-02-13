/*
 * Created on May 2, 2006
 *
 * TODO To change the template for this generated file go to
 * Window - Preferences - Java - Code Style - Code Templates
 */
package com.topcoder.web.forums.controller.request;

import com.jivesoftware.base.UnauthorizedException;
import com.jivesoftware.forum.AttachmentException;
import com.jivesoftware.forum.Forum;
import com.jivesoftware.forum.ForumMessage;
import com.jivesoftware.forum.ForumPermissions;
import com.jivesoftware.forum.database.DbAttachment;
import com.topcoder.shared.security.ClassResource;
import com.topcoder.web.common.BaseServlet;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.forums.ForumConstants;
import com.topcoder.web.forums.controller.ForumsUtil;

/**
 * @author billy
 *         Removes attachment from message
 */
public class RemoveAttachment extends ForumsProcessor {
    protected void businessProcessing() throws Exception {
        super.businessProcessing();
        if (isGuest()) {
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));
        }

        String forumIDStr = StringUtils.checkNull(getRequest().getParameter(ForumConstants.FORUM_ID));
        String messageIDStr = StringUtils.checkNull(getRequest().getParameter(ForumConstants.MESSAGE_ID));
        String tempMessageIDStr = StringUtils.checkNull(getRequest().getParameter(ForumConstants.TEMP_MESSAGE_ID));
        String postMode = getRequest().getParameter(ForumConstants.POST_MODE);
        String subject = ForumsUtil.formatSubject(getRequest().getParameter(ForumConstants.MESSAGE_SUBJECT));
        String body = getRequest().getParameter(ForumConstants.MESSAGE_BODY).trim();

        String strAttachmentID = getRequest().getParameter(ForumConstants.ATTACHMENT_ID);
        long attachmentID = Long.parseLong(strAttachmentID);
        DbAttachment attachment = new DbAttachment(attachmentID);

        ForumMessage messageToRemoveFrom = null;
        if (postMode.equals("New") || postMode.equals("Reply")) {
            messageToRemoveFrom = (ForumMessage) getRequest().getSession().getAttribute("tempMessage_" + tempMessageIDStr);
        } else if (postMode.equals("Edit")) {
            long messageID = Long.parseLong(messageIDStr);
            messageToRemoveFrom = forumFactory.getMessage(messageID);
        }

        // make sure the current user is the one who uploaded the attachment
        boolean correctUser = (messageToRemoveFrom.getUser().getID() == user.getID());
        if (!correctUser) {
            getRequest().setAttribute(BaseServlet.MESSAGE_KEY, ForumConstants.ERR_CANNOT_EDIT_FOREIGN_POST);
            setNextPage("/errorPage.jsp");
            setIsNextPageInContext(true);
            return;
        }

        Forum forum = forumFactory.getForum(Long.parseLong(forumIDStr));
        if (!forum.isAuthorized(ForumPermissions.CREATE_MESSAGE_ATTACHMENT)) {
            getRequest().setAttribute(BaseServlet.MESSAGE_KEY, ForumConstants.ERR_ATTACHMENT_PERMS);
            setNextPage("/errorPage.jsp");
            setIsNextPageInContext(true);
            return;
        }

        try {
            messageToRemoveFrom.deleteAttachment(attachment);
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

        ForumMessage tempMessage = (ForumMessage) getRequest().getSession().getAttribute("tempMessage_" + tempMessageIDStr);
        if (tempMessage == null) {
            tempMessage = messageToRemoveFrom.getForum().createMessage(user);
        }
        tempMessage.setSubject(subject);
        tempMessage.setBody(body);


        StringBuffer urlNext = new StringBuffer(getSessionInfo().getServletPath()).append("?module=Post");
        urlNext.append("&").append(ForumConstants.FORUM_ID).append("=").append(forumIDStr);
        urlNext.append("&").append(ForumConstants.MESSAGE_ID).append("=").append(messageIDStr);
        if (!postMode.equals("Edit")) {
            urlNext.append("&").append(ForumConstants.TEMP_MESSAGE_ID).append("=").append(tempMessageIDStr);
        }
        urlNext.append("&").append(ForumConstants.POST_MODE).append("=").append(postMode);
        setNextPage(urlNext.toString());
        setIsNextPageInContext(false);
    }
}