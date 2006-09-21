/*
 * Created on Aug 31, 2005
 */
package com.topcoder.web.forums.controller.request.dde;

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
        
        // since .getCategories() doesn't take in a ResultFilter, we'll
        // manually filter out those of the wrong type (customer/developer)
		String ftParam = getRequest().getParameter(ForumConstants.FORUM_TYPE);
        // "?ft=2" means developer forums, otherwise show customer forums
		String forumTypeToShow;
		if(ftParam != null && ftParam.equals(ForumConstants.DEVELOPER_FORUM)) {
			forumTypeToShow = ForumConstants.DEVELOPER_FORUM;
		} else {
			forumTypeToShow = ForumConstants.CUSTOMER_FORUM;
		}
        // don't let anonymous users see the dev forum
        if(forumTypeToShow == ForumConstants.DEVELOPER_FORUM && user == null) {
        	log.debug("Anonymous user can't view development forum list");
        	getRequest().setAttribute("message", "Please login to view the development forums.");
			setNextPage("/login.jsp");
			setIsNextPageInContext(true);
			return;
        }
        
        ResultFilter resultFilter = new ResultFilter();
        resultFilter.setSortField(JiveConstants.MODIFICATION_DATE);
        resultFilter.setSortOrder(ResultFilter.DESCENDING);
        
        Iterator itCategories = forumFactory.getRootForumCategory().getCategories();
        ArrayList mainCategoryList = new ArrayList();   // forums diplayed on main page
        ArrayList deepCategoryList = new ArrayList();   // expanded in Category servlet
		
        while (itCategories.hasNext()) {
            ForumCategory category = (ForumCategory)itCategories.next();
            
            String forumType = category.getProperty("forumType");
            if(!forumType.equals(forumTypeToShow)) {
            	continue;
            }
            
            if (category.getCategoryCount() > 0) {
                deepCategoryList.add(category);
            } else {
                mainCategoryList.add(category);
            }
        }
        
        String markRead = StringUtils.checkNull(getRequest().getParameter(ForumConstants.MARK_READ));
        if (markRead.equals("t")) {
            forumFactory.getReadTracker().markRead(user, forumFactory.getRootForumCategory());
            super.setUnreadCategories();
        }

        Iterator itForums = forumFactory.getRootForumCategory().getForums(resultFilter);

        getRequest().setAttribute("forumFactory", forumFactory);
        getRequest().setAttribute("forums", itForums);
        getRequest().setAttribute("categories", mainCategoryList);
        getRequest().setAttribute("deepCategories", deepCategoryList);
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