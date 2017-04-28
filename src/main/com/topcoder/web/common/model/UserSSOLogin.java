/*
 * Copyright (C) 2017 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.common.model;

import java.io.Serializable;

/**
 * <p>
 * This class represents a User SSO Login entity.
 * </p>
 *
 * <p>
 * <strong>Thread safety:</strong> This class is thread-safe.
 * </p>
 *
 * @author kht.tc
 * @version 1.0
 */
public class UserSSOLogin extends Base {

    /**
     * The id.
     */
    private Identifier id;

    /**
     * The sso user name.
     */
    private String ssoUserName;

    /**
     * THe sso email.
     */
    private String ssoEmail;


    private String ssoUserId;

    /**
     * Get the id.
     *
     * @return the id.
     */
    public Identifier getId() {
        return id;
    }

    /**
     * Set the id.
     *
     * @param id the id.
     */
    public void setId(Identifier id) {
        this.id = id;
    }

    /**
     * Get sso user name.
     *
     * @return the name.
     */
    public String getSsoUserName() {
        return ssoUserName;
    }

    /**
     * Set the sso user name.
     *
     * @param ssoUserName the name.
     */
    public void setSsoUserName(String ssoUserName) {
        this.ssoUserName = ssoUserName;
    }

    /**
     * Get the sso email.
     *
     * @return the email.
     */
    public String getSsoEmail() {
        return ssoEmail;
    }

    /**
     * Set the sso email.
     *
     * @param ssoEmail the email.
     */
    public void setSsoEmail(String ssoEmail) {
        this.ssoEmail = ssoEmail;
    }


    public String getSsoUserId() {
        return ssoUserId;
    }

    public void setSsoUserId(String ssoUserId) {
        this.ssoUserId = ssoUserId;
    }

    /**
     * Get the hash code.
     *
     * @return the hash code.
     */
    public int hashCode() {
        return id.hashCode();
    }

    /**
     * Check whether equals to other object.
     *
     * @param obj the object to check.
     * @return whether equals.
     */
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        return id.equals(((UserSSOLogin) obj).getId());
    }

    /**
     * The class used to represent the id of user social login.
     */
    public static class Identifier implements Serializable {
        /**
         * The user id.
         */
        private long userId;

        /**
         * The sso provider id.
         */
        private long providerId;

        /**
         * Identifier.
         *
         * @param userId the user id.
         * @param providerId the sso provider id.
         */
        public Identifier(long userId, long providerId) {
            this.userId = userId;
            this.providerId = providerId;
        }

        /**
         * The default ctor.
         */
        public Identifier() {
        }

        /**
         * Get user id.
         *
         * @return the user id.
         */
        public long getUserId() {
            return userId;
        }

        /**
         * Set user id.
         *
         * @param userId the user id.
         */
        public void setUserId(long userId) {
            this.userId = userId;
        }

        /**
         * Get sso provider id.
         *
         * @return the provider id.
         */
        public long getProviderId() {
            return providerId;
        }

        /**
         * Set provider id.
         *
         * @param providerId the provider id.
         */
        public void setProviderId(long providerId) {
            this.providerId = providerId;
        }

        /**
         * Check whether id equals to other object.
         *
         * @param o the object to check.
         * @return whether equals.
         */
        public boolean equals(Object o) {
            if (o == null) {
                return false;
            }
            try {
                Identifier id = (Identifier) o;
                return id.getUserId() == userId
                        && id.getProviderId() == providerId;
            } catch (ClassCastException e) {
                return false;
            }

        }

        /**
         * Get the hash code.
         *
         * @return the hash code.
         */
        public int hashCode() {
            final int PRIME = 31;
            return (int) (userId * PRIME + providerId);
        }
    }
}
