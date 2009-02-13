/*
 * UserContestResult.java
 *
 * Created on January 6, 2005, 11:41 AM
 */

package com.topcoder.web.tc.model;

import java.io.Serializable;
import java.util.Date;

/**
 * @author rfairfax
 */
public class UserContestResult implements Serializable {

    private String component;
    private int points;
    private String placed;
    private String score;
    private int compID;
    private String payment;
    private Date submitTimestamp;
    private boolean complete;
    private long projectId;
    private boolean viewable;

    /**
     * Creates a new instance of TC04OverallResult
     */
    public UserContestResult() {
        component = "";
        points = 0;
        placed = "-";
        score = "";
        compID = 0;
        payment = "";
        submitTimestamp = null;
        complete = false;
        projectId = 0;
        viewable = false;
    }

    public UserContestResult(String h, int pts, String pl, String sc, int u, String pay, Date sub, boolean complete, long projectId, boolean viewable) {
        component = h;
        points = pts;
        placed = pl;
        score = sc;
        compID = u;
        payment = pay;
        submitTimestamp = sub;
        this.complete = complete;
        this.projectId = projectId;
        this.viewable = viewable;
    }

    public boolean isComplete() {
        return complete;
    }

    public Date getSubmitTimestamp() {
        return submitTimestamp;
    }

    public void setSubmitTimestamp(Date s) {
        this.submitTimestamp = s;
    }

    public Date getSubmitTimestampDate() {
        return submitTimestamp;
    }

    public String getPayment() {
        return payment;
    }

    public void setPayment(String s) {
        payment = s;
    }

    public int getCompID() {
        return compID;
    }

    public void setCompID(int u) {
        compID = u;
    }

    public String getComponent() {
        return component;
    }

    public void setComponent(String h) {
        component = h;
    }

    public int getPoints() {
        return points;
    }

    public void setPoints(int p) {
        points = p;
    }

    public String getScore() {
        return score;
    }

    public double getScoreDouble() {
        if (score.equals(""))
            return 0;

        return Double.parseDouble(score);
    }

    public void setScore(String c) {
        score = c;
    }

    public String getPlaced() {
        return placed;
    }

    public void setPlaced(String s) {
        placed = s;
    }

    public long getProjectId() {
        return projectId;
    }

    public void setProjectId(long projectId) {
        this.projectId = projectId;
    }

    public boolean isViewable() {
        return viewable;
    }

    public void setViewable(boolean viewable) {
        this.viewable = viewable;
    }


}