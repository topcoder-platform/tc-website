package com.topcoder.mpsqas.common;

import java.io.Serializable;
import java.util.ArrayList;

/**
 * Holds information about a contest.
 */
public class ContestInformation implements Serializable {
    public ContestInformation() {
    }

    public void setContestName(String contestName) {
        this.contestName = contestName;
    }

    public String getContestName() {
        return contestName;
    }

    public void setRoundName(String roundName) {
        this.roundName = roundName;
    }

    public String getRoundName() {
        return roundName;
    }

    public void setStartCoding(String startCoding) {
        this.startCoding = startCoding;
    }

    public String getStartCoding() {
        return startCoding;
    }

    public void setEndCoding(String endCoding) {
        this.endCoding = endCoding;
    }

    public String getEndCoding() {
        return endCoding;
    }

    public void setStartChallenge(String startChallenge) {
        this.startChallenge = startChallenge;
    }

    public String getStartChallenge() {
        return startChallenge;
    }

    public void setEndChallenge(String endChallenge) {
        this.endChallenge = endChallenge;
    }

    public String getEndChallenge() {
        return endChallenge;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getRole() {
        return role;
    }

    public void setRoundId(int roundId) {
        this.roundId = roundId;
    }

    public int getRoundId() {
        return roundId;
    }

    /**
     */
    public void setAvailableProblems(ArrayList problems) {
        this.availableProblems = problems;
    }

    /**
     */
    public void setAvailableTesters(ArrayList testers) {
        this.availableTesters = testers;
    }

    /**
     */
    public void setScheduledProblems(ArrayList problems) {
        this.scheduledProblems = problems;
    }

    public ArrayList getAvailableProblems() {
        return availableProblems;
    }

    public ArrayList getAvailableTesters() {
        return availableTesters;
    }

    public ArrayList getScheduledProblems() {
        return scheduledProblems;
    }

    private int roundId;
    private String contestName;
    private String roundName;
    private String startCoding;
    private String endCoding;
    private String startChallenge;
    private String endChallenge;
    private ArrayList availableProblems;
    private ArrayList availableTesters;
    private ArrayList scheduledProblems;
    private String role;
}
