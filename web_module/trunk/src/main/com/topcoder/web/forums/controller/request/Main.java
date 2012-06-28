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
            if (category.getID() == WebConstants.TCS_FORUMS_ROOT_CATEGORY_ID) {
                // Just skip the Software forums category.
                // It became too large to be displayed on the main page.
                continue;
            }

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