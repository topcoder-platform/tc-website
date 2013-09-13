/*
 * Copyright (C) 2013 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.reg.dto;

/**
 * This class is used to receive user inputs from front-end.
 * <p>
 * <strong>Thread Safety:</strong> This class is mutable and not thread-safe.
 * </p>
 *
 * <p>
 * Version 1.1(Release Assembly - TopCoder Reg2 Password Recovery Revamp and Misc Bug Fixes) change log:
 * Added secondEmail attribute
 * </p>
 *
 * @author sampath01, leo_lol, Urmass ,TCSASSEMBLER
 * @version 1.1
 * @since 1.0
 */
public class UserDTO {

    /**
     * User ID.
     */
    private Long userId;

    /**
     * First name.
     */
    private String firstName;

    /**
     * Last name.
     */
    private String lastName;

    /**
     * Handle.
     */
    private String handle;

    /**
     * Country.
     */
    private String country;

    /**
     * Email.
     */
    private String email;

    /**
     * Secondary Email.
     */
    private String secondaryEmail;

    /**
     * Password.
     */
    private String password;

    /**
     * Confirm password.
     */
    private String confirmPassword;

    /**
     * Verification code.
     */
    private String verificationCode;

    /**
     * Current user status.
     */
    private Character status = 'A';

    /**
     * Activation code.
     */
    private String activationCode;

    /**
     * Source of registration. Default to reg2.
     */
    private String source = "reg2";

    /**
     * Getter of the name-sake field.
     * 
     * @return the value of name-sake field.
     */
    public Long getUserId() {
        return userId;
    }

    /**
     * Setter of the name-sake field.
     * 
     * @param userId
     *            the name-sake field to set
     */
    public void setUserId(Long userId) {
        this.userId = userId;
    }

    /**
     * Getter of the name-sake field.
     * 
     * @return the value of name-sake field.
     */
    public String getFirstName() {
        return firstName;
    }

    /**
     * Setter of the name-sake field.
     * 
     * @param firstName
     *            the name-sake field to set
     */
    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    /**
     * Getter of the name-sake field.
     * 
     * @return the value of name-sake field.
     */
    public String getLastName() {
        return lastName;
    }

    /**
     * Setter of the name-sake field.
     * 
     * @param lastName
     *            the name-sake field to set
     */
    public void setLastName(String lastName) {
        this.lastName = lastName;
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
    public String getCountry() {
        return country;
    }

    /**
     * Setter of the name-sake field.
     * 
     * @param country
     *            the name-sake field to set
     */
    public void setCountry(String country) {
        this.country = country;
    }

    /**
     * Getter of the name-sake field.
     *
     * @return the value of name-sake field.
     */
    public String getEmail() {
        return email;
    }

    /**
     * Setter of the name-sake field.
     *
     * @param email
     *            the name-sake field to set
     */
    public void setEmail(String email) {
        this.email = email;
    }

    /**
     * Getter of the name-sake field.
     *
     * @return the value of name-sake field.
     */
    public String getSecondaryEmail() {
        return secondaryEmail;
    }

    /**
     * Setter of the name-sake field.
     *
     * @param secondaryEmail
     *            the name-sake field to set
     */
    public void setSecondaryEmail(String secondaryEmail) {
        this.secondaryEmail = secondaryEmail;
    }

    /**
     * Getter of the name-sake field.
     * 
     * @return the value of name-sake field.
     */
    public String getPassword() {
        return password;
    }

    /**
     * Setter of the name-sake field.
     * 
     * @param password
     *            the name-sake field to set
     */
    public void setPassword(String password) {
        this.password = password;
    }

    /**
     * Getter of the name-sake field.
     * 
     * @return the value of name-sake field.
     */
    public String getConfirmPassword() {
        return confirmPassword;
    }

    /**
     * Setter of the name-sake field.
     * 
     * @param confirmPassword
     *            the name-sake field to set
     */
    public void setConfirmPassword(String confirmPassword) {
        this.confirmPassword = confirmPassword;
    }

    /**
     * Getter of the name-sake field.
     * 
     * @return the value of name-sake field.
     */
    public String getVerificationCode() {
        return verificationCode;
    }

    /**
     * Setter of the name-sake field.
     * 
     * @param verificationCode
     *            the name-sake field to set
     */
    public void setVerificationCode(String verificationCode) {
        this.verificationCode = verificationCode;
    }

    /**
     * Getter of the name-sake field.
     * 
     * @return the value of name-sake field.
     */
    public Character getStatus() {
        return status;
    }

    /**
     * Setter of the name-sake field.
     * 
     * @param status
     *            the name-sake field to set
     */
    public void setStatus(Character status) {
        this.status = status;
    }

    /**
     * Getter of the name-sake field.
     * 
     * @return the value of name-sake field.
     */
    public String getActivationCode() {
        return activationCode;
    }

    /**
     * Setter of the name-sake field.
     * 
     * @param activationCode
     *            the name-sake field to set
     */
    public void setActivationCode(String activationCode) {
        this.activationCode = activationCode;
    }

    /**
     * Getter of the name-sake field.
     * 
     * @return the value of name-sake field.
     */
    public String getSource() {
        return source;
    }

    /**
     * Setter of the name-sake field.
     * 
     * @param source
     *            the name-sake field to set
     */
    public void setSource(String source) {
        this.source = source;
    }

}
