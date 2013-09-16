/*
 * Copyright (C) 2013 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.common.model;

import java.util.Date;

/**
 * <p>The object to represent an email request.</p>
 * <p>It was renmaed from the previous <code>SecondEmailRequest</code> class.</p>
 *
 * <p>
 *   Version 1.1 (Release Assembly - TopCoder Email Address Management Update v1.0) Change notes:
 *   <ol>
 *     <li>Renamed from <code>SecondEmailRequest</code> to {@link EmailRequest}.</li>
 *     <li>Added {@link #requestId} and {@link #requestType} fields and their accessors.</li>
 *     <li>{@link #userId} is no longer the primary key.</li>
 *   </ol>
 * </p>
 *
 * @author vangavroche, Standlove, TCSASSEMBLER
 * @version 1.1
 */
public class EmailRequest {
    /**
     * <p>The id of the user who own this <code>EmailRequest</code>.</p>
     */
    private long userId;

    /**
     * <p>The email.</p>
     * <p>Renamed to <code>email</code> in version 1.1.
     */
    private String email;

    /**
     * <p>The random key to recognize the user's identity.</p>
     */
    private int randomKey;

    /**
     * <p>The expired date of this SecondEmailRequest.</p>
     */
    private Date expiredAt;

    /**
     * <p>The request ID.</p>
     * @since 1.1
     */
    private long requestId;

    /**
     * <p>The request type.</p>
     * @since 1.1
     */
    private EmailRequestType requestType;

    /**
     * <p>
     * The getter method for field userId.
     * </p>
     * 
     * @return the userId
     */
    public long getUserId() {
        return userId;
    }

    /**
     * <p>
     * The setter method for field userId.
     * </p>
     * 
     * @param userId
     *            the userId to set
     */
    public void setUserId(long userId) {
        this.userId = userId;
    }

    /**
     * <p>
     * The getter method for field email.
     * </p>
     * <p>Renamed to <code>getEmail</code> in 1.1.</o>
     * 
     * @return the email
     */
    public String getEmail() {
        return email;
    }

    /**
     * <p>
     * The setter method for field email.
     * </p>
     * <p>Renamed to <code>setEmail</code> in 1.1.</o>
     * 
     * @param email
     *            the email to set
     */
    public void setEmail(String email) {
        this.email = email;
    }

    /**
     * <p>
     * The getter method for field randomKey.
     * </p>
     * 
     * @return the randomKey
     */
    public int getRandomKey() {
        return randomKey;
    }

    /**
     * <p>
     * The setter method for field randomKey.
     * </p>
     * 
     * @param randomKey
     *            the randomKey to set
     */
    public void setRandomKey(int randomKey) {
        this.randomKey = randomKey;
    }

    /**
     * <p>
     * The getter method for field expiredAt.
     * </p>
     * 
     * @return the expiredAt
     */
    public Date getExpiredAt() {
        return expiredAt;
    }

    /**
     * <p>
     * The setter method for field expiredAt.
     * </p>
     * 
     * @param expiredAt
     *            the expiredAt to set
     */
    public void setExpiredAt(Date expiredAt) {
        this.expiredAt = expiredAt;
    }

    /**
     * <p>
     * Gets the request id.
     * </p>
     * 
     * @return the request id
     * @since 1.1
     */
    public long getRequestId() {
        return requestId;
    }

    /**
     * <p>
     * Sets the request id.
     * </p>
     * 
     * @param requestId
     *            the request id to set
     * @since 1.1
     */
    public void setRequestId(long requestId) {
        this.requestId = requestId;
    }

    /**
     * <p>
     * Gets the request type.
     * </p>
     * 
     * @return the request type
     * @since 1.1
     */
    public EmailRequestType getRequestType() {
        return requestType;
    }

    /**
     * <p>
     * Sets the request type.
     * </p>
     * 
     * @param requestType
     *            the request type to set
     * @since 1.1
     */
    public void setRequestType(EmailRequestType requestType) {
        this.requestType = requestType;
    }

}
