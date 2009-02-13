package com.topcoder.web.tc.controller.request.hs;

import java.rmi.RemoteException;
import java.util.Set;

import javax.ejb.CreateException;
import javax.naming.Context;

import com.topcoder.security.GeneralSecurityException;
import com.topcoder.security.GroupPrincipal;
import com.topcoder.security.TCSubject;
import com.topcoder.security.UserPrincipal;
import com.topcoder.security.admin.PrincipalMgrRemote;
import com.topcoder.security.admin.PrincipalMgrRemoteHome;
import com.topcoder.shared.util.ApplicationServer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.TCContext;
import com.topcoder.web.common.SecurityHelper;
import com.topcoder.web.common.ShortHibernateProcessor;
import com.topcoder.web.common.model.User;
import com.topcoder.web.common.model.UserGroup;

/**
 * Base class for registering/unregistering as HS competitor and in the current season.
 *  
 * @author cucu
 */
public abstract class RegistrationBase extends ShortHibernateProcessor {

    protected static final int HS_GROUP_ID = 12;
    
    /**
     * Get the status for the user in the HS ungroup.
     * 
     * @param u
     * @return
     */
    @SuppressWarnings("unchecked")
    protected Integer getHSGroupStatus(User u) {
        for (UserGroup sg : (Set<UserGroup>) u.getSecurityGroups()) {
            if (sg.getSecurityGroup().getGroupId() == HS_GROUP_ID) { 
                return sg.getSecurityStatusId();
            }
        }
        return null;
    }
    
    /**
     * Inactivates an user from the HS group
     * 
     * @param u
     * @throws Exception
     * @throws RemoteException
     * @throws CreateException
     * @throws GeneralSecurityException
     */
    protected void inactivateHsUser(User u) throws Exception, RemoteException, CreateException, GeneralSecurityException {
        log.debug("Inactivating user " + u.getId() + " for HS.");
        Context ctx = null;
        try {
            ctx = TCContext.getContext(ApplicationServer.SECURITY_CONTEXT_FACTORY, ApplicationServer.SECURITY_PROVIDER_URL);
            TCSubject tcs = new TCSubject(132456);
            PrincipalMgrRemoteHome pmrh = (PrincipalMgrRemoteHome) ctx.lookup(PrincipalMgrRemoteHome.EJB_REF_NAME);
            PrincipalMgrRemote pmr = pmrh.create();
            
            UserPrincipal user = new UserPrincipal("", u.getId().longValue());
            GroupPrincipal group = new GroupPrincipal("", HS_GROUP_ID); 
            
            pmr.removeUserFromGroup(group, user, tcs, DBMS.JTS_OLTP_DATASOURCE_NAME);

            //refresh the cached object
            SecurityHelper.getUserSubject(u.getId().longValue(), true, DBMS.JTS_OLTP_DATASOURCE_NAME);
            
        } finally {
            close(ctx);
        }
    }

}
