package com.topcoder.common.web.data.stat.contest;

import com.topcoder.shared.docGen.xml.*;

import java.io.Serializable;

public final class Room implements Serializable, TagRenderer {

    private int ContestId;
    private int RoundId;
    private int RoomId;
    private int CoderId;
    private String Handle;
    private float Rating;
    private int Submits;
    private float SubmitPoints;
    private int Defenses;
    private float DefensePoints;
    private int Challenges;
    private float ChallengePoints;
    private float Deduction;
    private float Points;
    private float PreRoundRating;
    private float PostRoundRating;

    public Room() {

        ContestId = 0;
        RoundId = 0;
        RoomId = 0;
        CoderId = 0;
        Handle = "";
        Rating = 0;
        Submits = 0;
        SubmitPoints = 0;
        Defenses = 0;
        DefensePoints = 0;
        Challenges = 0;
        ChallengePoints = 0;
        Deduction = 0;
        Points = 0;
        PreRoundRating = 0;
        PostRoundRating = 0;
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

    public void setCoderId(int CoderId) {
        this.CoderId = CoderId;
    }

    public void setHandle(String Handle) {
        this.Handle = Handle;
    }

    public void setRating(float Rating) {
        this.Rating = Rating;
    }

    public void setSubmits(int Submits) {
        this.Submits = Submits;
    }

    public void setSubmitPoints(float SubmitPoints) {
        this.SubmitPoints = SubmitPoints;
    }

    public void setDefenses(int Defenses) {
        this.Defenses = Defenses;
    }

    public void setDefensePoints(float DefensePoints) {
        this.DefensePoints = DefensePoints;
    }

    public void setChallenges(int Challenges) {
        this.Challenges = Challenges;
    }

    public void setChallengePoints(float ChallengePoints) {
        this.ChallengePoints = ChallengePoints;
    }

    public void setDeduction(float Deduction) {
        this.Deduction = Deduction;
    }

    public void setPoints(float Points) {
        this.Points = Points;
    }

    public void setPreRoundRating(float PreRoundRating) {
        this.PreRoundRating = PreRoundRating;
    }

    public void setPostRoundRating(float PostRoundRating) {
        this.PostRoundRating = PostRoundRating;
    }

// get
    public int getContestId() {
        return ContestId;
    }

    public int getRoundId() {
        return RoundId;
    }

    public int getRoomId() {
        return RoomId;
    }

    public int getCoderId() {
        return CoderId;
    }

    public String getHandle() {
        return Handle;
    }

    public float getRating() {
        return Rating;
    }

    public int getSubmits() {
        return Submits;
    }

    public float getSubmitPoints() {
        return SubmitPoints;
    }

    public int getDefenses() {
        return Defenses;
    }

    public float getDefensePoints() {
        return DefensePoints;
    }

    public int getChallenges() {
        return Challenges;
    }

    public float getChallengePoints() {
        return ChallengePoints;
    }

    public float getDeduction() {
        return Deduction;
    }

    public float getPoints() {
        return Points;
    }

    public float getPreRoundRating() {
        return PreRoundRating;
    }

    public float getPostRoundRating() {
        return PostRoundRating;
    }


    public RecordTag getXML() throws Exception {
        RecordTag result = null;
        try {
            result = new RecordTag("Room");
            result.addTag(new ValueTag("ContestId", ContestId));
            result.addTag(new ValueTag("RoundId", RoundId));
            result.addTag(new ValueTag("RoomId", RoomId));
            result.addTag(new ValueTag("CoderId", CoderId));
            result.addTag(new ValueTag("Handle", Handle));
            result.addTag(new ValueTag("Rating", Rating));
            result.addTag(new ValueTag("Submits", Submits));
            result.addTag(new ValueTag("SubmitPoints", SubmitPoints));
            result.addTag(new ValueTag("Defenses", Defenses));
            result.addTag(new ValueTag("DefensePoints", DefensePoints));
            result.addTag(new ValueTag("Challenges", Challenges));
            result.addTag(new ValueTag("ChallengePoints", ChallengePoints));
            result.addTag(new ValueTag("Deduction", Deduction));
            result.addTag(new ValueTag("Points", Points));
            result.addTag(new ValueTag("PreRoundRating", PreRoundRating));
            result.addTag(new ValueTag("PostRoundRating", PostRoundRating));
        } catch (Exception e) {
            throw new Exception("common.web.data.stat.contest.Room getXML ERROR: " + e);
        }
        return result;
    }

}

