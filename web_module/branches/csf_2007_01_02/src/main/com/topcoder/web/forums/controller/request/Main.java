/*
 * Created on Aug 31, 2005
 */
package com.topcoder.web.forums.controller.request;

import com.jivesoftware.base.JiveConstants;
import com.jivesoftware.forum.ResultFilter;
import com.jivesoftware.forum.ForumCategory;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.forums.ForumConstants;

import java.util.Iterator;
import java.util.ArrayList;

/**
 * @author mtong
 *
 * Displays the main category's forums and subcategories.
 */
public class Main extends ForumsProcessor {
	protected void businessProcessing() throws Exception {
        super.businessProcessing();
        
        ResultFilter resultFilter = new ResultFilter();
        resultFilter.setSortField(JiveConstants.MODIFICATION_DATE);
        resultFilter.setSortOrder(ResultFilter.DESCENDING);

        Iterator itCategories = forumFactory.getRootForumCategory().getCategories();
        ArrayList categoryList = new ArrayList();   // forums diplayed on main page
        
        while (itCategories.hasNext()) {
            ForumCategory category = (ForumCategory)itCategories.next();
        	log.debug("Category: " + category.getName());
            categoryList.add(category);
        }
        
        String markRead = StringUtils.checkNull(getRequest().getParameter(ForumConstants.MARK_READ));
        if (markRead.equals("t")) {
            forumFactory.getReadTracker().markRead(user, forumFactory.getRootForumCategory());
            super.setUnreadCategories();
        }

        Iterator itForums = forumFactory.getRootForumCategory().getForums(resultFilter);

        getRequest().setAttribute("forums", itForums);
        getRequest().setAttribute("categories", categoryList);
        getRequest().setAttribute("resultFilter", resultFilter);

        if (markRead.equals("t")) {
        	setNextPage(getSessionInfo().getServletPath() + "?module=Main");
        	setIsNextPageInContext(false);
        } else {
        	setNextPage("/main.jsp");
        	setIsNextPageInContext(true);
        }
	}
}