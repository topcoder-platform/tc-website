package com.topcoder.common.web.data.stat.contest;

import com.topcoder.common.web.data.SortKey;
import com.topcoder.shared.docGen.xml.*;

import java.io.Serializable;


public final class RoomResult implements Comparable, Serializable, TagRenderer {

    private int ContestId;
    private String ContestName;
    private int RoundId;
    private String RoundDesc;
    private int RoomId;
    private String RoomDesc;
    private int CoderId;
    private String Handle;
    private float CodingPoints;
    private float ChallengePoints;
    private float TestPoints;
    private float FinalPoints;
    private String Attended;
    private String Advanced;
    private int PreRoundRating;
    private int RatingDifference;
    private int PostRoundRating;

    private SortKey sort;

    public static final int USER_NAME = 0;
    public static final int CODING_POINTS = 1;
    public static final int CHALLENGE_POINTS = 2;
    public static final int TESTING_POINTS = 3;
    public static final int FINAL_POINTS = 4;
    public static final int OLD_RATING = 5;
    public static final int RATING_CHANGE = 6;
    public static final int NEW_RATING = 7;


    public RoomResult() {

        ContestId = 0;
        ContestName = "";
        RoundId = 0;
        RoundDesc = "";
        RoomId = 0;
        RoomDesc = "";
        CoderId = 0;
        Handle = "";
        CodingPoints = 0;
        ChallengePoints = 0;
        TestPoints = 0;
        FinalPoints = 0;
        Attended = "";
        Advanced = "";
        PreRoundRating = 0;
        RatingDifference = 0;
        PostRoundRating = 0;

        sort = new SortKey(
                com.topcoder.common.web.constant.Sort.DEFAULT_CODER_STAT_SORT_KEY
                , com.topcoder.common.web.constant.Sort.DEFAULT_CODER_STAT_SORT_DIR
        );

    }

    public int compareTo(Object other) {
        int result = 0;
        if (sort != null) {
            RoomResult otherRoomResult = (RoomResult) other;
            Comparable thisComparator = null;
            Comparable otherComparator = null;
            switch (sort.getKey()) {
                case USER_NAME:
                    thisComparator = this.getHandle().toUpperCase();
                    otherComparator = otherRoomResult.getHandle().toUpperCase();
                    break;
                case CODING_POINTS:
                    thisComparator = new Float(this.getCodingPoints());
                    otherComparator = new Float(otherRoomResult.getCodingPoints());
                    break;
                case CHALLENGE_POINTS:
                    thisComparator = new Float(this.getChallengePoints());
                    otherComparator = new Float(otherRoomResult.getChallengePoints());
                    break;
                case TESTING_POINTS:
                    thisComparator = new Float(this.getTestPoints());
                    otherComparator = new Float(otherRoomResult.getTestPoints());
                    break;
                case FINAL_POINTS:
                    thisComparator = new Float(this.getFinalPoints());
                    otherComparator = new Float(otherRoomResult.getFinalPoints());
                    break;
                case OLD_RATING:
                    thisComparator = new Integer(this.getPreRoundRating());
                    otherComparator = new Integer(otherRoomResult.getPreRoundRating());
                    break;
                case RATING_CHANGE:
                    thisComparator = new Integer(this.getRatingDifference());
                    otherComparator = new Integer(otherRoomResult.getRatingDifference());
                    break;
                case NEW_RATING:
                    thisComparator = new Integer(this.getPostRoundRating());
                    otherComparator = new Integer(otherRoomResult.getPostRoundRating());
                    break;
            }
            if (sort.getDir() == 'A') {
                result = thisComparator.compareTo(otherComparator);
            } else {
                result = otherComparator.compareTo(thisComparator);
            }
        }
        return result;
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

    public void setCoderId(int CoderId) {
        this.CoderId = CoderId;
    }

    public void setHandle(String Handle) {
        this.Handle = Handle;
    }

    public void setCodingPoints(float CodingPoints) {
        this.CodingPoints = CodingPoints;
    }

    public void setChallengePoints(float ChallengePoints) {
        this.ChallengePoints = ChallengePoints;
    }

    public void setTestPoints(float TestPoints) {
        this.TestPoints = TestPoints;
    }

    public void setFinalPoints(float FinalPoints) {
        this.FinalPoints = FinalPoints;
    }

    public void setAttended(String Attended) {
        this.Attended = Attended;
    }

    public void setAdvanced(String Advanced) {
        this.Advanced = Advanced;
    }

    public void setPreRoundRating(int PreRoundRating) {
        this.PreRoundRating = PreRoundRating;
    }

    public void setRatingDifference(int RatingDifference) {
        this.RatingDifference = RatingDifference;
    }

    public void setPostRoundRating(int PostRoundRating) {
        this.PostRoundRating = PostRoundRating;
    }

    public void setSort(SortKey sort) {
        this.sort = sort;
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

    public int getCoderId() {
        return CoderId;
    }

    public String getHandle() {
        return Handle;
    }

    public float getCodingPoints() {
        return CodingPoints;
    }

    public float getChallengePoints() {
        return ChallengePoints;
    }

    public float getTestPoints() {
        return TestPoints;
    }

    public float getFinalPoints() {
        return FinalPoints;
    }

    public String getAttended() {
        return Attended;
    }

    public String getAdvanced() {
        return Advanced;
    }

    public int getPreRoundRating() {
        return PreRoundRating;
    }

    public int getRatingDifference() {
        return RatingDifference;
    }

    public int getPostRoundRating() {
        return PostRoundRating;
    }

    public SortKey getSort() {
        return sort;
    }

    public RecordTag getXML() throws Exception {
        RecordTag result = null;
        try {
            result = new RecordTag("RoomResult");
            result.addTag(new ValueTag("ContestId", ContestId));
            result.addTag(new ValueTag("ContestName", ContestName));
            result.addTag(new ValueTag("RoundId", RoundId));
            result.addTag(new ValueTag("RoundDesc", RoundDesc));
            result.addTag(new ValueTag("RoomId", RoomId));
            result.addTag(new ValueTag("RoomDesc", RoomDesc));
            result.addTag(new ValueTag("CoderId", CoderId));
            result.addTag(new ValueTag("Handle", Handle));
            result.addTag(new ValueTag("CodingPoints", CodingPoints));
            result.addTag(new ValueTag("ChallengePoints", ChallengePoints));
            result.addTag(new ValueTag("TestPoints", TestPoints));
            result.addTag(new ValueTag("FinalPoints", FinalPoints));
            result.addTag(new ValueTag("Attended", Attended));
            result.addTag(new ValueTag("Advanced", Advanced));
            result.addTag(new ValueTag("PreRoundRating", PreRoundRating));
            result.addTag(new ValueTag("RatingDifference", RatingDifference));
            result.addTag(new ValueTag("PostRoundRating", PostRoundRating));
            if (sort != null) {
                result.addTag(sort.getXML());
            }
        } catch (Exception e) {
            throw new Exception("common.web.data.stat.RoomResult getXML ERROR: " + e);
        }
        return result;
    }

}

