/*
 * Copyright (C) 2013 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.reg.dto;

import java.util.Date;

/**
 * This class is used as DTO for password reset code.
 * <p>
 * <strong>Thread Safety:</strong> This class is mutable and not thread-safe.
 * </p>
 *
 * @author Urmass, TCSASSEMBLER
 * @version 1.0
 * @since 1.0
 */
public class PasswordResetTokenDTO {

    /**
     * User ID.
     */
    private long userId;

    /**
     * Email Type ID.
     * Primary Email-->1, Secondary Email-->2
     */
    private long emailTypeId;

    /**
     * token string.
     */
    private String token;

    /**
     * expired date.
     */
    private Date expiredAt;

    /**
     * Default constructor.
     */
    public PasswordResetTokenDTO() {
    }

    /**
     * Getter of the name-sake field.
     *
     * @return the value of name-sake field.
     */
    public long getUserId() {
        return userId;
    }

    /**
     * Setter of the name-sake field.
     *
     * @param userId
     *            the name-sake field to set
     */
    public void setUserId(long userId) {
        this.userId = userId;
    }

    /**
     * Getter of the name-sake field.
     *
     * @return the value of name-sake field.
     */
    public long getEmailTypeId() {
        return emailTypeId;
    }

    /**
     * Setter of the name-sake field.
     *
     * @param emailTypeId
     *            the name-sake field to set
     */
    public void setEmailTypeId(long emailTypeId) {
        this.emailTypeId = emailTypeId;
    }

    /**
     * Getter of the name-sake field.
     *
     * @return the value of name-sake field.
     */
    public String getToken() {
        return token;
    }

    /**
     * Setter of the name-sake field.
     *
     * @param token
     *            the name-sake field to set
     */
    public void setToken(String token) {
        this.token = token;
    }

    /**
     * Getter of the name-sake field.
     *
     * @return the value of name-sake field.
     */
    public Date getExpiredAt() {
        return expiredAt;
    }

    /**
     * Setter of the name-sake field.
     *
     * @param expiredAt
     *            the name-sake field to set
     */
    public void setExpiredAt(Date expiredAt) {
        this.expiredAt = expiredAt;
    }
}
