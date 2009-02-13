/*
 * Created on Apr 29, 2005
 */
package com.topcoder.web.forums.controller.request;

import java.util.Iterator;

import com.topcoder.web.common.StringUtils;
import com.topcoder.web.forums.ForumConstants;
import com.topcoder.web.forums.model.Paging;

import com.jivesoftware.forum.Forum;
import com.jivesoftware.forum.ForumThread;
import com.jivesoftware.forum.ResultFilter;
import com.jivesoftware.forum.action.util.Paginator;
import com.jivesoftware.forum.stats.ViewCountManager;

/**
 * @author mtong
 * 
 * Processor containing logic to display the appropriate view of a thread (flat/hierarchical, 
 * paginated, etc.), depending on the user's preferences.
 */
public class Thread extends ForumsProcessor {
    
	protected void businessProcessing() throws Exception {
		super.businessProcessing();
		
        String error = StringUtils.checkNull(getRequest().getParameter(ForumConstants.THREAD_ERROR));
        if (error.equals(ForumConstants.WATCH_THREAD)) {
            addError(ForumConstants.WATCH_THREAD, ForumConstants.ERR_THREAD_WATCHES_EXCEEDED);
        }
        
        long threadID = Long.parseLong(getRequest().getParameter(ForumConstants.THREAD_ID));
        ForumThread thread = forumFactory.getForumThread(threadID);
        ViewCountManager.getInstance().addThreadCount(thread);
        Forum forum = thread.getForum();
        
        int startIdx = 0;
        if ((!StringUtils.checkNull(getRequest().getParameter(ForumConstants.START_IDX)).equals(""))) {
            startIdx = Integer.parseInt(getRequest().getParameter(ForumConstants.START_IDX));
        }
        int messageRange = ForumConstants.DEFAULT_MESSAGE_RANGE;
        if (user != null) {
            try {
                messageRange = Integer.parseInt(user.getProperty("jiveMessageRange"));
            } catch (Exception ignored) {}
        }
        
        ResultFilter resultFilter = ResultFilter.createDefaultMessageFilter();
        resultFilter.setStartIndex(startIdx);
        resultFilter.setNumResults(messageRange);
        int totalItemCount = thread.getMessageCount(resultFilter);
        
        Paging paging = new Paging(resultFilter, totalItemCount);
        Paginator paginator = new Paginator(paging);
        Iterator itMessages = null; 
		
		getRequest().setAttribute("forumFactory", forumFactory);
		getRequest().setAttribute("forum", forum);
		getRequest().setAttribute("thread", thread);
		getRequest().setAttribute("paginator", paginator);
        
        // Use the setting chosen on the page if selected, or the user's default
        // preference otherwise.
        String threadView = StringUtils.checkNull(getRequest().getParameter(ForumConstants.THREAD_VIEW));
        if (threadView.equals("flat") || 
                (threadView.equals("") && (authToken.isAnonymous() || user.getProperty("jiveThreadMode") == null) && ForumConstants.DEFAULT_GUEST_THREAD_VIEW.equals("flat")) ||
                (threadView.equals("") && user.getProperty("jiveThreadMode").equals("flat"))) {
            itMessages = thread.getMessages(resultFilter);
            setNextPage("/viewThreadFlat.jsp"); 
        } else if (threadView.equals("threaded") || 
                (threadView.equals("") && (authToken.isAnonymous() || user.getProperty("jiveThreadMode") == null) && ForumConstants.DEFAULT_GUEST_THREAD_VIEW.equals("threaded")) ||
                (threadView.equals("") && user.getProperty("jiveThreadMode").equals("threaded"))) {
            itMessages = thread.getTreeWalker().getRecursiveMessages();
            setNextPage("/viewThreadThreaded.jsp"); 
        } else if (threadView.equals("tree") || 
                (threadView.equals("") && (authToken.isAnonymous() || user.getProperty("jiveThreadMode") == null) && ForumConstants.DEFAULT_GUEST_THREAD_VIEW.equals("tree")) ||
                (threadView.equals("") && user.getProperty("jiveThreadMode").equals("tree"))) {
            String messageID = StringUtils.checkNull(getRequest().getParameter(ForumConstants.MESSAGE_ID));
            if (!messageID.equals("")) {
            	getRequest().setAttribute("activeMessage", thread.getMessage(Long.parseLong(messageID)));
            } else {
            	getRequest().setAttribute("activeMessage", thread.getRootMessage());
            }
            itMessages = thread.getTreeWalker().getRecursiveMessages();
            setNextPage("/viewThreadTree.jsp"); 
        }
		
		getRequest().setAttribute("messages", itMessages);
		setIsNextPageInContext(true);
	}
}