/*
* StudioLeaderBoardRow
*
* Created Aug 2, 2007
*/
package com.topcoder.web.tc.controller.request.tournament;

import java.sql.Timestamp;


/**
 * @author Pablo Wolfus (pulky)
 * @version $Id$
 */
public class ModDashLeaderBoardDetailRow {
    private String issueKey;
    private Integer points;
    private Integer project;
    private Timestamp created;
    
    /**
     * @param rank
     * @param handle
     */
    public ModDashLeaderBoardDetailRow(String issueKey,
            Integer points, Integer project,
            Timestamp created) {
        super();
        this.issueKey = issueKey;
        this.points = points;
        this.project = project;
        this.created = created;
    }

    /**
     * @return the issueKey
     */
    public String getIssueKey() {
        return issueKey;
    }

    /**
     * @param issueKey the issueKey to set
     */
    public void setIssueKey(String issueKey) {
        this.issueKey = issueKey;
    }

    /**
     * @return the points
     */
    public Integer getPoints() {
        return points;
    }

    /**
     * @param points the points to set
     */
    public void setPoints(Integer points) {
        this.points = points;
    }

    /**
     * @return the project
     */
    public Integer getProject() {
        return project;
    }

    /**
     * @param project the project to set
     */
    public void setProject(Integer project) {
        this.project = project;
    }

    /**
     * @return the created
     */
    public Timestamp getCreated() {
        return created;
    }

    /**
     * @param created the created to set
     */
    public void setCreated(Timestamp created) {
        this.created = created;
    }
}
