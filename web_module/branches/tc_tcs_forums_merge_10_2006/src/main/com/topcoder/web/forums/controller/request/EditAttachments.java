// make sure user has permission to edit attachments!

/*
 * Created on Oct 23, 2006
 */
package com.topcoder.web.forums.controller.request;

import com.jivesoftware.forum.Forum;
import com.jivesoftware.forum.ForumMessage;
import com.jivesoftware.forum.ForumThread;
import com.topcoder.shared.security.ClassResource;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.forums.controller.ForumsUtil;
import com.topcoder.web.forums.ForumConstants;

/**
 * @author mtong
 * 
 * Allows the user to edit attachments for an existing message.
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
        String subject = com.jivesoftware.util.StringUtils.escapeHTMLTags(
                getRequest().getParameter(ForumConstants.MESSAGE_SUBJECT).trim());
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
        
        getRequest().setAttribute("forum", forum);
        getRequest().setAttribute("postMode", "Edit");
        
        setDefault(ForumConstants.FORUM_ID, getRequest().getParameter(ForumConstants.FORUM_ID));
        setDefault(ForumConstants.MESSAGE_ID, getRequest().getParameter(ForumConstants.MESSAGE_ID));
        setDefault(ForumConstants.POST_MODE, "Edit");
        setDefault(ForumConstants.MESSAGE_SUBJECT, subject);
        setDefault(ForumConstants.MESSAGE_BODY, textareaBody);
        
        getRequest().setAttribute("message", message);
        
        setNextPage("/attachfiles.jsp");
		setIsNextPageInContext(true);
	}
}