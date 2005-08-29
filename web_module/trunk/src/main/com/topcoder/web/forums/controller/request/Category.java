/*
 * Created on Aug 23, 2005
 */
package com.topcoder.web.forums.controller.request;

import com.jivesoftware.base.JiveConstants;
import com.jivesoftware.forum.ResultFilter;
import com.jivesoftware.forum.ForumCategory;
import com.jivesoftware.forum.Forum;
import com.jivesoftware.forum.action.util.Paginator;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.forums.ForumConstants;
import com.topcoder.web.forums.model.Paging;

import java.util.Iterator;
import java.util.ArrayList;

/**
 * @author mtong
 *
 * Displays a category's forums and subcategories.
 */
public class Category extends ForumsProcessor {
	protected void businessProcessing() throws Exception {
		super.businessProcessing();

        long categoryID = Long.parseLong(getRequest().getParameter(ForumConstants.CATEGORY_ID));
        ForumCategory forumCategory = forumFactory.getForumCategory(categoryID);
        
        int startIdx = 0;
        if ((!StringUtils.checkNull(getRequest().getParameter(ForumConstants.START_IDX)).equals(""))) {
            startIdx = Integer.parseInt(getRequest().getParameter(ForumConstants.START_IDX));
        }
        int forumRange = ForumConstants.DEFAULT_FORUM_RANGE;
        if (user != null) {
            try {
                forumRange = Integer.parseInt(user.getProperty("jiveForumRange"));
            } catch (Exception ignored) {}
        }
        
        ResultFilter resultFilter = new ResultFilter();
        resultFilter.setSortField(JiveConstants.MODIFICATION_DATE);
        resultFilter.setSortOrder(ResultFilter.DESCENDING);
        
        Iterator itCategories = forumCategory.getCategories();
        Iterator itForums = null;
        int totalItemCount = 0;
        
        if ("true".equals(forumCategory.getProperty(ForumConstants.HIDE_EMPTY_FORUMS))) {
            itForums = forumCategory.getForums(resultFilter);
            ArrayList a = new ArrayList();
            while (itForums.hasNext()) {
                Forum f = (Forum)itForums.next();
                if (f.getMessageCount() > 0) {
                    a.add(f);
                }
            }
            itForums = a.iterator();
            totalItemCount = a.size();
            resultFilter.setStartIndex(startIdx);
            resultFilter.setNumResults(forumRange);
        } else {
            resultFilter.setStartIndex(startIdx);
            resultFilter.setNumResults(forumRange);
            itForums = forumCategory.getForums(resultFilter);
            totalItemCount = forumCategory.getForumCount(resultFilter);
        }
        Paging paging = new Paging(resultFilter, totalItemCount);
        Paginator paginator = new Paginator(paging);
        
        getRequest().setAttribute("forumFactory", forumFactory);
        getRequest().setAttribute("forumCategory", forumCategory);
		getRequest().setAttribute("forums", itForums);
        getRequest().setAttribute("categories", itCategories);
        getRequest().setAttribute("resultFilter", resultFilter);
        getRequest().setAttribute("paginator", paginator);

		setNextPage("/viewCategory.jsp");
		setIsNextPageInContext(true);
	}
}