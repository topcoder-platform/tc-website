/*
 * Review.java
 * 26 August 2002
 * 1.0
 *
 * Copyright (c) 2002, TopCoder, Inc.
 * All rights reserved.
 */


package com.topcoder.dde.catalog;

import com.topcoder.dde.user.User;

import java.util.Date;


/**
 * An object that represents a user review of a component. Instances of this
 * class can either be created by the component catalog to return information to
 * the client, or by the client to pass information to the component catalog. In
 * the former case, the instance will contain information about the review's
 * primary key in the database, the username of the author of the review, and
 * the date the review was written. In the latter case, the instance will have a
 * dummy id of -1 and <code>null</code> for the username and review date.
 *
 * @version 1.0, 26 August 2002
 * @author  Albert Mao
 * @see     ComponentManager
 */
public class Review implements java.io.Serializable {


    private final long id;
    private final long userId;
    private String username;
    private Date reviewDate;
    private int rating;
    private String comments;


    Review(long id, long userId, String username, Date reviewDate, int rating,
           String comments) {
        this.id = id;
        this.userId = userId;
        this.username = username;

        /*
         * The Date class is not immutable.  A copy must be made to preserve the
         * immutability of ComponentReview.
         */
        reviewDate = (Date) reviewDate.clone();

        this.rating = rating;
        this.comments = comments;
    }

    /**
     * Constructs a new <code>Review</code> object.
     *
     * @param user a <code>User</code> object representing the author of the
     * review
     * @param rating the rating of the component given in the review
     * @param comments the comments of the review
     * @throws IllegalArgumentException if <code>user</code> or
     * <code>comments</code> are <code>null</code>
     */
    public Review(User user, int rating, String comments) {
        if (user == null) {
            throw new IllegalArgumentException(
                    "Null specified for reviewer");
        }
        if (comments == null) {
            throw new IllegalArgumentException(
                    "Null specified for review comments");
        }
        this.id = -1;
        this.userId = user.getId();
        this.rating = rating;
        this.comments = comments;
    }

    /**
     * Returns the primary key of this review.
     *
     * @return the primary key of this review, or -1 if this review was
     * constructed by the client (instead of returned by the component catalog)
     */
    public long getId() {
        return id;
    }

    /**
     * Returns the primary key of the user that wrote this review.
     *
     * @return the primary key of the author of this review
     */
    public long getUserId() {
        return userId;
    }

    /**
     * Returns the username of the user that wrote this review.
     *
     * @return the username of the author of this review, or <code>null</code>
     * if this review was constructed by the client (instead of returned by the
     * component catalog)
     */
    public String getUsername() {
        return username;
    }

    /**
     * Returns the date this review was made on.
     *
     * @return the date this review was made on, or <code>null</code> if this
     * review was constructed by the client (instead of returned by the
     * component catalog)
     */
    public Date getReviewDate() {
        return (reviewDate == null)
                ? null
                : (Date) reviewDate.clone();
    }

    /**
     * Returns the rating given in this review.
     *
     * @return the rating given in this review
     */
    public int getRating() {
        return rating;
    }

    /**
     * Sets the rating given in this review.
     *
     * @param rating the new rating
     */
    public void setRating(int rating) {
        this.rating = rating;
    }

    /**
     * Returns the comments given in this review.
     *
     * @return the comments given in this review
     */
    public String getComments() {
        return comments;
    }

    /**
     * Sets the comments given in this review.
     *
     * @param comments the new comments
     * @throws IllegalArgumentException if <code>comments</code> is
     * <code>null</code>.
     */
    public void setComments(String comments) {
        if (comments == null) {
            throw new IllegalArgumentException(
                    "Null specified for review comments");
        }
        this.comments = comments;
    }

    /**
     * Compares the specified object with this review for equality. Two
     * reviews are considered equal if they have the same user id, rating, and
     * comments. The primary key, username, and review date are <em>not</em>
     * tested for equality.
     *
     * @param object the object to be tested for equality
     * @return <code>true</code> if the specified object is equal to this
     * review; <code>false</code> otherwise
     */
    public boolean equals(Object object) {
        if (object == null || object.getClass() != getClass()) {
            return false;
        }
        Review other = (Review) object;
        return getUserId() == other.getUserId()
                && getRating() == other.getRating()
                && getComments().equals(other.getComments());
    }

    /**
     * Returns the hash code value for this review. The hash code is generated
     * by performing a bitwise exclusive-or operation on the user id, rating,
     * and the hash code of the review comments.
     *
     * @return the hash code value for this review
     */
    public int hashCode() {
        return (int) (getUserId() ^ getRating() ^ getComments().hashCode());
    }

    public String toString() {
        return "Review " + getId() + " by user " + getUserId() + " - Rating: "
                + getRating() + " - " + getComments();
    }


}