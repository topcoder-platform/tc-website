/*
 * Copyright (C) 2004 - 2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.admin.controller.request;

import com.cronos.termsofuse.dao.UserTermsOfUseDao;
import com.topcoder.web.admin.Constants;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.StringUtils;

/**
 * <strong>Purpose</strong>:
 *
 * This processor handles a terms of use agreement creation requested from the terms of use administration page.
 *
 *
  * <p>
  *   Version 1.1 (Miscellaneous TC Improvements Release Assembly 1.0) Change notes:
  *   <ol>
  *     <li>Added public constructor to conform to current TC coding standards.</li>
  *     <li>Refactored {@link #businessProcessing()} to take into consideration different source views which originated
 *      request to this controller.</li>
  *   </ol>
  * </p>
 *
 * <p>
 *   Version 1.2 (TopCoder Terms of Use Management Refactoring v1.0) Change notes:
 *   <ol>
 *     <li>Updated to use the Terms of Use DAO component instead of Terms of Use EJB.</li>
 *   </ol>
 * </p>
 * 
 * @author pulky, isv, TCSASSEMBER
 * @version 1.2 (Miscellaneous TC Improvements Assembly v1.0)
 * @since 1.0 (Configurable Contest Terms Release Assembly v2.0)
 */
public class CreateTermsOfUseAgreement extends Base {

    /**
     * <p>A <code>String</code> providing the name of request parameter referencing the source of request.</p>
     *
     * @since 1.1
     */
    private static final String SOURCE = "source";

    /**
     * <p>Constructs new <code>CreateTermsOfUseAgreement</code> instance. This implementation does nothing.</p>
     */
    public CreateTermsOfUseAgreement() {
    }

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
            // Validate terms, handle, request source and create an agreement if request passes the validation
            long termsId = TermsOfUseHelper.validateTermsOfUse(getTermsOfUseDao(), getRequest());
            Long userId = validateHandle();
            String source = StringUtils.checkNull(getRequest().getParameter(SOURCE));
            String sourceModule;
            if ("view".equals(source)) {
                sourceModule = "ViewEditTermsUsers";
            } else if ("quick".equals(source)) {
                sourceModule = "ViewAddTermsUsers";
            } else {
                throw new NavigationException("Invalid request. Wrong source specified.");
            }
            
            boolean success = !hasErrors();
            if (success) {
                success = createAgreement(termsId, userId);
            }
            
            if (success) {
                // Redirect after POST to View User Agreements page
                setNextPage(getSessionInfo().getServletPath() + "?module=" + sourceModule + "&"
                            + Constants.TERMS_OF_USE_ID + "=" + termsId + "&agreementCreated=true");
                setIsNextPageInContext(false);
            } else {
                // There was either validation or operational error - forward to View User Agreements page to display
                // error message 
                if ("ViewEditTermsUsers".equals(sourceModule)) {
                    TermsOfUseHelper.loadExistingAgreements(getRequest(), getDataAccess(), termsId);
                    setNextPage("/viewEditTermsUsers.jsp");
                } else {
                    setNextPage("/addTermsUsers.jsp");
                }
                setIsNextPageInContext(true);
            }
        } catch (NavigationException e) {
            throw e;
        } catch (Exception e) {
            throw new NavigationException("There was an unexpected error while processing the specified agreement.", e);
        }
    }

    /**
     * <p>Creates the record for agreement for the specified user to specified terms of use.</p>
     *
     * @param termsId a <code>long</code> providing the ID for the terms of use to create agreement for.
     * @param userId a <code>long</code> providing the ID for the user to create agreement for.
     * @return <code>true</code> if agreement was recorded successfully; <code>false</code> if such an agreement is
     *         already recorded.
     * @throws NavigationException if there was an error while generating the agreement.
     * @throws Exception if any other error occurs.
     */
    private boolean createAgreement(long termsId, long userId) throws NavigationException, Exception {
        UserTermsOfUseDao userTermsOfUse = getUserTermsOfUseDao();

        // check if the agreement already exists
        if (userTermsOfUse.hasTermsOfUse(userId, termsId)) {
            addError(Constants.HANDLE, "The agreement already exists for the specified handle.");
            return false;
        }

        // check if the the specified user is banned from accepting this terms of use
        if (userTermsOfUse.hasTermsOfUseBan(userId, termsId)) {
            addError(Constants.HANDLE, "The specified handle is banned from having this terms of use.");
            return false;
        }

        try {
            userTermsOfUse.createUserTermsOfUse(userId, termsId);
            return true;
        } catch (Exception e) {
            throw new NavigationException("There was an unexpected error while generating the agreement.", e);
        }
    }
}
