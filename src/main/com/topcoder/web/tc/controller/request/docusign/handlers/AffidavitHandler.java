/*
 * Copyright (C) 2014 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc.controller.request.docusign.handlers;

import java.util.HashMap;
import java.util.Map;

import com.topcoder.web.tc.controller.legacy.pacts.bean.DataInterfaceBean;
import com.topcoder.web.tc.controller.legacy.pacts.common.Affidavit;
import com.topcoder.web.tc.controller.legacy.pacts.common.AffidavitHeaderList;
import com.topcoder.web.tc.controller.legacy.pacts.common.InvalidSearchInputException;
import com.topcoder.web.tc.controller.legacy.pacts.common.PactsConstants;
import com.topcoder.web.tc.controller.legacy.pacts.common.UnsupportedSearchException;
import com.topcoder.web.tc.controller.request.docusign.HandlerPermanentErrorException;
import com.topcoder.web.tc.controller.request.docusign.HandlerTemporaryErrorException;
import com.topcoder.web.tc.controller.request.docusign.SignedDocumentHandler;

/**
 * It is the handler to process the signed affidavit.
 *
 * Thread-safety.
 * The handler implementation should be effectively thread-safe.
 *
 * @author vangavroche, gonia_119
 * @version 1.0
 */
public class AffidavitHandler implements SignedDocumentHandler {
    /**
     * The tab label of the affidavit ID tab used in the signed document.
     */
    private final String affidavitIdTab;

    /**
     * The constructor.
     * @param affidavitIdTab The tab label of the affidavit ID tab used in the signed document.
     */
    public AffidavitHandler(String affidavitIdTab) {
        this.affidavitIdTab = affidavitIdTab;
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
        if (!context.containsKey(affidavitIdTab)) {
            throw new HandlerPermanentErrorException("There is no Affidavit ID in the context");
        }

        try {
            DataInterfaceBean dib = new DataInterfaceBean();

            // find the affidavit with the given ID, also make sure it's not notarized and is for this user
            Map<String, String> criteria = new HashMap<String, String>();
            criteria.put(PactsConstants.AFFIDAVIT_ID, context.get(affidavitIdTab));
            criteria.put(PactsConstants.IS_NOTARIZED, "false");
            criteria.put(PactsConstants.USER_ID, userId + "");

            AffidavitHeaderList ahl;
            try {
                // execute the query and wrap the result with AffidavitHeaderList
                ahl = new AffidavitHeaderList(dib.findAffidavits(criteria));
            } catch (UnsupportedSearchException e) {
                throw new HandlerPermanentErrorException("Affidavit search failed.", e);
            } catch (InvalidSearchInputException e) {
                throw new HandlerPermanentErrorException("Affidavit search failed.", e);
            }

            if (ahl.getHeaderList().length == 0) {
                // throw exception indicating that there's no such un-notarized affidavit for this user
                throw new HandlerPermanentErrorException("The provided affidavit ID " + context.get(affidavitIdTab) + 
                        " is not an un-notarized affidavit for user " + userId);

            } else {
                // Update the given affidavit.
                Affidavit affidavit = new Affidavit(dib.getAffidavit(ahl.getHeaderList()[0].getId()));
                affidavit.getHeader().setNotarized(true);
                dib.updateAffidavit(affidavit);
            }
        } catch (Exception e) {
            if (e instanceof HandlerPermanentErrorException) {
                throw (HandlerPermanentErrorException) e;
            }
            throw new HandlerTemporaryErrorException(e.getMessage(), e);
        }
    }

}
