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
 *
 * @author cucu
 */
public abstract class RegistrationBase extends ShortHibernateProcessor {

    @SuppressWarnings("unchecked")
    protected Integer getHSGroupStatus(User u) {
        for (UserGroup sg : (Set<UserGroup>) u.getSecurityGroups()) {
            if (sg.getSecurityGroup().getGroupId() == 12) { // use constants!
                return sg.getSecurityStatusId();
            }
        }
        return null;
    }
    
    protected void inactivateHsUser(User u) throws Exception, RemoteException, CreateException, GeneralSecurityException {
        log.debug("Inactivating user " + u.getId() + " for HS.");
        Context ctx = null;
        try {
            ctx = TCContext.getContext(ApplicationServer.SECURITY_CONTEXT_FACTORY, ApplicationServer.SECURITY_PROVIDER_URL);
            TCSubject tcs = new TCSubject(132456);
            PrincipalMgrRemoteHome pmrh = (PrincipalMgrRemoteHome) ctx.lookup(PrincipalMgrRemoteHome.EJB_REF_NAME);
            PrincipalMgrRemote pmr = pmrh.create();
            
            UserPrincipal user = new UserPrincipal("", u.getId().longValue());
            GroupPrincipal group = new GroupPrincipal("", 12); // HS group
            
            pmr.removeUserFromGroup(group, user, tcs, DBMS.JTS_OLTP_DATASOURCE_NAME);

            //refresh the cached object
            SecurityHelper.getUserSubject(u.getId().longValue(), true, DBMS.JTS_OLTP_DATASOURCE_NAME);
            
        } finally {
            close(ctx);
        }

    }

}
