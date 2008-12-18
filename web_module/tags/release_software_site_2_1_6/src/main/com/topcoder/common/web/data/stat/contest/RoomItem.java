package com.topcoder.common.web.data.stat.contest;

import com.topcoder.shared.docGen.xml.RecordTag;
import com.topcoder.shared.docGen.xml.TagRenderer;
import com.topcoder.shared.docGen.xml.ValueTag;

import java.io.Serializable;

public final class RoomItem implements Serializable, TagRenderer {

    private int ContestId;
    private int RoundId;
    private int RoomId;
    private String RoomDesc;

    public RoomItem() {

        this.ContestId = 0;
        this.RoundId = 0;
        this.RoomId = 0;
        this.RoomDesc = "";
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

    public void setRoomDesc(String RoomDesc) {
        this.RoomDesc = RoomDesc;
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

    public String getRoomDesc() {
        return this.RoomDesc;
    }

    public RecordTag getXML() throws Exception {
        RecordTag result = null;
        try {
            result = new RecordTag("RoomItem");
            result.addTag(new ValueTag("ContestId", ContestId));
            result.addTag(new ValueTag("RoundId", RoundId));
            result.addTag(new ValueTag("RoomId", RoomId));
            result.addTag(new ValueTag("RoomDesc", RoomDesc));
        } catch (Exception e) {
            throw new Exception("common.web.data.stat.contest.RoomItem getXML ERROR: " + e);
        }
        return result;
    }

}

