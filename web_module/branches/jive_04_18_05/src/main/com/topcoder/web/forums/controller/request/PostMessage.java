/*
 * Created on Apr 29, 2005
 */
package com.topcoder.web.forums.controller.request;

import java.util.Iterator;

import com.topcoder.web.common.StringUtils;
import com.topcoder.web.forums.ForumConstants;
import com.topcoder.web.forums.ForumsProcessor;

import com.topcoder.shared.util.ApplicationServer;

import com.jivesoftware.forum.Forum;
import com.jivesoftware.forum.ForumThread;
import com.jivesoftware.forum.ForumMessage;
import com.jivesoftware.forum.ResultFilter;
import com.jivesoftware.forum.action.util.Pageable;
import com.jivesoftware.forum.action.util.Paginator;

import javax.transaction.Status;
import javax.transaction.TransactionManager;

/**
 * @author mtong
 */
public class PostMessage extends ForumsProcessor implements Pageable {
	private int start = 0;
	private int totalItemCount;
	private ResultFilter resultFilter;
	private ForumThread thread;
	
	protected void businessProcessing() throws Exception {
		super.businessProcessing();
		
		long forumID = Long.parseLong(getRequest().getParameter(ForumConstants.FORUM_ID));
		long threadID;
		long messageID;
		
		Forum forum = forumFactory.getForum(forumID);
		
		String threadIDStr = StringUtils.checkNull(getRequest().getParameter(ForumConstants.THREAD_ID));
		String messageIDStr = StringUtils.checkNull(getRequest().getParameter(ForumConstants.MESSAGE_ID));
		String postMode = getRequest().getParameter(ForumConstants.POST_MODE);
		
		System.out.println("forumID: " + forumID);
		System.out.println("threadIDstr: " + threadIDStr);
		System.out.println("messageIDstr: " + messageIDStr);
		
		TransactionManager tm = null;
		try { 
			tm = (TransactionManager) getInitialContext().lookup("java:/TransactionManager");
		    System.out.println("transaction obtained");
			
		    ForumMessage message;
			if (!messageIDStr.equals("") && !postMode.equals("Reply")) {
				messageID = Long.parseLong(messageIDStr);
				message = forumFactory.getMessage(messageID);
			} else {
				message = forum.createMessage(user);
			} System.out.println("message obtained");
			if (!threadIDStr.equals("")) {
				threadID = Long.parseLong(threadIDStr);
			} else {
				ForumThread newThread = forum.createThread(message);
				forum.addThread(newThread);
				threadID = newThread.getID();
			}
			System.out.println("messageID: " + message.getID());
			System.out.println("threadID: " + threadID);
			
			if (message.getSubject().trim().equals("")) {
				addError(ForumConstants.MESSAGE_SUBJECT, "Message subject is empty");
			}
			if (message.getBody().trim().equals("")) {
				addError(ForumConstants.MESSAGE_BODY, "Message body is empty");
			}
			
			thread = forum.getThread(threadID);
			getRequest().setAttribute("thread", thread);
			
			tm.commit();
		} catch (Exception e) {
			System.out.println("EXCEPTION!!!!!!");
			e.printStackTrace();
			if (tm != null && tm.getStatus() == Status.STATUS_ACTIVE) {
                tm.rollback();
            }
		}		
		
		initPagingFields();
		Paginator paginator = new Paginator(this);
		Iterator itMessages = thread.getMessages(getResultFilter());
	
		getRequest().setAttribute("forumFactory", forumFactory);
		getRequest().setAttribute("forum", forum);
		getRequest().setAttribute("messages", itMessages);
		getRequest().setAttribute("paginator", paginator);
		
		setNextPage("/viewThread.jsp");
		setIsNextPageInContext(true);
	}
	
	public int getStart() {
		if (start == -1) {
            initPagingFields();
        }
        return start;
	}
     
    public int getTotalItemCount() {
    	if (totalItemCount == -1) {
            initPagingFields();
        }
        return totalItemCount;
    }
    
    public ResultFilter getResultFilter() {
    	if (resultFilter == null) {
            initPagingFields();
        }
        return resultFilter;
    }
    
    protected void initPagingFields() {
    	// Set view to latest post; this may be modified in the future
    	start = thread.getMessageCount()-1;
    	
        resultFilter = ResultFilter.createDefaultMessageFilter();
        resultFilter.setStartIndex(getStart());
        int messageRange = 15;
        if (user != null) {
            try {
                messageRange = Integer.parseInt(user.getProperty("jiveMessageRange"));
            } catch (Exception ignored) {}
        }
        resultFilter.setNumResults(messageRange);

        // Compute the total # of items (messages in this case)
        totalItemCount = thread.getMessageCount(getResultFilter());
    }
}