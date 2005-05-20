/*
 * Created on Apr 29, 2005
 */
package com.topcoder.web.forums.controller.request;

import java.util.Iterator;

import com.topcoder.web.forums.ForumConstants;
import com.topcoder.web.forums.model.Paging;

import com.jivesoftware.base.User;
import com.jivesoftware.forum.ResultFilter;
import com.jivesoftware.forum.action.util.Paginator;


/**
 * @author mtong
 */
public class History extends ForumsProcessor {
	protected void businessProcessing() throws Exception {
		super.businessProcessing();
		
        long userID = Long.parseLong(getRequest().getParameter(ForumConstants.USER_ID));
        User user = forumFactory.getUserManager().getUser(userID);
        int startIdx = 0;
        if (getRequest().getParameter(ForumConstants.START_IDX) != null) {
            startIdx = Integer.parseInt(getRequest().getParameter(ForumConstants.START_IDX));
        }
        
        int range = 10;
        if (user != null) {
            try {
                range = Integer.parseInt(user.getProperty("jiveHistoryRange"));
            } catch (Exception ignored) {}
        }
        
        ResultFilter resultFilter = ResultFilter.createDefaultMessageFilter();
        resultFilter.setSortOrder(ResultFilter.DESCENDING);
        resultFilter.setStartIndex(startIdx);
        resultFilter.setNumResults(range);
        int totalItemCount = forumFactory.getUserMessageCount(user, resultFilter);
        
        Paging paging = new Paging(resultFilter, totalItemCount);
        Paginator paginator = new Paginator(paging);
        Iterator itMessages = forumFactory.getUserMessages(user, resultFilter);
        
        getRequest().setAttribute("forumFactory", forumFactory);
        getRequest().setAttribute("user", user);
        getRequest().setAttribute("messages", itMessages);
        getRequest().setAttribute("paginator", paginator);
		
		setNextPage("/postHistory.jsp");
		setIsNextPageInContext(true);
	}
}