/*
 * Created on Apr 29, 2005
 */
package com.topcoder.web.forums.controller.request;

import java.util.Iterator;

import com.topcoder.web.forums.ForumConstants;
import com.topcoder.web.forums.ForumsProcessor;

import com.jivesoftware.forum.ForumThread;
import com.jivesoftware.forum.ForumMessage;
import com.jivesoftware.forum.ResultFilter;

import com.jivesoftware.base.JiveConstants;

/**
 * @author mtong
 * 
 * Redirects the message request to the appropriate Thread page.
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
			
			ResultFilter filter = new ResultFilter();
			filter.setSortField(JiveConstants.MODIFICATION_DATE);
			filter.setSortOrder(ResultFilter.ASCENDING);
			Iterator messageIter = thread.getMessages(filter);			
			while (messageIter.hasNext()) {
			    if (((ForumMessage)messageIter.next()).getID() == message.getID()) {
			    	break;
			    }
			    messageIdx++;
			}
			
			long messageRange = Long.parseLong(user.getProperty("jiveMessageRange"));
			long startIdx = (messageIdx/messageRange)*messageRange;
			urlNext.append("&").append(ForumConstants.START_IDX).append("=").append(startIdx); 
		}
		urlNext.append("&mc=").append(thread.getMessageCount());
		
		setNextPage(urlNext.toString());
		setIsNextPageInContext(false);
	}
}