package com.topcoder.web.tc.controller.request.hs;

import java.util.Set;

import com.topcoder.web.common.HSRegistrationHelper;
import com.topcoder.web.common.ShortHibernateProcessor;
import com.topcoder.web.common.model.User;
import com.topcoder.web.common.model.UserGroup;

/**
 * Base class for registering/unregistering as HS competitor and in the current season.
 *  
 * @author cucu
 */
public abstract class RegistrationBase extends ShortHibernateProcessor {
   
    
    /**
     * Get the status for the user in the HS ungroup.
     * 
     * @param u
     * @return
     */
    @SuppressWarnings("unchecked")
    protected Integer getHSGroupStatus(User u) {
        for (UserGroup sg : (Set<UserGroup>) u.getSecurityGroups()) {
            if (sg.getSecurityGroup().getGroupId() == HSRegistrationHelper.HS_GROUP_ID) { 
                return sg.getSecurityStatusId();
            }
        }
        return null;
    }
    

}
