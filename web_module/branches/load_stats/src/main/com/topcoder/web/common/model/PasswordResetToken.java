/*
 * Copyright (C) 2013 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.common.model;

import java.util.Date;

/**
 * <p>The password reset token object used for access control.</p>
 * @author vangavroche, TCSASSEMBLER
 * @version 1.0
 */
public class PasswordResetToken {
    /**
     * <p>the id of the user who own this password reset token. </p>
     */
   private long userId;

    /**
     * <p>The password reset token.</p>
     */
   private String token;

    /**
     * <p>The expired date.</p>
     */
   private Date expiredAt;

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
     * The getter method for field token.
     * </p>
     * 
     * @return the token
     */
    public String getToken() {
        return token;
    }

    /**
     * <p>
     * The setter method for field token.
     * </p>
     * 
     * @param token
     *            the token to set
     */
    public void setToken(String token) {
        this.token = token;
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

}
