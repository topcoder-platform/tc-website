package com.topcoder.common.web.data.stat;

import com.topcoder.common.web.data.stat.contest.*;
import com.topcoder.shared.docGen.xml.*;

import java.io.Serializable;
import java.util.ArrayList;

public final class Main implements Serializable, TagRenderer {

    private int ContestId;
    private String ContestName;
    private int RoundId;
    private String RoundName;
    private int RoomId;
    private String RoomName;
    private String PreviousRoomName;
    private int CoderId;
    private String Handle;
    private int Rating;
    private int ProblemId;
    private String ProblemName;
    private int ChallengeId;
    private int CurUserId;
    private String View;
    private String Sort;
    private String Type;
    private boolean New;

    private String RowVal;
    private String Direction;
    private int CurRowVal;
    private int RowCountVal;
    private int CoderCount;
    private boolean NextPrevious;
    private boolean End;
    private String NextLink;
    private String PreviousLink;
    private String StartRec;
    private String EndRec;

    private ArrayList contests;
    private ArrayList generalresults;
    private ArrayList generalrooms;
    private ArrayList contestrounds;


    public static final int CODER_HANDLE = 0;
    public static final int CODING_PHASE = 1;
    public static final int CHALLENGE_PHASE = 2;
    public static final int TESTING_PHASE = 3;
    public static final int FINAL_POINTS = 4;
    public static final int OLD_RATING = 5;
    public static final int RATING_CHANGE = 6;
    public static final int NEW_RATING = 7;


