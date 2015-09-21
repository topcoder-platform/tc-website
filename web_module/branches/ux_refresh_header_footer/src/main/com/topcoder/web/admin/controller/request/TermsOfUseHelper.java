/*
 * Copyright (C) 2004 - 2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.admin.controller.request;

import com.cronos.termsofuse.dao.TermsOfUseDao;
import com.cronos.termsofuse.model.TermsOfUse;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.web.admin.Constants;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.TCRequest;


/**
 * <strong>Purpose</strong>:
 *
 * Helper providing common functionality for the terms of use administration pages
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
public final class TermsOfUseHelper {

    /**
     * This method validates specified terms of use
     *
     * @param termsOfUseDao the <code>TermsOfUseDao</code> instance.
     * @param request the <code>TCRequest</code> instance.
     * @return the terms of use id
     *
     * @throws NavigationException if the specified terms was not found
     * @throws Exception if any other error occurs
     */
    protected static long validateTermsOfUse(TermsOfUseDao termsOfUseDao, TCRequest request) throws NavigationException, Exception {

        String tId = StringUtils.checkNull(request.getParameter(Constants.TERMS_OF_USE_ID));
        if ("".equals(tId)) {
            throw new NavigationException("Terms of use id was not specified.");
        }
        
        TermsOfUse terms = termsOfUseDao.getTermsOfUse(Long.parseLong(tId));
        
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
