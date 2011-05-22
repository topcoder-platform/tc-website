/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.reg.action;

import java.util.Collection;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.naming.Context;

import com.topcoder.security.GroupPrincipal;
import com.topcoder.security.TCSubject;
import com.topcoder.security.UserPrincipal;
import com.topcoder.security.admin.PrincipalMgrRemote;
import com.topcoder.security.admin.PrincipalMgrRemoteHome;
import com.topcoder.shared.util.ApplicationServer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.TCContext;
import com.topcoder.web.common.SecurityHelper;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.dao.RegistrationTypeDAO;
import com.topcoder.web.common.dao.UserDAO;
import com.topcoder.web.common.model.RegistrationType;
import com.topcoder.web.common.model.SecurityGroup;
import com.topcoder.web.common.model.User;
import com.topcoder.web.common.model.UserGroup;
import com.topcoder.web.reg.RegHelper;

/**
 * <p>
 * Setups the user for first time.
 * </p>
 * 
 * @author live_world
 * @version 1.0
 */
public class FirstStepAction extends BaseAction implements PostAction {
    /**
     * serial version UID.
     */
    private static final long serialVersionUID = 1030202028499312064L;
    /**
     * Topcoder direct type.
     */
    private boolean topcoderDirect;
    /**
     * Topcoder normal competitor in software competitions.
     */
    private boolean competeTopcoder;
    /**
     * Studio competitions.
     */
    private boolean competeStudio;

    /**
     * Adds the user to the corresponding security group based on its registration types.
     * 
     * @return a <code>String</code> referencing the next view or action to route request to
     * @throws Exception if an unexpected error occurs while processing the request
     */
    @SuppressWarnings("unchecked")
    @Override
    public String execute() throws Exception {

        Set<UserGroup> userGroups = new HashSet<UserGroup>();
        UserDAO userDAO = getUserDAO();
        User user = userDAO.find(getCurrentUser().getId());
        RegistrationTypeDAO registrationTypeDAO = DAOUtil.getFactory().getRegistrationTypeDAO();
        // add the groups based on the user selection
        if (topcoderDirect) {
            userGroups.add(populateUserGroup(registrationTypeDAO.getCorporateType().getSecurityGroup(), user));
        }
        if (competeTopcoder) {
            userGroups.add(populateUserGroup(registrationTypeDAO.getCompetitionType().getSecurityGroup(), user));
        }
        if (competeStudio) {
            userGroups.add(populateUserGroup(registrationTypeDAO.getStudioType().getSecurityGroup(), user));
        }
        user.setSecurityGroups(userGroups);
        userDAO.saveOrUpdate(user);

        Context ctx = null;
        try {
            ctx =
                TCContext.getContext(ApplicationServer.SECURITY_CONTEXT_FACTORY,
                    ApplicationServer.SECURITY_PROVIDER_URL);
            TCSubject tcs = new TCSubject(132456);
            PrincipalMgrRemoteHome pmrh = (PrincipalMgrRemoteHome) ctx.lookup(PrincipalMgrRemoteHome.EJB_REF_NAME);
            PrincipalMgrRemote pmr = pmrh.create();

            UserPrincipal myPrincipal = new UserPrincipal("", getCurrentUser().getId());

            Set<RegistrationType> registrationTypes = new HashSet<RegistrationType>();
            if (topcoderDirect) {
                registrationTypes.add(registrationTypeDAO.getCorporateType());
            }
            if (competeTopcoder) {
                registrationTypes.add(registrationTypeDAO.getCompetitionType());
            }
            if (competeStudio) {
                registrationTypes.add(registrationTypeDAO.getStudioType());
            }

            List<SecurityGroup> types =
                DAOUtil.getFactory().getSecurityGroupDAO().getSecurityGroups(registrationTypes);

            for (SecurityGroup type : types) {
                pmr.addUserToGroup(pmr.getGroup(type.getId(), DBMS.JTS_OLTP_DATASOURCE_NAME), myPrincipal, tcs,
                    DBMS.JTS_OLTP_DATASOURCE_NAME);
            }

            Collection<GroupPrincipal> groups = pmr.getGroups(tcs, DBMS.JTS_OLTP_DATASOURCE_NAME);
            GroupPrincipal anonGroup = RegHelper.findGroupPrincipal(groups, "Anonymous");
            if (anonGroup != null) {
                pmr.addUserToGroup(anonGroup, myPrincipal, tcs, DBMS.JTS_OLTP_DATASOURCE_NAME);
            }
            GroupPrincipal userGroup = RegHelper.findGroupPrincipal(groups, "Users");
            if (userGroup != null) {
                pmr.addUserToGroup(userGroup, myPrincipal, tcs, DBMS.JTS_OLTP_DATASOURCE_NAME);
            }

            // refresh the cached object
            SecurityHelper.getUserSubject(user.getId().longValue(), true, DBMS.JTS_OLTP_DATASOURCE_NAME);
        } finally {
            RegHelper.closeContext(LOGGER, ctx);
        }
        return SUCCESS;
    }

    /**
     * Creates a user group based on the user info and the provided security group .
     * 
     * @param securityGroup the security group
     * @param user the User instance
     * @return the created user group
     */
    private UserGroup populateUserGroup(SecurityGroup securityGroup, User user) {
        UserGroup group = new UserGroup();
        group.setSecurityGroup(securityGroup);
        group.setUser(user);
        group.setSecurityStatusId(SecurityGroup.ACTIVE);
        return group;
    }

    /**
     * The getter for the topcoderDirect instance variable.
     * 
     * @return the topcoderDirect
     */
    public boolean isTopcoderDirect() {
        return topcoderDirect;
    }

    /**
     * The setter for the topcoderDirect instance variable.
     * 
     * @param topcoderDirect the topcoderDirect to set
     */
    public void setTopcoderDirect(boolean topcoderDirect) {
        this.topcoderDirect = topcoderDirect;
    }

    /**
     * The getter for the competeTopcoder instance variable.
     * 
     * @return the competeTopcoder
     */
    public boolean isCompeteTopcoder() {
        return competeTopcoder;
    }

    /**
     * The setter for the competeTopcoder instance variable.
     * 
     * @param competeTopcoder the competeTopcoder to set
     */
    public void setCompeteTopcoder(boolean competeTopcoder) {
        this.competeTopcoder = competeTopcoder;
    }

    /**
     * The getter for the competeStudio instance variable.
     * 
     * @return the competeStudio
     */
    public boolean isCompeteStudio() {
        return competeStudio;
    }

    /**
     * The setter for the competeStudio instance variable.
     * 
     * @param competeStudio the competeStudio to set
     */
    public void setCompeteStudio(boolean competeStudio) {
        this.competeStudio = competeStudio;
    }
}
