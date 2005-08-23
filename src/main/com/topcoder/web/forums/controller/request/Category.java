/*
 * Created on Aug 23, 2005
 */
package com.topcoder.web.forums.controller.request;

import com.jivesoftware.base.JiveConstants;
import com.jivesoftware.forum.ResultFilter;
import com.jivesoftware.forum.ForumCategory;
import com.topcoder.web.forums.ForumConstants;

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
        
        ResultFilter resultFilter = new ResultFilter();
        resultFilter.setSortField(JiveConstants.MODIFICATION_DATE);
        resultFilter.setSortOrder(ResultFilter.DESCENDING);

        ForumCategory forumCategory = forumFactory.getForumCategory(categoryID);
        Iterator itCategories = forumCategory.getCategories();
		Iterator itForums = forumCategory.getForums(resultFilter);

        ArrayList categoryList = new ArrayList();
        ForumCategory category = forumCategory;
        categoryList.add(category);
        while ((category = category.getParentCategory()) != null) {
            categoryList.add(0, category);
        }
        
        getRequest().setAttribute("forumFactory", forumFactory);
        getRequest().setAttribute("forumCategory", forumCategory);
        getRequest().setAttribute("categoryTree", categoryList.iterator());
		getRequest().setAttribute("forums", itForums);
        getRequest().setAttribute("categories", itCategories);
        getRequest().setAttribute("resultFilter", resultFilter);

		setNextPage("/viewCategory.jsp");
		setIsNextPageInContext(true);
	}
}