package com.topcoder.common.web.data.stat.problem;

import com.topcoder.shared.docGen.xml.*;

import java.io.Serializable;

public final class Defense implements Serializable, TagRenderer {

    private int ContestId;
    private int RoundId;
    private int RoomId;
    private int ChallengerId;
    private String Challenger;
    private int DefendantId;
    private String Defendant;
    private int ProblemId;
    private String ClassName;
    private int Succeeded;
    private float DefensePoints;
    private float Rating;

    public Defense() {
        this.ContestId = 0;
        this.RoundId = 0;
        this.RoomId = 0;
        this.ChallengerId = 0;
        this.Challenger = "";
        this.DefendantId = 0;
        this.Defendant = "";
        this.ProblemId = 0;
        this.ClassName = "";
        this.Succeeded = 0;
        this.DefensePoints = 0;
        this.Rating = 0;
    }

// set
    public void setContestId(int ContestId) {
        this.ContestId = ContestId;
    }

    public void setRoundId(int RoundId) {
        this.RoundId = RoundId;
    }

    public void setRoomId(int RoomId) {
        this.RoomId = RoomId;
    }

    public void setChallengerId(int ChallengerId) {
        this.ChallengerId = ChallengerId;
    }

    public void setChallenger(String Challenger) {
        this.Challenger = Challenger;
    }

    public void setDefendantId(int DefendantId) {
        this.DefendantId = DefendantId;
    }

    public void setDefendant(String Defendant) {
        this.Defendant = Defendant;
    }

    public void setProblemId(int ProblemId) {
        this.ProblemId = ProblemId;
    }

    public void setClassName(String ClassName) {
        this.ClassName = ClassName;
    }

    public void setSucceeded(int Succeeded) {
        this.Succeeded = Succeeded;
    }

    public void setDefensePoints(float DefensePoints) {
        this.DefensePoints = DefensePoints;
    }

    public void setRating(float Rating) {
        this.Rating = Rating;
    }


// get
    public int getContestId() {
        return this.ContestId;
    }

    public int getRoundId() {
        return this.RoundId;
    }

    public int getRoomId() {
        return this.RoomId;
    }

    public int getChallengerId() {
        return this.ChallengerId;
    }

    public String getChallenger() {
        return this.Challenger;
    }

    public int getDefendantId() {
        return this.DefendantId;
    }

    public String getDefendant() {
        return this.Defendant;
    }

    public int getProblemId() {
        return this.ProblemId;
    }

    public String getClassName() {
        return this.ClassName;
    }

    public int getSucceeded() {
        return this.Succeeded;
    }

    public float getChallengePoints() {
        return this.DefensePoints;
    }

    public float getRating() {
        return this.Rating;
    }

    public RecordTag getXML() throws Exception {
        RecordTag result = null;
        try {
            result = new RecordTag("Defense");
            result.addTag(new ValueTag("ContestId", ContestId));
            result.addTag(new ValueTag("RoundId", RoundId));
            result.addTag(new ValueTag("RoomId", RoomId));
            result.addTag(new ValueTag("ChallengerId", ChallengerId));
            result.addTag(new ValueTag("Challenger", Challenger));
            result.addTag(new ValueTag("DefendantId", DefendantId));
            result.addTag(new ValueTag("Defendant", Defendant));
            result.addTag(new ValueTag("ProblemId", ProblemId));
            result.addTag(new ValueTag("ClassName", ClassName));
            result.addTag(new ValueTag("Succeeded", Succeeded));
            result.addTag(new ValueTag("DefensePoints", DefensePoints));
            result.addTag(new ValueTag("Rating", Rating));
        } catch (Exception e) {
            throw new Exception("common.web.data.stat.problem.Defense getXML ERROR: " + e);
        }
        return result;
    }

}

