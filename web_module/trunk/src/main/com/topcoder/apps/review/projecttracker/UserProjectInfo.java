/*
 * UserProjectInfo.java
 *
 * Copyright � 2003, TopCoder, Inc. All rights reserved
 *
 */
package com.topcoder.apps.review.projecttracker;

import java.io.Serializable;


/**
 * <p>
 * A lightweight version of the Project which is provided to speed performance
 * and minimise storage needs as these objects are stored in a user's session.
 * </p>
 *
 * @author FatClimber
 * @version 1.0
 */
public class UserProjectInfo implements Serializable {
    private long id;
    private String name;
    private String version;
    private UserRole[] userRole;
    private PhaseInstance phaseInstance;
    private ProjectType projectType;
    private User winner;

    private ProjectStatus projectStatus;
    private String catalog;

    /**
     * Creates a new UserProjectInfo object.
     *
     * @param id DOCUMENT ME!
     * @param name DOCUMENT ME!
     * @param version DOCUMENT ME!
     * @param userRole DOCUMENT ME!
     * @param phaseInstance DOCUMENT ME!
     * @param projectType DOCUMENT ME!
     */
    public UserProjectInfo(long id, String name, String version, UserRole[] userRole, PhaseInstance phaseInstance,
                           ProjectType projectType, User winner, ProjectStatus projectStatus) {
        this.id = id;
        this.name = name;
        this.version = version;
        this.userRole = userRole;
        this.phaseInstance = phaseInstance;
        this.projectType = projectType;
        this.winner = winner;

        this.projectStatus = projectStatus;
    }

    /**
     * <p>
     * Return the project id.
     * </p>
     *
     * @return the project id.
     */
    public long getId() {
        return id;
    }

    void setProjectName(String newName) {
        this.name = newName;
    }

    void setProjectVersion(String newVersion) {
        this.version = newVersion;
    }

    void setUserRoles(UserRole[] newUserRole) {
        this.userRole = newUserRole;
    }

    void setPhase(PhaseInstance newPhaseInstance) {
        this.phaseInstance = newPhaseInstance;
    }

    /**
     * <p>
     * Return the project name.
     * </p>
     *
     * @return a String the project name.
     */
    public String getProjectName() {
        return name;
    }

    /**
     * <p>
     * Return the project version.
     * </p>
     *
     * @return a String with the project version.
     */
    public String getProjectVersion() {
        return version;
    }

    /**
     * <p>
     * Return the users involved in this project.
     * </p>
     *
     * @return a UserRole[] with the users involved in this project.
     */
    public UserRole[] getUserRoles() {
        return userRole;
    }

    /**
     * <p>
     * Return the current phase.
     * </p>
     *
     * @return a PhaseInstance with the current phase.
     */
    public PhaseInstance getCurrentPhaseInstance() {
        return phaseInstance;
    }

    /**
     * <p>
     * Return the project type.
     * </p>
     *
     * @return a ProjectType with the project type.
     */
    public ProjectType getProjectType() {
        return projectType;
    }

    /**
     * <p>
     * Return the winner of this project.
     * </p>
     *
     * @return the winner of this project.
     */
    public User getWinner() {
        return winner;
    }

    /**
     * @return
     */
    public ProjectStatus getProjectStatus() {
        return projectStatus;
    }

    /**
     * Get what catalog this project belongs to(Java/.NET).
     * @return catalog
     */
    public String getCatalog() {
        return catalog;
    }

    /**
     * @param catalog The catalog to set.
     */
    public void setCatalog(String catalog) {
        this.catalog = catalog;
    }

    /* (non-Javadoc)
     * @see java.lang.Object#equals(java.lang.Object)
     */
    public boolean equals(Object o) {
        if (o == this) {
            return true;
        }

        if (!(o instanceof UserProjectInfo)) {
            return false;
        }

        UserProjectInfo info = (UserProjectInfo) o;

        return info.getId() == this.id;
    }

    /* (non-Javadoc)
     * @see java.lang.Object#hashCode()
     */
    public int hashCode() {
        return (int) (id ^ (id >>> 32));
    }

}
