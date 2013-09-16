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
import com.topcoder.web.forums.controller.ForumsUtil;

/**
 * @author mtong
 *         <p/>
 *         Adds or removes a watch from the user's watchlist.
 */
public class Watch extends ForumsProcessor {

    protected void businessProcessing() throws Exception {
        super.businessProcessing();
        if (isGuest()) {
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));
        }

        WatchManager watchManager = forumFactory.getWatchManager();
        int type = Integer.parseInt(getRequest().getParameter(ForumConstants.WATCH_TYPE));
        long id = Long.parseLong(getRequest().getParameter(ForumConstants.WATCH_ID));
        String cmd = getRequest().getParameter(ForumConstants.WATCH_COMMAND);
        StringBuffer nextPage = new StringBuffer(getSessionInfo().getServletPath());
        String errors = "";

        switch (type) {
            case JiveConstants.THREAD:
                ForumThread thread = forumFactory.getForumThread(id);
                if (cmd.equals("add")) {
                    if (watchManager.getTotalWatchCount(user, JiveConstants.THREAD) < ForumConstants.maxThreadWatchesPerPage) {
                        watchManager.createWatch(user, thread);
                    } else {
                        errors = ForumConstants.WATCH_THREAD;
                    }
                } else if (cmd.equals("remove")) {
                    com.jivesoftware.forum.Watch watch = watchManager.getWatch(user, thread);
                    watchManager.deleteWatch(watch);
                }
                nextPage.append("?module=Thread&").append(ForumConstants.THREAD_ID).append("=").append(thread.getID());
                String threadView = StringUtils.checkNull(getRequest().getParameter(ForumConstants.THREAD_VIEW));
                if (!threadView.equals("")) {
                    nextPage.append("&").append(ForumConstants.THREAD_VIEW).append("=").append(threadView);
                }
                if (!errors.equals("")) {
                    nextPage.append("&").append(ForumConstants.THREAD_ERROR).append("=").append(errors);
                }
                break;
            case JiveConstants.FORUM_CATEGORY:
                ForumCategory category = forumFactory.getForumCategory(id);
                if (ForumsUtil.isSoftwareSubcategory(category) || ForumsUtil.isDirectProjectSubcategory(category)) {
                    if (cmd.equals("add")) {
                        watchManager.createWatch(user, category);
                    } else if (cmd.equals("remove")) {
                        com.jivesoftware.forum.Watch watch = watchManager.getWatch(user, category);
                        watchManager.deleteWatch(watch);
                    }
                    nextPage.append("?module=Category&").append(ForumConstants.CATEGORY_ID).append("=").append(category.getID());
                }
                break;
            case JiveConstants.FORUM:
                Forum forum = forumFactory.getForum(id);
                if (cmd.equals("add")) {
                    watchManager.createWatch(user, forum);
                } else {
                    com.jivesoftware.forum.Watch watch = watchManager.getWatch(user, forum);
                    watchManager.deleteWatch(watch);
                }
                nextPage.append("?module=ThreadList&").append(ForumConstants.FORUM_ID).append("=").append(forum.getID());
                break;
        }

        setNextPage(nextPage.toString());
        setIsNextPageInContext(false);
    }
}