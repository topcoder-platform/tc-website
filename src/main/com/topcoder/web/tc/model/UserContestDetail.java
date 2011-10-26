/*
 * Copyright (C) 2005-2010 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/**
 *
 * @author rfairfax, isv
 */
public class UserContestDetail implements Serializable {

    private String handle;
    private ArrayList points;
    private int complete;
    private int incomplete;
    private int submissionCount;
    private int userID;
    private String payment;

    /**
     * <p>A <code>List</code> listing the placements taken by the user for contest projects.</p>
     */
    private List<Integer> placements = new ArrayList<Integer>();

    /** Creates a new instance of TC04OverallResult */
    public UserContestDetail() {
        handle = "";
        points = new ArrayList();
        complete = 0;
        incomplete = 0;
        submissionCount = 0;
        userID = 0;
        payment = "";
    }

    public UserContestDetail(String h, int u) {
        handle = h;
        userID = u;
        points = new ArrayList();
        complete = 0;
        incomplete = 0;
        submissionCount = 0;
        payment = "";
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
        int pts = 0;
        for (int i = 0; i < points.size(); i++) {
            pts += ((Integer) points.get(i)).intValue();
        }

        return pts;
    }

    public void addPoints(int p) {
        points.add(new Integer(p));
    }

    public void addPoints(int p, int max) {
        if (points.size() < max) {
            points.add(new Integer(p));
        } else {
            points.add(new Integer(p));
            Collections.sort(points);
            Collections.reverse(points);
            ArrayList al = new ArrayList();
            for (int i = 0; i < max; i++) {
                al.add(points.get(i));
            }
            points = al;
        }
    }

    public int getComplete() {
        return complete;
    }

    public void setComplete(int c) {
        complete = c;
    }

    public int getIncomplete() {
        return incomplete;
    }

    public void setIncomplete(int i) {
        incomplete = i;
    }

    public int getSubmissionCount() {
        return submissionCount;
    }

    public void setSubmissionCount(int submissionCount) {
        this.submissionCount = submissionCount;
    }

    /**
     * <p>Gets the placements taken by user for contest projects.</p>
     *
     * @return a <code>List</code> listing the placements taken by the user for contest projects.
     */
    public List<Integer> getPlacements() {
        return placements;
    }

    /**
     * <p>Sets the placements taken by user for contest projects.</p>
     *
     * @param placements a <code>List</code> listing the placements taken by the user for contest projects.
     */
    public void setPlacements(List<Integer> placements) {
        this.placements = placements;
    }
}
