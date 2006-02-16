package com.topcoder.web.forums.controller.request;

import com.jivesoftware.forum.ReadTracker;
import com.jivesoftware.forum.ForumCategory;
import com.jivesoftware.forum.WatchManager;
import com.jivesoftware.forum.Forum;
import com.topcoder.web.forums.ForumConstants;

import java.util.Iterator;
import java.util.HashSet;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Feb 16, 2006
 */
public class NavList extends ForumsProcessor {

    protected void businessProcessing() throws Exception {
        setNextPage("/navList.jsp");
        setIsNextPageInContext(true);

        // Determine categories with unread forums
        ReadTracker readTracker = forumFactory.getReadTracker();
        WatchManager watchManager = forumFactory.getWatchManager();
        HashSet unreadCategories = new HashSet();
        ForumCategory rootCategory = forumFactory.getRootForumCategory();
        Iterator itCategories = rootCategory.getCategories();
        while (itCategories.hasNext()) {
            ForumCategory category = (ForumCategory)itCategories.next();
            Iterator itForums = category.getForums();
            boolean isCategoryRead = true;
            while (isCategoryRead && itForums.hasNext()) {
                Forum forum = (Forum)itForums.next();
                if (user != null && forum.getLatestMessage() != null
                        && readTracker.getReadStatus(user, forum.getLatestMessage()) != ReadTracker.READ
                        && !("true".equals(user.getProperty("markWatchesRead")) && watchManager.isWatched(user, forum.getLatestMessage().getForumThread()))) {
                    isCategoryRead = false;
                }
            }
            if (!isCategoryRead && category.getProperty(ForumConstants.PROPERTY_LEFT_NAV_NAME) != null) {
                unreadCategories.add(category.getProperty(ForumConstants.PROPERTY_LEFT_NAV_NAME));
            }
        }
        getRequest().setAttribute("unreadCategories", unreadCategories);
    }

}
