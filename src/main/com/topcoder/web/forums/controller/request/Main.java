/*
 * Created on Aug 31, 2005
 */
package com.topcoder.web.forums.controller.request;

import com.jivesoftware.base.JiveConstants;
import com.jivesoftware.forum.ForumCategory;
import com.jivesoftware.forum.ResultFilter;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.WebConstants;
import com.topcoder.web.ejb.forums.Forums;
import com.topcoder.web.ejb.forums.ForumsLocal;
import com.topcoder.web.forums.ForumConstants;
import com.topcoder.web.forums.controller.ForumsUtil;
import com.topcoder.web.forums.model.ImageData;

import java.util.ArrayList;
import java.util.Hashtable;
import java.util.Iterator;

/**
 * @author mtong
 *         <p/>
 *         Displays the main category's forums and subcategories.
 */
public class Main extends ForumsProcessor {
    protected void businessProcessing() throws Exception {
        super.businessProcessing();

        ResultFilter resultFilter = new ResultFilter();
        resultFilter.setSortField(JiveConstants.MODIFICATION_DATE);
        resultFilter.setSortOrder(ResultFilter.DESCENDING);

        Iterator itCategories = forumFactory.getRootForumCategory().getCategories();
        ArrayList categoryList = new ArrayList();   // forums diplayed on main page

        ForumsLocal forumsBean = (ForumsLocal) createLocalEJB(getInitialContext(), Forums.class);

        while (itCategories.hasNext()) {
            ForumCategory category = (ForumCategory) itCategories.next();
            categoryList.add(category);

            getRequest().setAttribute("numActiveForums_" + category.getID(), new Long(0));
            getRequest().setAttribute("numActiveCategories_" + category.getID(), new Long(0));
            String limit = StringUtils.checkNull(category.getProperty(ForumConstants.PROPERTY_DISPLAY_LIMIT));
            if (!"".equals(limit)) {
                if (category.getCategoryCount() > 0) {
                    ArrayList categoriesList = ForumsUtil.getCategories(forumsBean, category, resultFilter, true, false);
                    ArrayList pageList = ForumsUtil.getPage(categoriesList, 0, Integer.parseInt(category.getProperty("displayLimit")));
                    getRequest().setAttribute("categoriesIterator_" + category.getID(), pageList.iterator());
                    getRequest().setAttribute("numActiveCategories_" + category.getID(), new Long(pageList.size()));

                    // create image data for software components
                    if (category.getID() == WebConstants.TCS_FORUMS_ROOT_CATEGORY_ID) {
                        Hashtable imageDataTable = new Hashtable();
                        long[] compVersIDs = new long[pageList.size()];
                        long[] compIDs = new long[pageList.size()];
                        for (int i = 0; i < pageList.size(); i++) {
                            ForumCategory subcategory = (ForumCategory) pageList.get(i);
                            compVersIDs[i] = Long.parseLong(subcategory.getProperty(ForumConstants.PROPERTY_COMPONENT_VERSION_ID));
                            compIDs[i] = Long.parseLong(subcategory.getProperty(ForumConstants.PROPERTY_COMPONENT_ID));
                        }
                        Hashtable compVersPhasesTable = forumsBean.getComponentVersionPhases(compVersIDs);
                        Hashtable rootCategoriesTable = forumsBean.getComponentRootCategories(compIDs);
                        for (int i = 0; i < pageList.size(); i++) {
                            ForumCategory subcategory = (ForumCategory) pageList.get(i);
                            long compVersPhase = -1, rootCategoryID = -1;
                            if (compVersPhasesTable.containsKey(String.valueOf(compVersIDs[i]))) {
                                compVersPhase = Long.parseLong((String) compVersPhasesTable.get(String.valueOf(compVersIDs[i])));
                            }
                            if (rootCategoriesTable.containsKey(String.valueOf(compIDs[i]))) {
                                rootCategoryID = Long.parseLong((String) rootCategoriesTable.get(String.valueOf(compIDs[i])));
                            }
                            imageDataTable.put(String.valueOf(subcategory.getID()), new ImageData(compVersPhase, rootCategoryID));
                        }
                        getRequest().setAttribute("imageDataTable_" + category.getID(), imageDataTable);
                    }
                } else {
                    boolean excludeEmptyForums = !("true".equals(category.getProperty(ForumConstants.PROPERTY_SHOW_EMPTY_FORUMS_ON_MAIN)));
                    ArrayList forumsList = ForumsUtil.getForums(category, resultFilter, excludeEmptyForums);
                    ArrayList pageList = ForumsUtil.getPage(forumsList, 0, Integer.parseInt(category.getProperty("displayLimit")));
                    getRequest().setAttribute("forumsIterator_" + category.getID(), pageList.iterator());
                    getRequest().setAttribute("numActiveForums_" + category.getID(), new Long(pageList.size()));
                }
            } else {
                resultFilter.setNumResults(ResultFilter.NULL_INT);
                getRequest().setAttribute("forumsIterator_" + category.getID(), category.getForums(resultFilter));
                getRequest().setAttribute("numActiveForums_" + category.getID(), new Long(category.getForumCount(resultFilter)));
            }
        }

        /*  2/12/07: With the addition of the software forums, the forums have become too large to 
         * 	read track in one pass.
        String markRead = StringUtils.checkNull(getRequest().getParameter(ForumConstants.MARK_READ));
        if (markRead.equals("t")) {
            forumFactory.getReadTracker().markRead(user, forumFactory.getRootForumCategory());
            super.setUnreadCategories();
        }
        */

        Iterator itForums = forumFactory.getRootForumCategory().getForums(resultFilter);

        getRequest().setAttribute("forums", itForums);
        getRequest().setAttribute("categories", categoryList);
        getRequest().setAttribute("resultFilter", resultFilter);

        //if (markRead.equals("t")) {
        //	setNextPage(getSessionInfo().getServletPath() + "?module=Main");
        //	setIsNextPageInContext(false);
        //} else {
        setNextPage("/main.jsp");
        setIsNextPageInContext(true);
        //}
    }
}