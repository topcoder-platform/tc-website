/*
 * Created on Apr 29, 2005
 */
package com.topcoder.web.forums.controller.request;

import java.util.Iterator;
import com.jivesoftware.base.JiveConstants;
import com.jivesoftware.forum.WatchManager;
import com.jivesoftware.forum.ForumThread;
import com.topcoder.shared.security.SimpleResource;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.forums.ForumConstants;

import com.topcoder.shared.util.logging.Logger;

/**
 * @author mtong
 * 
 * Forwards to the user's personal watchlist page.
 */
public class Watches extends ForumsProcessor {
    private final static Logger log = Logger.getLogger(Watches.class);
    
	protected void businessProcessing() throws Exception {
		super.businessProcessing();
        if (isGuest()) {
            throw new PermissionException(getUser(), new SimpleResource("Forums - Watches")); 
        }
        
        WatchManager watchManager = forumFactory.getWatchManager();
        Iterator itThreads = watchManager.getAllWatches(user, JiveConstants.THREAD);
        
        getRequest().setAttribute("user", user);
        getRequest().setAttribute("watchManager", watchManager);
        getRequest().setAttribute("threads", itThreads);
        
        String status = StringUtils.checkNull(getRequest().getParameter(ForumConstants.SETTINGS_STATUS));
		if (status.equals("update")) {
			Iterator threads = watchManager.getAllWatches(user, JiveConstants.THREAD);
            while (threads.hasNext()) {
            	ForumThread thread = (ForumThread)(threads.next());
                String saveThread = StringUtils.checkNull(getRequest().getParameter("saveThread"+thread.getID()));
                log.debug("Watchlist save: ID - " + thread.getID() + ", parameter - " + saveThread);
                boolean expirable = saveThread.equals(String.valueOf(thread.getID()));
                watchManager.getWatch(user, thread).setExpirable(expirable);                
            }
        } else if (status.equals("delete")) {
            Iterator threads = watchManager.getAllWatches(user, JiveConstants.THREAD);
            while (threads.hasNext()) {
                ForumThread thread = (ForumThread)(threads.next());
                String deleteThread = StringUtils.checkNull(getRequest().getParameter("deleteThread"+thread.getID()));
                log.debug("Watchlist delete: ID - " + thread.getID() + ", parameter - " + deleteThread);
                if (deleteThread.equals(String.valueOf(thread.getID()))) {
                	watchManager.deleteWatch(watchManager.getWatch(user, thread));
                }
            }
        }
        
		setNextPage("/watches.jsp");
		setIsNextPageInContext(true);
	}
}