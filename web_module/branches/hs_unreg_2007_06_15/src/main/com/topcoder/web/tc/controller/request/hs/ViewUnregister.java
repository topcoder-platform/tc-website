package com.topcoder.web.tc.controller.request.hs;

import java.util.Set;

import com.topcoder.shared.security.ClassResource;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.ShortHibernateProcessor;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.model.SecurityGroup;
import com.topcoder.web.common.model.User;
import com.topcoder.web.common.model.UserGroup;
import com.topcoder.web.tc.Constants;

/**
 *
 * @author cucu
 */
public class ViewUnregister extends ShortHibernateProcessor {

    @SuppressWarnings("unchecked")
    @Override
    protected void dbProcessing() throws Exception {
        if (!userLoggedIn()) {
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));
        } 
        
        User u = DAOUtil.getFactory().getUserDAO().find(new Long(getUser().getId()));
        Integer hsStatus = null;
        for (UserGroup sg : (Set<UserGroup>) u.getSecurityGroups()) {
            if (sg.getSecurityGroup().getGroupId() == 12) { // use constants!
                hsStatus = sg.getSecurityStatusId();
                break;
            }
        }

        boolean active = SecurityGroup.ACTIVE.equals(hsStatus);

        getRequest().setAttribute("active", active);
        
        setNextPage(Constants.HS_VIEW_UNREGISTER);
        setIsNextPageInContext(true);
    } 

}
