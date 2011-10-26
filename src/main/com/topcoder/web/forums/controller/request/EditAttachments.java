// make sure user has permission to edit attachments!

/*
 * Created on Oct 23, 2006
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
 * @author mtong
 *         <p/>
 *         Allows the user to edit attachments for an existing message.
 */
public class EditAttachments extends ForumsProcessor {
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

        String messageIDStr = StringUtils.checkNull(getRequest().getParameter(ForumConstants.MESSAGE_ID));
        String subject = ForumsUtil.formatSubject(getRequest().getParameter(ForumConstants.MESSAGE_SUBJECT));
        String body = getRequest().getParameter(ForumConstants.MESSAGE_BODY).trim();
        String textareaBody = ForumsUtil.createTextAreaBody(body);

        messageID = Long.parseLong(messageIDStr);
        message = forumFactory.getMessage(messageID);
        forum = message.getForum();
        forumID = forum.getID();
        thread = message.getForumThread();

        if (!message.getUser().equals(user)) {
            setNextPage(getSessionInfo().getServletPath() + "?module=Main");
            setIsNextPageInContext(false);
            return;
        }

        if (!forum.isAuthorized(ForumPermissions.CREATE_MESSAGE_ATTACHMENT)) {
            getRequest().setAttribute(BaseServlet.MESSAGE_KEY, ForumConstants.ERR_ATTACHMENT_PERMS);
            setNextPage("/errorPage.jsp");
            setIsNextPageInContext(true);
            return;
        }

        getRequest().setAttribute("forum", forum);
        getRequest().setAttribute("postMode", "Edit");

        setDefault(ForumConstants.FORUM_ID, String.valueOf(forumID));
        setDefault(ForumConstants.MESSAGE_ID, String.valueOf(messageID));
        setDefault(ForumConstants.POST_MODE, "Edit");
        setDefault(ForumConstants.MESSAGE_SUBJECT, subject);
        setDefault(ForumConstants.MESSAGE_BODY, textareaBody);

        String status = StringUtils.checkNull(getRequest().getParameter(ForumConstants.STATUS));
        if (status.equals(ForumConstants.STATUS_DELETE)) {
            // deleted specified attachment
            String attachmentIDStr = StringUtils.checkNull(getRequest().getParameter(ForumConstants.ATTACHMENT_ID));
            long attachmentID = Long.parseLong(attachmentIDStr);
            DbAttachment attachment = new DbAttachment(attachmentID);

            try {
                message.deleteAttachment(attachment);
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

        getRequest().setAttribute("message", message);

        setNextPage("/attachfiles.jsp");
        setIsNextPageInContext(true);
    }
}