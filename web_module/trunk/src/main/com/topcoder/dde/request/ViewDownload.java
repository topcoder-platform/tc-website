package com.topcoder.dde.request;

import com.topcoder.dde.catalog.ComponentManager;
import com.topcoder.dde.catalog.ComponentManagerHome;
import com.topcoder.dde.user.UserManagerRemote;
import com.topcoder.dde.user.UserManagerRemoteHome;
import com.topcoder.dde.util.Constants;
import com.topcoder.shared.security.ClassResource;
import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.PermissionException;

import javax.rmi.PortableRemoteObject;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 * Create Date: February 7, 2006
 * this class is not currently used, but is pretty much ready
 * to go if we ever want to swith to MVC for this page
 * we should probably remove the terms though
 */
public class ViewDownload extends BaseProcessor {

    protected void businessProcessing() throws Exception {

        if (getUser().isAnonymous()) {
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));
        } else {
            Object objUserManager = getInitialContext().lookup("dde/UserManager");
            UserManagerRemoteHome userManagerHome = (UserManagerRemoteHome)
                    PortableRemoteObject.narrow(objUserManager, UserManagerRemoteHome.class);
            UserManagerRemote userManager = userManagerHome.create();

            getRequest().setAttribute(Constants.TERMS, userManager.getComponentTerms());

            Object objComponentMgr = getInitialContext().lookup(ComponentManagerHome.EJB_REF_NAME);
            ComponentManagerHome compManagerHome = (ComponentManagerHome) PortableRemoteObject.narrow(objComponentMgr, ComponentManagerHome.class);
            ComponentManager compManager;

            long componentId = Long.parseLong(getRequest().getParameter("comp"));
            int version = -1;
            if (getRequest().getParameter("ver")!=null) {
                version = Integer.parseInt(getRequest().getParameter("ver"));
                compManager = compManagerHome.create(componentId, version);
            } else {
                compManager = compManagerHome.create(componentId);
            }

            getRequest().setAttribute("downloads", compManager.getDownloads());
            getRequest().setAttribute("componentInfo", compManager.getComponentInfo());
            getRequest().setAttribute("versionInfo", compManager.getVersionInfo());

            setNextPage("/catalog/download.jsp");
            setIsNextPageInContext(true);
        }

    }
}
