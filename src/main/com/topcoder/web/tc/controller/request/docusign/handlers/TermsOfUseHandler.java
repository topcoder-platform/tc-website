/*
 * Copyright (C) 2014 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc.controller.request.docusign.handlers;

import java.util.Map;

import com.cronos.termsofuse.dao.TermsOfUseDao;
import com.cronos.termsofuse.dao.UserTermsOfUseDao;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.TermsOfUseUtil;
import com.topcoder.web.tc.controller.request.docusign.HandlerPermanentErrorException;
import com.topcoder.web.tc.controller.request.docusign.HandlerTemporaryErrorException;
import com.topcoder.web.tc.controller.request.docusign.SignedDocumentHandler;

/**
 * It is the handler for processing the signed terms of use.
 *
 * Thread-safety.
 * The handler implementation should be effectively thread-safe.
 *
 * @author vangavroche, gonia_119
 * @version 1.0
 */
public class TermsOfUseHandler implements SignedDocumentHandler {
    /**
     * <p>A <code>Logger</code> to be used for logging.</p>
     */
    private static Logger log = Logger.getLogger(TermsOfUseHandler.class);
    /**
     * The ID of terms of use that this handler is for.
     */
    private final long termsOfUseId;

    /**
     * The constructor.
     * @param termsOfUseId The ID of terms-of-use that this handler is for.
     */
    public TermsOfUseHandler(long termsOfUseId) {
        this.termsOfUseId = termsOfUseId;
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
            TermsOfUseDao termsOfUseDao = TermsOfUseUtil.getTermsOfUseDao();

            if (termsOfUseDao.getTermsOfUse(termsOfUseId) == null) {
                throw new HandlerPermanentErrorException("The configured termsOrUseId " + termsOfUseId + " does not exist in systems.");
            }
            
            UserTermsOfUseDao userTermsOfUseDao = TermsOfUseUtil.getUserTermsOfUseDao();
            if (userTermsOfUseDao.hasTermsOfUseBan(userId, termsOfUseId)) {
                // log the error information indicating that the user can't be added to this terms of use, do NOT throw exception
                log.error("the user with userId = " + userId + " can't be added to this terms of use");
            } else if (userTermsOfUseDao.hasTermsOfUse(userId, termsOfUseId)) {
                // log the warning information indicating that the user has been already added to this terms of use before, do NOT throw exception
                log.warn("the user with userId = " + userId + " has been already added to this terms of use before");
            } else {
                userTermsOfUseDao.createUserTermsOfUse(userId, termsOfUseId);
            }
        } catch (Exception e) {
            if(e instanceof HandlerPermanentErrorException){
                throw (HandlerPermanentErrorException)e;
            }
            throw new HandlerTemporaryErrorException(e.getMessage(), e);
        }
    }

}
