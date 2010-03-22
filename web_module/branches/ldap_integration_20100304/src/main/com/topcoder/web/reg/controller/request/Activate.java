/*
 * Copyright (C) 2006-2010 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.reg.controller.request;

import com.topcoder.security.ldap.LDAPClient;
import com.topcoder.security.ldap.LDAPClientException;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.model.Email;
import com.topcoder.web.common.model.User;
import com.topcoder.web.reg.Constants;

import java.util.Arrays;

/**
 * <p>A controller for requests for activating newlyc reated user accounts.</p>
 *
 *
 * <p>Version 2.0 (LDAP Authentication Release Assembly v1.0) change notes:
 *   <ul>
 *     <li>Updated {@link #registrationProcessing()} method to update the <code>status</code> attribute for
 *     <code>LDAP</code> entry for confirmed user account in <code>LDAP</code> directory.</li>
 *   </ul>
 * </p>
 *
 * @author dok, isv
 * @version 2.0
 */
public class Activate extends Base {

    /**
     * <p>Constructs new <code>Activate</code> instance. This implementation does nothing.</p>
     *
     * @since 2.0
     */
    public Activate() {
    }

    /**
     * <p>Handles the incoming request which is a request for confirming the newly created user account.</p>
     *
     * @throws Exception if an unexpected error occurs.
     */
    protected void registrationProcessing() throws Exception {

        String code = StringUtils.checkNull(getRequest().getParameter(Constants.ACTIVATION_CODE));
        long userId = StringUtils.getCoderId(code);

        try {
            User u = getFactory().getUserDAO().find(new Long(userId));
            if (u == null) {
                throw new NavigationException("Sorry, incorrect activation code, account not activated.");
            } else if (code.equals(u.getActivationCode())) {
                char status = u.getStatus().charValue();
                if (Arrays.binarySearch(Constants.UNACTIVE_STATI, status) >= 0) {
                    u.getPrimaryEmailAddress().setStatusId(Email.STATUS_ID_ACTIVE);
                    u.setStatus(new Character(Constants.ACTIVE_STATI[1]));
                    getFactory().getUserDAO().saveOrUpdate(u);
                    activateLDAPEntry(u.getId());
                    markForCommit();
                    setNextPage("/activated.jsp");
                    setIsNextPageInContext(true);
                } else if (Arrays.binarySearch(Constants.ACTIVE_STATI, status) >= 0) {
                    setNextPage("/activated.jsp");
                    setIsNextPageInContext(true);
                } else {
                    throw new NavigationException("Your account can not be activated.");
                }
            } else {
                throw new NavigationException("Sorry, incorrect activation code, account not activated.");
            }

        } catch (TCWebException e) {
            throw e;
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }

    /**
     * <p>Updates the <code>status</code> attributed for <code>LDAP</code> entry corresponding to specified
     * <code>TopCoder</code> member profile with <code>Active</code> status.</p>
     *
     * @param userId a <code>long</code> providing the user ID.
     * @throws LDAPClientException if an unexpected error occurs while communicating to <code>LDAP</code> server.
     * @since 2.0 
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
                log.error("Failed to disconnect from LDAP server while activating user account. "
                          + "The process is not interrupted.", e);
            }
        }
   }
}