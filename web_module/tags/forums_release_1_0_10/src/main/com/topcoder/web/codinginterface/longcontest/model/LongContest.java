package com.topcoder.web.codinginterface.longcontest.model;

import com.topcoder.web.common.model.ImageInfo;

import java.util.Date;

public class LongContest {

    private String contestName;
    private long contestID;
    private String roundName;
    private long roundID;
    private Date startTime;
    private Date endTime;
    private String problemName;
    private long componentID;
    private boolean passed;
    private boolean coderRegistered;
    private long problemID;
    private boolean started;
    private int numCompetitors;
    private int numRegistrants;
    private ImageInfo sponsorImage;
    private long forumId;
    private int submissionCount;

    public boolean isCoderRegistered() {
        return coderRegistered;
    }

    public void setCoderRegistered(boolean coderRegistered) {
        this.coderRegistered = coderRegistered;
    }

    public long getComponentID() {
        return componentID;
    }

    public void setComponentID(long componentID) {
        this.componentID = componentID;
    }

    public long getContestID() {
        return contestID;
    }

    public void setContestID(long contestID) {
        this.contestID = contestID;
    }

    public String getContestName() {
        return contestName;
    }

    public void setContestName(String contestName) {
        this.contestName = contestName;
    }

    public Date getEndTime() {
        return endTime;
    }

    public void setEndTime(Date endTime) {
        this.endTime = endTime;
    }

    public boolean isPassed() {
        return passed;
    }

    public void setPassed(boolean passed) {
        this.passed = passed;
    }

    public String getProblemName() {
        return problemName;
    }

    public void setProblemName(String problemName) {
        this.problemName = problemName;
    }

    public long getRoundID() {
        return roundID;
    }

    public void setRoundID(long roundID) {
        this.roundID = roundID;
    }

    public String getRoundName() {
        return roundName;
    }

    public void setRoundName(String roundName) {
        this.roundName = roundName;
    }

    public Date getStartTime() {
        return startTime;
    }

    public void setStartTime(Date startTime) {
        this.startTime = startTime;
    }

    public long getProblemID() {
        return problemID;
    }

    public void setProblemID(long problemID) {
        this.problemID = problemID;
    }

    public boolean isStarted() {
        return started;
    }

    public void setStarted(boolean started) {
        this.started = started;
    }

    public int getNumCompetitors() {
        return numCompetitors;
    }

    public void setNumCompetitors(int numCompetitors) {
        this.numCompetitors = numCompetitors;
    }

    public int getNumRegistrants() {
        return numRegistrants;
    }

    public void setNumRegistrants(int numRegistrants) {
        this.numRegistrants = numRegistrants;
    }

    public ImageInfo getSponsorImage() {
        return sponsorImage;
    }

    public void setSponsorImage(ImageInfo sponsorImage) {
        this.sponsorImage = sponsorImage;
    }

    public long getForumId() {
        return forumId;
    }

    public void setForumId(long forumId) {
        this.forumId = forumId;
    }

    public int getSubmissionCount() {
        return submissionCount;
    }

    public void setSubmissionCount(int submissionCount) {
        this.submissionCount = submissionCount;
    }

}
