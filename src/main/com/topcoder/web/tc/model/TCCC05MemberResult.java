/*
 * TCCC05MemberResult.java
 *
 * Created on January 6, 2005, 11:41 AM
 */

package com.topcoder.web.tc.model;

import java.io.Serializable;
import java.util.Date;
import java.text.SimpleDateFormat;
/**
 *
 * @author rfairfax
 */
public class TCCC05MemberResult implements Serializable {
    
    private String component;
    private int points;
    private String placed;
    private String score;
    private int compID;
    private String payment;
    private Date submitTimestamp;
    
    SimpleDateFormat dtfmt = new SimpleDateFormat("MM.dd.yyyy hh:mma");
    
    /** Creates a new instance of TC04OverallResult */
    public TCCC05MemberResult() {
        component = "";
        points = 0;
        placed = "-";
        score = "";
        compID = 0;
        payment = "";
        submitTimestamp = null;
    }
    
    public TCCC05MemberResult(String h, int pts, String pl, String sc, int u, String pay, Date sub) {
        component = h;
        points = pts;
        placed = pl;
        score = sc;
        compID = u;
        payment = pay;
        submitTimestamp = sub;
    }
    
    public String getSubmitTimestamp() {
        if(submitTimestamp == null)
            return "";
        
        return dtfmt.format(submitTimestamp);
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
        if(score.equals(""))
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