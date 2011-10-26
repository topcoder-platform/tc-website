/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc.memberphoto.servlet;

import java.io.Serializable;

/**
 * <p>
 * This data entity class contains the member information. It contains member
 * name, handle, and email address.
 * </p>
 * <p>
 * <strong>Thread safety:</strong> This class is not thread safe since it is
 * mutable.
 * </p>
 * @author AleaActaEst, microsky
 * @version 1.0
 */
@SuppressWarnings("serial")
public class MemberInformation implements Serializable {
    /**
     * <p>
     * Represents the member name.
     * </p>
     * <p>
     * Null initially, must be non-null, non-empty string after set.
     * </p>
     * <p>
     * Can be initialized in constructor.
     * </p>
     * <p>
     * Use getter/setter to access/change its value.
     * </p>
     */
    private String name;

    /**
     * <p>
     * Represents the member handle.
     * </p>
     * <p>
     * Null initially, must be non-null, non-empty string after set.
     * </p>
     * <p>
     * Can be initialized in constructor.
     * </p>
     * <p>
     * Use getter/setter to access/change its value.
     * </p>
     */
    private String handle;

    /**
     * <p>
     * Represents the member email address.
     * </p>
     * <p>
     * Null initially, must be non-null, non-empty string after set.
     * </p>
     * <p>
     * Can be initialized in constructor.
     * </p>
     * <p>
     * Use getter/setter to access/change its value.
     * </p>
     */
    private String emailAddress;

    /**
     * <p>
     * Empty constructor.
     * </p>
     */
    public MemberInformation() {
        // do nothing
    }

    /**
     * <p>
     * Constructor with parameters.
     * </p>
     * @param name the name
     * @param handle the handle
     * @param emailAddress the email address
     * @throws IllegalArgumentException if any argument is null or empty string.
     */
    public MemberInformation(String name, String handle, String emailAddress) {
        // 'name' can not be null/empty string
        Helper.checkString(name, "name");

        // 'handle' can not be null/empty string
        Helper.checkString(handle, "handle");

        // 'emailAddress' can not be null/empty string
        Helper.checkString(emailAddress, "emailAddress");

        this.name = name;
        this.handle = handle;
        this.emailAddress = emailAddress;
    }

    /**
     * <p>
     * Getter for the namesake instance variable.
     * </p>
     * @return the name.
     */
    public String getName() {
        return name;
    }

    /**
     * <p>
     * Setter for the namesake instance variable.
     * </p>
     * @param name the name.
     * @throws IllegalArgumentException if the argument is null or empty string.
     */
    public void setName(String name) {
        // 'name' can not be null/empty string
        Helper.checkString(name, "name");

        this.name = name;
    }

    /**
     * <p>
     * Getter for the namesake instance variable.
     * </p>
     * @return the handle.
     */
    public String getHandle() {
        return handle;
    }

    /**
     * <p>
     * Setter for the namesake instance variable.
     * </p>
     * @param handle the handle.
     * @throws IllegalArgumentException if the argument is null or empty string.
     */
    public void setHandle(String handle) {
        // 'handle' can not be null/empty string
        Helper.checkString(handle, "handle");

        this.handle = handle;
    }

    /**
     * <p>
     * Getter for the namesake instance variable.
     * </p>
     * @return the email address.
     */
    public String getEmailAddress() {
        return emailAddress;
    }

    /**
     * <p>
     * Setter for the namesake instance variable.
     * </p>
     * @param emailAddress the email address.
     * @throws IllegalArgumentException if the argument is null or empty string.
     */
    public void setEmailAddress(String emailAddress) {
        // 'emailAddress' can not be null/empty string
        Helper.checkString(emailAddress, "emailAddress");

        this.emailAddress = emailAddress;
    }
}
