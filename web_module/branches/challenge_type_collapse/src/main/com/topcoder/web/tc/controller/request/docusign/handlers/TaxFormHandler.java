/*
 * Copyright (C) 2014 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc.controller.request.docusign.handlers;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.tc.controller.legacy.pacts.bean.DataInterfaceBean;
import com.topcoder.web.tc.controller.legacy.pacts.common.InvalidSearchInputException;
import com.topcoder.web.tc.controller.legacy.pacts.common.PactsConstants;
import com.topcoder.web.tc.controller.legacy.pacts.common.TaxForm;
import com.topcoder.web.tc.controller.legacy.pacts.common.TaxFormHeader;
import com.topcoder.web.tc.controller.legacy.pacts.common.TaxFormHeaderList;
import com.topcoder.web.tc.controller.legacy.pacts.common.UnsupportedSearchException;
import com.topcoder.web.tc.controller.request.docusign.HandlerPermanentErrorException;
import com.topcoder.web.tc.controller.request.docusign.HandlerTemporaryErrorException;
import com.topcoder.web.tc.controller.request.docusign.SignedDocumentHandler;

/**
 * It is the handler for processing the signed tax form.
 *
 * Thread-safety.
 * The handler implementation should be effectively thread-safe.
 *
 * @author vangavroche, gonia_119
 * @version 1.0
 */
public class TaxFormHandler implements SignedDocumentHandler {
    /**
     * <p>A <code>Logger</code> to be used for logging.</p>
     */
    private static Logger log = Logger.getLogger(TaxFormHandler.class);
    /**
     * The ID of tax form that handler is for.
     */
    private final long taxFormId;

    /**
     * The constructor.
     * @param taxFormId The ID of tax
     */
    public TaxFormHandler(long taxFormId) {
        this.taxFormId = taxFormId;
    }
    /**
     * Handle the document.
     * @param userId The ID of user who signed the document
     * @param context A map that may store context information for the handler to use.
     * @throws HandlerPermanentErrorException - indicating that the method invocation context (like parameters)
     *              is invalid or the handler's state has some problem (like incorrectly configured).
     *              These are permanent errors representing the situation when the caller shouldn't retry.
     * @throws HandlerTemporaryErrorException - indicating that there are unexpected error occurring in the method
     *              execution. The errors may include database connection error,
     *              or unavailability of some depending service , or any other unexpected errors.
     *              These are temporary errors representing the situation when the caller could retry after a while.
     */
    public void handleDocument(long userId, Map<String, String> context)
            throws HandlerPermanentErrorException,
            HandlerTemporaryErrorException {
        try {
            DataInterfaceBean dib = new DataInterfaceBean();

            // check if the tax form for this configured tax form ID exist in DB:
            TaxForm tf = new TaxForm(dib.getTaxForm(taxFormId));
            if (tf.getHeader().getId() == 0) {
                // not exist
                throw new HandlerPermanentErrorException("The configured taxFormID " + taxFormId + " does not exist in database");
            }
            // search if the current user has a tax form
            Map<String, String> criteria = new HashMap<String, String>();
            criteria.put(PactsConstants.USER_ID, userId + "");

            TaxFormHeaderList list;
            try {
                // execute the query and wrap the result with TaxFormHeaderList
                list = new TaxFormHeaderList(dib.findUserTaxForms(criteria));
            } catch (UnsupportedSearchException e) {
                throw new HandlerPermanentErrorException("Tax form search failed.", e);
            } catch (InvalidSearchInputException e) {
                throw new HandlerPermanentErrorException("Tax form search failed.", e);
            }

            boolean hasActiveTaxForm = false, hasInactiveTaxForm = false;
            for (TaxFormHeader header : list.getHeaderList()) {
                if (PactsConstants.USER_TAX_FORM_STATUS_ACTIVE == header.getStatusId()) {
                    hasActiveTaxForm = true;
                } else if (PactsConstants.USER_TAX_FORM_STATUS_INACTIVE == header.getStatusId()) {
                    hasInactiveTaxForm = true;
                }
            }
            
            if (!hasActiveTaxForm && !hasInactiveTaxForm) {
                // there's no existing tax form, add a new one for the user:
                TaxForm taxform = new TaxForm(userId, taxFormId,
                        new SimpleDateFormat(PactsConstants.DATE_FORMAT_STRING).format(new Date()),
                        PactsConstants.USER_TAX_FORM_STATUS_ACTIVE);

                dib.addUserTaxForm(taxform);
            } else if (hasActiveTaxForm) {
                // log the warning condition indicating that the user already has an active tax form
                // do NOT throw any exception
                log.warn("the user with userId = " + userId + " already has an active tax form");
            } else {
                throw new HandlerPermanentErrorException("The user " + userId + " already has an inactive tax form. It must be cleaned up first.");
            }
        } catch (Exception e) {
            if(e instanceof HandlerPermanentErrorException){
                throw (HandlerPermanentErrorException)e;
            }
            throw new HandlerTemporaryErrorException(e.getMessage(), e);
        }
    }

}
