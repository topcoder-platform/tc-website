/*
 * Copyright (C) 2014 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.common.model;

import java.io.Serializable;
/**
 * It is the model of the DocuSign envelope created for each document to be signed by the user.
 *
 * Thread-safety.
 * The class is not thread-safe thus it is not supposed to be shared by multiple threads.
 *
 * @author vangavroche, gonia_119
 * @version 1.0
 */
public class DocuSignEnvelope implements Serializable {
    /**
     * The envelope ID, which is used as the ID in the persistence.
     */
    private String envelopeId;

    /**
     * The template ID (for DocuSign) for this envelope.
     */
    private String templateId;

    /**
     * The user ID that this envelope is created for.
     */
    private Long userId;

    /**
     * The flag indicating whether the envelope is completed.
     */
    private Boolean completed;

    /**
     * Get the envelope ID.
     * @return the envelope ID.
     */
    public String getEnvelopeId() {
        return envelopeId;
    }
    /**
     * Set the envelope ID.
     * @param envelopeId the envelope ID.
     */
    public void setEnvelopeId(String envelopeId) {
        this.envelopeId = envelopeId;
    }
    /**
     * Get the template ID.
     * @return the template ID.
     */
    public String getTemplateId() {
        return templateId;
    }
    /**
     * Set the template ID.
     * @param templateId the template ID.
     */
    public void setTemplateId(String templateId) {
        this.templateId = templateId;
    }
    /**
     * Get the user id.
     * @return the user id.
     */
    public Long getUserId() {
        return userId;
    }
    /**
     * Set the user id.
     * @param userId the user id.
     */
    public void setUserId(Long userId) {
        this.userId = userId;
    }
    /**
     * Get the is complete flag.
     * @return the is complete flag.
     */
    public Boolean getCompleted() {
        return completed;
    }
    /**
     * Set the is complete flag.
     * @param completed the is complete flag.
     */
    public void setCompleted(Boolean completed) {
        this.completed = completed;
    }
    
}
