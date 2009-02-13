package com.topcoder.common.web.data.stat.contest;

import com.topcoder.shared.docGen.xml.*;

import java.io.Serializable;


public final class Round implements Serializable, TagRenderer {

    private int ContestId;
    private int RoundId;
    private String RoundDesc;


    public Round() {

        this.ContestId = 0;
        this.RoundId = 0;
        this.RoundDesc = "";
    }

// set
    public void setContestId(int ContestId) {
        this.ContestId = ContestId;
    }

    public void setRoundId(int RoundId) {
        this.RoundId = RoundId;
    }

    public void setRoundDesc(String RoundDesc) {
        this.RoundDesc = RoundDesc;
    }

// get
    public int getContestId() {
        return this.ContestId;
    }

    public int getRoundId() {
        return this.RoundId;
    }

    public String getRoundDesc() {
        return this.RoundDesc;
    }

    public RecordTag getXML() throws Exception {
        RecordTag result = null;
        try {
            result = new RecordTag("Round");
            result.addTag(new ValueTag("ContestId", ContestId));
            result.addTag(new ValueTag("RoundId", RoundId));
            result.addTag(new ValueTag("RoundDesc", RoundDesc));
        } catch (Exception e) {
            throw new Exception("common.web.data.stat.contest.Round getXML ERROR: " + e);
        }
        return result;
    }

}

