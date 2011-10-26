/*
 * ProjectDetail.java
 *
 * Created on January 5, 2005, 3:43 PM
 */

package com.topcoder.web.tc.model;

import java.io.Serializable;
import java.sql.Timestamp;

/**
 *
 * @author rfairfax
 */
public class ProjectDetail implements Serializable {

    private String handle;
    private int points;
    private String placed;
    private String score;
    private int userID;
    private String payment;
    private Timestamp submitTimestamp;

    /** Creates a new instance of TC04OverallResult */
    public ProjectDetail() {
        handle = "";
        points = 0;
        placed = "-";
        score = "";
        userID = 0;
        payment = "";
        submitTimestamp =null;
    }

    public ProjectDetail(String h, int pts, String pl, String sc, int u, String pay, Timestamp sub) {
        handle = h;
        points = pts;
        placed = pl;
        score = sc;
        userID = u;
        payment = pay;
        submitTimestamp = sub;
    }

    public Timestamp getSubmitTimestamp() {
        return submitTimestamp;
    }

    public void setSubmitTimestamp(Timestamp s) {
        this.submitTimestamp = s;
    }

    public String getPayment() {
        return payment;
    }

    public void setPayment(String s) {
        payment = s;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int u) {
        userID = u;
    }

    public String getHandle() {
        return handle;
    }

    public void setHandle(String h) {
        handle = h;
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

}
