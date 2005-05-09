/*
 * Created on Apr 29, 2005 (Eclipse)
 *
 * TODO To change the template for this generated file go to
 * Window - Preferences - Java - Code Style - Code Templates
 */
package com.topcoder.web.forums.controller.request;

import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.forums.ForumConstants;

import com.jivesoftware.base.AuthFactory;
import com.jivesoftware.base.AuthToken;
import com.jivesoftware.base.User;

import com.jivesoftware.forum.ForumFactory;
import com.jivesoftware.forum.Forum;

/**
 * @author mtong
 *
 * 
 */
public class PostMessage extends BaseProcessor {	
	protected void businessProcessing() throws Exception {
		long forumID = Long.parseLong(getRequest().getParameter(ForumConstants.FORUM_ID));
		long threadID;
		long messageID;
		
		AuthToken authToken = AuthFactory.getAnonymousAuthToken();
		ForumFactory forumFactory = ForumFactory.getInstance(authToken);
		User user = forumFactory.getUserManager().getUser("mktong");
		Forum forum = forumFactory.getForum(forumID);
		
		String threadIDStr = StringUtils.checkNull(getRequest().getParameter(ForumConstants.THREAD_ID));
		String messageIDStr = StringUtils.checkNull(getRequest().getParameter(ForumConstants.MESSAGE_ID));
	
		TransactionManager tm = null;
		try { 
			tm = (TransactionManager) getInitialContext().lookup(ApplicationServer.TRANS_MANAGER);
		    
			if (!messageIDStr.equals("")) {
				messageID = Long.parseLong(messageIDStr);
			} else {
				messageID = forum.createMessage().getID();
			}
			
			tm.commit();
		} catch (Exception e) {
			if (tm != null && tm.getStatus() == Status.STATUS_ACTIVE) {
                tm.rollback();
            }
		}
		
		addError(ForumConstants.MESSAGE_SUBJECT, "Subject is empty");
		addError(ForumConstants.MESSAGE_BODY, "Message body is empty");
		
		messageID = Long.parseLong(getRequest().getParameter(ForumConstants.MESSAGE_ID));
		
		getRequest().setAttribute("forumFactory", forumFactory);
		getRequest().setAttribute("user", user);
		
		setNextPage("/post.jsp");
		setIsNextPageInContext(true);
	}
}