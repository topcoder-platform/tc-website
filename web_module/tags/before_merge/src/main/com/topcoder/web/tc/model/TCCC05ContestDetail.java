/*
 * TCCC05ContestDetail.java
 *
 * Created on January 6, 2005, 10:05 AM
 */

package com.topcoder.web.tc.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collections;

/**
 *
 * @author rfairfax
 */
public class TCCC05ContestDetail implements Serializable {

    private String handle;
    private ArrayList points;
    private int complete;
    private int incomplete;
    private int submissionCount;
    private int userID;
    private String payment;

    /** Creates a new instance of TC04OverallResult */
    public TCCC05ContestDetail() {
        handle = "";
        points = new ArrayList();
        complete = 0;
        incomplete = 0;
        submissionCount = 0;
        userID = 0;
        payment = "";
    }

    public TCCC05ContestDetail(String h, int u) {
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

}
