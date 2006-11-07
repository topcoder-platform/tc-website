/*
 * Created on Apr 29, 2005
 */
package com.topcoder.web.forums.controller.request;

//import com.jivesoftware.base.JiveConstants;
//import com.jivesoftware.forum.ResultFilter;
//import com.jivesoftware.forum.ForumCategory;
import com.topcoder.web.forums.ForumConstants;

//import java.util.Iterator;
//import java.util.ArrayList;

/**
 * @author mtong
 *
 * Provides the root list of forums.
 */
public class ForumList extends ForumsProcessor {
	protected void businessProcessing() throws Exception {
		super.businessProcessing();

        setNextPage(getSessionInfo().getServletPath() + "?module=Category&" + ForumConstants.CATEGORY_ID + "=1");
        setIsNextPageInContext(false);
        
        /*
        ResultFilter resultFilter = new ResultFilter();
        resultFilter.setSortField(JiveConstants.MODIFICATION_DATE);
        resultFilter.setSortOrder(ResultFilter.DESCENDING);

        Iterator itCategories = forumFactory.getRootForumCategory().getCategories();
        ArrayList mainCategoryList = new ArrayList();   // forums diplayed on main page
        ArrayList deepCategoryList = new ArrayList();   // expanded in Category servlet
        
        while (itCategories.hasNext()) {
            ForumCategory category = (ForumCategory)itCategories.next();
            if (category.getCategoryCount() > 0) {
                deepCategoryList.add(category);
            } else {
                mainCategoryList.add(category);
            }
        }
        
		Iterator itForums = forumFactory.getRootForumCategory().getForums(resultFilter);

		getRequest().setAttribute("forums", itForums);
        getRequest().setAttribute("categories", mainCategoryList);
        getRequest().setAttribute("deepCategories", deepCategoryList);
        getRequest().setAttribute("resultFilter", resultFilter);

		setNextPage("/main.jsp");
		setIsNextPageInContext(true);
        */
	}
}