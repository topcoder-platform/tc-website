/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.common.controller.request.authentication;

/**
 * <p>
 * This bean style class will be used by OpenIDManager to store retrieved
 * information and possible error message.
 * </p>
 * 
 * @author leo_lol
 * @version 1.0
 */
public class ResponseVerificationResult {
    /**
     * <p>
     * Automatically generated serialVersionUID.
     * </p>
     */
    private static final long serialVersionUID = 2214464885553164380L;

    /**
     * <p>
     * First name retrieved from OpenID provider.
     * </p>
     */
    private String firstName;

    /**
     * <p>
     * Middle name retrieved from OpenID provider.
     * </p>
     */
    private String middleName;

    /**
     * <p>
     * Last name retrieved from OpenID provider.
     * </p>
     */
    private String lastName;

    /**
     * <p>
     * Email address.
     * </p>
     */
    private String email;

    /**
     * <p>
     * This field stores user's openId.
     * </p>
     */
    private String openId;

    /**
     * <p>
     * Error message if there is one.
     * </p>
     */
    private String errorMessage;

    /**
     * <p>
     * Empty constructor. Do nothing but routine stuffs.
     * </p>
     */
    public ResponseVerificationResult() {
        super();
    }

    /**
     * <p>
     * Getter of firstName field.
     * </p>
     * 
     * @return the firstName field.
     */
    public String getFirstName() {
        return firstName;
    }

    /**
     * <p>
     * Setter of the firstName field.
     * </p>
     * 
     * @param firstName
     *            the firstName to set
     */
    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    /**
     * <p>
     * Getter of middleName field.
     * </p>
     * 
     * @return the middleName field.
     */
    public String getMiddleName() {
        return middleName;
    }

    /**
     * <p>
     * Setter of the middleName field.
     * </p>
     * 
     * @param middleName
     *            the middleName to set
     */
    public void setMiddleName(String middleName) {
        this.middleName = middleName;
    }

    /**
     * <p>
     * Getter of lastName field.
     * </p>
     * 
     * @return the lastName field.
     */
    public String getLastName() {
        return lastName;
    }

    /**
     * <p>
     * Setter of the lastName field.
     * </p>
     * 
     * @param lastName
     *            the lastName to set
     */
    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    /**
     * <p>
     * Getter of email field.
     * </p>
     * 
     * @return the email field.
     */
    public String getEmail() {
        return email;
    }

    /**
     * <p>
     * Setter of the email field.
     * </p>
     * 
     * @param email
     *            the email to set
     */
    public void setEmail(String email) {
        this.email = email;
    }

    /**
     * <p>
     * Getter of openId field.
     * </p>
     * 
     * @return the openId field.
     */
    public String getOpenId() {
        return openId;
    }

    /**
     * <p>
     * Setter of the openId field.
     * </p>
     * 
     * @param openId
     *            the openId to set
     */
    public void setOpenId(String openId) {
        this.openId = openId;
    }

    /**
     * <p>
     * Getter of errorMessage field.
     * </p>
     * 
     * @return the errorMessage field.
     */
    public String getErrorMessage() {
        return errorMessage;
    }

    /**
     * <p>
     * Setter of the errorMessage field.
     * </p>
     * 
     * @param errorMessage
     *            the errorMessage to set
     */
    public void setErrorMessage(String errorMessage) {
        this.errorMessage = errorMessage;
    }
}
