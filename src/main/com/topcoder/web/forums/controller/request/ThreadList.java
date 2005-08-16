/*
 * Created on Apr 29, 2005
 */
package com.topcoder.web.forums.controller.request;

import com.jivesoftware.base.JiveConstants;
import com.jivesoftware.forum.Forum;
import com.jivesoftware.forum.ResultFilter;
import com.jivesoftware.forum.action.util.Paginator;
import com.jivesoftware.forum.ForumThreadIterator;
import com.jivesoftware.forum.stats.ViewCountManager;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.forums.ForumConstants;
import com.topcoder.web.forums.model.Paging;

/**
 * @author mtong
 *
 * Processor for viewing a forum (list of threads).
 */
public class ThreadList extends ForumsProcessor {
	protected void businessProcessing() throws Exception {
		super.businessProcessing();

		long forumID = Long.parseLong(getRequest().getParameter(ForumConstants.FORUM_ID));
		Forum forum = forumFactory.getForum(forumID);
		ViewCountManager.getInstance().addForumCount(forum);

        int startIdx = 0;
        if ((!StringUtils.checkNull(getRequest().getParameter(ForumConstants.START_IDX)).equals(""))) {
            startIdx = Integer.parseInt(getRequest().getParameter(ForumConstants.START_IDX));
            getRequest().getSession().setAttribute("tc.forum." + forumID + ".start", new Integer(startIdx));
            log.debug("ThreadList: " + startIdx + " set");
        }
        int threadRange = ForumConstants.DEFAULT_THREAD_RANGE;
        if (user != null) {
            try {
                threadRange = Integer.parseInt(user.getProperty("jiveThreadRange"));
            } catch (Exception ignored) {}
        }

        String sortField = StringUtils.checkNull(getRequest().getParameter(ForumConstants.SORT_FIELD));
        String sortOrder = StringUtils.checkNull(getRequest().getParameter(ForumConstants.SORT_ORDER));

        ResultFilter resultFilter = ResultFilter.createDefaultThreadFilter();
        if (!sortField.equals("")) {
            resultFilter.setSortField(Integer.parseInt(sortField));
        }
        if (!sortOrder.equals("")) {
            resultFilter.setSortOrder(Integer.parseInt(sortOrder));
        } else {
            if (resultFilter.getSortField() == JiveConstants.THREAD_NAME) {
                resultFilter.setSortOrder(ResultFilter.ASCENDING);
            }
        }
        resultFilter.setStartIndex(startIdx);
        resultFilter.setNumResults(threadRange);
        int totalItemCount = forum.getThreadCount(resultFilter);

        Paging paging = new Paging(resultFilter, totalItemCount);
        Paginator paginator = new Paginator(paging);
        ForumThreadIterator itThreads = forum.getThreads(resultFilter);

        getRequest().setAttribute("forumFactory", forumFactory);
		getRequest().setAttribute("forum", forum);
		getRequest().setAttribute("threads", itThreads);
		getRequest().setAttribute("paginator", paginator);
        getRequest().setAttribute("sortField", sortField);
        getRequest().setAttribute("sortOrder", sortOrder);

		setNextPage("/viewForum.jsp");
		setIsNextPageInContext(true);
	}
}