/*
 * Created on Apr 29, 2005
 */
package com.topcoder.web.forums.controller.request;

import com.jivesoftware.base.JiveConstants;
import com.jivesoftware.base.JiveGlobals;
import com.jivesoftware.base.User;
import com.jivesoftware.base.UserNotFoundException;
import com.jivesoftware.forum.Forum;
import com.jivesoftware.forum.Query;
import com.jivesoftware.forum.ResultFilter;
import com.jivesoftware.forum.action.util.Paginator;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.forums.ForumConstants;
import com.topcoder.web.forums.model.Paging;

import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;

/**
 * @author mtong
 *
 * Forwards to the search page.
 */
public class Search extends ForumsProcessor {
    private boolean displayPerThread
        = JiveGlobals.getJiveBooleanProperty("search.results.groupByThread",true);

	protected void businessProcessing() throws Exception {
		super.businessProcessing();

        ResultFilter resultFilter = new ResultFilter();
        resultFilter.setSortField(JiveConstants.FORUM_NAME);
        resultFilter.setSortOrder(ResultFilter.ASCENDING);
        Iterator itForums = forumFactory.getForums(resultFilter);

        HashMap dates = new HashMap();
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(new Date());
        calendar.add(Calendar.DAY_OF_MONTH, -1);
        dates.put(ForumConstants.SEARCH_DATE_YESTERDAY, calendar.getTime());
        calendar.add(Calendar.DAY_OF_MONTH, -6);
        dates.put(ForumConstants.SEARCH_DATE_LAST_7_DAYS, calendar.getTime());
        calendar.add(Calendar.DAY_OF_MONTH, -23);
        dates.put(ForumConstants.SEARCH_DATE_LAST_30_DAYS, calendar.getTime());
        calendar.add(Calendar.DAY_OF_MONTH, -60);
        dates.put(ForumConstants.SEARCH_DATE_LAST_90_DAYS, calendar.getTime());
        calendar.add(Calendar.DAY_OF_MONTH, 90);
        calendar.set(calendar.get(Calendar.YEAR), Calendar.JANUARY, 1);
        dates.put(ForumConstants.SEARCH_DATE_THIS_YEAR, calendar.getTime());
        calendar.add(Calendar.YEAR, -1);
        dates.put(ForumConstants.SEARCH_DATE_LAST_YEAR, calendar.getTime());

        getRequest().setAttribute("forums", itForums);
        getRequest().setAttribute("dates", dates);

        String mode = StringUtils.checkNull(getRequest().getParameter(ForumConstants.SEARCH_MODE));
        String status = StringUtils.checkNull(getRequest().getParameter(ForumConstants.SEARCH_STATUS));

        if (mode.equals(ForumConstants.SEARCH_MODE_BASIC)) {
            setNextPage("/searchBasic.jsp");
        } else {
            setNextPage("/search.jsp");
        }
        setIsNextPageInContext(true);

        if (status.equals("search")) {
            String queryTerms = getRequest().getParameter(ForumConstants.SEARCH_QUERY);
            String searchScope = getRequest().getParameter(ForumConstants.SEARCH_SCOPE);
            String dateRange = getRequest().getParameter(ForumConstants.SEARCH_DATE_RANGE);
            String userHandle = StringUtils.checkNull(getRequest().getParameter(ForumConstants.SEARCH_HANDLE));
            String sortField = StringUtils.checkNull(getRequest().getParameter(ForumConstants.SEARCH_SORT_FIELD));
            User sortUser = null;

            int resultSize = ForumConstants.DEFAULT_SEARCH_RANGE;
            if (user != null) {
                try {
                    resultSize = Integer.parseInt(user.getProperty("jiveSearchRange"));
                } catch (Exception ignored) {}
            }
            if (!StringUtils.checkNull(getRequest().getParameter(ForumConstants.SEARCH_RESULT_SIZE)).equals("")) {
                resultSize = Integer.parseInt(getRequest().getParameter(ForumConstants.SEARCH_RESULT_SIZE));
            }
            int startIdx = 0;
            if (!StringUtils.checkNull(getRequest().getParameter(ForumConstants.START_IDX)).equals("")) {
                startIdx = Integer.parseInt(getRequest().getParameter(ForumConstants.START_IDX));
            }

            if (queryTerms.length() <= 0 && userHandle.equals("")) {
                addError(ForumConstants.SEARCH_QUERY, ForumConstants.ERR_NO_SEARCH_TERMS);
            }
            if (!userHandle.equals("")) {
                try {
                	sortUser = forumFactory.getUserManager().getUser(userHandle);
                } catch (UserNotFoundException une) {
                	addError(ForumConstants.SEARCH_HANDLE, ForumConstants.ERR_NO_SEARCH_HANDLE);
                }
            }
            if (hasErrors()) {
                status = "error";
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
                query.setAfterDate((Date)dates.get(dateRange));
            }

            if (sortUser instanceof User) {
            	query.filterOnUser(sortUser);
            }

            if (sortField.equals("") || Integer.parseInt(sortField) == Query.RELEVANCE) {
                query.setSortField(Query.RELEVANCE);
            } else if (Integer.parseInt(sortField) == Query.DATE) {
                query.setSortField(Query.DATE);
            }
            query.setSortOrder(ResultFilter.DESCENDING);

            ResultFilter pageFilter = new ResultFilter();
            pageFilter.setStartIndex(startIdx);
            pageFilter.setNumResults(resultSize);

            Iterator itResults = null;
            int totalItemCount = 0;
            if (displayPerThread) {
                itResults = query.getResultsByThread(startIdx, resultSize);
                totalItemCount = query.getResultByThreadCount();
            } else {
                itResults = query.getResults(startIdx, resultSize);
                totalItemCount = query.getResultCount();
            }

            Paging paging = new Paging(pageFilter, totalItemCount);
            Paginator paginator = new Paginator(paging);

            getRequest().setAttribute("status", status);
            getRequest().setAttribute("query", query);
            getRequest().setAttribute("dateRange", dateRange);
            getRequest().setAttribute("searchScope", searchScope);
            getRequest().setAttribute("results", itResults);
            getRequest().setAttribute("paginator", paginator);
            getRequest().setAttribute("mode", mode);
        }
	}
}