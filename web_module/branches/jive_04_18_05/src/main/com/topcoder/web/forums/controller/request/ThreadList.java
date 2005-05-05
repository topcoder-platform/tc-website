/*
 * Created on Apr 29, 2005 (Eclipse)
 *
 * TODO To change the template for this generated file go to
 * Window - Preferences - Java - Code Style - Code Templates
 */
package com.topcoder.web.forums.controller.request;

import java.util.Iterator;

import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.forums.ForumConstants;

import com.jivesoftware.base.AuthFactory;
import com.jivesoftware.base.AuthToken;
import com.jivesoftware.base.User;

import com.jivesoftware.forum.ForumFactory;
import com.jivesoftware.forum.Forum;
import com.jivesoftware.forum.ResultFilter;
import com.jivesoftware.forum.action.util.Pageable;
import com.jivesoftware.forum.action.util.Paginator;

/**
 * @author mtong
 *
 * TODO To change the template for this generated type comment go to
 * Window - Preferences - Java - Code Style - Code Templates
 */
public class ThreadList extends BaseProcessor implements Pageable {
	private long forumID;
	private int start = 0;
	private int totalItemCount;
	
	private ResultFilter resultFilter;
	private Forum forum;
	private User user;
	
	protected void businessProcessing() throws Exception {
		forumID = Long.parseLong(getRequest().getParameter(ForumConstants.FORUM_ID));
		AuthToken authToken = AuthFactory.getAnonymousAuthToken();
		ForumFactory forumFactory = ForumFactory.getInstance(authToken);
		forum = forumFactory.getForum(forumID);
		user = forumFactory.getUserManager().getUser("mktong");
		
		initPagingFields();
		Paginator paginator = new Paginator(this);
		Iterator itThreads = forum.getThreads(getResultFilter());
		
		getRequest().setAttribute("forum", forum);
		getRequest().setAttribute("threads", itThreads);
		getRequest().setAttribute("user", user);
		getRequest().setAttribute("paginator", paginator);
		
		setNextPage("/viewForum.jsp");
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
        resultFilter = ResultFilter.createDefaultThreadFilter();
        resultFilter.setStartIndex(getStart());
        int threadRange = 15;
        if (user != null) {
            try {
                threadRange = Integer.parseInt(user.getProperty("jiveThreadRange"));
            } catch (Exception ignored) {}
        }
        resultFilter.setNumResults(threadRange);

        // Compute the total # of items (threads in this case)
        totalItemCount = forum.getThreadCount(getResultFilter());
    }
}