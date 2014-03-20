/*
 * Copyright (C) 2013 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.reg.dto;

/**
 * <p>
 * The social account data bean.
 * </p>
 * 
 * <strong>Thread Safety:</strong> This class is mutable and not thread-safe.
 * 
 * @author ecnu_haozi
 * @version 1.0
 * @since 1.0 (Release Assembly - TopCoder Website Social Login)
 */
public class SocialAccountDTO {

    /**
     * It can be null to indicate there is no mapping account in topcoder for this social account. For not-null
     * value, it equals the TC account's userId in database.
     */
    private Long userId;

    /**
     * The unique id for each social account, which is introduced from Auth0.
     */
    private String name;

    /**
     * Email of the user.
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
     * The provider id.
     */
    private int providerId;

    /**
     * This field is for twitter only, which is a unique identity have the same effect as the other accounts' email
     * field.
     */
    private String screenName;

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
     * The getter method for field userId.
     * </p>
     * 
     * @return the userId
     */
    public Long getUserId() {
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
    public void setUserId(Long userId) {
        this.userId = userId;
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
     * <p>
     * The getter method for field screenName.
     * </p>
     * 
     * @return the screenName
     */
    public String getScreenName() {
        return screenName;
    }

    /**
     * <p>
     * The setter method for field screenName.
     * </p>
     * 
     * @param screenName
     *            the screenName to set
     */
    public void setScreenName(String screenName) {
        this.screenName = screenName;
    }
}