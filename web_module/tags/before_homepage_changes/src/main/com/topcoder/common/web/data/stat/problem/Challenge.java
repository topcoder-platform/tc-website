package com.topcoder.common.web.data.stat.problem;

import com.topcoder.shared.docGen.xml.*;

import java.io.Serializable;

public final class Challenge implements Serializable, TagRenderer {

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
    private float ChallengePoints;
    private float Rating;
    private String ChallengeArgs;
    private String ExpectedResult;
    private String ReceivedResult;

    public Challenge() {
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
        this.ChallengePoints = 0;
        this.Rating = 0;
        this.ChallengeArgs = "";
        this.ExpectedResult = "";
        this.ReceivedResult = "";
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

    public void setChallengePoints(float ChallengePoints) {
        this.ChallengePoints = ChallengePoints;
    }

    public void setRating(float Rating) {
        this.Rating = Rating;
    }

    public void setChallengeArgs(String ChallengeArgs) {
        this.ChallengeArgs = ChallengeArgs;
    }

    public void setExpectedResult(String ExpectedResult) {
        this.ExpectedResult = ExpectedResult;
    }

    public void setReceivedResult(String ReceivedResult) {
        this.ReceivedResult = ReceivedResult;
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
        return this.ChallengePoints;
    }

    public float getRating() {
        return this.Rating;
    }

    public String getChallengeArgs() {
        return this.ChallengeArgs;
    }

    public String getExpectedResult() {
        return this.ExpectedResult;
    }

    public String getReceivedResult() {
        return this.ReceivedResult;
    }

    public RecordTag getXML() throws Exception {
        RecordTag result = null;
        try {
            result = new RecordTag("Challenge");
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
            result.addTag(new ValueTag("ChallengePoints", ChallengePoints));
            result.addTag(new ValueTag("Rating", Rating));
            result.addTag(new ValueTag("ChallengeArgs", ChallengeArgs));
            result.addTag(new ValueTag("ExpectedResult", ExpectedResult));
            result.addTag(new ValueTag("ReceivedResult", ReceivedResult));
        } catch (Exception e) {
            throw new Exception("common.web.data.stat.problem.Challenge getXML ERROR: " + e);
        }
        return result;
    }

}

