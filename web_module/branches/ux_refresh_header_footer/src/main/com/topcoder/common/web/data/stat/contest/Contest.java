package com.topcoder.common.web.data.stat.contest;

import com.topcoder.common.web.data.stat.problem.Challenge;
import com.topcoder.common.web.data.stat.problem.Defense;
import com.topcoder.common.web.data.stat.problem.Problem;
import com.topcoder.shared.docGen.xml.RecordTag;
import com.topcoder.shared.docGen.xml.TagRenderer;
import com.topcoder.shared.docGen.xml.ValueTag;

import java.io.Serializable;
import java.util.ArrayList;

public final class Contest implements Serializable, TagRenderer {

    private int ContestId;
    private String ContestName;
    private java.sql.Date ContestStart;
    private java.sql.Date ContestEnd;
    private int RoundId;
    private String RoundDesc;
    private int RoomId;
    private String RoomDesc;
    private int CoderId;
    private String Handle;
    private ArrayList coderRooms;
    private ArrayList coderProblems;
    private ArrayList coderChallenges;
    private ArrayList coderDefenses;

    public Contest() {
        this.ContestId = 0;
        this.ContestName = "";
        this.ContestStart = new java.sql.Date(0L);
        this.ContestEnd = new java.sql.Date(0L);
        this.RoundId = 0;
        this.RoundDesc = "";
        this.RoomId = 0;
        this.RoomDesc = "";
        this.CoderId = 0;
        this.Handle = "";
        this.coderRooms = new ArrayList();
        this.coderProblems = new ArrayList();
        this.coderChallenges = new ArrayList();
        this.coderDefenses = new ArrayList();
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

    public void setRoomId(int RoomId) {
        this.RoomId = RoomId;
    }

    public void setRoomDesc(String RoomDesc) {
        this.RoomDesc = RoomDesc;
    }

    public void setCoderId(int CoderId) {
        this.CoderId = CoderId;
    }

    public void setHandle(String Handle) {
        this.Handle = Handle;
    }

    public void setCoderRooms(ArrayList coderRooms) {
        this.coderRooms = coderRooms;
    }

    public void setCoderProblems(ArrayList coderProblems) {
        this.coderProblems = coderProblems;
    }

    public void setCoderChallenges(ArrayList coderChallenges) {
        this.coderChallenges = coderChallenges;
    }

    public void setCoderDefenses(ArrayList coderDefenses) {
        this.coderDefenses = coderDefenses;
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

    public int getRoomId() {
        return this.RoomId;
    }

    public String getRoomDesc() {
        return this.RoomDesc;
    }

    public int getCoderId() {
        return this.CoderId;
    }

    public String getHandle() {
        return this.Handle;
    }

    public ArrayList getCoderRooms() {
        return this.coderRooms;
    }

    public ArrayList getCoderProblems() {
        return this.coderProblems;
    }

    public ArrayList getCoderChallenges() {
        return this.coderChallenges;
    }

    public ArrayList getCoderDefenses() {
        return this.coderDefenses;
    }

    public RecordTag getXML() throws Exception {
        RecordTag result = null;
        try {
            result = new RecordTag("Contest");
            result.addTag(new ValueTag("ContestId", ContestId));
            result.addTag(new ValueTag("ContestName", ContestName));
            result.addTag(new ValueTag("ContestStart", ContestStart));
            result.addTag(new ValueTag("ContestEnd", ContestEnd));
            result.addTag(new ValueTag("RoundId", RoundId));
            result.addTag(new ValueTag("RoundDesc", RoundDesc));
            result.addTag(new ValueTag("RoomId", RoomId));
            result.addTag(new ValueTag("RoomDesc", RoomDesc));
            result.addTag(new ValueTag("CoderId", CoderId));
            result.addTag(new ValueTag("Handle", Handle));
            for (int i = 0; i < this.coderRooms.size(); i++) {
                Room room = (Room) this.coderRooms.get(i);
                result.addTag(room.getXML());
            }
            for (int i = 0; i < this.coderProblems.size(); i++) {
                Problem problem = (Problem) this.coderProblems.get(i);
                result.addTag(problem.getXML());
            }
            for (int i = 0; i < this.coderChallenges.size(); i++) {
                Challenge challenge = (Challenge) this.coderChallenges.get(i);
                result.addTag(challenge.getXML());
            }
            for (int i = 0; i < this.coderDefenses.size(); i++) {
                Defense defense = (Defense) this.coderDefenses.get(i);
                result.addTag(defense.getXML());
            }
        } catch (Exception e) {
            throw new Exception("common.web.data.stat.contest.Contest getXML ERROR: " + e);
        }
        return result;
    }
}

