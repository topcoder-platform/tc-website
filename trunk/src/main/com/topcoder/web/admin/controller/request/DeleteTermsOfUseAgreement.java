/*
 * Copyright (C) 2010 - 2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.admin.controller.request;

import com.cronos.termsofuse.dao.UserTermsOfUseDao;
import com.topcoder.web.admin.Constants;
import com.topcoder.web.common.NavigationException;

/**
 * <p>A controller for handling the requests for deleting the individual agreement for requested user to requested
 * terms of use.</p>
 *
 * <p>
 *   Version 1.1 (TopCoder Terms of Use Management Refactoring v1.0) Change notes:
 *   <ol>
 *     <li>Updated to use the Terms of Use DAO component instead of Terms of Use EJB.</li>
 *   </ol>
 * </p>
 * 
 * @author isv, TCSASSEMBER
 * @version 1.1 (Miscellaneous TC Improvements Assembly v1.0)
 */
public class DeleteTermsOfUseAgreement extends Base {

    /**
     * <p>Implements the business logic which is to delete the agreement for requested user to requested terms of use.
     * </p>
     *
     * @throws Exception if an unexpected error occurs which prevents request from successful processing.
     */
    @Override
    protected void businessProcessing() throws Exception {
        try {
            // Validate terms, handle and remove an agreement if request passes the validation
            long termsId = TermsOfUseHelper.validateTermsOfUse(getTermsOfUseDao(), getRequest());
            Long userId = validateUserId();
            if (!hasErrors()) {
                deleteAgreement(termsId, userId);
                // Redirect after POST to View User Agreements page
                setNextPage(getSessionInfo().getServletPath() + "?module=ViewEditTermsUsers&"
                            + Constants.TERMS_OF_USE_ID + "=" + termsId + "&agreementRemoved=true");
                setIsNextPageInContext(false);
            } else {
                // There was validation error - forward to View User Agreements page to display error message
                TermsOfUseHelper.loadExistingAgreements(getRequest(), getDataAccess(), termsId);
                setNextPage("/viewEditTermsUsers.jsp");
                setIsNextPageInContext(true);
            }
        } catch (NavigationException e) {
            throw e;
        } catch (Exception e) {
            throw new NavigationException("There was an unexpected error while processing the specified agreement.", e);
        }
    }

    /**
     * This method creates a specific terms of use agreement
     *
     * <p>Note: error messages are added to the request.</p>
     *
     * @param termsId a <code>long</code> providing the ID for terms of use to remove agreement for.
     * @param userId a <code>long</code> providing the ID for user to remove agreement for.
     * @throws NavigationException if there was an error while removing the agreement.
     * @throws Exception if any other error occurs which prevents the method from successful execution.
     */
    private void deleteAgreement(long termsId, long userId) throws NavigationException, Exception {
        UserTermsOfUseDao userTermsOfUseDao = getUserTermsOfUseDao();
        if (!userTermsOfUseDao.hasTermsOfUse(userId, termsId)) {
            addError(Constants.HANDLE, "The agreement does not exist for the specified handle.");
        } else {
            try {
                userTermsOfUseDao.removeUserTermsOfUse(userId, termsId);
            } catch (Exception e) {
                throw new NavigationException("There was an unexpected error while removing the agreement.", e);
            }
            getRequest().setAttribute("message", "The agreement was successfully removed.");
        }
    }
}
