/*
 * Copyright (C) 2013 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.common.model;

/**
 * <p>
 * The confirmation email request.
 *
 * <b>Thread safety:</b>
 * This class is not thread safe.
 * </p>
 *
 * <p>
 * It is introduced in Release Assembly - TopCoder Email Address Management Update v1.0.
 * </p>
 *
 * @author Standlove, TCSASSEMBLER
 * @version 1.0
 */
public class ConfirmationEmailRequest {
    /**
     * <p>Represents the recipient address of this email.</p>
     */
    private String toEmail;

    /**
     * <p>Represents the user id of the recipient of this email.</p>
     */
    private long userId;

    /**
     * <p>Represents the subject of this email.</p>
     */
    private String subject;

    /**
     * <p>Represents the body of this email.</p>
     */
    private String body;

    /**
     * <p>Represents the request type of this email.</p>
     */
    private EmailRequestType requestType;

    /**
     * <p>Represents the from address of this email.</p>
     */
    private String fromEmail;

    /**
     * <p>Represents the expiration duration.</p>
     */
    private long expirationDuration;

    /**
     * <p>Gets to email.</p>
     * @return to email
     */
    public String getToEmail() {
        return toEmail;
    }

    /**
     * <p>Sets to email.</p>
     * @param toEmail to email
     */
    public void setToEmail(String toEmail) {
        this.toEmail = toEmail;
    }

    /**
     * <p>Gets user id.</p>
     * @return user id
     */
    public long getUserId() {
        return userId;
    }

    /**
     * <p>Sets user id.</p>
     * @param userId user id
     */
    public void setUserId(long userId) {
        this.userId = userId;
    }

    /**
     * <p>Gets subject.</p>
     * @return subject
     */
    public String getSubject() {
        return subject;
    }

    /**
     * <p>Sets subject.</p>
     * @param subject subject
     */
    public void setSubject(String subject) {
        this.subject = subject;
    }

    /**
     * <p>Gets body.</p>
     * @return body
     */
    public String getBody() {
        return body;
    }

    /**
     * <p>Sets body.</p>
     * @param body body
     */
    public void setBody(String body) {
        this.body = body;
    }

    /**
     * <p>Gets request type.</p>
     * @return request type
     */
    public EmailRequestType getRequestType() {
        return requestType;
    }

    /**
     * <p>Sets request type.</p>
     * @param requestType request type
     */
    public void setRequestType(EmailRequestType requestType) {
        this.requestType = requestType;
    }

    /**
     * <p>Gets from email.</p>
     * @return from email
     */
    public String getFromEmail() {
        return fromEmail;
    }

    /**
     * <p>Sets from email.</p>
     * @param fromEmail from email
     */
    public void setFromEmail(String fromEmail) {
        this.fromEmail = fromEmail;
    }

    /**
     * <p>Gets expiration duration.</p>
     * @return expiration duration
     */
    public long getExpirationDuration() {
        return expirationDuration;
    }

    /**
     * <p>Sets expiration duration.</p>
     * @param expirationDuration expiration duration
     */
    public void setExpirationDuration(long expirationDuration) {
        this.expirationDuration = expirationDuration;
    }
}
