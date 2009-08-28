/*
 * Copyright (C) 2001 - 2009 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.common.model;

/**
 * <p>This class represents a Specification Review Reviewer association.</p>
 *
 * <p>
 *   Version 1.0 (Studio Release Assembly - Spec Review Sign up page v1.0) Change notes:
 *   <ol>
 *       This class was created to support the new Specification Review entity.
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
     * Constant to store is_active flag ACTIVE value
     */
    public static final Integer ACTIVE = 1;

    /**
     * The Specification Review id.
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
     * The Association's "is active" flag.
     */
    private Integer isActive;
        
    /**
     * Constructor using fields
     * 
     * @param specReview the Specification Review to set
     * @param user the User to set
     * @param isActive the "is_active" flag to set
     */
    public SpecReviewReviewer(SpecReview specReview, User user,
            Integer isActive) {
        this.specReview = specReview; 
        this.user = user; 
        this.isActive = isActive; 
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
        return id.hashCode();
    }
}
