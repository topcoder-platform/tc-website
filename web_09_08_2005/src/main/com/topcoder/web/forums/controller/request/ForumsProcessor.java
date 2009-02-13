/*
 * Created on May 10, 2005
 */
package com.topcoder.web.forums.controller.request;

import com.jivesoftware.base.AuthToken;
import com.jivesoftware.base.User;
import com.jivesoftware.forum.ForumFactory;
import com.jivesoftware.forum.ForumCategory;
import com.jivesoftware.forum.Forum;
import com.jivesoftware.forum.ReadTracker;
import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.forums.ForumConstants;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.CachedDataAccess;
import com.topcoder.shared.dataAccess.DataAccess;
import com.topcoder.shared.util.DBMS;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Iterator;

/**
 * @author mtong
 *
 * Base class for forum-related processors, providing message and user data.
 */
public abstract class ForumsProcessor extends BaseProcessor {
    protected HttpServletRequest httpRequest;
    protected HttpServletResponse httpResponse;
    protected AuthToken authToken;
    protected ForumFactory forumFactory;
    protected User user;


    /* TODO there is redundant code stuff that seems to break the design.  hopefully this can be cleaned */


    /**
     * Subclasses should do their work by implementing this method.
     */
    protected void businessProcessing() throws Exception {
        getRequest().setAttribute("authToken", authToken);
        getRequest().setAttribute("user", user);
        
        // Determine categories with unread forums
        ReadTracker readTracker = forumFactory.getReadTracker();
        StringBuffer unreadCategories = new StringBuffer();
        ForumCategory rootCategory = forumFactory.getRootForumCategory();
        Iterator itCategories = rootCategory.getCategories();
        while (itCategories.hasNext()) {
            ForumCategory category = (ForumCategory)itCategories.next();
            Iterator itForums = category.getForums();
            boolean isCategoryRead = true;
            while (isCategoryRead && itForums.hasNext()) {
                Forum forum = (Forum)itForums.next();
                if (user != null && forum.getLatestMessage() != null && readTracker.getReadStatus(user, forum.getLatestMessage()) != ReadTracker.READ) {
                    isCategoryRead = false;
                }
            }
            if (!isCategoryRead && category.getProperty(ForumConstants.PROPERTY_LEFT_NAV_NAME) != null) {
                unreadCategories.append(category.getProperty(ForumConstants.PROPERTY_LEFT_NAV_NAME)).append(',');
            }
        }
        if (unreadCategories.length() > 0) {
            getRequest().setAttribute("unreadCategories", 
                    unreadCategories.substring(0,unreadCategories.length()-1));
        } else {
            getRequest().setAttribute("unreadCategories", "");
        }
    }

    public HttpServletRequest getHttpRequest() {
        return httpRequest;
    }

    public void setHttpRequest(HttpServletRequest httpRequest) {
        this.httpRequest = httpRequest;
    }

    public HttpServletResponse getHttpResponse() {
        return httpResponse;
    }

    public void setHttpResponse(HttpServletResponse httpResponse) {
        this.httpResponse = httpResponse;
    }

    public void setAuthToken(AuthToken authToken) {
    	this.authToken = authToken;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public void setForumFactory(ForumFactory forumFactory) {
        this.forumFactory = forumFactory;
    }

    public boolean isGuest() {
    	return authToken.isAnonymous();
    }

    public DataAccessInt getDataAccess() throws Exception {
        return getDataAccess(DBMS.OLTP_DATASOURCE_NAME, false);
    }

    public DataAccessInt getDataAccess(boolean cached) throws Exception {
        return getDataAccess(DBMS.OLTP_DATASOURCE_NAME, cached);
    }
    
    public DataAccessInt getDataAccess(String datasource) throws Exception {
        return getDataAccess(datasource, false);
    }

    public DataAccessInt getDataAccess(String datasource, boolean cached) throws Exception {
        if (datasource == null) return null;
        DataAccessInt dAccess = null;
        if (cached)
            dAccess = new CachedDataAccess(datasource);
        else
            dAccess = new DataAccess(datasource);
        return dAccess;
    }


}
