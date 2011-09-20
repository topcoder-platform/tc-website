/*
 * Copyright (C) 2004 - 2009 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.admin.controller.request;

import javax.naming.InitialContext;

import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.admin.Constants;
import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.TCRequest;
import com.topcoder.web.ejb.termsofuse.TermsOfUse;
import com.topcoder.web.ejb.termsofuse.TermsOfUseEntity;


/**
 * <strong>Purpose</strong>:
 *
 * Helper providing common functionality for the terms of use administration pages
 *
 * @author pulky
 * @version 1.0 (Configurable Contest Terms Release Assembly v2.0)
 */
public final class TermsOfUseHelper {

    /**
     * This method validates specified terms of use
     *
     * @return the terms of use id
     *
     * @throws NavigationException if the specified terms was not found
     * @throws Exception if any other error occurs
     */
    protected static long validateTermsOfUse(TCRequest request, InitialContext context) throws NavigationException, Exception {

        String tId = StringUtils.checkNull(request.getParameter(Constants.TERMS_OF_USE_ID));
        if ("".equals(tId)) {
            throw new NavigationException("Terms of use id was not specified.");
        }

        TermsOfUse termsOfUse = (TermsOfUse)BaseProcessor.createEJB(context, TermsOfUse.class);
        TermsOfUseEntity terms = termsOfUse.getEntity(Long.parseLong(tId), DBMS.OLTP_DATASOURCE_NAME);

        if (terms != null) {
            request.setAttribute(Constants.TERMS_OF_USE_ID, tId);
            request.setAttribute(Constants.TERMS_TITLE, terms.getTitle());
        } else {
            throw new NavigationException("The specified terms of use was not found.");
        }

        return Long.parseLong(tId);
    }

    /**
     * This method load existing agreements for a specific terms of use
     *
     * @param termsId the terms of use id being queried
     *
     * @throws Exception if any error occurs
     */
    protected static void loadExistingAgreements(TCRequest request, DataAccessInt dataAccess, long termsId)
        throws Exception {
        Request r = new Request();
        r.setContentHandle("existing_terms_agreements_list");
        r.setProperty(Constants.TERMS_OF_USE_ID, String.valueOf(termsId));
        request.setAttribute("existing_agreements", dataAccess.getData(r).
            get("existing_terms_agreements_list"));
    }
}
