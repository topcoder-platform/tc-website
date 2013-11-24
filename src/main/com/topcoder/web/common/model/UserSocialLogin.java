/*
 * Copyright (C) 2013 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.common.model;

import java.io.Serializable;

/**
 * <p>
 * This class represents a User Social Login entity.
 * </p>
 *
 * <p>
 * <strong>Thread safety:</strong> This class is thread-safe.
 * </p>
 *
 * <p>
 *   Version 1.0 (Release Assembly - Social Login Linking for Existing User) Change notes:
 *   <ol>
 *      <li>The first version of this model.</li>
 *   </ol>
 * </p>
 *
 * @author tangzx
 * @version 1.0
 */
public class UserSocialLogin extends Base {

    /**
     * The id.
     */
    private Identifier id;

    /**
     * The social user name.
     */
    private String socialUserName;

    /**
     * THe social email.
     */
    private String socialEmail;

    /**
     * The social email verified field.
     */
    private boolean socialEmailVerified;

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
     * Get social user name.
     *
     * @return the name.
     */
    public String getSocialUserName() {
        return socialUserName;
    }

    /**
     * Set the social user name.
     *
     * @param socialUserName the name.
     */
    public void setSocialUserName(String socialUserName) {
        this.socialUserName = socialUserName;
    }

    /**
     * Get the social email.
     *
     * @return the email.
     */
    public String getSocialEmail() {
        return socialEmail;
    }

    /**
     * Set the social email.
     *
     * @param socialEmail the email.
     */
    public void setSocialEmail(String socialEmail) {
        this.socialEmail = socialEmail;
    }

    /**
     * Set the social email verified field.
     *
     * @return whether verified.
     */
    public boolean isSocialEmailVerified() {
        return socialEmailVerified;
    }

    /**
     * Set the social email verified field.
     *
     * @param socialEmailVerified the verified field.
     */
    public void setSocialEmailVerified(boolean socialEmailVerified) {
        this.socialEmailVerified = socialEmailVerified;
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
        return id.equals(((UserSocialLogin) obj).getId());
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
         * The social login provider id.
         */
        private long socialLoginProviderId;

        /**
         * The ctor of Identifier.
         *
         * @param userId the user id.
         * @param socialLoginProviderId the social login provider id.
         */
        public Identifier(long userId, long socialLoginProviderId) {
            this.userId = userId;
            this.socialLoginProviderId = socialLoginProviderId;
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
         * Get social login provider id.
         *
         * @return the provider id.
         */
        public long getSocialLoginProviderId() {
            return socialLoginProviderId;
        }

        /**
         * Set social login provider id.
         *
         * @param socialLoginProviderId the provider id.
         */
        public void setSocialLoginProviderId(long socialLoginProviderId) {
            this.socialLoginProviderId = socialLoginProviderId;
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
                        && id.getSocialLoginProviderId() == socialLoginProviderId;
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
            return (int) (userId * PRIME + socialLoginProviderId);
        }
    }
}
