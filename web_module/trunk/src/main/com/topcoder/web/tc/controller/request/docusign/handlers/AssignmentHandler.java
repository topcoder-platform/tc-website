/*
 * Copyright (C) 2014 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc.controller.request.docusign.handlers;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.tc.controller.legacy.pacts.bean.DataInterfaceBean;
import com.topcoder.web.tc.controller.legacy.pacts.common.PactsConstants;
import com.topcoder.web.tc.controller.request.docusign.HandlerPermanentErrorException;
import com.topcoder.web.tc.controller.request.docusign.HandlerTemporaryErrorException;
import com.topcoder.web.tc.controller.request.docusign.SignedDocumentHandler;
import com.topcoder.web.ejb.pacts.assignmentdocuments.AssignmentDocument;
import com.topcoder.web.ejb.pacts.assignmentdocuments.AssignmentDocumentStatus;
import com.topcoder.web.ejb.pacts.assignmentdocuments.AssignmentDocumentTemplate;
import com.topcoder.web.ejb.pacts.assignmentdocuments.AssignmentDocumentType;
import com.topcoder.web.ejb.pacts.assignmentdocuments.User;

/**
 * It is the handler for processing the signed assignment document.
 *
 * Thread-safety.
 * The handler implementation should be effectively thread-safe.
 * @author vangavroche, gonia_119
 * @version 1.0
 */
public class AssignmentHandler implements SignedDocumentHandler {
    /**
     * <p>A <code>Logger</code> to be used for logging.</p>
     */
    private static Logger log = Logger.getLogger(AssignmentHandler.class);
    /**
     * The ID of assignment document template that this handler is for.
     */
    private final long assignmentDocumentTemplateId;

    /**
     * The constructor.
     * @param assignmentDocumentTemplateId
     *          The ID of assignment document template that this handler is for.
     */
    public AssignmentHandler(long assignmentDocumentTemplateId) {
        this.assignmentDocumentTemplateId = assignmentDocumentTemplateId;
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
            throws HandlerPermanentErrorException, HandlerTemporaryErrorException {

        try {
            DataInterfaceBean dib = new DataInterfaceBean();

            List<AssignmentDocumentTemplate> adtl = dib.getAssignmentDocumentTemplate(
                    AssignmentDocumentType.GLOBAL_TYPE_ID, false);
            boolean found = false;
            for (AssignmentDocumentTemplate t : adtl) {
                if (t.getId() == assignmentDocumentTemplateId) {
                    found = true;
                    break;
                }
            }
            if (!found) {
                throw new HandlerPermanentErrorException("The configured assignmentDocumentTemplateId " +
                        assignmentDocumentTemplateId + " does not exist in system");
            }

            // / search if the current user has an affirmed global assignment document
            Map<String, String> criteria = new HashMap<String, String>();
            criteria.put(PactsConstants.STATUS, AssignmentDocumentStatus.AFFIRMED_STATUS_ID + "");
            criteria.put(PactsConstants.TYPE, AssignmentDocumentType.GLOBAL_TYPE_ID + "");
            criteria.put(PactsConstants.USER_ID, userId + "");

            List result = dib.findAssignmentDocument(criteria);

            if (result.size() == 0) {
                // there's no existing affirmed assigned document, add one for the user:
                AssignmentDocument ad = new AssignmentDocument();
                ad.setUser(new User(userId));
                ad.setStatus(new AssignmentDocumentStatus(AssignmentDocumentStatus.AFFIRMED_STATUS_ID));
                ad.setType(new AssignmentDocumentType(AssignmentDocumentType.GLOBAL_TYPE_ID));
                dib.addAssignmentDocument(ad, assignmentDocumentTemplateId);

            } else {
                // log the warning condition indicating that the user already has an affirmed global assignment document
                log.warn("the user with userId = " + userId + " already has an affirmed global assignment document");
            }
        } catch (Exception e) {
            if (e instanceof HandlerPermanentErrorException) {
                throw (HandlerPermanentErrorException) e;
            }
            throw new HandlerTemporaryErrorException(e.getMessage(), e);
        }
    }

}
