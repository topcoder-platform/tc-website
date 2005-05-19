/*
 * Created on Apr 29, 2005
 */
package com.topcoder.web.forums.controller.request;

import com.topcoder.web.common.StringUtils;
import com.topcoder.web.forums.ForumConstants;

//import com.topcoder.shared.util.ApplicationServer;

import com.jivesoftware.forum.Forum;
import com.jivesoftware.forum.ForumThread;
import com.jivesoftware.forum.ForumMessage;

//import javax.transaction.Status;
//import javax.transaction.TransactionManager;

/**
 * @author mtong
 */
public class PostMessage extends ForumsProcessor {
	protected void businessProcessing() throws Exception {
		super.businessProcessing();
		
		long forumID = Long.parseLong(getRequest().getParameter(ForumConstants.FORUM_ID));
		long threadID = -1;
		long messageID = -1;
		
		Forum forum = forumFactory.getForum(forumID);
		
		String threadIDStr = StringUtils.checkNull(getRequest().getParameter(ForumConstants.THREAD_ID));
		String messageIDStr = StringUtils.checkNull(getRequest().getParameter(ForumConstants.MESSAGE_ID));
		String postMode = getRequest().getParameter(ForumConstants.POST_MODE);
		
		if (getRequest().getParameter(ForumConstants.MESSAGE_SUBJECT).trim().equals("")) {
			addError(ForumConstants.MESSAGE_SUBJECT, "Message subject is empty");
		}
		if (getRequest().getParameter(ForumConstants.MESSAGE_BODY).trim().equals("")) {
			addError(ForumConstants.MESSAGE_BODY, "Message body is empty");
		}
		if (hasErrors()) {
			setDefault(ForumConstants.FORUM_ID, getRequest().getParameter(ForumConstants.FORUM_ID));
			setDefault(ForumConstants.THREAD_ID, getRequest().getParameter(ForumConstants.THREAD_ID));
			setDefault(ForumConstants.MESSAGE_ID, getRequest().getParameter(ForumConstants.MESSAGE_ID));
			setDefault(ForumConstants.POST_MODE, postMode);
			// set defaults for subject, body
            
            if (threadIDStr.equals("") || messageIDStr.equals("")) {
                getRequest().setAttribute("thread", null);
                getRequest().setAttribute("message", null);
            } else {
                ForumMessage message = forumFactory.getMessage(Long.parseLong(messageIDStr));
                getRequest().setAttribute("thread", message.getForumThread());
                getRequest().setAttribute("message", message);
            }
			
			getRequest().setAttribute("forumFactory", forumFactory);
			getRequest().setAttribute("user", user);
			getRequest().setAttribute("forum", forum);
			
			setNextPage("/post.jsp");
			setIsNextPageInContext(true);
			return;
		}
		
		//tm = (TransactionManager) getInitialContext().lookup("java:/TransactionManager");
		
	    ForumMessage message;
	    ForumThread thread;
		if (!messageIDStr.equals("") && !postMode.equals("Reply")) {
			messageID = Long.parseLong(messageIDStr);
			message = forumFactory.getMessage(messageID);
		} else {
			message = forum.createMessage(user);
		}
		message.setSubject(getRequest().getParameter(ForumConstants.MESSAGE_SUBJECT));
		message.setBody(getRequest().getParameter(ForumConstants.MESSAGE_BODY));
		
		if (!threadIDStr.equals("")) {
			threadID = Long.parseLong(threadIDStr);
			thread = forum.getThread(threadID);
			if (postMode.equals("Reply")) {
				messageID = Long.parseLong(messageIDStr);
				ForumMessage parentMessage = forumFactory.getMessage(messageID);
				thread.addMessage(parentMessage, message);
			} else if (postMode.equals("NewMessage")) {
				thread.addMessage(null, message);
			}
		} else {
			thread = forum.createThread(message);
			forum.addThread(thread);
		}	
		
		//setNextPage("?module=Thread&" + ForumConstants.THREAD_ID + "=" +
		//		thread.getID() + "&mc=" + thread.getMessageCount() + "#" + message.getID());
		setNextPage("?module=Message&" + ForumConstants.MESSAGE_ID + "=" + message.getID());
		setIsNextPageInContext(false);
	}
}