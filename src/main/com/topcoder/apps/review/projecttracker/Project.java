/*
 * Project.java
 *
 * Copyright ? 2003, TopCoder, Inc. All rights reserved
 *
 */
package com.topcoder.apps.review.projecttracker;

import com.topcoder.apps.review.persistence.Common;

import java.io.Serializable;
import java.net.URL;


/**
 * The Project represents and provides access, as necessary, to the data
 * representing a project tracked by the system.
 *
 * @author FatClimber
 * @version 1.0
 */
public class Project implements Serializable {
    private long id;
    private long componentId;
    private long forumId;
    private long compVersId;
    private PhaseInstance[] timeline;
    private User projectManager;
    private String name;
    private String version;
    private PhaseInstance currentPhase;
    private User winner;
    private URL projectInformationURL;
    private UserRole[] userRole;
    private String notes;
    private String overView;
    private ProjectType projectType;
    private ProjectStatus projectStatus;
    private String catalog;
    private boolean notificationSent;
    private long screeningTemplateId;
    private long reviewTemplateId;
    private boolean dirtyFlag = false;
    private long requestorId;
    private long versionId;
    private long levelId;
    private boolean autopilot;

    /**
     * Creates a new Project object.
     *
     * @param id DOCUMENT ME!
     * @param name DOCUMENT ME!
     * @param version DOCUMENT ME!
     * @param projectManager DOCUMENT ME!
     * @param winner DOCUMENT ME!
     * @param timeline DOCUMENT ME!
     * @param currentPhase DOCUMENT ME!
     * @param userRole DOCUMENT ME!
     * @param notes DOCUMENT ME!
     * @param overView DOCUMENT ME!
     * @param projectType DOCUMENT ME!
     * @param requestorId DOCUMENT ME!
     * @param versionId DOCUMENT ME!
     */
    public Project(long id, long componentId, long forumId, long compVersId, String name, String version,
                   User projectManager, User winner,
                   PhaseInstance[] timeline, PhaseInstance currentPhase, UserRole[] userRole, String notes, String overView,
                   ProjectType projectType, ProjectStatus projectStatus, boolean notificationSent,
                   long screeningTemplateId, long reviewTemplateId,
                   long requestorId, long versionId, long levelId, boolean autopilot) {
        this.id = id;
        this.componentId = componentId;
        this.forumId = forumId;
        this.compVersId = compVersId;
        this.name = name;
        this.version = version;
        this.projectManager = projectManager;
        this.winner = winner;
        this.timeline = timeline;
        this.currentPhase = currentPhase;
        this.userRole = userRole;
        this.notes = notes;
        this.overView = overView;
        this.projectType = projectType;
        this.projectStatus = projectStatus;
        this.notificationSent = notificationSent;
        this.screeningTemplateId = screeningTemplateId;
        this.reviewTemplateId = reviewTemplateId;
        this.requestorId = requestorId;
        this.versionId = versionId;
        this.levelId = levelId;
        this.autopilot = autopilot;
    }

    public boolean getAutoPilot() {
        return autopilot;
    }

    public void setAutoPilot(boolean autopilot) {
        this.dirtyFlag = true;
        this.autopilot = autopilot;
    }

    protected long getLevelId() {
        return levelId;
    }

    protected void setLevelId(long levelId) {
        this.dirtyFlag = true;
        this.levelId = levelId;
    }

    /**
     * DOCUMENT ME!
     *
     * @return DOCUMENT ME!
     */
    protected long getRequestorId() {
        return requestorId;
    }

    /**
     * DOCUMENT ME!
     *
     * @return DOCUMENT ME!
     */
    protected boolean getDirty() {
        return dirtyFlag;
    }

    /**
     * DOCUMENT ME!
     *
     * @return DOCUMENT ME!
     */
    protected long getVersionId() {
        return versionId;
    }

    /**
     * <p>
     * Return the id of this project.
     * This id maps to the component version id in comp_versions.comp_vers_id
     * </p>
     *
     * @return the id of this project.
     */
    public long getId() {
        return id;
    }

    /**
     * <p>
     * Return the component id for this project.
     * This id is the component id in comp_catalog.component_id
     * </p>
     *
     * @return the component version id for this project.
     */
    public long getCatalogueId() {
        return componentId;
    }

    /**
     * @return the forum id for this project.
     */
    public long getForumId() {
        return forumId;
    }

    /**
     * <p>
     * Return the component version id for this project.
     * This id is the one in comp_versions.comp_vers_id
     * </p>
     *
     * @return the component version id for this project.
     */
    public long getCompVersId() {
        return compVersId;
    }

    /**
     * <p>
     * Return the timeline of this project.
     * </p>
     *
     * @return a PhaseInstance[] with the timeline of this project.
     */
    public PhaseInstance[] getTimeline() {
        return timeline;
    }

    /**
     * <p>
     * Return the project manager of this project.
     * </p>
     *
     * @return the project manager of this project.
     */
    public User getProjectManager() {
        return projectManager;
    }

    /**
     * <p>
     * Return the name of this project.
     * </p>
     *
     * @return the name of this project.
     */
    public String getName() {
        return name;
    }

    /**
     * <p>
     * Return the version of this project.
     * </p>
     *
     * @return the version of this project.
     */
    public String getVersion() {
        return version;
    }

