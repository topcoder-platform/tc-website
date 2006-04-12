/*
 * UserRole.java
 *
 * Copyright � 2003, TopCoder, Inc. All rights reserved
 *
 */
package com.topcoder.apps.review.projecttracker;

import com.topcoder.apps.review.persistence.Common;

import java.io.Serializable;


/**
 * <p>
 * The UserRole represents the relationship of a user to a project.
 * </p>
 *
 * @author FatClimber
 * @version 1.0
 */
public class UserRole implements Serializable {
    private long id;
    private Role role;
    private User user;
    private PaymentInfo paymentInfo;
    private ReviewerResponsibility reviewerResponsibility;
    private boolean dirtyFlag = false;
    private long versionId;

    /**
     * Creates a new UserRole object.
     *
     * @param id DOCUMENT ME!
     * @param role DOCUMENT ME!
     * @param user DOCUMENT ME!
     * @param paymentInfo DOCUMENT ME!
     * @param reviewerResponsibility DOCUMENT ME!
     * @param versionId DOCUMENT ME!
     */
    public UserRole(long id, Role role, User user, PaymentInfo paymentInfo,
                    ReviewerResponsibility reviewerResponsibility, long versionId) {
        this.id = id;
        this.role = role;
        this.user = user;
        this.paymentInfo = paymentInfo;
        this.reviewerResponsibility = reviewerResponsibility;
        this.versionId = versionId;
    }

    /**
     * DOCUMENT ME!
     *
     * @return DOCUMENT ME!
     */
    public boolean getDirty() {
        return dirtyFlag;
    }

    /**
     * DOCUMENT ME!
     *
     * @return DOCUMENT ME!
     */
    public long getVersionId() {
        return versionId;
    }

    /**
     * <p>
     * Return the id of the role.
     * </p>
     *
     * @return the id of the role.
     */
    public long getId() {
        return id;
    }

    /**
     * <p>
     * Return the id of the role.
     * </p>
     *
     * @return the id of the role.
     */
    public void setId(long id) {
        this.id = id;
        this.dirtyFlag = true;
    }

    /**
     * <p>
     * Return the user role.
     * </p>
     *
     * @return the user role.
     */
    public Role getRole() {
        return role;
    }

    /**
     * <p>
     * Set the user role.
     * </p>
     *
     * @param role The user role to be set.
     */
    public void setRole(Role newRole) {
        this.role = newRole;
        this.dirtyFlag = true;
    }

    /**
     * <p>
     * Return the user.
     * </p>
     *
     * @return the user.
     */
    public User getUser() {
        return user;
    }

    /**
     * <p>
     * Set the user
     * </p>
     *
     * @param user The user to be set.
     */
    public void setUser(User newUser) {
        if (!Common.equals(this.user, newUser)) {
            this.user = newUser;
            this.dirtyFlag = true;
        }
    }

    /**
     * <p>
     * Return the payment information.
     * </p>
     *
     * @return the payment information.
     */
    public PaymentInfo getPaymentInfo() {
        return paymentInfo;
    }

    /**
     * <p>
     * Set the payment information.
     * </p>
     *
     * @param info The payment information.
     */
    public void setPaymentInfo(PaymentInfo newPaymentInfo) {
        this.paymentInfo = newPaymentInfo;
        this.dirtyFlag = true;
    }

    /**
     * <p>
     * Return the reviewer's responsibility.
     * </p>
     *
     * @return the reviewer's responsibility.
     */
    public ReviewerResponsibility getReviewerResponsibility() {
        return reviewerResponsibility;
    }

    /**
     * <p>
     * Set the reviewer's responsibility.
     * </p>
     *
     * @param reviewerResponsibility The reviewer's responsibility.
     */
    public void setReviewerResponsibility(ReviewerResponsibility newReviewerResponsibility) {
        if (!Common.equals(this.reviewerResponsibility, newReviewerResponsibility)) {
            this.reviewerResponsibility = newReviewerResponsibility;
            this.dirtyFlag = true;
        }
    }

    /* (non-Javadoc)
     * @see java.lang.Object#equals(java.lang.Object)
     */
    public boolean equals(Object o) {
        if (o == this) {
            return true;
        }

        if (!(o instanceof UserRole)) {
            return false;
        }

        UserRole userRole = (UserRole) o;

        return userRole.getId() == this.id;
    }

    /* (non-Javadoc)
     * @see java.lang.Object#hashCode()
     */
    public int hashCode() {
        return (int) (id ^ (id >>> 32));
    }
}
