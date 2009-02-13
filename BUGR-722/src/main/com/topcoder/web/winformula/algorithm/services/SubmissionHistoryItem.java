/*
 * SubmissionHistoryItem
 * 
 * Created Aug 3, 2008
 */
package com.topcoder.web.winformula.algorithm.services;

import java.util.Date;

/**
 * @author Diego Belfer (Mural)
 * @version $Id: SubmissionHistoryItem.java 72272 2008-08-11 16:58:57Z pwolfus $
 */
public class SubmissionHistoryItem {
    //Unique id for the coder submissions
    private int number;
    private Date time;
    
    //Submission on round data
    private int roundId;
    private String roundName;
    
    private boolean example; //Only first round containing this submission
    private double examplePoints;
    private boolean lockedIn;

    private double accuracy;
    private boolean inQueue;
    private boolean hasPrediction;

    
    public SubmissionHistoryItem(int submissionNumber, Date submissionTime, int roundId, String roundName,
            boolean examplesForSubmission, double examplePoints, boolean lockedIn, double accuracyPercentage, boolean inqueue, boolean hasPrediction) {
        this.number = submissionNumber;
        this.time = submissionTime;
        this.roundId = roundId;
        this.roundName = roundName;
        this.example = examplesForSubmission;
        this.examplePoints = examplePoints;
        this.lockedIn = lockedIn;
        this.accuracy = accuracyPercentage;
        this.inQueue = inqueue;
        this.hasPrediction = hasPrediction;
    }

    public int getNumber() {
        return number;
    }

    public Date getTime() {
        return time;
    }

    public int getRoundId() {
        return roundId;
    }

    public String getRoundName() {
        return roundName;
    }

    public boolean isExample() {
        return example;
    }

    public boolean isLockedIn() {
        return lockedIn;
    }

    public double getAccuracy() {
        return accuracy;
    }

    public double getExamplePoints() {
        return examplePoints;
    }

    public boolean isInQueue() {
        return inQueue;
    }

    public boolean isHasPrediction() {
        return hasPrediction;
    }
}