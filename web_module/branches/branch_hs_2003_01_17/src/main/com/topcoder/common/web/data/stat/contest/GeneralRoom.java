package com.topcoder.common.web.data.stat.contest;

import com.topcoder.shared.docGen.xml.*;

import java.io.Serializable;
import java.util.ArrayList;

public final class GeneralRoom implements Serializable, TagRenderer {

    private int ContestId;
    private String ContestName;
    private int RoundId;
    private String RoundDesc;
    private int RoomId;
    private String RoomDesc;
    private ArrayList RoomResults;

    public GeneralRoom() {

        ContestId = 0;
        ContestName = "";
        RoundId = 0;
        RoundDesc = "";
        RoomId = 0;
        RoomDesc = "";
        RoomResults = new ArrayList();
    }

// set
    public void setContestId(int ContestId) {
        this.ContestId = ContestId;
    }

    public void setContestName(String ContestName) {
        this.ContestName = ContestName;
    }

    public void setRoundId(int RoundId) {
        this.RoundId = RoundId;
    }

    public void setRoundDesc(String RoundDesc) {
        this.RoundDesc = RoundDesc;
    }

    public void setRoomId(int RoomId) {
        this.RoomId = RoomId;
    }

    public void setRoomDesc(String RoomDesc) {
        this.RoomDesc = RoomDesc;
    }

    public void setRoomResults(ArrayList RoomResults) {
        this.RoomResults = RoomResults;
    }

// get
    public int getContestId() {
        return ContestId;
    }

    public String getContestName() {
        return ContestName;
    }

    public int getRoundId() {
        return RoundId;
    }

    public String getRoundDesc() {
        return RoundDesc;
    }

    public int getRoomId() {
        return RoomId;
    }

    public String getRoomDesc() {
        return RoomDesc;
    }

    public ArrayList getRoomResults() {
        return RoomResults;
    }

    public RecordTag getXML() throws Exception {
        RecordTag result = null;
        try {
            result = new RecordTag("GeneralRoom");
            result.addTag(new ValueTag("ContestId", ContestId));
            result.addTag(new ValueTag("ContestName", ContestName));
            result.addTag(new ValueTag("RoundId", RoundId));
            result.addTag(new ValueTag("RoundDesc", RoundDesc));
            result.addTag(new ValueTag("RoomId", RoomId));
            result.addTag(new ValueTag("RoomDesc", RoomDesc));
            for (int i = 0; i < this.RoomResults.size(); i++) {
                RoomResult roomResult = (RoomResult) this.RoomResults.get(i);
                result.addTag(roomResult.getXML());
            }
        } catch (Exception e) {
            throw new Exception("common.web.data.stat.contest.GeneralRoom getXML ERROR: " + e);
        }
        return result;
    }

}

