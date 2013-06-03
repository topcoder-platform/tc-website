/*
 * Copyright (C) 2012 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.common.model;

import java.util.Date;

/**
 * <p>An entity class representing government issued ID document.</p>
 * 
 * @author isv
 * @version 1.0
 */
public class GovernmentID extends Base {

    /**
     * Serial version UID for this class.
     *
     * Please change that number if you affect the fields in a way that will affect the serialization for this object,
     * i.e. when data members are changed.
     */
    private static final long serialVersionUID = 1L;

    /**
     * <p>A <code>Long</code> providing the ID of the government ID document.</p>
     */
    private Long id;

    /**
     * <p>A <code>Long</code> providing the ID of a user associated with the document.</p>
     */
    private Long userId;

    /**
     * <p>A <code>String</code> providing the government issued number for the document.</p>
     */
    private String documentNumber;

    /**
     * <p>A <code>String</code> providing the code for the country where the document originates from.</p>
     */
    private String country;

    /**
     * <p>Constructs new <code>GovernmentID</code> instance. This implementation does nothing.</p>
     */
    public GovernmentID() {
    }

    /**
     * <p>Gets the code for the country where the document originates from.</p>
     *
     * @return a <code>String</code> providing the code for the country where the document originates from.
     */
    public String getCountry() {
        return this.country;
    }

    /**
     * <p>Sets the code for the country where the document originates from.</p>
     *
     * @param country a <code>String</code> providing the code for the country where the document originates from.
     */
    public void setCountry(String country) {
        this.country = country;
    }

    /**
     * <p>Gets the government issued number for the document.</p>
     *
     * @return a <code>String</code> providing the government issued number for the document.
     */
    public String getDocumentNumber() {
        return this.documentNumber;
    }

    /**
     * <p>Sets the government issued number for the document.</p>
     *
     * @param documentNumber a <code>String</code> providing the government issued number for the document.
     */
    public void setDocumentNumber(String documentNumber) {
        this.documentNumber = documentNumber;
    }

    /**
     * <p>Gets the ID of a user associated with the document.</p>
     *
     * @return a <code>Long</code> providing the ID of a user associated with the document.
     */
    public Long getUserId() {
        return this.userId;
    }

    /**
     * <p>Sets the ID of a user associated with the document.</p>
     *
     * @param userId a <code>Long</code> providing the ID of a user associated with the document.
     */
    public void setUserId(Long userId) {
        this.userId = userId;
    }

    /**
     * <p>A <code>Date</code> providing the date when document was received.</p>
     */
    private Date received;

    /**
     * <p>A <code>Date</code> providing the date when document expires.</p>
     */
    private Date expires;

    /**
     * <p>Gets the date when document expires.</p>
     *
     * @return a <code>Date</code> providing the date when document expires.
     */
    public Date getExpires() {
        return this.expires;
    }

    /**
     * <p>Sets the date when document expires.</p>
     *
     * @param expires a <code>Date</code> providing the date when document expires.
     */
    public void setExpires(Date expires) {
        this.expires = expires;
    }

    /**
     * <p>Gets the date when document was received.</p>
     *
     * @return a <code>Date</code> providing the date when document was received.
     */
    public Date getReceived() {
        return this.received;
    }

    /**
     * <p>Sets the date when document was received.</p>
     *
     * @param received a <code>Date</code> providing the date when document was received.
     */
    public void setReceived(Date received) {
        this.received = received;
    }

    /**
     * <p>Gets the ID of the government ID document.</p>
     *
     * @return a <code>Long</code> providing the ID of the government ID document.
     */
    public Long getId() {
        return this.id;
    }

    /**
     * <p>Sets the ID of the government ID document.</p>
     *
     * @param id a <code>Long</code> providing the ID of the government ID document.
     */
    public void setId(Long id) {
        this.id = id;
    }
}
