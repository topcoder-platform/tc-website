/*
 * Copyright (C) 2013 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.common.model;

import java.io.Serializable;

/**
 * <p>
 * This class represents a User API Spin entity.
 * </p>
 *
 * <p>
 * <strong>Thread safety:</strong> This class is thread-safe.
 * </p>
 *
 * <p>
 *   Version 1.0 (Release Assembly - Porting CS Mashathon pages to TopCoder website) Change notes:
 *   <ol>
 *      <li>The first version of this model.</li>
 *   </ol>
 * </p>
 *
 * @author TCSASSEMBLER
 * @version 1.0
 */
public class UserApiSpin extends Base {
    /**
     * The id.
     */
    private Identifier id;

    /**
     * The api name.
     */
    private String apiName;

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
     * Get api name.
     *
     * @return the name.
     */
    public String getApiName() {
        return apiName;
    }

    /**
     * Set the api name.
     *
     * @param apiName the name.
     */
    public void setApiName(String apiName) {
        this.apiName = apiName;
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
        return id.equals(((UserApiSpin) obj).getId());
    }

    /**
     * The class used to represent the id of user API spin.
     */
    public static class Identifier implements Serializable {
        /**
         * The user id.
         */
        private long userId;

        /**
         * The api ranking.
         */
        private Integer apiRanking;

        /**
         * The ctor of Identifier.
         *
         * @param userId the user id.
         * @param apiRanking the api ranking.
         */
        public Identifier(long userId, Integer apiRanking) {
            this.userId = userId;
            this.apiRanking = apiRanking;
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
         * Get api ranking.
         *
         * @return the api ranking.
         */
        public Integer getApiRanking() {
            return apiRanking;
        }

        /**
         * Set api ranking.
         *
         * @param apiRanking the api ranking.
         */
        public void setApiRanking(Integer apiRanking) {
            this.apiRanking = apiRanking;
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
                        && id.getApiRanking() == apiRanking;
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
            final int PRIME = 11;
            return (int) (userId * PRIME + apiRanking);
        }
    }
}
