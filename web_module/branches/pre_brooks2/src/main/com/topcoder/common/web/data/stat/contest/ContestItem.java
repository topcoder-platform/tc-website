package com.topcoder.common.web.data.stat.contest;

import com.topcoder.common.web.util.DateTime;
import com.topcoder.shared.docGen.xml.*;

import java.io.Serializable;
import java.util.ArrayList;


public final class ContestItem implements Serializable, TagRenderer {

    private int ContestId;
    private String ContestName;
    private java.sql.Date ContestStart;
    private java.sql.Date ContestEnd;
    private int RoundId;
    private String RoundDesc;
    private ArrayList roomList;

    public ContestItem() {

        this.ContestId = 0;
        this.ContestName = "";
        this.ContestStart = new java.sql.Date(0L);
        this.ContestEnd = new java.sql.Date(0L);
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

    public void setContestStart(java.sql.Date ContestStart) {
        this.ContestStart = ContestStart;
    }

    public void setContestEnd(java.sql.Date ContestEnd) {
        this.ContestEnd = ContestEnd;
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

    public java.sql.Date getContestStart() {
        return this.ContestStart;
    }

    public java.sql.Date getContestEnd() {
        return this.ContestEnd;
    }

    public int getRoundId() {
        return this.RoundId;
    }

    public String getRoundDesc() {
        return this.RoundDesc;
    }

    public ArrayList getRoomList() {
        return this.roomList;
    }

    public RecordTag getXML() throws Exception {
        RecordTag result = null;
        try {
            result = new RecordTag("ContestItem");
            result.addTag(new ValueTag("ContestId", ContestId));
            result.addTag(new ValueTag("ContestName", ContestName));
            result.addTag(new ValueTag("ContestStart", DateTime.dateToShortSortString(ContestStart)));
            result.addTag(new ValueTag("ContestEnd", DateTime.dateToShortSortString(ContestEnd)));
            result.addTag(new ValueTag("RoundId", RoundId));
            result.addTag(new ValueTag("RoundDesc", RoundDesc));
            for (int i = 0; i < this.roomList.size(); i++) {
                RoomItem roomItem = (RoomItem) this.roomList.get(i);
                result.addTag(roomItem.getXML());
            }
        } catch (Exception e) {
            throw new Exception("common.web.data.stat.contest.ContestItem getXML ERROR: " + e);
        }
        return result;
    }

}

