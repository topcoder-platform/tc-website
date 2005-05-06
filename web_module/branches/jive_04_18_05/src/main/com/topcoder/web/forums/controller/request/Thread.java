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
import com.topcoder.web.forums.model.TCUserManager;
import com.topcoder.web.forums.model.TCUser;

import com.jivesoftware.base.AuthFactory;
import com.jivesoftware.base.AuthToken;
import com.jivesoftware.base.User;
import com.jivesoftware.base.UserManagerFactory;

import com.jivesoftware.forum.Forum;
import com.jivesoftware.forum.ForumFactory;
import com.jivesoftware.forum.ForumThread;
import com.jivesoftware.forum.ResultFilter;
import com.jivesoftware.forum.action.util.Pageable;
import com.jivesoftware.forum.action.util.Paginator;

/**
 * @author mtong
 *
 * TODO To change the template for this generated type comment go to
 * Window - Preferences - Java - Code Style - Code Templates
 */
public class Thread extends BaseProcessor implements Pageable {
	private long threadID;
	private int start = 0;
	private int totalItemCount;
	
	private ResultFilter resultFilter;
	private ForumThread thread;
	private User user;
	
	protected void businessProcessing() throws Exception {
		threadID = Long.parseLong(getRequest().getParameter(ForumConstants.THREAD_ID));
		AuthToken authToken = AuthFactory.getAnonymousAuthToken();
		ForumFactory forumFactory = ForumFactory.getInstance(authToken);
		thread = forumFactory.getForumThread(threadID);
		Forum forum = thread.getForum();
		TCUserManager userManager = (TCUserManager)UserManagerFactory.getInstance();
		//user = userManager.getUser("mktong");
		System.out.println("userID: " + userManager.getUserID("mktong"));
		//TCUserManager userManager = (TCUserManager)forumFactory.getUserManager();
		TCUser sampleUser = (TCUser)userManager.getUser(129063);
		System.out.println("ID: " + sampleUser.getID());
		System.out.println("handle: " + sampleUser.getHandle());
		System.out.println("image path: " + sampleUser.getImagePath());
		//user = userManager.getUser(129063);
		
		initPagingFields();
		Paginator paginator = new Paginator(this);
		Iterator itMessages = thread.getMessages(getResultFilter());
		
		getRequest().setAttribute("forumFactory", forumFactory);
		getRequest().setAttribute("forum", forum);
		getRequest().setAttribute("thread", thread);
		getRequest().setAttribute("messages", itMessages);
		getRequest().setAttribute("user", user);
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