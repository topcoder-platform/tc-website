package com.topcoder.dde.request;

import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.PermissionException;
import com.topcoder.shared.security.ClassResource;
import com.topcoder.dde.util.Constants;
import com.topcoder.dde.user.UserManagerLocalHome;
import com.topcoder.dde.user.UserManagerLocal;

import javax.rmi.PortableRemoteObject;
import javax.naming.NamingEnumeration;

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
            log.debug("name : " + getInitialContext().lookup(UserManagerLocalHome.EJB_REF_NAME).getClass().getName());
            UserManagerLocalHome userManagerHome = (UserManagerLocalHome)
                    getInitialContext().lookup(UserManagerLocalHome.EJB_REF_NAME);
            UserManagerLocal userManager = userManagerHome.create();

            getRequest().setAttribute(Constants.TERMS, userManager.getComponentTerms());
            setNextPage("/terms/componentTerms.jsp");
            setIsNextPageInContext(true);
        }
    }



}