    /**
     * <p>
     * Return the current phase of this project.
     * </p>
     *
     * @return the current phase of this project.
     */
    public Phase getCurrentPhase() {
        return currentPhase.getPhase();
    }

    /**
     * <p>
     * Set the current phase of this project.
     * </p>
     *
     * @param phase The current phase of this project.
     */
    public void setCurrentPhase(Phase phase) {
        boolean validPhase = false;

        for (int i = 0; i < timeline.length; i++) {
            if (timeline[i].getPhase().getId() == phase.getId()) {
                if (!Common.equals(this.currentPhase, timeline[i])) {
                    this.currentPhase = timeline[i];
                    this.dirtyFlag = true;
                }
                validPhase = true;

                break;
            }
        }

        if (!validPhase) {
            throw new IllegalArgumentException("Phase not in project's timeline!");
        }
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
     * <p>
     * Set the winner of this project.
     * </p>
     *
     * @param winner The winner of this project.
     */
    public void setWinner(User submitter) {
        this.winner = submitter;
        this.dirtyFlag = true;
    }

    /**
     * <p>
     * Return the URL of this project's information.
     * </p>
     *
     * @return the URL of this project's information.
     */
    public URL getProjectInformationURL() {
        return projectInformationURL;
    }

    /**
     * <p>
     * Set the URL of this project's information.
     * </p>
     *
     * @param url The URL of this project's information.
     */
    public void setProjectInformationURL(URL url) {
        if (!Common.equals(this.projectInformationURL, url)) {
            this.projectInformationURL = url;
            this.dirtyFlag = true;
        }
    }

    /**
     * <p>
     * Return the list of participants.
     * </p>
     *
     * @return the list of participants.
     */
    public UserRole[] getParticipants() {
        return userRole;
    }

    /**
     * <p>
     * Set the list of participants.
     * </p>
     *
     * @param participants The list of participants.
     */
    public void setParticipants(UserRole[] participants) {
        this.userRole = participants;
    }


    /**
     * <p>
     * Return the project overview.
     * </p>
     *
     * @return the project overview.
     */
    public String getOverview() {
        return overView;
    }

    /**
     * <p>
     * Return the project notes.
     * </p>
     *
     * @return the project notes.
     */
    public String getNotes() {
        return notes;
    }

    /**
     * <p>
     * Set the project notes.
     * </p>
     *
     * @param notes The project notes to be set.
     */
    public void setNotes(String notes) {
        if (!Common.equals(this.notes, notes)) {
            this.notes = notes;
            this.dirtyFlag = true;
        }
    }

    /**
     * <p>
     * Return the project type (design/develop).
     * </p>
     *
     * @return the project type.
     */
    public ProjectType getProjectType() {
        return projectType;
    }

    /**
     * <p>
     * Set the project type (design/develop).
     * </p>
     *
     * @param type The project type to be set.
     */
    public void setProjectType(ProjectType type) {
        this.projectType = type;
        this.dirtyFlag = true;
    }

    /**
     * <p>
     * Return the project status .
     * </p>
     *
     * @return the project status.
     */
    public ProjectStatus getProjectStatus() {
        return projectStatus;
    }

    /**
     * <p>
     * Set the project status.
     * </p>
     *
     * @param type The project status to be set.
     */
    public void setProjectStatus(ProjectStatus status) {
        if (!Common.equals(this.projectStatus, status)) {
            this.projectStatus = status;
            this.dirtyFlag = true;
        }
    }

    /**
     * <p>
     * Return whether project notification has been sent.
     * </p>
     *
     * @return whether the project notification has been sent.
     */
    public boolean isNotificationSent() {
        return notificationSent;
    }

    /**
     * <p>
     * Set whether the project notification has been sent.
     * </p>
     *
     * @param isPMReviewed Whether the project notification has been sent.
     */
    public void setNotificationSent(boolean isSent) {
        if (this.isNotificationSent() != isSent) {
            this.notificationSent = isSent;
            this.dirtyFlag = true;
        }
    }


    /**
     * @return Returns the reviewTemplateId.
     */
    public long getReviewTemplateId() {
        return reviewTemplateId;
    }

    /**
     * @param reviewTemplateId The reviewTemplateId to set.
     */
    public void setReviewTemplateId(long reviewTemplateId) {
        if (this.reviewTemplateId != reviewTemplateId) {
            this.reviewTemplateId = reviewTemplateId;
            this.dirtyFlag = true;
        }
    }

    /**
     * @return Returns the screeningeTemplateId.
     */
    public long getScreeningTemplateId() {
        return screeningTemplateId;
    }

    /**
     * @param screeningeTemplateId The screeningeTemplateId to set.
     */
    public void setScreeningTemplateId(long screeningTemplateId) {
        if (this.screeningTemplateId != screeningTemplateId) {
            this.screeningTemplateId = screeningTemplateId;
            this.dirtyFlag = true;
        }
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

        if (!(o instanceof Project)) {
            return false;
        }

        Project project = (Project) o;

        return project.getId() == this.id;
    }

    /* (non-Javadoc)
     * @see java.lang.Object#hashCode()
     */
    public int hashCode() {
        return (int) (id ^ (id >>> 32));
    }
}
