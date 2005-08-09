/*
 * Created on Aug 9, 2005
 */
package com.topcoder.web.forums.controller.request;

import com.jivesoftware.base.UserManager;
import com.jivesoftware.base.Group;
import com.jivesoftware.base.PermissionsManager;
import com.jivesoftware.base.PermissionType;
import com.jivesoftware.base.Permissions;
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
        UserManager userManager = forumFactory.getUserManager();
        PermissionsManager permManager = forumFactory.getPermissionsManager();
        if (isGuest() ) {
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));
        }
        boolean isSysAdmin = false;
        isSysAdmin |= user.getPermissions(authToken).hasPermission(Permissions.SYSTEM_ADMIN);
        Iterator itGroups = permManager.groupsWithPermission(PermissionType.ADDITIVE, Permissions.SYSTEM_ADMIN);
        while (itGroups.hasNext()) {
            isSysAdmin |= ((Group)itGroups.next()).isMember(user);  
        }
        if (!isSysAdmin) {
            setNextPage("/main.jsp");
            setIsNextPageInContext(true);
        }

        setNextPage("/admin.jsp");
        setIsNextPageInContext(true);
    }
}
