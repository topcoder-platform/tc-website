/*
 * Created on May 10, 2005
 */
package com.topcoder.web.forums.controller.request.dde;

import com.jivesoftware.base.AuthToken;
import com.jivesoftware.base.User;
import com.jivesoftware.forum.ForumFactory;
import com.topcoder.web.forums.controller.ForumsUtil;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Map;

/**
 * @author mtong
 *
 * Base class for forum-related processors, providing message and user data.
 */
public abstract class ForumsProcessor extends com.topcoder.web.forums.controller.request.ForumsProcessor {
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
        
        // set the roleMap for this user if not yet set
        if(getRequest().getSession().getAttribute("roleMap") == null
        		&& user != null) {
        	Map roleMap = ForumsUtil.lookupRoleMap(user.getID());
        	getRequest().getSession().setAttribute("roleMap", roleMap);
        }
        
        setUnreadCategories();
    }
}
