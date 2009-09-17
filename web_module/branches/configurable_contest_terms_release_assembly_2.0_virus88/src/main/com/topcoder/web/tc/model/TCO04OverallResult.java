/*
 * TC04OverallResult.java
 *
 * Created on September 17, 2004, 11:25 AM
 */

package com.topcoder.web.tc.model;

import java.io.Serializable;

/**
 *
 * @author  rfairfax
 */
public class TCO04OverallResult implements Serializable {

    private String handle;
    private boolean pending;
    private int points;
    private int completeProjects;
    private int incompleteProjects;
    private int userID;
    private String contestPrize;

    /** Creates a new instance of TC04OverallResult */
    public TCO04OverallResult() {
        handle = "";
        pending = false;
        points = 0;
        completeProjects = 0;
        incompleteProjects = 0;
        userID = 0;
        contestPrize = "";
    }

    public TCO04OverallResult(String h, boolean p, int pts, int c, int i, int u, String prz) {
        handle = h;
        pending = p;
        points = pts;
        completeProjects = c;
        incompleteProjects = i;
        userID = u;
        contestPrize = prz;
    }

    public String getContestPrize() {
        return contestPrize;
    }

    public void setContestPrize(String s) {
        contestPrize = s;
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

    public boolean isPending() {
        return pending;
    }

    public void setPending(boolean b) {
        pending = b;
    }

    public int getPoints() {
        return points;
    }

    public void setPoints(int p) {
        points = p;
    }

    public int getCompleteProjects() {
        return completeProjects;
    }

    public void setCompleteProjects(int c) {
        completeProjects = c;
    }

    public int getIncompleteProjects() {
        return incompleteProjects;
    }

    public void setIncompleteProjects(int i) {
        incompleteProjects = i;
    }
}
