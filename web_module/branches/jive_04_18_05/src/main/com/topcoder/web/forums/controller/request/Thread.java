/*
 * Created on Apr 29, 2005
 */
package com.topcoder.web.forums.controller.request;

import java.util.Iterator;

import com.topcoder.web.forums.ForumConstants;
import com.topcoder.web.forums.ForumsProcessor;

import com.jivesoftware.forum.Forum;
import com.jivesoftware.forum.ForumThread;
import com.jivesoftware.forum.ResultFilter;
import com.jivesoftware.forum.action.util.Pageable;
import com.jivesoftware.forum.action.util.Paginator;
import com.jivesoftware.forum.stats.ViewCountManager;

/**
 * @author mtong
 */
public class Thread extends ForumsProcessor implements Pageable {
	private long threadID;
	private int start = 0;
	private int totalItemCount;
	
	private ResultFilter resultFilter;
	private ForumThread thread;
	
	protected void businessProcessing() throws Exception {
		super.businessProcessing();
		
		threadID = Long.parseLong(getRequest().getParameter(ForumConstants.THREAD_ID));
		thread = forumFactory.getForumThread(threadID);
		ViewCountManager.getInstance().addThreadCount(thread);
		Forum forum = thread.getForum();
		
		initPagingFields();
		Paginator paginator = new Paginator(this);
		Iterator itMessages = null; 
		
		getRequest().setAttribute("user", user);
		getRequest().setAttribute("forumFactory", forumFactory);
		getRequest().setAttribute("forum", forum);
		getRequest().setAttribute("thread", thread);
		getRequest().setAttribute("paginator", paginator);
		
		if (user.getProperty("jiveThreadMode").equals("flat")) {
			itMessages = thread.getMessages(getResultFilter());
			setNextPage("/viewThreadFlat.jsp");	
		} else if (user.getProperty("jiveThreadMode").equals("threaded")) {
			itMessages = thread.getTreeWalker().getRecursiveMessages();
			setNextPage("/viewThreadThreaded.jsp");	
		}
		
		getRequest().setAttribute("messages", itMessages);
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
		if (getRequest().getParameter(ForumConstants.START_IDX) != null) {
			start = Integer.parseInt(getRequest().getParameter(ForumConstants.START_IDX));
		}
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