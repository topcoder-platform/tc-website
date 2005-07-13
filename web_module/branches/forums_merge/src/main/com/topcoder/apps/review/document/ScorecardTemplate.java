/*
 * ScorecardTemplate.java
 *
 * Copyright ? 2004, TopCoder, Inc. All rights reserved
 *
 */
package com.topcoder.apps.review.document;

/**
 * Represents a scorecard template, used for scorecard editing.
 *
 * @author FatClimber
 */
public class ScorecardTemplate {
    private long id;
    private String name;
    private int projectType;
    private int scorecardType;
    private int status;
    private boolean isDefault;

    private TGroup[] groups;

    /**
     * @param id
     * @param name
     * @param projectType
     * @param scorecardType
     * @param status
     */
    public ScorecardTemplate(
            long id,
            String name,
            int status,
            int projectType,
            int scorecardType,
            TGroup[] groups,
            boolean isDefault) {
        this.id = id;
        this.name = name;
        this.projectType = projectType;
        this.scorecardType = scorecardType;
        this.status = status;
        this.groups = groups;
        this.isDefault = isDefault;
    }

    public boolean isDefault() {
        return isDefault;
    }

    public void setDefault(boolean b) {
        this.isDefault = b;
    }

    /**
     * @return Returns the id.
     */
    public long getId() {
        return id;
    }

    /**
     * @param id The id to set.
     */
    public void setId(long id) {
        this.id = id;
    }

    /**
     * @return Returns the name.
     */
    public String getName() {
        return name;
    }

    /**
     * @param name The name to set.
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * @return Returns the projectType.
     */
    public int getProjectType() {
        return projectType;
    }

    /**
     * @param projectType The projectType to set.
     */
    public void setProjectType(int projectType) {
        this.projectType = projectType;
    }

    /**
     * @return Returns the scorecardType.
     */
    public int getScorecardType() {
        return scorecardType;
    }

    /**
     * @param scorecardType The scorecardType to set.
     */
    public void setScorecardType(int scorecardType) {
        this.scorecardType = scorecardType;
    }

    /**
     * @return Returns the status.
     */
    public int getStatus() {
        return status;
    }

    /**
     * @param status The status to set.
     */
    public void setStatus(int status) {
        this.status = status;
    }

    /**
     * @return Returns the groups.
     */
    public TGroup[] getGroups() {
        return groups;
    }

    /**
     * @param groups The groups to set.
     */
    public void setGroups(TGroup[] groups) {
        this.groups = groups;
    }

}