    public Main() {
        this.ContestId = 0;
        this.ContestName = "";
        this.RoundId = 0;
        this.RoundName = "";
        this.RoomId = 0;
        this.RoomName = "";
        this.PreviousRoomName = "";
        this.CoderId = 0;
        this.Handle = "";
        this.Rating = 0;
        this.ProblemId = 0;
        this.ProblemName = "";
        this.ChallengeId = 0;
        this.CurUserId = 0;
        this.View = "";
        this.Sort = "";
        this.Type = "";
        this.New = true;

        this.RowVal = "";
        this.Direction = "";
        this.CurRowVal = 0;
        this.RowCountVal = 0;
        this.CoderCount = 0;
        this.NextPrevious = false;
        this.NextLink = "";
        this.PreviousLink = "";
        this.StartRec = "";
        this.EndRec = "";

        this.contests = new ArrayList();
        this.generalresults = new ArrayList();
        this.generalrooms = new ArrayList();
        this.contestrounds = new ArrayList();
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

    public void setRoundName(String RoundName) {
        this.RoundName = RoundName;
    }

    public void setRoomId(int RoomId) {
        this.RoomId = RoomId;
    }

    public void setRoomName(String RoomName) {
        this.RoomName = RoomName;
    }

    public void setPreviousRoomName(String PreviousRoomName) {
        this.PreviousRoomName = PreviousRoomName;
    }

    public void setCoderId(int CoderId) {
        this.CoderId = CoderId;
    }

    public void setHandle(String Handle) {
        this.Handle = Handle;
    }

    public void setRating(int Rating) {
        this.Rating = Rating;
    }

    public void setProblemId(int ProblemId) {
        this.ProblemId = ProblemId;
    }

    public void setProblemName(String ProblemName) {
        this.ProblemName = ProblemName;
    }

    public void setChallengeId(int ChallengeId) {
        this.ChallengeId = ChallengeId;
    }

    public void setCurUserId(int CurUserId) {
        this.CurUserId = CurUserId;
    }

    public void setView(String View) {
        this.View = View;
    }

    public void setSort(String Sort) {
        this.Sort = Sort;
    }

    public void setType(String Type) {
        this.Type = Type;
    }

    public void setNew(boolean New) {
        this.New = New;
    }

    public void setRowVal(String RowVal) {
        this.RowVal = RowVal;
    }

    public void setDirection(String Direction) {
        this.Direction = Direction;
    }

    public void setCurRowVal(int CurRowVal) {
        this.CurRowVal = CurRowVal;
    }

    public void setRowCountVal(int RowCountVal) {
        this.RowCountVal = RowCountVal;
    }

    public void setCoderCount(int CoderCount) {
        this.CoderCount = CoderCount;
    }

    public void setNextPrevious(boolean NextPrevious) {
        this.NextPrevious = NextPrevious;
    }

    public void setEnd(boolean End) {
        this.End = End;
    }

    public void setNextLink(String NextLink) {
        this.NextLink = NextLink;
    }

    public void setPreviousLink(String PreviousLink) {
        this.PreviousLink = PreviousLink;
    }

    public void setStartRec(String StartRec) {
        this.StartRec = StartRec;
    }

    public void setEndRec(String EndRec) {
        this.EndRec = EndRec;
    }

    public void setContests(ArrayList contests) {
        this.contests = contests;
    }

    public void setGeneralResults(ArrayList generalresults) {
        this.generalresults = generalresults;
    }

    public void setGeneralRooms(ArrayList generalrooms) {
        this.generalrooms = generalrooms;
    }

    public void setContestRounds(ArrayList contestrounds) {
        this.contestrounds = contestrounds;
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

    public String getRoundName() {
        return this.RoundName;
    }

    public int getRoomId() {
        return this.RoomId;
    }

    public String getRoomName() {
        return this.RoomName;
    }

    public String getPreviousRoomName() {
        return this.PreviousRoomName;
    }

    public int getCoderId() {
        return this.CoderId;
    }

    public String getHandle() {
        return this.Handle;
    }

    public int getRating() {
        return this.Rating;
    }

    public int getProblemId() {
        return this.ProblemId;
    }

    public String getProblemName() {
        return this.ProblemName;
    }

    public int getChallengeId() {
        return this.ChallengeId;
    }

    public int getCurUserId() {
        return this.CurUserId;
    }

    public String getView() {
        return this.View;
    }

    public String getSort() {
        return this.Sort;
    }

    public String getType() {
        return this.Type;
    }

    public boolean getNew() {
        return this.New;
    }

    public String getRowVal() {
        return this.RowVal;
    }

    public String getDirection() {
        return this.Direction;
    }

    public int getCurRowVal() {
        return this.CurRowVal;
    }

    public int getRowCountVal() {
        return this.RowCountVal;
    }

    public int getCoderCount() {
        return this.CoderCount;
    }

    public boolean getNextPrevious() {
        return this.NextPrevious;
    }

    public boolean getEnd() {
        return this.End;
    }

    public String getNextLink() {
        return this.NextLink;
    }

    public String getPreviousLink() {
        return this.PreviousLink;
    }

    public String getStartRec() {
        return this.StartRec;
    }

    public ArrayList getContests() {
        return this.contests;
    }

    public String getEndRec() {
        return this.EndRec;
    }

    public ArrayList getGeneralResults() {
        return this.generalresults;
    }

    public ArrayList getGeneralRooms() {
        return this.generalrooms;
    }

    public ArrayList getContestRounds() {
        return this.contestrounds;
    }

    public RecordTag getXML() throws Exception {
        RecordTag result = null;
        try {
            result = new RecordTag("Main");
            result.addTag(new ValueTag("ContestId", ContestId));
            result.addTag(new ValueTag("ContestName", ContestName));
            result.addTag(new ValueTag("RoundId", RoundId));
            result.addTag(new ValueTag("RoundName", RoundName));
            result.addTag(new ValueTag("RoomId", RoomId));
            result.addTag(new ValueTag("RoomName", RoomName));
            result.addTag(new ValueTag("PreviousRoomName", PreviousRoomName));
            result.addTag(new ValueTag("CoderId", CoderId));
            result.addTag(new ValueTag("Handle", Handle));
            result.addTag(new ValueTag("Rating", Rating));
            result.addTag(new ValueTag("ProblemId", ProblemId));
            result.addTag(new ValueTag("ProblemName", ProblemName));
            result.addTag(new ValueTag("ChallengeId", ChallengeId));
            result.addTag(new ValueTag("CurrentUserId", CurUserId));
            result.addTag(new ValueTag("View", View));
            result.addTag(new ValueTag("Sort", Sort));
            result.addTag(new ValueTag("Type", Type));
            result.addTag(new ValueTag("New", New));
            result.addTag(new ValueTag("RowVal", RowVal));
            result.addTag(new ValueTag("Direction", Direction));
            result.addTag(new ValueTag("CurRowVal", CurRowVal));
            result.addTag(new ValueTag("RowCountVal", RowCountVal));
            result.addTag(new ValueTag("CoderCount", CoderCount));
            result.addTag(new ValueTag("NextPrevious", NextPrevious));
            result.addTag(new ValueTag("End", End));
            result.addTag(new ValueTag("NextLink", NextLink));
            result.addTag(new ValueTag("PreviousLink", PreviousLink));
            result.addTag(new ValueTag("StartRec", StartRec));
            result.addTag(new ValueTag("EndRec", EndRec));
            for (int i = 0; i < this.contests.size(); i++) {
                ContestItem contestItem = (ContestItem) this.contests.get(i);
                result.addTag(contestItem.getXML());
            }
            for (int i = 0; i < this.contestrounds.size(); i++) {
                Contest contest = (Contest) this.contestrounds.get(i);
                result.addTag(contest.getXML());
            }
            for (int i = 0; i < this.generalresults.size(); i++) {
                RoomResult generalresult = (RoomResult) this.generalresults.get(i);
                result.addTag(generalresult.getXML());
            }
            for (int i = 0; i < this.generalrooms.size(); i++) {
                GeneralRoom generalroom = (GeneralRoom) this.generalrooms.get(i);
                result.addTag(generalroom.getXML());
            }
        } catch (Exception e) {
            throw new Exception("common.web.data.stat.Main getXML ERROR: " + e);
        }
        return result;
    }
}

