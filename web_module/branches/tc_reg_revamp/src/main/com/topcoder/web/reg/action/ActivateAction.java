/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.reg.action;

import java.util.Arrays;

import org.apache.struts2.ServletActionContext;

import com.topcoder.security.ldap.LDAPClient;
import com.topcoder.security.ldap.LDAPClientException;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.WebConstants;
import com.topcoder.web.common.dao.UserDAO;
import com.topcoder.web.common.model.Email;
import com.topcoder.web.common.model.User;
import com.topcoder.web.reg.RegHelper;

/**
 * <p>
 * Activates the user.
 * </p>
 * 
 * @author live_world
 * @version 1.0
 */
public class ActivateAction extends BaseAction implements GetAction {

    /**
     * serial version UID.
     */
    private static final long serialVersionUID = 2755591303261603392L;

    /**
     * Activates the user by activation code.
     * 
     * @return a <code>String</code> referencing the next view or action to route request to
     * @throws Exception if an unexpected error occurs while processing the request
     */
    @Override
    public String execute() throws Exception {
        String code = ServletActionContext.getRequest().getParameter(WebConstants.ACTIVATION_CODE);
        if (RegHelper.isEmptyString(code)) {
            addActionError("empty activation code.");
            return ERROR;
        }
        // validate the user.
        long userId = StringUtils.getCoderId(code);
        UserDAO userDAO = getUserDAO();
        User user = userDAO.find(new Long(userId));
        if (user == null || !code.equals(user.getActivationCode())) {
            addActionError("incorrect activation code.");
            return ERROR;
        }

        char status = user.getStatus().charValue();
        // if the user is not active
        if (Arrays.binarySearch(WebConstants.UNACTIVE_STATI, status) >= 0) {
            user.getPrimaryEmailAddress().setStatusId(Email.STATUS_ID_ACTIVE);
            user.setStatus(new Character(WebConstants.ACTIVE_STATI[1]));
            userDAO.saveOrUpdate(user);
            activateLDAPEntry(user.getId());
        }
        return SUCCESS;
    }

    /**
     * <p>
     * Updates the status attributed of LDAP entry corresponding to specified TopCoder member profile with Active
     * status.
     * </p>
     * 
     * @param userId a providing the user ID.
     * @throws LDAPClientException if an unexpected error occurs while communicating to LDAP server.
     */
    private void activateLDAPEntry(long userId) throws LDAPClientException {
        LDAPClient ldapClient = new LDAPClient();
        try {
            ldapClient.connect();
            ldapClient.activateTopCoderMemberProfile(userId);
        } finally {
            try {
                ldapClient.disconnect();
            } catch (LDAPClientException e) {
                LOGGER.error("Failed to disconnect from LDAP server while activating user account. "
                    + "The process is not interrupted.", e);
            }
        }
    }
}
