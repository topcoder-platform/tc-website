package com.topcoder.common.web.data.stat.coder;

import com.topcoder.shared.docGen.xml.*;

import java.io.Serializable;
import java.text.DateFormat;


public final class Deviation implements Serializable, TagRenderer {

    private String contestName;
    private int contestId;
    private String roundName;
    private int roundId;
    private float deviation;
    private java.sql.Date eventDate;

    public Deviation() {
        contestName = "";
        contestId = 0;
        roundName = "";
        roundId = 0;
        deviation = 0;
        eventDate = null;

    }

// set
    public void setContestName(String contestName) {
        this.contestName = contestName;
    }

    public void setContestId(int contestId) {
        this.contestId = contestId;
    }

    public void setRoundName(String roundName) {
        this.roundName = roundName;
    }

    public void setRoundId(int roundId) {
        this.roundId = roundId;
    }

    public void setDeviation(float deviation) {
        this.deviation = deviation;
    }

    public void setEventDate(java.sql.Date eventDate) {
        this.eventDate = eventDate;
    }

// get
    public String getContestName() {
        return contestName;
    }

    public int getContestId() {
        return contestId;
    }

    public String getRoundName() {
        return roundName;
    }

    public int getRoundId() {
        return roundId;
    }

    public float getDeviation() {
        return deviation;
    }

    public java.sql.Date getEventDate() {
        return eventDate;
    }

    public RecordTag getXML() throws Exception {
        RecordTag result = null;
        try {
            result = new RecordTag("Deviation");
            result.addTag(new ValueTag("ContestName", contestName));
            result.addTag(new ValueTag("ContestId", contestId));
            result.addTag(new ValueTag("RoundName", roundName));
            result.addTag(new ValueTag("RoundId", roundId));
            result.addTag(new ValueTag("Deviation", deviation));
            result.addTag(new ValueTag("EventDate", DateFormat.getDateInstance(DateFormat.LONG).format(eventDate)));
        } catch (Exception e) {
            e.printStackTrace();
            throw new Exception("common.web.data.stat.coder.Deviation getXML ERROR: " + e);
        }
        return result;
    }

}

