package com.topcoder.dde.request;

import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.PermissionException;
import com.topcoder.shared.security.ClassResource;
import com.topcoder.dde.user.UserManagerRemoteHome;
import com.topcoder.dde.user.UserManagerRemote;

import javax.rmi.PortableRemoteObject;

/**
 * @author  dok
 * @version  $Revision$ $Date$
 * Create Date: Feb 7, 2005
 */
public class ComponentTermsAgree extends BaseProcessor {

    protected void businessProcessing() throws Exception {

        if (getUser().isAnonymous()) {
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));
        } else {
            Object objUserManager = getInitialContext().lookup("dde/UserManager");
            UserManagerRemoteHome userManagerHome = (UserManagerRemoteHome)
                    PortableRemoteObject.narrow(objUserManager, UserManagerRemoteHome.class);
            UserManagerRemote userManager = userManagerHome.create();

            userManager.agreeToComponentTerms(getUser().getId());
            setNextPage("/catalog/index.jsp");
            setIsNextPageInContext(false);
        }
    }


}
