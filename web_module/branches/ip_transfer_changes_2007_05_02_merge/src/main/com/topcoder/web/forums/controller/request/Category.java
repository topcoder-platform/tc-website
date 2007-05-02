/*
 * Created on Aug 23, 2005
 */
package com.topcoder.web.forums.controller.request;

import com.jivesoftware.base.JiveConstants;
import com.jivesoftware.forum.ResultFilter;
import com.jivesoftware.forum.ForumCategory;
import com.jivesoftware.forum.action.util.Paginator;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.WebConstants;
import com.topcoder.web.ejb.forums.Forums;
import com.topcoder.web.ejb.forums.ForumsLocal;
import com.topcoder.web.forums.ForumConstants;
import com.topcoder.web.forums.model.ImageData;
import com.topcoder.web.forums.model.Paging;
import com.topcoder.web.forums.controller.ForumsUtil;

import java.util.ArrayList;
import java.util.Hashtable;

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
        ForumsLocal forumsBean = (ForumsLocal)createLocalEJB(getInitialContext(), Forums.class);
        
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
        if (markRead.equals("t") && forumCategory.getID() != 1 && forumCategory.getID() != WebConstants.TCS_FORUMS_ROOT_CATEGORY_ID) {
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
        
        ArrayList list = null;
        if (forumCategory.getCategoryCount() > 0) {
            boolean excludeEmptyCategories = "true".equals(forumCategory.getProperty(ForumConstants.PROPERTY_HIDE_EMPTY_CATEGORIES));
            boolean mergeEmptyCategories = "true".equals(forumCategory.getProperty(ForumConstants.PROPERTY_MERGE_EMPTY_CATEGORIES));
        	list = ForumsUtil.getCategories(forumsBean, forumCategory, resultFilter, excludeEmptyCategories, mergeEmptyCategories);
        } else {
            boolean excludeEmptyForums = "true".equals(forumCategory.getProperty(ForumConstants.PROPERTY_HIDE_EMPTY_FORUMS));
        	list = ForumsUtil.getForums(forumCategory, resultFilter, excludeEmptyForums);   
        }
        ArrayList pageList = ForumsUtil.getPage(list, startIdx, forumRange);
        resultFilter.setStartIndex(startIdx);
        resultFilter.setNumResults(forumRange);
        Paging paging = new Paging(resultFilter, list.size());
        Paginator paginator = new Paginator(paging);
        
        if (ForumsUtil.isSoftwareSubcategory(forumCategory)) {
            getRequest().setAttribute("imageData", ForumsUtil.getImageData(forumsBean, forumCategory));
        }
        
        if (forumCategory.getCategoryCount() > 0) {
        	getRequest().setAttribute("categories", pageList.iterator());
            
            // create image data for software components
            if (forumCategory.getID() == WebConstants.TCS_FORUMS_ROOT_CATEGORY_ID) {
                Hashtable imageDataTable = new Hashtable();
                long[] compVersIDs = new long[pageList.size()];
                long[] compIDs = new long[pageList.size()];
                for (int i=0; i<pageList.size(); i++) {
                    ForumCategory subcategory = (ForumCategory)pageList.get(i);
                    compVersIDs[i] = Long.parseLong(subcategory.getProperty(ForumConstants.PROPERTY_COMPONENT_VERSION_ID));
                    compIDs[i] = Long.parseLong(subcategory.getProperty(ForumConstants.PROPERTY_COMPONENT_ID));
                }
                Hashtable compVersPhasesTable = forumsBean.getComponentVersionPhases(compVersIDs);
                Hashtable rootCategoriesTable = forumsBean.getComponentRootCategories(compIDs);
                for (int i=0; i<pageList.size(); i++) {
                    ForumCategory subcategory = (ForumCategory)pageList.get(i);
                    long compVersPhase = -1, rootCategoryID = -1;
                    if (compVersPhasesTable.containsKey(String.valueOf(compVersIDs[i]))) {
                        compVersPhase = Long.parseLong((String)compVersPhasesTable.get(String.valueOf(compVersIDs[i])));
                    }
                    if (rootCategoriesTable.containsKey(String.valueOf(compIDs[i]))) {
                        rootCategoryID = Long.parseLong((String)rootCategoriesTable.get(String.valueOf(compIDs[i])));
                    }
                    imageDataTable.put(String.valueOf(subcategory.getID()), new ImageData(compVersPhase, rootCategoryID));
                }
                getRequest().setAttribute("imageDataTable", imageDataTable);
            }
        } else {
        	getRequest().setAttribute("forums", pageList.iterator());
        }
        getRequest().setAttribute("forumCategory", forumCategory);
        getRequest().setAttribute("resultFilter", resultFilter);
        getRequest().setAttribute("paginator", paginator);
        getRequest().setAttribute("sortField", sortField);
        getRequest().setAttribute("sortOrder", sortOrder);
        getRequest().setAttribute("showComponentLink", 
                String.valueOf(ForumsUtil.showComponentLink(forumsBean, forumCategory)));

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