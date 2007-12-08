package com.topcoder.dde.request;

import com.topcoder.dde.catalog.ComponentManager;
import com.topcoder.dde.catalog.ComponentManagerHome;
import com.topcoder.dde.user.UserManagerRemote;
import com.topcoder.dde.user.UserManagerRemoteHome;
import com.topcoder.dde.util.Constants;
import com.topcoder.security.TCSubject;
import com.topcoder.shared.security.ClassResource;
import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.PermissionException;

import javax.rmi.PortableRemoteObject;

/**
 * @author  dok
 * @version  $Revision$ $Date$
 * Create Date: Feb 7, 2005
 */
public class ViewComponentTerms extends BaseProcessor {


    protected void businessProcessing() throws Exception {

        getRequest().setAttribute("comp", getRequest().getParameter("comp"));
        if (getRequest().getParameter("ver")!=null) {
            getRequest().setAttribute("ver", getRequest().getParameter("ver"));
        }
        if (getUser().isAnonymous()) {
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));
        } else {
            Object objUserManager = getInitialContext().lookup("dde/UserManager");
            UserManagerRemoteHome userManagerHome = (UserManagerRemoteHome)
                    PortableRemoteObject.narrow(objUserManager, UserManagerRemoteHome.class);
            UserManagerRemote userManager = userManagerHome.create();

            // check if the user meets the requirements for the download before he gets to the terms page
            ComponentManagerHome componentManagerHome = (ComponentManagerHome) PortableRemoteObject.narrow(
                    getInitialContext().lookup(ComponentManagerHome.EJB_REF_NAME), ComponentManagerHome.class);

            TCSubject tcSubject = (TCSubject) getRequest().getSession().getAttribute("TCSUBJECT");
            long compId = Long.parseLong((String) getRequest().getParameter("comp"));
            ComponentManager compMgr = componentManagerHome.create(compId);
            if (compMgr.canDownload(tcSubject)) {
                getRequest().setAttribute(Constants.TERMS, userManager.getComponentTerms());
                setNextPage("/terms/componentTerms.jsp");
            } else {
                // go to error page
            }
            setIsNextPageInContext(true);
        }
    }



}
