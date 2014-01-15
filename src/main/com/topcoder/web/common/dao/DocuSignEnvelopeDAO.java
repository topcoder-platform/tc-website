/*
* Copyright (C) 2014 TopCoder Inc., All Rights Reserved.
*/
package com.topcoder.web.common.dao;

import com.topcoder.web.common.model.DocuSignEnvelope;

/**
 * It is the DAO of DocuSignEnvelope.
 *
 * Thread-safety.
 * The handler implementation should be effectively thread-safe.
 *
 * @author vangavroche, gonia_119
 * @version 1.0
 */
public interface DocuSignEnvelopeDAO extends GenericDAO<DocuSignEnvelope, String> {
    /**
     * Find the complete envelope given the user ID and template ID.
     * Return null if not found.
     * @param templateId The template ID to be used to find the envelope.
     * @param userId The user ID to be used to find the envelope.
     * @return The found envelope, or null if not found.
     */
    DocuSignEnvelope findCompletedEnvelope(String templateId, long userId);
    /**
     * Create a new envelope (not completed), save it and return it.
     * @param templateId The template ID to be used to create the envelope.
     * @param userId The user ID to be used to create the envelope.
     * @param envelopeId The ID of the envelope. 
     * @return The new envelope.
     */
    DocuSignEnvelope newEnvelope(String templateId, long userId, String envelopeId);
    /**
     * Complete the given envelope and return it.
     * @param envelopeId The ID of the envelope, state of which is to be updated as "completed".
     * @return The updated envelope.
     */
    DocuSignEnvelope completeEnvelope(String envelopeId);
}
