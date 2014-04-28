/*
 * Copyright (C) 2013 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.reg.dto;

/**
 * <p>
 * The social account in session data bean. It's disposable.
 * </p>
 * 
 * <strong>Thread Safety:</strong> This class is mutable and not thread-safe.
 * 
 * @author ecnu_haozi
 * @version 1.0
 * @since 1.0 (Release Assembly - TopCoder Website Social Login)
 */
public class SessionSocialAccount {

    /**
     * Empty constructor
     */
    public SessionSocialAccount() {
    }

    /**
     * Constructor with arguments.
     * 
     * @param socialAccount
     *            the social account.
     * @param expired
     *            the expried flag.
     */
    public SessionSocialAccount(SocialAccount socialAccount, boolean expired) {
        this.socialAccount = socialAccount;
        this.expired = expired;
    }

    /**
     * The social account.
     */
    private SocialAccount socialAccount;

    /**
     * The flag to mark if this social account is ready to remove.
     */
    private boolean expired;

    /**
     * <p>
     * The getter method for field socialAccount.
     * </p>
     * 
     * @return the socialAccount
     */
    public SocialAccount getSocialAccount() {
        return socialAccount;
    }

    /**
     * <p>
     * The setter method for field socialAccount.
     * </p>
     * 
     * @param socialAccount
     *            the socialAccount to set
     */
    public void setSocialAccount(SocialAccount socialAccount) {
        this.socialAccount = socialAccount;
    }

    /**
     * <p>
     * The getter method for field expired.
     * </p>
     * 
     * @return the expired
     */
    public boolean isExpired() {
        return expired;
    }

    /**
     * <p>
     * The setter method for field expired.
     * </p>
     * 
     * @param expired
     *            the expired to set
     */
    public void setExpired(boolean expired) {
        this.expired = expired;
    }
}
