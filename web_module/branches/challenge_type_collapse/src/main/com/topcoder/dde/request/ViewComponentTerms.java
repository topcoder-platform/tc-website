package com.topcoder.dde.request;

import javax.rmi.PortableRemoteObject;

import com.topcoder.security.admin.PrincipalMgrRemote;
import com.topcoder.security.admin.PrincipalMgrRemoteHome;
import com.topcoder.dde.catalog.ComponentManager;
import com.topcoder.dde.catalog.ComponentManagerHome;
import com.topcoder.dde.catalog.NonPublicComponentException;
import com.topcoder.dde.catalog.ReachedQuotaException;
import com.topcoder.dde.user.UserManagerRemote;
import com.topcoder.dde.user.UserManagerRemoteHome;
import com.topcoder.dde.util.Constants;
import com.topcoder.security.TCSubject;
import com.topcoder.shared.security.ClassResource;
import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.StringUtils;

/**
 * @author  dok
 * @version  $Revision$ $Date$
 * Create Date: Feb 7, 2005
 */
public class ViewComponentTerms extends BaseProcessor {


    public static final Integer QUOTA_REACHED_REASON = 1;
    public static final Integer NON_PUBLIC_REASON = 2;

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

            // the user is only agreeing to terms, no component selected
            if (StringUtils.checkNull(getRequest().getParameter("comp")).equals("")) {
                getRequest().setAttribute(Constants.TERMS, userManager.getComponentTerms());
                setNextPage("/terms/componentTerms.jsp");
            } else {
                // check if the user meets the requirements for the download before he gets to the terms page
                ComponentManagerHome componentManagerHome = (ComponentManagerHome) PortableRemoteObject.narrow(
                        getInitialContext().lookup(ComponentManagerHome.EJB_REF_NAME), ComponentManagerHome.class);
    
                TCSubject tcSubject = (TCSubject) getRequest().getSession().getAttribute("TCSUBJECT");

                // If the user directly hits this URL without entering his credentials on the login page and if he is
                // already logged in, the TCSUBJECT session attribute may not be set yet, so we need to check and set it.
                if (tcSubject == null) {
                    PrincipalMgrRemoteHome principalMgrHome = (PrincipalMgrRemoteHome)
                            getInitialContext().lookup(PrincipalMgrRemoteHome.EJB_REF_NAME);
                    PrincipalMgrRemote principalMgr = principalMgrHome.create();

                    tcSubject = principalMgr.getUserSubject(getUser().getId());
                    getRequest().getSession().setAttribute("TCSUBJECT", tcSubject);
                }

                long compId = Long.parseLong((String) getRequest().getParameter("comp"));
                ComponentManager compMgr = componentManagerHome.create(compId);
    
                try {
                    // we don't care here if the user has permission
                    // he must get to the terms page in order to get those permissions
                    compMgr.canDownload(tcSubject);
                    getRequest().setAttribute(Constants.TERMS, userManager.getComponentTerms());
                    setNextPage("/terms/componentTerms.jsp");
                } catch (ReachedQuotaException e) {
                    getRequest().setAttribute("failure_reason", QUOTA_REACHED_REASON);
                    getRequest().setAttribute("max_downloads", compMgr.getMaxPublicDownloads());
                    setNextPage("/catalog/sorry.jsp");
                } catch (NonPublicComponentException e) {
                    getRequest().setAttribute("failure_reason", NON_PUBLIC_REASON);                
                    getRequest().setAttribute("max_downloads", compMgr.getMaxPublicDownloads());
                    setNextPage("/catalog/sorry.jsp");
                }
            }
            setIsNextPageInContext(true);
        }
    }



}
