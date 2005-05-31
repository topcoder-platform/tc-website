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
        
        String status = StringUtils.checkNull(getRequest().getParameter(ForumConstants.SEARCH_STATUS));
        if (status.equals("save")) {
            String queryTerms = getRequest().getParameter("queryTerms");
            String searchScope = getRequest().getParameter("searchScope");
            String dateRange = getRequest().getParameter("dateRange");
            String userHandle = StringUtils.checkNull(getRequest().getParameter("userHandle"));
            int resultSize = Integer.parseInt(getRequest().getParameter("resultSize"));
                
            int startIdx = 0;
            if (!StringUtils.checkNull(getRequest().getParameter(ForumConstants.START_IDX)).equals("")) {
                startIdx = Integer.parseInt(getRequest().getParameter(ForumConstants.START_IDX));
            }
            
            Query query = null;
            if (searchScope.equals("all")) {
                query = forumFactory.createQuery();
            } else if (searchScope.startsWith("f")) {
            	long forumID = Long.parseLong(searchScope.substring(1));
                Forum forum = forumFactory.getForum(forumID);
                query = forum.createQuery();
            }
            
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
            	query.filterOnUser(forumFactory.getUserManager().getUser(userHandle));
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
            
            getRequest().setAttribute("results", itResults);
            getRequest().setAttribute("paginator", paginator);
        }
        
        getRequest().setAttribute("forums", itForums);
        
		setNextPage("/search.jsp");
		setIsNextPageInContext(true);
	}
}