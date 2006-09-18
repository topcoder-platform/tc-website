/*
 * Created on Apr 29, 2005
 */
package com.topcoder.web.forums.controller.request.dde;

import javax.naming.InitialContext;

import com.jivesoftware.base.Log;
import com.jivesoftware.forum.Forum;
import com.jivesoftware.forum.ForumMessage;
import com.jivesoftware.forum.ForumThread;
import com.topcoder.shared.security.ClassResource;
import com.topcoder.shared.util.TCContext;
import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.ejb.messagehistory.MessageHistory;
import com.topcoder.web.forums.controller.ForumsUtil;
import com.topcoder.web.forums.ForumConstants;

/**
 * @author billy
 * 
 * Forwards to attachfiles.jsp
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
        String postMode = getRequest().getParameter(ForumConstants.POST_MODE);
        String subject = com.jivesoftware.util.StringUtils.escapeHTMLTags(
                getRequest().getParameter(ForumConstants.MESSAGE_SUBJECT).trim());
        String body = getRequest().getParameter(ForumConstants.MESSAGE_BODY).trim();
        String textareaBody = ForumsUtil.createTextAreaBody(body);
        
        if (postMode.equals("New")) {
            forumID = Long.parseLong(forumIDStr);
            forum = forumFactory.getForum(forumID);
            message = (ForumMessage)getRequest().getAttribute("message");
        } else if (postMode.equals("Reply") || postMode.equals("Edit")) {
            messageID = Long.parseLong(messageIDStr);
            message = forumFactory.getMessage(messageID);
            forum = message.getForum();
            forumID = forum.getID();
            thread = message.getForumThread();
        } else {
            addError(ForumConstants.MESSAGE_SUBJECT, ForumConstants.ERR_POST_MODE_UNRECOGNIZED);
        }
        
        InitialContext ctx = null;
        MessageHistory historyBean = null;
        try {
            ctx = TCContext.getInitial();
            historyBean = (MessageHistory)createEJB(ctx, MessageHistory.class);
        } catch (Exception e) {
            Log.error(e);
        } finally {
            BaseProcessor.close(ctx);
        }
        
        getRequest().setAttribute("forumFactory", forumFactory);
        getRequest().setAttribute("forum", forum);
        getRequest().setAttribute("postMode", postMode);
        getRequest().setAttribute("historyBean", historyBean);
        
        setDefault(ForumConstants.FORUM_ID, getRequest().getParameter(ForumConstants.FORUM_ID));
        setDefault(ForumConstants.MESSAGE_ID, getRequest().getParameter(ForumConstants.MESSAGE_ID));
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
        /*
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
        */
		if (hasErrors()) {
            setNextPage("/post.jsp");
            setIsNextPageInContext(true);
            return;
		}
		
        ForumMessage previewMessage = forum.createMessage(user);   // message for preview
        previewMessage.setSubject(subject);
        previewMessage.setBody(body);
        
        getRequest().setAttribute("message", previewMessage);
        //getRequest().setAttribute("tempMessage", getRequest().getAttribute("tempMessage")); 
        //getRequest().setAttribute("tempMessage", getRequest().getAttribute("tempMessage"));
        
        setNextPage("/attachfiles.jsp");
		setIsNextPageInContext(true);
	}
}