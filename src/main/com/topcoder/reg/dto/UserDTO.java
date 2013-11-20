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
 * <p>
 *     version 1.2(BugR 10042) change log:
 *     <ol>
 *         <li>Add {@link #utm_source} field and its getter/setter method.</li>
 *         <li>Add {@link #utm_medium} field and its getter/setter method.</li>
 *         <li>Add {@link #utm_campaign} field and its getter/setter method.</li>
 *     </ol>
 * </p>
 *
 * @author sampath01, leo_lol, Urmass ,TCSASSEMBLER, KeSyren
 * @version 1.2
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
     *  Identify the advertiser, site, publication, etc. that is sending traffic to your property, e.g. google,
     *  city search, newsletter4, billboard.
     */
    private String utm_source;

    /**
     * The advertising or marketing medium, e.g.: cpc, referral, email.
     */
    private String utm_medium;

    /**
     * The individual campaign name, slogan, promo code, etc. for a product.
     */
    private String utm_campaign;

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

    /**
     * Gets namesake field.
     *
     * @return the namesake value.
     */
    public String getUtm_source() {
        return utm_source;
    }

    /**
     * Gets namesake field.
     *
     * @return the namesake value.
     */
    public String getUtm_medium() {
        return utm_medium;
    }

    /**
     * Gets namesake field.
     *
     * @return the namesake value.
     */
    public String getUtm_campaign() {
        return utm_campaign;
    }

    /**
     * Sets the namesake field.
     *
     * @param utm_source the source
     */
    public void setUtm_source(String utm_source) {
        this.utm_source = utm_source;
    }

    /**
     * Sets the namesake field.
     *
     * @param utm_medium the medium
     */
    public void setUtm_medium(String utm_medium) {
        this.utm_medium = utm_medium;
    }

    /**
     * Sets the namesake field.
     *
     * @param utm_campaign the campaign.
     */
    public void setUtm_campaign(String utm_campaign) {
        this.utm_campaign = utm_campaign;
    }
}
