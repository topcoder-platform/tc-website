package com.topcoder.dde.request;

import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.PermissionException;
import com.topcoder.shared.security.ClassResource;
import com.topcoder.dde.util.Constants;
import com.topcoder.dde.user.UserManagerLocalHome;
import com.topcoder.dde.user.UserManagerLocal;

import javax.rmi.PortableRemoteObject;

/**
 * @author  dok
 * @version  $Revision$ $Date$
 * Create Date: Feb 7, 2005
 */
public class ViewComponentTerms extends BaseProcessor {


    protected void businessProcessing() throws Exception {

        if (getUser().isAnonymous()) {
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));
        } else {
            UserManagerLocalHome userManagerHome = (UserManagerLocalHome)
                    PortableRemoteObject.narrow(getInitialContext().lookup("dde/UserManager"), UserManagerLocalHome.class);
            UserManagerLocal userManager = userManagerHome.create();

            getRequest().setAttribute(Constants.TERMS, userManager.getComponentTerms());
        }
    }



}
