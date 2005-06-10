/*
 * Created on Apr 29, 2005
 */
package com.topcoder.web.forums.controller.request;

import java.util.Iterator;
import java.util.Calendar;

import com.topcoder.web.common.StringUtils;
import com.topcoder.web.forums.ForumConstants;
import com.topcoder.web.forums.model.Paging;

import com.jivesoftware.base.JiveConstants;
import com.jivesoftware.base.User;
import com.jivesoftware.base.UserNotFoundException;

import com.jivesoftware.forum.ResultFilter;
import com.jivesoftware.forum.Query;
import com.jivesoftware.forum.Forum;
import com.jivesoftware.forum.action.util.Paginator;

/**
 * @author mtong
 * 
 * Forwards to the search page.
 */
public class Search extends ForumsProcessor {
	protected void businessProcessing() throws Exception {
		super.businessProcessing();
		
        ResultFilter resultFilter = new ResultFilter();
        resultFilter.setSortField(JiveConstants.FORUM_NAME);
        resultFilter.setSortOrder(ResultFilter.ASCENDING);
        Iterator itForums = forumFactory.getForums(resultFilter);
        
        getRequest().setAttribute("forums", itForums);
        
        String status = StringUtils.checkNull(getRequest().getParameter(ForumConstants.SEARCH_STATUS));
        if (status.equals("search")) {
            String queryTerms = getRequest().getParameter(ForumConstants.SEARCH_QUERY);
            String searchScope = getRequest().getParameter(ForumConstants.SEARCH_SCOPE);
            String dateRange = getRequest().getParameter(ForumConstants.SEARCH_DATE_RANGE);
            String userHandle = StringUtils.checkNull(getRequest().getParameter(ForumConstants.SEARCH_HANDLE));
            User user = null;
            
            int resultSize = ForumConstants.DEFAULT_SEARCH_RESULT_SIZE;
            if (!StringUtils.checkNull(getRequest().getParameter(ForumConstants.SEARCH_RESULT_SIZE)).equals("")) {
                resultSize = Integer.parseInt(getRequest().getParameter(ForumConstants.SEARCH_RESULT_SIZE));
            }
            int startIdx = 0;
            if (!StringUtils.checkNull(getRequest().getParameter(ForumConstants.START_IDX)).equals("")) {
                startIdx = Integer.parseInt(getRequest().getParameter(ForumConstants.START_IDX));
            }
            
            if (queryTerms.length() <= 0) {
                addError(ForumConstants.SEARCH_QUERY, ForumConstants.ERR_NO_SEARCH_TERMS);
            }
            if (!userHandle.equals("")) {
                try {
                	user = forumFactory.getUserManager().getUser(userHandle);
                } catch (UserNotFoundException une) {
                	addError(ForumConstants.SEARCH_HANDLE, ForumConstants.ERR_NO_SEARCH_HANDLE);
                }
            }
            if (hasErrors()) {                
                setNextPage("/search.jsp");
                setIsNextPageInContext(true);
                return;
            }
            
            Query query = null;
            if (searchScope.equals("all")) {
                query = forumFactory.createQuery();
            } else if (searchScope.startsWith("f")) {
            	long forumID = Long.parseLong(searchScope.substring(1));
                Forum forum = forumFactory.getForum(forumID);
                query = forum.createQuery();
            }
            query.setQueryString(queryTerms);
            
            if (!dateRange.equals("all")) {
            	Calendar calendar = Calendar.getInstance();
                String[] dateValues = dateRange.split("/");	
                int month = Integer.parseInt(dateValues[0]);
                int day = Integer.parseInt(dateValues[1]);
                int year = Integer.parseInt(dateValues[2]);
                calendar.set(year, month, day);
                query.setAfterDate(calendar.getTime());
            }
            
            if (!userHandle.equals("")) {
            	query.filterOnUser(user);
            }
            
            ResultFilter pageFilter = new ResultFilter();
            pageFilter.setStartIndex(startIdx);
            pageFilter.setNumResults(resultSize);
            pageFilter.setSortField(Query.RELEVANCE);
            pageFilter.setSortOrder(ResultFilter.DESCENDING);
            int totalItemCount = query.getResultCount();
            
            Paging paging = new Paging(pageFilter, totalItemCount);
            Paginator paginator = new Paginator(paging);
            Iterator itResults = query.getResults(startIdx, resultSize);
            
            getRequest().setAttribute("status", status);
            getRequest().setAttribute("query", query);
            getRequest().setAttribute("searchScope", searchScope);
            getRequest().setAttribute("results", itResults);
            getRequest().setAttribute("paginator", paginator);
        }
        
		setNextPage("/search.jsp");
		setIsNextPageInContext(true);
	}
}