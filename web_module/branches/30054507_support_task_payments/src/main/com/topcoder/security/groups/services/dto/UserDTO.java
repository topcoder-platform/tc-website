/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.security.groups.services.dto;

/**
 * <p>
 * This class represents relevant info about a user
 * </p>
 * <p>
 * <strong>Thread Safety:</strong> This class is mutable and not thread safe
 * </p>
 * 
 * @author TCSASSEMBLER
 * @version 1.0 (Topcoder Security Groups Backend Model and Authorization
 *          Assembly v1.0 )
 * @since 1.0
 */
public class UserDTO {

    /**
     * <p>
     * Represents the ID of the user, It is managed with a getter and setter,
     * hence fully mutable. It may have any value.
     * </p>
     */
    private long userId;

    /**
     * <p>
     * Represents the user's handle It is managed with a getter and setter,
     * hence fully mutable. It may have any value.
     * </p>
     */
    private String handle;

    /**
     * <p>
     * Represents the user's email address It is managed with a getter and
     * setter, hence fully mutable. It may have any value.
     * </p>
     */
    private String emailAddress;

    /**
     * <p>
     * Default constructor.
     * </p>
     */
    public UserDTO() {
    }

    /**
     * <p>
     * Getter of userId field.
     * </p>
     * @return the userId
     */
    public long getUserId() {
        return userId;
    }

    /**
     * <p>
     * Setter of userId field.
     * </p>
     * @param userId the userId to set
     */
    public void setUserId(long userId) {
        this.userId = userId;
    }

    /**
     * <p>
     * Getter of handle field.
     * </p>
     * @return the handle
     */
    public String getHandle() {
        return handle;
    }

    /**
     * <p>
     * Setter of handle field.
     * </p>
     * @param handle the handle to set
     */
    public void setHandle(String handle) {
        this.handle = handle;
    }

    /**
     * <p>
     * Getter of emailAddress field.
     * </p>
     * @return the emailAddress
     */
    public String getEmailAddress() {
        return emailAddress;
    }

    /**
     * <p>
     * Setter of emailAddress field.
     * </p>
     * @param emailAddress the emailAddress to set
     */
    public void setEmailAddress(String emailAddress) {
        this.emailAddress = emailAddress;
    }
}
