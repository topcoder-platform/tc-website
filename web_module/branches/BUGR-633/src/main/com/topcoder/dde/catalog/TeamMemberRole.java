/*
 * Copyright (c) 2006 TopCoder, Inc. All rights reserved.
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
 * Version 1.0.1 Change notes:
 * <ol>
 * <li>
 * Added static constants for role's IDs.
 * </li>
 * <li>
 * Description attribute was added.
 * </li>
 * <li>
 * tcsrating attribute was eliminated.
 * </li>
 * </ol>
 *
 * @version 1.0.1
 * @author Albert Mao, pulky
 * @see     ComponentManager
 */
public class TeamMemberRole implements java.io.Serializable {

    /** The ROLE_REQUESTOR role id */
    public static final int ROLE_REQUESTOR = 1;

    /** The ROLE_ARCHITECT role id */
    public static final int ROLE_ARCHITECT = 2;

    /** The ROLE_DEVELOPER role id */
    public static final int ROLE_DEVELOPER = 3;

    /** The ROLE_QA_DEVELOPER role id */
    public static final int ROLE_QA_DEVELOPER = 4;

    /** The ROLE_COMPONENT_DESIGNER role id */
    public static final int ROLE_COMPONENT_DESIGNER = 5;

    /** The ROLE_COMPONENT_DESIGN_REVIEWER role id */
    public static final int ROLE_COMPONENT_DESIGN_REVIEWER = 6;

    /** The ROLE_COMPONENT_DEVELOPER role id */
    public static final int ROLE_COMPONENT_DEVELOPER = 7;

    /** The ROLE_COMPONENT_DEVELOPMENT_REVIEWER role id */
    public static final int ROLE_COMPONENT_DEVELOPMENT_REVIEWER = 8;

    private long id;
    private long userId;
    private String username;
    private long roleId;
    private String roleName;
    private String roleDescription;


    /**
     * The description of the added role.
     *
     * @since 1.0.1
     */
    private String description;

    /**
     * Constructs a new <code>TeamMemberRole</code> object.
     *
     * @param id the entity Id
     * @param userId the Id of the user
     * @param username the user's name
     * @param resourceRoleId the Id of the resource role.
     * @param projectCategoryId the project category id
     * @throws IllegalArgumentException if <code>user</code> or
     * <code>role</code> is <code>null</code>, if the specified role was
     * constructed by the client (instead of returned by the catalog)
     */
    TeamMemberRole(long id, long userId, String username, long resourceRoleId,
                   long projectCategoryId) {
        this.id = id;
        this.userId = userId;
        this.username = username;
        if (projectCategoryId == 1 && resourceRoleId == 1) {
        	this.roleId = ROLE_COMPONENT_DESIGNER;
        } else if (projectCategoryId == 2 && resourceRoleId == 1) {
        	this.roleId = ROLE_COMPONENT_DEVELOPER;
        } else if (resourceRoleId == 4) {
        	this.roleId = ROLE_COMPONENT_DESIGN_REVIEWER;
        } else {
        	this.roleId = ROLE_COMPONENT_DEVELOPMENT_REVIEWER;
        }
    }

    /**
     * Constructs a new <code>TeamMemberRole</code> object.
     *
     * @param id the entity Id
     * @param userId the Id of the user
     * @param username the user's name
     * @param roleId the Id of the role.
     * @param description the role addition description
     * @throws IllegalArgumentException if <code>user</code> or
     * <code>role</code> is <code>null</code>, if the specified role was
     * constructed by the client (instead of returned by the catalog)
     */
    TeamMemberRole(long id, long userId, String username, long roleId,
                   String roleName, String roleDescription, String description) {
        this.id = id;
        this.userId = userId;
        this.username = username;
        this.roleId = roleId;
        this.roleName = roleName;
        this.roleDescription = roleDescription;
        this.description = description;
    }

    /**
     * Constructs a new <code>TeamMemberRole</code> object.
     *
     * @param user a <code>User</code> object representing the user that plays
     * the development role
     * @param role a <code>Role</code> object representing the role
     * @param description the role addition description
     * @throws IllegalArgumentException if <code>user</code> or
     * <code>role</code> is <code>null</code>, if the specified role was
     * constructed by the client (instead of returned by the catalog)
     */
    public TeamMemberRole(User user, Role role, String description) {
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
        id = -1;
        this.userId = user.getId();
        this.roleId = role.getId();
        this.roleName = role.getName();
        this.roleDescription = role.getDescription();
        this.description = description;
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
     * Returns the role addition description
     *
     * @return the role addition description
     * @since 1.0.1
     */
    public String getDescription() {
        return description;
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
                && getDescription() == other.getDescription();
    }

    /**
     * Returns the hash code value for this development role. The hash code is
     * generated by performing a bitwise exclusive-or operation on the user id,
     * role id, and rating.
     *
     * @return the hash code value for this development role
     */
    public int hashCode() {
        return (int) (getUserId() ^ getRoleId() ^ getDescription().hashCode());
    }

    public String toString() {
        return "Development Role " + getId() + ": " + getUserId() + " - " +
            getRoleId() + " " + getRoleName() + " (" + getRoleDescription() + ")";
    }


}
