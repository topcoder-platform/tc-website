/*
 * TeamMemberRole.java
 * 26 August 2002
 * 1.0
 *
 * Copyright (c) 2002, TopCoder, Inc.
 * All rights reserved.
 */


package com.topcoder.dde.catalog;

import com.topcoder.dde.user.User;

/**
 * An object that represents a component development role. Instances of this
 * class can either be created by the component catalog to return information to
 * the client, or by the client to pass information to the component catalog. In
 * the former case, the instance will contain information about the development
 * role's primary key in the database and the username of the user. In the
 * latter case, the instance will have a dummy id of -1 and <code>null</code>
 * for the username. A development role is a binding of a user to a role. For a
 * particular component, many users can play one role and many roles can be
 * played by one user.
 *
 * @version 1.0, 26 August 2002
 * @author  Albert Mao
 * @see     ComponentManager
 */
public class TeamMemberRole implements java.io.Serializable {


    /** The maximum possible rating */
    public static final int MAX_RATING = 99999;

    /** The minimum possible rating */
    public static final int MIN_RATING = 0;

    private long id;
    private long userId;
    private String username;
    private long roleId;
    private String roleName;
    private String roleDescription;
    private int tcsRating;


    TeamMemberRole(long id, long userId, String username, long roleId,
                   String roleName, String roleDescription, int tcsRating) {
        this.id = id;
        this.userId = userId;
        this.username = username;
        this.roleId = roleId;
        this.roleName = roleName;
        this.roleDescription = roleDescription;
        this.tcsRating = tcsRating;
    }

    /**
     * Constructs a new <code>TeamMemberRole</code> object.
     *
     * @param user a <code>User</code> object representing the user that plays
     * the development role
     * @param role a <code>Role</code> object representing the role
     * @param tcsRating the rating given to the user for this role
     * @throws IllegalArgumentException if <code>user</code> or
     * <code>role</code> is <code>null</code>, if the specified role was
     * constructed by the client (instead of returned by the catalog), or if
     * <code>tcsRating</code> is not between <code>MIN_RATING</code> and
     * <code>MAX_RATING</code>, inclusive
     */
    public TeamMemberRole(User user, Role role, int tcsRating) {
        if (user == null) {
            throw new IllegalArgumentException(
                    "Null specified for user");
        }
        if (role == null) {
            throw new IllegalArgumentException(
                    "Null specified for role");
        }
        if (role.getId() == -1) {
            throw new IllegalArgumentException(
                    "Specified role does not exist in the catalog");
        }
        if (tcsRating > MAX_RATING || tcsRating < MIN_RATING) {
            throw new IllegalArgumentException(
                    "Invalid value specified for rating");
        }
        id = -1;
        this.userId = user.getId();
        this.roleId = role.getId();
        this.roleName = role.getName();
        this.roleDescription = role.getDescription();
        this.tcsRating = tcsRating;
    }


    /**
     * Returns the primary key of this development role.
     *
     * @return the primary key of this development role, or -1 if this category
     * was constructed by the client (instead of returned by the component
     * catalog)
     */
    public long getId() {
        return id;
    }

    /**
     * Returns the primary key of the user that plays this development role
     *
     * @return the primary key of the user that plays this development role
     */
    public long getUserId() {
        return userId;
    }

    /**
     * Returns the username of the user that plays this development role
     *
     * @return the username of the user that plays this development role, or
     * <code>null</code> if this development role was constructed by the client
     * (instead of returned by the component catalog)
     */
    public String getUsername() {
        return username;
    }

    /**
     * Returns the primary key of the role
     *
     * @return the primary key of the role
     */
    public long getRoleId() {
        return roleId;
    }

    /**
     * Returns the name of the role
     *
     * @return the name of the role
     */
    public String getRoleName() {
        return roleName;
    }

    /**
     * Returns a description of the role
     *
     * @return a description of the role
     */
    public String getRoleDescription() {
        return roleDescription;
    }

    /**
     * Returns the rating assigned to the user for this role
     *
     * @return the rating assigned to the user for this role
     */
    public int getTCSRating() {
        return tcsRating;
    }

    /**
     * Compares the specified object with this development role for equality.
     * Two development roles are considered equal if they have the same user id,
     * role id, and rating. The primary key, username, role name, and role
     * description are <em>not</em> tested for equality.
     *
     * @param object the object to be tested for equality
     * @return <code>true</code> if the specified object is equal to this
     * role; <code>false</code> otherwise
     */
    public boolean equals(Object object) {
        if (object == null || object.getClass() != getClass()) {
            return false;
        }
        TeamMemberRole other = (TeamMemberRole) object;
        return getUserId() == other.getUserId()
                && getRoleId() == other.getRoleId()
                && getTCSRating() == other.getTCSRating();
    }

    /**
     * Returns the hash code value for this development role. The hash code is
     * generated by performing a bitwise exclusive-or operation on the user id,
     * role id, and rating.
     *
     * @return the hash code value for this development role
     */
    public int hashCode() {
        return (int) (getUserId() ^ getRoleId() ^ getTCSRating());
    }

    public String toString() {
        return "Development Role " + getId() + ": " + getUserId() + " "
                + getTCSRating() + " - " + getRoleId() + " "
                + getRoleName() + " (" + getRoleDescription() + ")";
    }


}
