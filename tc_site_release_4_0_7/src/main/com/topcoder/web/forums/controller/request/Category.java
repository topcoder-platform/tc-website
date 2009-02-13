/*
 * Created on Aug 23, 2005
 */
package com.topcoder.web.forums.controller.request;

import com.jivesoftware.base.JiveConstants;
import com.jivesoftware.forum.ResultFilter;
import com.jivesoftware.forum.ForumCategory;
import com.jivesoftware.forum.action.util.Paginator;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.forums.ForumConstants;
import com.topcoder.web.forums.model.Paging;
import com.topcoder.web.forums.controller.ForumsUtil;

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
        if (categoryID == 1) {
            setNextPage("?module=Main");
            setIsNextPageInContext(false);
            return;
        }
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
        
        String sortField = StringUtils.checkNull(getRequest().getParameter(ForumConstants.SORT_FIELD));
        String sortOrder = StringUtils.checkNull(getRequest().getParameter(ForumConstants.SORT_ORDER));
        if (sortField.equals("")) {
            sortField = String.valueOf(JiveConstants.MODIFICATION_DATE);
        }
        if (sortOrder.equals("")) {
            sortOrder = String.valueOf(ResultFilter.DESCENDING);
        }
        
        ResultFilter resultFilter = new ResultFilter();
        if ("fixed".equals(forumCategory.getProperty(ForumConstants.PROPERTY_SORT))) {
            resultFilter = ResultFilter.createDefaultForumFilter();
        } else {
            resultFilter.setSortField(Integer.parseInt(sortField));
            resultFilter.setSortOrder(Integer.parseInt(sortOrder));
        }
        
        Iterator itCategories = forumCategory.getCategories();
        int totalItemCount = 0;
        
        boolean excludeEmptyForums = "true".equals(forumCategory.getProperty(ForumConstants.PROPERTY_HIDE_EMPTY_FORUMS));
        ArrayList forumsList = ForumsUtil.getForums(forumCategory, resultFilter, excludeEmptyForums);
        ArrayList pageList = ForumsUtil.getForumsPage(forumsList, startIdx, forumRange);
        totalItemCount = forumsList.size();
        resultFilter.setStartIndex(startIdx);
        resultFilter.setNumResults(forumRange);
        
        /*
        if ("true".equals(forumCategory.getProperty(ForumConstants.PROPERTY_HIDE_EMPTY_FORUMS))) {
            itForums = forumCategory.getForums(resultFilter);
            ArrayList a = new ArrayList();  // all results
            while (itForums.hasNext()) {
                Forum f = (Forum)itForums.next();
                if (f.getMessageCount() > 0) {
                    a.add(f);
                }
            }
            int endIdx = Math.min(startIdx+forumRange, a.size());
            ArrayList pageList = new ArrayList();   // page results
            for (int i=startIdx; i<endIdx; i++) {
                pageList.add(a.get(i));
            }
            itForums = pageList.iterator();
            totalItemCount = a.size();
            resultFilter.setStartIndex(startIdx);
            resultFilter.setNumResults(forumRange);
        } else {
            // Place forums containing posts before empty forums
            
            itForums = forumCategory.getForums(resultFilter);
            ArrayList a = new ArrayList();  // all results
            ArrayList emptyList = new ArrayList();
            while (itForums.hasNext()) {
                Forum f = (Forum)itForums.next();
                if (f.getMessageCount() > 0) {
                    a.add(f);
                } else {
                    emptyList.add(f);
                }
            }
            a.addAll(emptyList);
            int endIdx = Math.min(startIdx+forumRange, a.size());
            ArrayList pageList = new ArrayList();   // page results
            for (int i=startIdx; i<endIdx; i++) {
                pageList.add(a.get(i));
            }
            itForums = pageList.iterator();
            totalItemCount = a.size();
            resultFilter.setStartIndex(startIdx);
            resultFilter.setNumResults(forumRange);
            
            //resultFilter.setStartIndex(startIdx);
            //resultFilter.setNumResults(forumRange);
            //itForums = forumCategory.getForums(resultFilter);
            //totalItemCount = forumCategory.getForumCount(resultFilter);
        }
        */
        
        Paging paging = new Paging(resultFilter, totalItemCount);
        Paginator paginator = new Paginator(paging);
        
        getRequest().setAttribute("forumFactory", forumFactory);
        getRequest().setAttribute("forumCategory", forumCategory);
		getRequest().setAttribute("forums", pageList.iterator());
        getRequest().setAttribute("categories", itCategories);
        getRequest().setAttribute("resultFilter", resultFilter);
        getRequest().setAttribute("paginator", paginator);
        getRequest().setAttribute("sortField", sortField);
        getRequest().setAttribute("sortOrder", sortOrder);

		setNextPage("/viewCategory.jsp");
		setIsNextPageInContext(true);
	}
}