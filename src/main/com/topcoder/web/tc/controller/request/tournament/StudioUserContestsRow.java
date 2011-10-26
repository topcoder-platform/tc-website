/*
* StudioLeaderBoardRow
*
* Created Aug 2, 2007
*/
package com.topcoder.web.tc.controller.request.tournament;

import java.sql.Timestamp;

/**
 * @author Pablo Wolfus (pulky)
 * @version $Id: StudioUserContestsRow.java 68101 2008-01-21 18:39:50Z pulky $
 */
public class StudioUserContestsRow {

    private Long contestId;
    private String contestName;
    private Timestamp startDate;
    private Timestamp endDate;
    private String handle;
    private Integer registrants;
    private Integer submissions;
    private Integer placed;
    private Integer points;
    private Long submissionId;
    
    public StudioUserContestsRow(Long contestId, String contestName, Timestamp startDate, Timestamp endDate, String handle, Integer registrants, Integer submissions, Integer placed, Integer points, Long submissionId) {
        super();
        this.contestId = contestId;
        this.contestName = contestName;
        this.startDate = startDate;
        this.endDate = endDate;
        this.handle = handle;
        this.registrants = registrants;
        this.submissions = submissions;
        this.placed = placed;
        this.points = points;
        this.submissionId = submissionId;
    }

    public Long getContestId() {
        return contestId;
    }
    public void setContestId(Long contestId) {
        this.contestId = contestId;
    }
    public String getContestName() {
        return contestName;
    }
    public void setContestName(String contestName) {
        this.contestName = contestName;
    }
    public Timestamp getEndDate() {
        return endDate;
    }
    public void setEndDate(Timestamp endDate) {
        this.endDate = endDate;
    }
    public String getHandle() {
        return handle;
    }
    public void setHandle(String handle) {
        this.handle = handle;
    }
    public Integer getPlaced() {
        return placed;
    }
    public void setPlaced(Integer placed) {
        this.placed = placed;
    }
    public Integer getPoints() {
        return points;
    }
    public void setPoints(Integer points) {
        this.points = points;
    }
    public Integer getRegistrants() {
        return registrants;
    }
    public void setRegistrants(Integer registrants) {
        this.registrants = registrants;
    }
    public Timestamp getStartDate() {
        return startDate;
    }
    public void setStartDate(Timestamp startDate) {
        this.startDate = startDate;
    }
    public Integer getSubmissions() {
        return submissions;
    }
    public void setSubmissions(Integer submissions) {
        this.submissions = submissions;
    }
        
    public Long getSubmissionId() {
        return submissionId;
    }
    public void setSubmissionId(Long submissionId) {
        this.submissionId = submissionId;
    }
        
}
