/*
 * Copyright (C) 2004 - 2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.admin.controller.request;

import com.topcoder.web.common.NavigationException;


/**
 * <strong>Purpose</strong>:
 *
 * This processor handles a detailed terms of use agreement view requested from the terms of use administration page.
 *
 * <p>
 *   Version 1.1 (TopCoder Terms of Use Management Refactoring v1.0) Change notes:
 *   <ol>
 *     <li>Updated to use the Terms of Use DAO component instead of Terms of Use EJB.</li>
 *   </ol>
 * </p>
 * 
 * @author pulky, TCSASSEMBER
 * @version 1.1 (Configurable Contest Terms Release Assembly v2.0)
 */
public class ViewEditTermsUsers extends Base {
    protected void businessProcessing() throws Exception {
        try {
            // validate terms
            long termsId = TermsOfUseHelper.validateTermsOfUse(getTermsOfUseDao(), getRequest());

            // get existing agreements to be shown on the page
            TermsOfUseHelper.loadExistingAgreements(getRequest(), getDataAccess(), termsId);
        } catch (NavigationException e) {
            throw e;
        } catch (Exception e) {
            throw new NavigationException("There was an unexpected error while processing the specified agreement.", e);
        }
        setNextPage("/viewEditTermsUsers.jsp");
        setIsNextPageInContext(true);
    }
}
