/*
 * Copyright (C) 2013 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.reg.dto;

/**
 * This DTO represents the user/email status of a account.
 * <p>
 * <strong>Thread Safety:</strong> This class is mutable and not thread-safe.
 * </p>
 * 
 * @author leo_lol
 * @version 1.0
 * @since 1.0
 */
public class UserInfoDTO {

    /**
     * A character to represent the status of the account.
     */
    private Character userStatus;

    /**
     * A character to represent the email status.
     */
    private Integer emailStatus;

    /**
     * Handle of this user.
     */
    private String handle;

    /**
     * User ID.
     */
    private long userId;

    /**
     * Email address;
     */
    private String emailAddress;

    /**
     * Default constructor.
     */
    public UserInfoDTO() {
    }

    /**
     * Getter of the name-sake field.
     * 
     * @return the value of name-sake field.
     */
    public Character getUserStatus() {
        return userStatus;
    }

    /**
     * Setter of the name-sake field.
     * 
     * @param userStatus
     *            the name-sake field to set
     */
    public void setUserStatus(Character userStatus) {
        this.userStatus = userStatus;
    }

    /**
     * Getter of the name-sake field.
     * 
     * @return the value of name-sake field.
     */
    public Integer getEmailStatus() {
        return emailStatus;
    }

    /**
     * Setter of the name-sake field.
     * 
     * @param emailStatus
     *            the name-sake field to set
     */
    public void setEmailStatus(Integer emailStatus) {
        this.emailStatus = emailStatus;
    }

    /**
     * Getter of the name-sake field.
     * 
     * @return the value of name-sake field.
     */
    public String getHandle() {
        return handle;
    }

    /**
     * Setter of the name-sake field.
     * 
     * @param handle
     *            the name-sake field to set
     */
    public void setHandle(String handle) {
        this.handle = handle;
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
    public String getEmailAddress() {
        return emailAddress;
    }

    /**
     * Setter of the name-sake field.
     * 
     * @param emailAddress
     *            the name-sake field to set
     */
    public void setEmailAddress(String emailAddress) {
        this.emailAddress = emailAddress;
    }
}
