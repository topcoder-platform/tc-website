package com.topcoder.common.web.data.stat.contest;

import com.topcoder.shared.docGen.xml.RecordTag;
import com.topcoder.shared.docGen.xml.TagRenderer;
import com.topcoder.shared.docGen.xml.ValueTag;

import java.io.Serializable;
import java.util.ArrayList;

public final class RoundItem implements Serializable, TagRenderer {

    private int ContestId;
    private String ContestName;
    private int RoundId;
    private String RoundDesc;
    private ArrayList roomList;

    public RoundItem() {

        this.ContestId = 0;
        this.ContestName = "";
        this.RoundId = 0;
        this.RoundDesc = "";
        this.roomList = new ArrayList();
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

    public void setRoomList(ArrayList roomList) {
        this.roomList = roomList;
    }

// get
    public int getContestId() {
        return this.ContestId;
    }

    public String getContestName() {
        return this.ContestName;
    }

    public int getRoundId() {
        return this.RoundId;
    }

    public String getRoundDesc() {
        return this.RoundDesc;
    }

    public ArrayList getroomList() {
        return this.roomList;
    }

    public RecordTag getXML() throws Exception {
        RecordTag result = null;
        try {
            result = new RecordTag("RoundItem");
            result.addTag(new ValueTag("ContestId", ContestId));
            result.addTag(new ValueTag("ContestName", ContestName));
            result.addTag(new ValueTag("RoundId", RoundId));
            result.addTag(new ValueTag("RoundDesc", RoundDesc));
            if (this.roomList.size() > 0) {
                for (int i = 0; i < this.roomList.size(); i++) {
                    RoomItem roomItem = (RoomItem) this.roomList.get(i);
                    result.addTag(roomItem.getXML());
                }
            }
        } catch (Exception e) {
            throw new Exception("common.web.data.stat.contest.RoundItem getXML ERROR: " + e);
        }
        return result;
    }

}

