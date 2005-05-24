/*
 * Created on Apr 29, 2005
 */
package com.topcoder.web.forums.controller.request;

import java.util.Iterator;

import com.topcoder.web.forums.ForumConstants;

import com.jivesoftware.forum.ForumThread;
import com.jivesoftware.forum.ForumMessage;

/**
 * @author mtong
 * 
 * Given a message ID, redirects the message request to the appropriate Thread view.
 */ 
public class Message extends ForumsProcessor {	
	protected void businessProcessing() throws Exception {
		super.businessProcessing();
		
		long messageID = Long.parseLong(getRequest().getParameter(ForumConstants.MESSAGE_ID));
		ForumMessage message = forumFactory.getMessage(messageID);
		ForumThread thread = message.getForumThread();
		
		StringBuffer urlNext = new StringBuffer();
		urlNext.append("?module=Thread&").append(ForumConstants.THREAD_ID).append("=").append(thread.getID());
		if (user.getProperty("jiveThreadMode").equals("flat")) {
			long messageIdx = 0;
			Iterator messageIter = thread.getMessages();			
			while (messageIter.hasNext()) {
			    if (((ForumMessage)messageIter.next()).getID() == messageID) {
			    	break;
			    }
			    messageIdx++;
			}
			
			long messageRange = Long.parseLong(user.getProperty("jiveMessageRange"));
			long startIdx = (messageIdx/messageRange)*messageRange;
			urlNext.append("&").append(ForumConstants.START_IDX).append("=").append(startIdx);
		}
		urlNext.append("&mc=").append(thread.getMessageCount());
		urlNext.append("#").append(messageID);
		
		setNextPage(urlNext.toString());
		setIsNextPageInContext(false);
	}
}