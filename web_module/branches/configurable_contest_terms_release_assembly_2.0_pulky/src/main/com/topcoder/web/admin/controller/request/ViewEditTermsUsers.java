/*
 * Copyright (C) 2004 - 2009 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.admin.controller.request;

import com.topcoder.web.common.NavigationException;


/**
 * <strong>Purpose</strong>:
 *
 * This processor handles a detailed terms of use agreement view requested from the terms of use administration page.
 *
 * @author pulky
 * @version 1.0 (Configurable Contest Terms Release Assembly v2.0)
 */
public class ViewEditTermsUsers extends Base {
    protected void businessProcessing() throws Exception {
        try {
            // validate terms
            long termsId = TermsOfUseHelper.validateTermsOfUse(getRequest(), getInitialContext());

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
