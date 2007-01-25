/*
 * Created on Aug 23, 2005
 */
package com.topcoder.web.forums.controller.request;

import com.jivesoftware.base.JiveConstants;
import com.jivesoftware.base.Log;
import com.jivesoftware.forum.ResultFilter;
import com.jivesoftware.forum.ForumCategory;
import com.jivesoftware.forum.action.util.Paginator;
import com.topcoder.shared.util.TCContext;
import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.ejb.forums.Forums;
import com.topcoder.web.forums.ForumConstants;
import com.topcoder.web.forums.model.Paging;
import com.topcoder.web.forums.controller.ForumsUtil;

import java.util.ArrayList;

import javax.naming.InitialContext;

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
            setNextPage(getSessionInfo().getServletPath() + "?module=Main");
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
        
        String markRead = StringUtils.checkNull(getRequest().getParameter(ForumConstants.MARK_READ));
        if (markRead.equals("t")) {
            forumFactory.getReadTracker().markRead(user, forumCategory);
            super.setUnreadCategories();
        }
        
        ResultFilter resultFilter = new ResultFilter();
        if ("fixed".equals(forumCategory.getProperty(ForumConstants.PROPERTY_SORT))) {
            resultFilter = ResultFilter.createDefaultForumFilter();
        } else {
            resultFilter.setSortField(Integer.parseInt(sortField));
            resultFilter.setSortOrder(Integer.parseInt(sortOrder));
        }
        
        boolean excludeEmptyForums = "true".equals(forumCategory.getProperty(ForumConstants.PROPERTY_HIDE_EMPTY_FORUMS));
        
        ArrayList list = null;
        if (forumCategory.getCategoryCount() > 0) {
        	list = ForumsUtil.getCategories(forumCategory, resultFilter, excludeEmptyForums);
        } else {
        	list = ForumsUtil.getForums(forumCategory, resultFilter, excludeEmptyForums);   
        }
        ArrayList pageList = ForumsUtil.getPage(list, startIdx, forumRange);
        resultFilter.setStartIndex(startIdx);
        resultFilter.setNumResults(forumRange);
        Paging paging = new Paging(resultFilter, list.size());
        Paginator paginator = new Paginator(paging);
        
        InitialContext ctx = null;
        Forums forumsBean = null;
        try {
            ctx = TCContext.getInitial();
            forumsBean = (Forums)createEJB(ctx, Forums.class);
        } catch (Exception e) {
            Log.error(e);
        } finally {
            BaseProcessor.close(ctx);
        }
        
        if (forumCategory.getCategoryCount() > 0) {
        	getRequest().setAttribute("categories", pageList.iterator());
        } else {
        	getRequest().setAttribute("forums", pageList.iterator());
        }
        getRequest().setAttribute("forumCategory", forumCategory);
        getRequest().setAttribute("resultFilter", resultFilter);
        getRequest().setAttribute("paginator", paginator);
        getRequest().setAttribute("sortField", sortField);
        getRequest().setAttribute("sortOrder", sortOrder);
        getRequest().setAttribute("forumsBean", forumsBean);

        if (markRead.equals("t")) {
        	setNextPage(getSessionInfo().getServletPath() + 
        			"?module=Category&" + ForumConstants.CATEGORY_ID + "=" + forumCategory.getID());
        	setIsNextPageInContext(false);
        } else {
        	setNextPage("/viewCategory.jsp");
        	setIsNextPageInContext(true);
        }
	}
}