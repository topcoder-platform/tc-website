/*
 * Copyright (C) 2013 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.common.model;

import java.util.Date;

/**
 * <p>The object to represent a second email request.</p>
 * @author vangavroche, TCSASSEMBLER
 * @version 1.0
 */
public class SecondEmailRequest {
    /**
     * <p>The id of the user who own this SecondEmailRequest.</p>
     */
    private long userId;

    /**
     * <p>The second email.</p>
     */
    private String secondMail;

    /**
     * <p>The random key to recognize the user's identity.</p>
     */
    private int randomeKey;

    /**
     * <p>The expired date of this SecondEmailRequest.</p>
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
     * The getter method for field secondMail.
     * </p>
     * 
     * @return the secondMail
     */
    public String getSecondMail() {
        return secondMail;
    }

    /**
     * <p>
     * The setter method for field secondMail.
     * </p>
     * 
     * @param secondMail
     *            the secondMail to set
     */
    public void setSecondMail(String secondMail) {
        this.secondMail = secondMail;
    }

    /**
     * <p>
     * The getter method for field randomeKey.
     * </p>
     * 
     * @return the randomeKey
     */
    public int getRandomeKey() {
        return randomeKey;
    }

    /**
     * <p>
     * The setter method for field randomeKey.
     * </p>
     * 
     * @param randomeKey
     *            the randomeKey to set
     */
    public void setRandomeKey(int randomeKey) {
        this.randomeKey = randomeKey;
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
