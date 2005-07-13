/*
 * Created on Apr 29, 2005
 */
package com.topcoder.web.forums.controller.request;

import java.util.Iterator;
import com.jivesoftware.base.JiveConstants;
import com.jivesoftware.forum.WatchManager;
import com.jivesoftware.forum.ForumThread;
import com.topcoder.shared.security.ClassResource;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.forums.ForumConstants;

/**
 * @author mtong
 * 
 * Forwards to the user's personal watchlist page.
 */
public class Watches extends ForumsProcessor {
    
	protected void businessProcessing() throws Exception {
		super.businessProcessing();
        if (isGuest()) {
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));
        }
        
        WatchManager watchManager = forumFactory.getWatchManager();
        
        String status = StringUtils.checkNull(getRequest().getParameter(ForumConstants.SETTINGS_STATUS));
		if (status.equals(ForumConstants.WATCHES_UPDATE)) {
			Iterator threads = watchManager.getAllWatches(user, JiveConstants.THREAD);
            while (threads.hasNext()) {
            	ForumThread thread = (ForumThread)(threads.next());
                String saveThread = StringUtils.checkNull(getRequest().getParameter(ForumConstants.WATCHES_SAVE_THREAD+thread.getID()));
                String deleteThread = StringUtils.checkNull(getRequest().getParameter(ForumConstants.WATCHES_DELETE_THREAD+thread.getID()));
                boolean expirable = !(saveThread.equals(String.valueOf(thread.getID())));
                watchManager.getWatch(user, thread).setExpirable(expirable);
                if (deleteThread.equals(String.valueOf(thread.getID())) && !saveThread.equals(String.valueOf(thread.getID()))) {
                    watchManager.deleteWatch(watchManager.getWatch(user, thread));
                }
            }
        }
        
        Iterator itThreads = watchManager.getAllWatches(user, JiveConstants.THREAD);
        getRequest().setAttribute("watchManager", watchManager);
        getRequest().setAttribute("threads", itThreads);
        
		setNextPage("/watches.jsp");
		setIsNextPageInContext(true);
	}
}