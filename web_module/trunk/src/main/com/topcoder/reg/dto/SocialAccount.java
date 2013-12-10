/*
 * Copyright (C) 2013 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.reg.dto;

/**
 * <p>
 * The social account data bean.
 * </p>
 *
 * <p>
 *     Version 1.1 (BUGR-10169) changes:
 *     <ul>
 *         <li>Add {@link #enterpriseLogin} place holder for enterprise login</li>
 *     </ul>
 * </p>
 *
 * <strong>Thread Safety:</strong> This class is mutable and not thread-safe.
 * 
 * @author ecnu_haozi
 * @version 1.1
 * @since 1.0 (Release Assembly - TopCoder Website Social Login)
 */
public class SocialAccount {

    /**
     * The unique name for each social account, which is introduced from Auth0. If such name don't exist. set it to
     * empty string.
     */
    private String name;

    /**
     * Email of the user. If the email is unavailable, set it to empty string.
     */
    private String email;

    /**
     * First name of the user.
     */
    private String givenName;

    /**
     * Last name of the user.
     */
    private String familyName;

    /**
     * The email is activated or not after registration.
     */
    private boolean emailVerified;

    /**
     * The provider id to indicate such as Google, FaceBook, Twitter etc..
     */
    private int providerId;

    /**
     * The enterprise login status
     * @since 1.1
     */
    private boolean enterpriseLogin = false;

    /**
     * <p>
     * The getter method for field providerId.
     * </p>
     * 
     * @return the providerId
     */
    public int getProviderId() {
        return providerId;
    }

    /**
     * <p>
     * The setter method for field providerId.
     * </p>
     * 
     * @param providerId
     *            the providerId to set
     */
    public void setProviderId(int providerId) {
        this.providerId = providerId;
    }

    /**
     * <p>
     * The getter method for field name.
     * </p>
     * 
     * @return the name
     */
    public String getName() {
        return name;
    }

    /**
     * <p>
     * The setter method for field name.
     * </p>
     * 
     * @param name
     *            the name to set
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * <p>
     * The getter method for field email.
     * </p>
     * 
     * @return the email
     */
    public String getEmail() {
        return email;
    }

    /**
     * <p>
     * The setter method for field email.
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
     * The getter method for field givenName.
     * </p>
     * 
     * @return the givenName
     */
    public String getGivenName() {
        return givenName;
    }

    /**
     * <p>
     * The setter method for field givenName.
     * </p>
     * 
     * @param givenName
     *            the givenName to set
     */
    public void setGivenName(String givenName) {
        this.givenName = givenName;
    }

    /**
     * <p>
     * The getter method for field familyName.
     * </p>
     * 
     * @return the familyName
     */
    public String getFamilyName() {
        return familyName;
    }

    /**
     * <p>
     * The setter method for field familyName.
     * </p>
     * 
     * @param familyName
     *            the familyName to set
     */
    public void setFamilyName(String familyName) {
        this.familyName = familyName;
    }

    /**
     * <p>
     * The getter method for field emailVerified.
     * </p>
     * 
     * @return the emailVerified
     */
    public boolean isEmailVerified() {
        return emailVerified;
    }

    /**
     * <p>
     * The setter method for field emailVerified.
     * </p>
     * 
     * @param emailVerified
     *            the emailVerified to set
     */
    public void setEmailVerified(boolean emailVerified) {
        this.emailVerified = emailVerified;
    }

    /**
     * Getter of <code>enterpriseLogin</code>
     *
     * @return whether it is enterprise
     * @since 1.1
     */
    public boolean isEnterpriseLogin() {
        return enterpriseLogin;
    }

    /**
     * Setter of <code>enterpriseLogin</code>
     *
     * @param enterprise
     * @since 1.1
     */
    public void setEnterpriseLogin(boolean enterprise) {
        this.enterpriseLogin = enterprise;
    }

}
