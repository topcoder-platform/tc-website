/*
 * Copyright (C) 2009 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.admin.controller.request;

import com.topcoder.web.ejb.termsofuse.TermsOfUse;
import com.topcoder.web.ejb.termsofuse.AddAgreementException;
import com.topcoder.web.ejb.termsofuse.TermsOfUseEntity;
import com.topcoder.web.admin.AdminConstants;
import com.topcoder.web.tc.Constants;
import com.topcoder.shared.util.DBMS;

/**
 * <p>A controller for handling the requests for adding agreements to terms of use.</p>
 *
 * @author TCSDEVELOPER
 * @version 1.0
 * @since Configurable Contest Terms Release Assembly v2.0
 */
public class AddTermsAgreement extends TermsUsersList {

    /**
     * <p>Constructs new <code>AddTermsAgreement</code> instance. This implementation does nothing.</p>
     */
    public AddTermsAgreement() {
    }

    /**
     * <p>Processes the incoming request. Records user agreement to terms of use to database and redirects requets back
     * to <code>Terms Of Use Users List</code> page.</p>
     *
     * @throws Exception if an unexpected error occurs.
     */
    protected void businessProcessing() throws Exception {
        // Verify that handle is provided
        String tuid = getRequest().getParameter(AdminConstants.TERMS_OF_USE_ID);
        String handle = getRequest().getParameter(AdminConstants.HANDLE);
        TermsOfUse termsOfUse = (TermsOfUse)createEJB(getInitialContext(), TermsOfUse.class);
        if (handle == null || handle.trim().length() == 0) {
            addError(AdminConstants.HANDLE, "Please, provide user handle");
        } else {
            // Record user agreement to terms in DB
            try {
                termsOfUse.addUserAgreement(Long.parseLong(tuid), handle, DBMS.OLTP_DATASOURCE_NAME);
            } catch (Exception e) {
                Throwable error = e.getCause();
                if (error instanceof AddAgreementException) {
                    AddAgreementException.Reason cause = ((AddAgreementException) error).getReason();
                    if (AddAgreementException.Reason.DUPLICATE_AGREEMENT == cause) {
                        addError(AdminConstants.TERMS_OF_USE_TYPE_ID,
                                 "User [" + handle + "] already accepted the terms of use " + tuid);
                    } else if (AddAgreementException.Reason.INVALID_TERMS == cause) {
                        addError(AdminConstants.TERMS_OF_USE_TYPE_ID, "Terms of use [" + tuid + "] could not be found");
                    } else if (AddAgreementException.Reason.INVALID_USER == cause) {
                        addError(AdminConstants.TERMS_OF_USE_TYPE_ID, "User [" + handle + "] could not be found");
                    }
                } else {
                    throw e;
                }
            }
        }

        if (hasErrors()) {
            TermsOfUseEntity terms = termsOfUse.getEntity(Long.parseLong(tuid), DBMS.OLTP_DATASOURCE_NAME);
            if (terms != null) {
                getRequest().setAttribute(Constants.TERMS, terms);
                setTermsUsersList(tuid);
            }
            setNextPage("/termsUsersList.jsp");
            setIsNextPageInContext(true);
        } else {
            setNextPage("/admin/?module=TermsUsersList&" + AdminConstants.TERMS_OF_USE_ID + '=' + tuid);
            setIsNextPageInContext(false);
        }
    }
}
