package com.topcoder.web.admin.controller.request;

import java.rmi.RemoteException;

import javax.ejb.CreateException;
import javax.ejb.EJBException;
import javax.naming.NamingException;

import com.topcoder.security.GeneralSecurityException;
import com.topcoder.security.NoSuchUserException;
import com.topcoder.security.UserPrincipal;
import com.topcoder.security.admin.PrincipalMgrRemote;
import com.topcoder.security.admin.PrincipalMgrRemoteHome;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.admin.Constants;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.ejb.termsofuse.TermsOfUse;
import com.topcoder.web.ejb.termsofuse.TermsOfUseEntity;
import com.topcoder.web.ejb.user.UserTermsOfUse;
import com.topcoder.web.ejb.user.UserTermsOfUseLocator;

/**
 * @author  dok
 * @version  $Revision$ $Date$
 * Create Date: Apr 27, 2005
 */
public class CreateTermsOfUseAgreement extends Base {
    protected void businessProcessing() throws Exception {
        try {
            String tId = StringUtils.checkNull(getRequest().getParameter(Constants.TERMS_OF_USE_ID));
            String handle = StringUtils.checkNull(getRequest().getParameter("ha"));
            if (!"".equals(tId)) {
                TermsOfUse termsOfUse = (TermsOfUse)createEJB(getInitialContext(), TermsOfUse.class);
                TermsOfUseEntity terms = termsOfUse.getEntity(Long.parseLong(tId), DBMS.OLTP_DATASOURCE_NAME);
    
                if (terms != null) {
                    getRequest().setAttribute(Constants.TERMS_OF_USE_ID, tId);
                    getRequest().setAttribute(Constants.TERMS_TITLE, terms.getTitle());
                } else {
                    throw new NavigationException("The specified terms of use was not found.");
                }

                if ("".equals(handle)) {
                    addError("ha", "You must enter a handle.");
                }

                Long userId;
                try {
                    userId = getUserIdFromHandle(handle);
                } catch (Exception e) {
                    throw new NavigationException("There was an unexpected error while retrieving specified user.", e);
                }
                
                if (userId == null) {
                    addError("ha", "The handle you entered doesn't exist. Please enter a valid handle.");
                }
                
                try {
                    long termsId = Long.parseLong(tId);
                    UserTermsOfUse userTermsOfUse = UserTermsOfUseLocator.getService();
                    userTermsOfUse.createUserTermsOfUse(userId, termsId, DBMS.COMMON_OLTP_DATASOURCE_NAME);
                } catch (Exception e) {
                    throw new NavigationException("There was an unexpected error while generating.", e);
                }
                
                getRequest().setAttribute("message", "The agreement for " + handle + " was successfully generated.");                
            } else {
                throw new NavigationException("Terms of use id was not specified.");
            }
        } catch (Exception e) {
            throw new NavigationException("There was an unexpected error while processing the specified agreement.", e);
        }
        setNextPage("/viewEditTermsUsers.jsp");
        setIsNextPageInContext(true);
    }

    private Long getUserIdFromHandle(String handle) throws NoSuchUserException, RemoteException, 
        GeneralSecurityException, EJBException, CreateException, NamingException {
        
        PrincipalMgrRemoteHome principalMgrHome = (PrincipalMgrRemoteHome) getInitialContext().lookup(PrincipalMgrRemoteHome.EJB_REF_NAME);
        PrincipalMgrRemote principalMgr = principalMgrHome.create();
        UserPrincipal up = principalMgr.getUser(handle);

        if (up != null) {
            return up.getId();
        }
        return null;
    }

    private void loadExistingAgreements(String id) throws Exception {
        Request r = new Request();
        r.setContentHandle("existing_terms_agreements_list");
        r.setProperty(Constants.TERMS_OF_USE_ID, id);
        getRequest().setAttribute("existing_agreements", getDataAccess().getData(r).get("existing_terms_agreements_list"));
    }


}
