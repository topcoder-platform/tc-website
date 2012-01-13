/*
 * Copyright (C) 2010 - 2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.admin.controller.request;

import com.topcoder.web.common.NavigationException;

/**
 * <p>A controller for handling the requests for viewing the page with web form for quick adding the agreements for
 * requested users to requested terms of use.</p>
 *
 * <p>Actually this controller does nothing and is introduced to enforce the authorization of the users attempting to
 * access the page.</p>
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
public class ViewAddTermsUsers extends Base {

    /**
     * <p>Constructs new <code>ViewAddTermsUsers</code> instance. This implementation does nothing.</p>
     */
    public ViewAddTermsUsers() {
    }

    /**
     * <p>Implements the business logic which is to forward request to view with web form for adding agreements for
     * requested users to requested terms of use. Validates request references valid terms of use.</p>
     *
     * @throws Exception if an unexpected error occurs.
     */
    @Override
    protected void businessProcessing() throws Exception {
        try {
            TermsOfUseHelper.validateTermsOfUse(getTermsOfUseDao(), getRequest());
            setNextPage("/addTermsUsers.jsp");
            setIsNextPageInContext(true);
        } catch (Exception e) {
            throw new NavigationException("Failed to validate the requested terms of use", e);
        }
    }
}
