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
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.SecurityHelper;
import com.topcoder.web.common.ShortHibernateProcessor;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.model.Event;
import com.topcoder.web.common.model.EventRegistration;
import com.topcoder.web.common.model.Season;
import com.topcoder.web.common.model.SecurityGroup;
import com.topcoder.web.common.model.User;
import com.topcoder.web.common.model.UserGroup;
import com.topcoder.web.reg.Constants;
/**
 *
 * @author cucu
 */
public class Register extends ShortHibernateProcessor {

    @SuppressWarnings("unchecked")
    @Override
    protected void dbProcessing() throws Exception {

        // Check that the user is eligible, just in case he fakes the URL
        User u = DAOUtil.getFactory().getUserDAO().find(new Long(getUser().getId()));
        
        Integer hsStatus = null;
        
        for (UserGroup sg : (Set<UserGroup>) u.getSecurityGroups()) {
            if (sg.getSecurityGroup().getGroupId() == 12) { // use constants!
                hsStatus = sg.getSecurityStatusId();
                break;
            }
        }
        
        if (!SecurityGroup.ACTIVE.equals(hsStatus)) {
            throw new NavigationException("You're not eligible for High School");
        }
        
        Event event =  DAOUtil.getFactory().getSeasonDAO().findCurrent(Season.HS_SEASON).getEvent(); 
        EventRegistration registration = DAOUtil.getFactory().getEventRegistrationDAO().find(u.getId(), event.getId());
        
        if (registration != null) {
            throw new NavigationException("You're not eligible for High School or benn already registered");            
        }
                
                
        int ageHs = Integer.parseInt(getRequest().getParameter(Constants.AGE_FOR_HS));

        boolean eligible = "yes".equals(getRequest().getParameter(Constants.ATTENDING_HS)) && ageHs < Constants.MAX_AGE_FOR_HS;

        u.addEventRegistration(event, null, eligible);
        DAOUtil.getFactory().getUserDAO().saveOrUpdate(u);            

        if (!eligible) {
            inactivateHsUser(u);
        }
        
        markForCommit();

        setNextPage("/tc?module=HSViewRegister");
        setIsNextPageInContext(true);
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
