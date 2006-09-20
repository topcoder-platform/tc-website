/*
 * Created on May 2, 2006
 *
 * TODO To change the template for this generated file go to
 * Window - Preferences - Java - Code Style - Code Templates
 */
package com.topcoder.web.forums.controller.request.dde;

import java.util.Iterator;

import com.jivesoftware.forum.Attachment;
import com.jivesoftware.forum.ForumMessage;
import com.jivesoftware.forum.database.DbAttachment;
import com.topcoder.shared.security.ClassResource;
import com.topcoder.web.common.BaseServlet;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.forums.ForumConstants;

/**
 * @author billy
 * Removes attachment from message
 */
public class RemoveAttachment extends ForumsProcessor {
	protected void businessProcessing() throws Exception {
		super.businessProcessing();
        if (isGuest()) {
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));
        }
        
        String postMode = getRequest().getParameter(ForumConstants.POST_MODE);
        String messageIDStr = StringUtils.checkNull(getRequest().getParameter(ForumConstants.MESSAGE_ID));
        
        String strAttachmentID = getRequest().getParameter(ForumConstants.ATTACHMENT_ID);
        long attachmentID = Long.parseLong(strAttachmentID);
        DbAttachment attachment = new DbAttachment(attachmentID);
        
        ForumMessage messageToRemoveFrom = null;
        if (postMode.equals("New") || postMode.equals("Reply")) {
        	messageToRemoveFrom = (ForumMessage) getRequest().getSession().getAttribute("tempMessage"); 
        } else if (postMode.equals("Edit")) {
            long messageID = Long.parseLong(messageIDStr);
            messageToRemoveFrom = forumFactory.getMessage(messageID);
        }
        
        // make sure the current user is the one who uploaded the attachment
        boolean correctUser = ( (messageToRemoveFrom.getUser() == null)
        		|| (messageToRemoveFrom.getUser().getID() == user.getID())); 
    	if (!correctUser) {
    		getRequest().setAttribute(BaseServlet.MESSAGE_KEY, "You cannot edit messages created by other users.");
    		setNextPage("/errorPage.jsp");
    		setIsNextPageInContext(true);
    		return;
    	}
    	
        // check that the specified attachment is for the specified message
        boolean attachmentIsFromThisMessage = false;
        Iterator attachmentsIter = messageToRemoveFrom.getAttachments();
        while (attachmentsIter.hasNext()) {
        	Attachment curAttachment = (Attachment) attachmentsIter.next();
        	if(curAttachment.getID() == attachment.getID()) {
        		attachmentIsFromThisMessage = true;
        		break;
        	}
        }
        if (!attachmentIsFromThisMessage) {
    		getRequest().setAttribute(BaseServlet.MESSAGE_KEY, "Invalid attachment for the current message.");
    		setNextPage("/errorPage.jsp");
    		setIsNextPageInContext(true);
    		return;
    	}
        
        messageToRemoveFrom.deleteAttachment(attachment);
        
        // should be in a new window so just go to confirmation page
        setNextPage("/attachmentRemoved.jsp");
		setIsNextPageInContext(true);
	}	
}
