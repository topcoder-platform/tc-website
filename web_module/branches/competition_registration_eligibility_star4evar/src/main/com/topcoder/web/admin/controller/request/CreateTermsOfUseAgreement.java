/*
 * Copyright (C) 2004 - 2009 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.admin.controller.request;

import com.topcoder.security.NoSuchUserException;
import com.topcoder.security.UserPrincipal;
import com.topcoder.security.admin.PrincipalMgrRemote;
import com.topcoder.security.admin.PrincipalMgrRemoteHome;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.admin.Constants;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.ejb.user.UserTermsOfUse;
import com.topcoder.web.ejb.user.UserTermsOfUseLocator;

/**
 * <strong>Purpose</strong>:
 *
 * This processor handles a terms of use agreement creation requested from the terms of use administration page.
 *
 * @author pulky
 * @version 1.0 (Configurable Contest Terms Release Assembly v2.0)
 */
public class CreateTermsOfUseAgreement extends Base {

    /**
     * This method is the final processor for the request.
     *
     * It will validate the necessary parameters are set and:
     * - the specified terms of use exists.
     * - the handle is valid (corresponds to an existing user)
     * - the agreement doesn't exist
     *
     * @throws NavigationException if any error occurs
     * @see com.topcoder.web.common.BaseProcessor#businessProcessing()
     */
    protected void businessProcessing() throws NavigationException {
        try {
            // validate terms
            long termsId = TermsOfUseHelper.validateTermsOfUse(getRequest(), getInitialContext());

            // validate handle
            Long userId = validateHandle();

            // create agreement
            if (!hasErrors()) {
                createAgreement(termsId, userId);
            }

            // refresh existing agreements to be shown on the page
            TermsOfUseHelper.loadExistingAgreements(getRequest(), getDataAccess(), termsId);
        } catch (NavigationException e) {
            throw e;
        } catch (Exception e) {
            throw new NavigationException("There was an unexpected error while processing the specified agreement.", e);
        }
        setNextPage("/viewEditTermsUsers.jsp");
        setIsNextPageInContext(true);
    }

    /**
     * This method validates specified handle
     *
     * Note: error messages are added to the request
     *
     * @return the user id, or null if there are validation errors
     *
     * @throws NavigationException if the specified user can't be retrieved
     */
    private Long validateHandle() throws NavigationException {
        String handle = StringUtils.checkNull(getRequest().getParameter(Constants.HANDLE));

        if ("".equals(handle)) {
            addError(Constants.HANDLE, "You must enter a handle.");
            return null;
        }

        Long userId = null;
        try {
            userId = getUserIdFromHandle(handle);
        } catch (Exception e) {
            throw new NavigationException("There was an unexpected error while retrieving specified user.", e);
        }

        if (userId == null) {
            addError(Constants.HANDLE, "The handle you entered doesn't exist. Please enter a valid handle.");
        }

        return userId;
    }

    /**
     * This method creates a specific terms of use agreement
     *
     * Note: error messages are added to the request
     *
     * @param termsId the terms of use agree
     * @param userId the user id agreeing to the terms
     *
     * @throws NavigationException if there was an error while generating the agreement
     * @throws Exception if any other error occurs
     */
    private void createAgreement(long termsId, long userId) throws NavigationException, Exception {

        UserTermsOfUse userTermsOfUse = UserTermsOfUseLocator.getService();

        // check if the agreement already exists
        if (userTermsOfUse.hasTermsOfUse(userId, termsId, DBMS.COMMON_OLTP_DATASOURCE_NAME)) {
            addError(Constants.HANDLE, "The agreement already exists for the specified handle.");
            return;
        }

        try {
            userTermsOfUse.createUserTermsOfUse(userId, termsId, DBMS.COMMON_OLTP_DATASOURCE_NAME);
        } catch (Exception e) {
            throw new NavigationException("There was an unexpected error while generating the agreement.", e);
        }

        getRequest().setAttribute("message", "The agreement was successfully generated.");
    }

    /**
     * This method returns a user id based on a tc handle.
     *
     * @param handle the handle being queried
     * @return the user id or null if it can't be found
     *
     * @throws Exception if any error occurs
     */
    private Long getUserIdFromHandle(String handle) throws Exception {
        PrincipalMgrRemoteHome principalMgrHome = (PrincipalMgrRemoteHome) getInitialContext().lookup(
            PrincipalMgrRemoteHome.EJB_REF_NAME);
        PrincipalMgrRemote principalMgr = principalMgrHome.create();

        UserPrincipal up = null;
        try {
            up = principalMgr.getUser(handle);
        } catch (NoSuchUserException nsue) {
            // don't do anything, return null
        }

        if (up != null) {
            return up.getId();
        }
        return null;
    }
}
