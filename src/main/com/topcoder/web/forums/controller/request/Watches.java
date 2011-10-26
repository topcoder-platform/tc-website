/*
 * Created on Apr 29, 2005
 */
package com.topcoder.web.forums.controller.request;

import com.jivesoftware.base.JiveConstants;
import com.jivesoftware.forum.Forum;
import com.jivesoftware.forum.ForumCategory;
import com.jivesoftware.forum.ForumThread;
import com.jivesoftware.forum.WatchManager;
import com.topcoder.shared.security.ClassResource;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.forums.ForumConstants;

import java.util.Iterator;

/**
 * @author mtong
 *         <p/>
 *         Forwards to the user's personal watchlist page.
 */
public class Watches extends ForumsProcessor {

    protected void businessProcessing() throws Exception {
        super.businessProcessing();
        if (isGuest()) {
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));
        }

        WatchManager watchManager = forumFactory.getWatchManager();

        String status = StringUtils.checkNull(getRequest().getParameter(ForumConstants.STATUS));
        log.debug("status is " + status);
        if (status.equals(ForumConstants.STATUS_UPDATE)) {
            int type = Integer.parseInt(getRequest().getParameter(ForumConstants.WATCH_TYPE));
            log.debug("type is " + type);
            if (type == JiveConstants.THREAD) {
                Iterator threads = watchManager.getAllWatches(user, JiveConstants.THREAD);
                while (threads.hasNext()) {
                    ForumThread thread = (ForumThread) (threads.next());
                    String saveThread = StringUtils.checkNull(getRequest().getParameter(ForumConstants.STATUS_SAVE + thread.getID()));
                    String deleteThread = StringUtils.checkNull(getRequest().getParameter(ForumConstants.STATUS_DELETE + thread.getID()));
                    boolean expirable = !(saveThread.equals(String.valueOf(thread.getID())));
                    watchManager.getWatch(user, thread).setExpirable(expirable);
                    if (deleteThread.equals(String.valueOf(thread.getID())) && !saveThread.equals(String.valueOf(thread.getID()))) {
                        watchManager.deleteWatch(watchManager.getWatch(user, thread));
                    }
                }
            } else if (type == JiveConstants.FORUM_CATEGORY) {
                Iterator categories = watchManager.getAllWatches(user, JiveConstants.FORUM_CATEGORY);
                while (categories.hasNext()) {
                    ForumCategory category = (ForumCategory) (categories.next());
                    String saveCategory = StringUtils.checkNull(getRequest().getParameter(ForumConstants.STATUS_SAVE + category.getID()));
                    String deleteCategory = StringUtils.checkNull(getRequest().getParameter(ForumConstants.STATUS_DELETE + category.getID()));
                    boolean expirable = !(saveCategory.equals(String.valueOf(category.getID())));
                    watchManager.getWatch(user, category).setExpirable(expirable);
                    if (deleteCategory.equals(String.valueOf(category.getID())) && !saveCategory.equals(String.valueOf(category.getID()))) {
                        watchManager.deleteWatch(watchManager.getWatch(user, category));
                    }
                }
            } else if (type == JiveConstants.FORUM) {
                log.debug("forum");
                Iterator forums = watchManager.getAllWatches(user, JiveConstants.FORUM);
                while (forums.hasNext()) {
                    Forum forum = (Forum) (forums.next());
                    String saveForum = StringUtils.checkNull(getRequest().getParameter(ForumConstants.STATUS_SAVE + forum.getID()));
                    String deleteForum = StringUtils.checkNull(getRequest().getParameter(ForumConstants.STATUS_DELETE + forum.getID()));
                    boolean expirable = !(saveForum.equals(String.valueOf(forum.getID())));
                    log.debug("forum " + forum.getName() + " " + forum.getID() + " save " + saveForum + " delete " + deleteForum);
                    watchManager.getWatch(user, forum).setExpirable(expirable);
                    if (deleteForum.equals(String.valueOf(forum.getID())) && !saveForum.equals(String.valueOf(forum.getID()))) {
                        watchManager.deleteWatch(watchManager.getWatch(user, forum));
                    }
                }
            }
        }

        Iterator itThreads = watchManager.getAllWatches(user, JiveConstants.THREAD);
        Iterator itCategories = watchManager.getAllWatches(user, JiveConstants.FORUM_CATEGORY);
        getRequest().setAttribute("watchManager", watchManager);
        getRequest().setAttribute("threads", itThreads);
        getRequest().setAttribute("categories", itCategories);
        getRequest().setAttribute("forums", watchManager.getAllWatches(user, JiveConstants.FORUM));

        setNextPage("/watches.jsp");
        setIsNextPageInContext(true);
    }
}