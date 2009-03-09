package com.topcoder.common.web.data;

import com.topcoder.shared.docGen.xml.RecordTag;
import com.topcoder.shared.docGen.xml.TagRenderer;
import com.topcoder.shared.docGen.xml.ValueTag;

import java.io.Serializable;
import java.util.ArrayList;


public final class Round implements Serializable, TagRenderer {


    private int roundId;
    private int contestId;
    private String roundName;
    private String contestName;
    private String status;
    private int ranRatings;
    private int paidMoney;
    private int registrationLimit;
    private String notes;
    private String link;
    private String modified;
    private String RoundDesc;
    private ArrayList problems;  // ArrayList of Problem Id's
    private ArrayList rooms;     // ArrayList of rooms
    private ArrayList roundSegments; //ArrayList of RoundSegment


    public Round(int contestId) {
        this.contestId = contestId;
        init();
    }

    public Round() {
        this.contestId = 0;
        init();
    }

    private void init() {
        this.roundId = 0;
        this.problems = new ArrayList();
        this.rooms = new ArrayList();
        this.roundSegments = new ArrayList();
        this.roundName = "";
        this.contestName = "";
        this.status = null;
        this.ranRatings = 0;
        this.paidMoney = 0;
        this.registrationLimit = 0;
        this.notes = "";
        this.link = "";
        this.modified = "";

    }

// set

    public void setContestId(int contestId) {
        this.contestId = contestId;
    }

    public void setRoundId(int roundId) {
        this.roundId = roundId;
    }

    public void setProblems(ArrayList problems) {
        this.problems = problems;
    }

    public void setRooms(ArrayList rooms) {
        this.rooms = rooms;
    }

    public void setRoundSegments(ArrayList roundSegments) {
        this.roundSegments = roundSegments;
    }

    public void setRoundName(String roundName) {
        this.roundName = roundName;
    }

    public void setContestName(String contestName) {
        this.contestName = contestName;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public void setRanRatings(int in) {
        this.ranRatings = in;
    }

    public void setPaidMoney(int in) {
        this.paidMoney = in;
    }

    public void setRegistrationLimit(int in) {
        this.registrationLimit = in;
    }

    public void setModified(String modified) {
        this.modified = modified;
    }

    public void setNotes(String notes) {
        this.notes = notes;
    }

    public void setLink(String link) {
        this.link = link;
    }


    public void setRoundDesc(String RoundDesc) {
        this.RoundDesc = RoundDesc;
    }



// get

    public String getRoundDesc() {
        return this.RoundDesc;
    }


    public int getContestId() {
        return this.contestId;
    }

    public int getRoundId() {
        return this.roundId;
    }

    public ArrayList getProblems() {
        return this.problems;
    }

    public ArrayList getRooms() {
        return this.rooms;
    }

    public ArrayList getRoundSegments() {
        return this.roundSegments;
    }

    public String getRoundName() {
        return this.roundName;
    }

    public String getContestName() {
        return this.contestName;
    }

    public String getStatus() {
        return this.status;
    }

    public int getRanRatings() {
        return this.ranRatings;
    }

    public int getPaidMoney() {
        return this.paidMoney;
    }

    public int getRegistrationLimit() {
        return this.registrationLimit;
    }

    public String getModified() {
        return this.modified;
    }

    public String getNotes() {
        return this.notes;
    }

    public String getLink() {
        return this.link;
    }

    public RecordTag getXML() throws Exception {
        RecordTag result = null;
        try {
            result = new RecordTag("Round");
            result.addTag(new ValueTag("ContestId", contestId));
            result.addTag(new ValueTag("RoundId", roundId));
            result.addTag(new ValueTag("RoundName", roundName));
            result.addTag(new ValueTag("ContestName", contestName));
            result.addTag(new ValueTag("Status", status));
            result.addTag(new ValueTag("RanRatings", ranRatings));
            result.addTag(new ValueTag("PaidMoney", paidMoney));
            result.addTag(new ValueTag("RegistrationLimit", registrationLimit));
            result.addTag(new ValueTag("Modified", modified));
            result.addTag(new ValueTag("Notes", notes));
            result.addTag(new ValueTag("Link", link));
            result.addTag(RecordTag.getListXML("RoundSegments", roundSegments));
            result.addTag(RecordTag.getListXML("Problems", problems));
            result.addTag(RecordTag.getListXML("Rooms", rooms));
        } catch (Exception e) {
            throw new Exception("common.web.data.Round getXML ERROR: " + e);
        }
        return result;
    }
}

