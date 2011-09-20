/*
 * Copyright (C) 2001 - 2009 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.common.model;

import java.util.Date;

/**
 * <p>This class represents a Specification Review Reviewer association.</p>
 *
 * <p>
 *   Version 1.0 (Studio Release Assembly - Spec Review Sign up page v1.0) Change notes:
 *   <ol>
 *       This class was created to support the new Specification Review Reviewer association.
 *   </ol>
 * </p>
 *
 * @author TCSDEVELOPER
 * @version 1.0
 * @since Studio Release Assembly - Spec Review Sign up page v1.0
 */
public class SpecReviewReviewer extends Base {

    /**
     * Serial version UID for this class.
     *
     * Please change that number if you affect the fields in a way that will affect the
     * serialization for this object, i.e. when data members are changed.
     * @see http://java.sun.com/j2se/1.3/docs/guide/serialization/spec/version.doc7.html
     */
    private static final long serialVersionUID = 1L;

    /**
     * Constant to store is_active flag TRUE value
     */
    public static final Integer TRUE = 1;

    /**
     * The Specification Review reviewer association id.
     */
    private Long id;

    /**
     * The associated Specification Review.
     */
    private SpecReview specReview;

    /**
     * The associated User.
     */
    private User user;

    /**
     * The Specification Review start time.
     */
    private Date reviewStartTime;

    /**
     * The Association's "is active" flag.
     */
    private Integer isActive;

    /**
     * The Association's creation user.
     */
    private String creationUser;

    /**
     * The Association's creation time.
     */
    private Date creationTime;

    /**
     * Default empty Constructor
     */
    public SpecReviewReviewer() {
    }

    /**
     * Constructor using fields
     *
     * @param specReview the Association's Specification Review to set
     * @param user the Association's User to set
     * @param reviewStartTime the Review Start Time to set
     * @param isActive the Association's "is_active" flag to set
     * @param creationUser the Association's creation user to set
     * @param creationTime the Association's creation time to set
     */
    public SpecReviewReviewer(SpecReview specReview, User user, Date reviewStartTime, Integer isActive,
            String creationUser, Date creationTime) {
        this.specReview = specReview;
        this.user = user;
        this.reviewStartTime = reviewStartTime;
        this.isActive = isActive;
        this.creationUser = creationUser;
        this.creationTime = creationTime;
    }

    /**
     * Gets the identifier
     *
     * @return the identifier
     */
    public Long getId() {
        return id;
    }

    /**
     * Sets the identifier
     *
     * @param id the identifier to set
     */
    public void setId(Long id) {
        this.id = id;
    }

    /**
     * Gets the associated Specification Review
     *
     * @return the associated Specification Review
     */
    public SpecReview getSpecReview() {
        return specReview;
    }

    /**
     * Sets the associated Specification Review
     *
     * @param specReview the associated Specification Review to set
     */
    public void setSpecReview(SpecReview specReview) {
        this.specReview = specReview;
    }

    /**
     * Gets the associated User
     *
     * @return the associated User
     */
    public User getUser() {
        return user;
    }

    /**
     * Sets the associated User
     *
     * @param user the associated User to set
     */
    public void setUser(User user) {
        this.user = user;
    }

    /**
     * Gets the Specification review start Time
     *
     * @return the Specification review start Time
     */
    public Date getReviewStartTime() {
        return reviewStartTime;
    }

    /**
     * Sets the Specification review start Time
     *
     * @param reviewStartTime the Specification review start Time to set
     */
    public void setReviewStartTime(Date reviewStartTime) {
        this.reviewStartTime = reviewStartTime;
    }

    /**
     * Gets the Association's "is_active" flag
     *
     * @return the Association's "is_active" flag
     */
    public Integer getIsActive() {
        return isActive;
    }

    /**
     * Sets the Association's "is_active" flag
     *
     * @param isActive the Association's "is_active" flag to set
     */
    public void setIsActive(Integer isActive) {
        this.isActive = isActive;
    }

    /**
     * Gets the Association's creation User
     *
     * @return the Association's creation User
     */
    public String getCreationUser() {
        return creationUser;
    }

    /**
     * Sets the Association's creation User
     *
     * @param creationUser the Association's creation User to set
     */
    public void setCreationUser(String creationUser) {
        this.creationUser = creationUser;
    }

    /**
     * Gets the Association's creation Time
     *
     * @return the Association's creation Time
     */
    public Date getCreationTime() {
        return creationTime;
    }

    /**
     * Sets the Association's creation Time
     *
     * @param creationTime the Association's creation Time to set
     */
    public void setCreationTime(Date creationTime) {
        this.creationTime = creationTime;
    }

    /**
     * Equals implementation for this class.
     *
     * @param obj the object to compare
     * @return true if the two objects are equal (identifiers are equal)
     *
     * @see java.lang.Object#equals(java.lang.Object)
     */
    public boolean equals(Object obj) {
        if (obj == null || id == null || !(obj instanceof SpecReviewReviewer)) {
            return false;
        } else {
            SpecReviewReviewer other = (SpecReviewReviewer) obj;
            return id.equals(other.getId());
        }
    }

    /**
     * Hashcode implementation for this class.
     *
     * @return an <code>int</code> with the hashcode (identifier hashcode)
     *
     * @see java.lang.Object#hashCode()
     */
    public int hashCode() {
        return (id != null ? id.hashCode() : 0);
    }
}
