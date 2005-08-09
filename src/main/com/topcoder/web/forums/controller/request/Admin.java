/*
 * Created on Aug 9, 2005
 */
package com.topcoder.web.forums.controller.request;

import com.jivesoftware.base.UnauthorizedException;
import com.jivesoftware.base.PermissionsManager;
import com.topcoder.shared.security.ClassResource;
import com.topcoder.web.common.PermissionException;

import java.util.Iterator;

/**
 * @author mtong
 * 
 * Administrative tool providing utilities not included in Jive.
 */
public class Admin extends ForumsProcessor {

    protected void businessProcessing() throws Exception {
        super.businessProcessing();
        if (isGuest() ) {
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));
        }
     
        try {
            PermissionsManager permManager = forumFactory.getPermissionsManager();
        } catch (UnauthorizedException uae) {
            setNextPage("/main.jsp");
            setIsNextPageInContext(true);
        }

        setNextPage("/admin.jsp");
        setIsNextPageInContext(true);
    }
}
