package com.topcoder.web.tc.model;

import java.io.Serializable;

public class ComponentCompetitorDetails implements Serializable {

    private int uid;
    private String handle;
    private String dateInquired;
    private String dateSubmitted;
    private String screeningScore;
    private String initialScore;
    private String finalScore;
    private String score1;
    private String score2;
    private String score3;

    public ComponentCompetitorDetails() {
        setUid(0);
        setHandle("n/a");
        setDateInquired("n/a");
        setDateSubmitted("n/a");
        setScreeningScore("n/a");
        setInitialScore("n/a");
        setFinalScore("n/a");
        setScore1("n/a");
        setScore2("n/a");
        setScore3("n/a");
    }

    public String toString() {
        StringBuffer b = new StringBuffer();
        b.append("\n");
        b.append("uid=").append(uid).append("\n");
        b.append("handle=").append(handle).append("\n");
        b.append("dateInquired=").append(dateInquired).append("\n");
        b.append("dateSubmitted=").append(dateSubmitted).append("\n");
        b.append("screeningScore=").append(screeningScore).append("\n");
        b.append("initialScore=").append(initialScore).append("\n");
        b.append("finalScore=").append(finalScore).append("\n");
        b.append("score1=").append(score1).append("\n");
        b.append("score2=").append(score2).append("\n");
        b.append("score3=").append(score3).append("\n");
        return b.toString();
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public int getUid() {
        return uid;
    }

    public void setHandle(String handle) {
        this.handle = handle;
    }

    public String getHandle() {
        return handle;
    }

    public void setDateInquired(String dateInquired) {
        this.dateInquired = dateInquired;
    }

    public String getDateInquired() {
        return dateInquired;
    }

    public void setDateSubmitted(String dateSubmitted) {
        this.dateSubmitted = dateSubmitted;
    }

    public String getDateSubmitted() {
        return dateSubmitted;
    }

    public void setScreeningScore(String screeningScore) {
        this.screeningScore = screeningScore;
    }

    public String getScreeningScore() {
        return screeningScore;
    }

    public void setInitialScore(String initialScore) {
        this.initialScore = initialScore;
    }

    public String getInitialScore() {
        return initialScore;
    }

    public void setFinalScore(String finalScore) {
        this.finalScore = finalScore;
    }

    public String getFinalScore() {
        return finalScore;
    }

    public void setScore1(String score1) {
        this.score1 = score1;
    }

    public String getScore1() {
        return score1;
    }

    public void setScore2(String score2) {
        this.score2 = score2;
    }

    public String getScore2() {
        return score2;
    }

    public void setScore3(String score3) {
        this.score3 = score3;
    }

    public String getScore3() {
        return score3;
    }

}

