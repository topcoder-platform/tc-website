package com.topcoder.dde.request;

import com.topcoder.dde.user.UserManagerRemote;
import com.topcoder.dde.user.UserManagerRemoteHome;
import com.topcoder.security.admin.PrincipalMgrRemote;
import com.topcoder.security.admin.PrincipalMgrRemoteHome;
import com.topcoder.shared.security.ClassResource;
import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.PermissionException;

import javax.rmi.PortableRemoteObject;

/**
 * @author  dok
 * @version  $Revision: 43006 $ $Date$
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

            PrincipalMgrRemoteHome principalMgrHome = (PrincipalMgrRemoteHome)
                    getInitialContext().lookup(PrincipalMgrRemoteHome.EJB_REF_NAME);
            PrincipalMgrRemote principalMgr = principalMgrHome.create();

            //reload the subject object so that their new role is available
            getRequest().getSession().setAttribute("TCSUBJECT", principalMgr.getUserSubject(getUser().getId()));


            String componentId = getRequest().getParameter("comp");
            String version = getRequest().getParameter("ver")==null?"":getRequest().getParameter("ver");

            if (componentId!=null) {
                StringBuffer buf = new StringBuffer(40);
                buf.append("/catalog/c_component_download.jsp?comp=");
                buf.append(componentId);
                if (!"".equals(version)) {
                    buf.append("&ver=").append(version);
                }
                setNextPage(buf.toString());
            } else {
                setNextPage("/catalog/index.jsp");
            }
            setIsNextPageInContext(false);
        }
    }


}
