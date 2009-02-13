/*
 * Created on Apr 29, 2005
 */
package com.topcoder.web.forums.controller.request;

import com.jivesoftware.base.JiveConstants;
import com.jivesoftware.forum.ForumThread;
import com.jivesoftware.forum.WatchManager;
import com.topcoder.shared.security.ClassResource;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.forums.ForumConstants;

/**
 * @author mtong
 *
 * Adds or removes a watch from the user's watchlist.
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
        StringBuffer nextPage = new StringBuffer();
        String errors = "";

        if (type == JiveConstants.THREAD) {
            ForumThread thread = forumFactory.getForumThread(id);
        	if (cmd.equals("add")) {
                if (watchManager.getTotalWatchCount(user, JiveConstants.THREAD) < ForumConstants.DEFAULT_MAX_THREAD_WATCHES) {
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
        }

        setNextPage(nextPage.toString());
        setIsNextPageInContext(false);
	}
}