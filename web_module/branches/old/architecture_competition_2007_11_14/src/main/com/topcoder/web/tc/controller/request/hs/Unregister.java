package com.topcoder.web.tc.controller.request.hs;

import java.rmi.RemoteException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Set;

import javax.ejb.CreateException;
import javax.naming.Context;

import com.topcoder.security.GeneralSecurityException;
import com.topcoder.security.GroupPrincipal;
import com.topcoder.security.TCSubject;
import com.topcoder.security.UserPrincipal;
import com.topcoder.security.admin.PrincipalMgrRemote;
import com.topcoder.security.admin.PrincipalMgrRemoteHome;
import com.topcoder.shared.security.ClassResource;
import com.topcoder.shared.util.ApplicationServer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.TCContext;
import com.topcoder.web.common.HSRegistrationHelper;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.SecurityHelper;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.model.Event;
import com.topcoder.web.common.model.EventRegistration;
import com.topcoder.web.common.model.Season;
import com.topcoder.web.common.model.SecurityGroup;
import com.topcoder.web.common.model.User;
import com.topcoder.web.common.model.UserGroup;
import com.topcoder.web.tc.Constants;


/**
 * Unregister a coder from HS and the current HS season.
 * 
 * @author cucu
 */
public class Unregister extends RegistrationBase {

    @SuppressWarnings("unchecked")
    @Override
    protected void dbProcessing() throws Exception {
        if (!userLoggedIn()) {
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));
        } 

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm");

        // Check that the user is eligible, just in case he fakes the URL
        User u = DAOUtil.getFactory().getUserDAO().find(new Long(getUser().getId()));
       
        List<Season> seasons = DAOUtil.getFactory().getSeasonDAO().findCurrentAndUpcoming(Season.HS_SEASON);
        for (Season season : seasons) {
            Event event =  season.getEvent(); 
            EventRegistration registration = DAOUtil.getFactory().getEventRegistrationDAO().find(u.getId(), event.getId());
            
            // If he was eligible for the current season, mark him as uneligible.
            if (registration != null && registration.isEligible()) {
                registration.setEligible(false);
                registration.setNotes("System: User requested un registration on " + sdf.format(new Date()));
            }
        }
                    
        DAOUtil.getFactory().getUserDAO().saveOrUpdate(u);
        inactivateHsUser(u);

        boolean hasReg = false;
        for (UserGroup sg : (Set<UserGroup>) u.getSecurityGroups()) {
            // if it belongs to a security group for a registration 
            if (!sg.getSecurityGroup().getRegistrationTypes().isEmpty()) { 
                if (SecurityGroup.ACTIVE.equals(sg.getSecurityStatusId())) {
                    hasReg = true;
                    break;                   
                }
            }
        }

        markForCommit();

        getRequest().setAttribute("hasReg", hasReg);
        setNextPage(Constants.HS_UNREGISTER);
        setIsNextPageInContext(true);
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
            GroupPrincipal group = new GroupPrincipal("", HSRegistrationHelper.HS_GROUP_ID); 
            
            pmr.removeUserFromGroup(group, user, tcs, DBMS.JTS_OLTP_DATASOURCE_NAME);

            //refresh the cached object
            SecurityHelper.getUserSubject(u.getId().longValue(), true, DBMS.JTS_OLTP_DATASOURCE_NAME);
            
        } finally {
            close(ctx);
        }
    }

}
