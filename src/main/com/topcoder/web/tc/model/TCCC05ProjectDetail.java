/*
 * TCCC05ProjectDetail.java
 *
 * Created on January 5, 2005, 3:43 PM
 */

package com.topcoder.web.tc.model;

import java.io.Serializable;
/**
 *
 * @author rfairfax
 */
public class TCCC05ProjectDetail implements Serializable {
    
    private String handle;
    private int points;
    private String placed;
    private double score;
    private int userID;
    private String payment;
    
    /** Creates a new instance of TC04OverallResult */
    public TCCC05ProjectDetail() {
        handle = "";
        points = 0;
        placed = "-";
        score = 0;
        userID = 0;
        payment = "";
    }
    
    public TCCC05ProjectDetail(String h, int pts, String pl, double sc, int u, String pay) {
        handle = h;
        points = pts;
        placed = pl;
        score = sc;
        userID = u;
        payment = pay;
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
    
    public double getScore() {
        return score;
    }
    
    public void setScore(double c) {
        score = c;
    }
    
    public String getPayment() {
        return payment;
    }
    
    public void setPayment(String s) {
        payment = s;
    }
    
}
