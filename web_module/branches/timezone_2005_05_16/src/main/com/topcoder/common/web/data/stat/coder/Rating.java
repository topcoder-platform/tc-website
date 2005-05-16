package com.topcoder.common.web.data.stat.coder;

import com.topcoder.common.web.data.SortKey;
import com.topcoder.shared.docGen.xml.RecordTag;
import com.topcoder.shared.docGen.xml.TagRenderer;
import com.topcoder.shared.docGen.xml.ValueTag;

import java.io.Serializable;
import java.text.DateFormat;

public final class Rating implements Comparable, Serializable, TagRenderer {

    private String contestName;
    private int contestId;
    private String roundName;
    private int roundId;
    private int rating;
    private java.sql.Date eventDate;
    private SortKey sort;

    public static final int CONTEST_NAME = 0;
    public static final int ROUND_NAME = 1;
    public static final int RATING = 2;
    public static final int EVENT_DATE = 3;

    public Rating() {
        contestName = "";
        contestId = 0;
        roundName = "";
        roundId = 0;
        rating = 0;
        eventDate = null;

        sort = new SortKey(com.topcoder.common.web.constant.Sort.DEFAULT_RATINGS_HISTORY_SORT_KEY, com.topcoder.common.web.constant.Sort.DEFAULT_RATINGS_HISTORY_SORT_DIR);

    }


    public int compareTo(Object other) {
        int result = 0;
        Rating otherRating = (Rating) other;
        Comparable thisComparator = null;
        Comparable otherComparator = null;

        if (sort != null) {
            switch (sort.getKey()) {
                case CONTEST_NAME:
                    thisComparator = this.getContestName().toUpperCase();
                    otherComparator = otherRating.getContestName().toUpperCase();
                    break;
                case ROUND_NAME:
                    thisComparator = this.getRoundName().toUpperCase();
                    otherComparator = otherRating.getRoundName().toUpperCase();
                    break;
                case RATING:
                    thisComparator = new Integer(this.getRating());
                    otherComparator = new Integer(otherRating.getRating());
                    break;
                case EVENT_DATE:
                    thisComparator = this.getEventDate();
                    otherComparator = otherRating.getEventDate();
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

    public void setRating(int rating) {
        this.rating = rating;
    }

    public void setEventDate(java.sql.Date eventDate) {
        this.eventDate = eventDate;
    }

    public void setSort(SortKey sort) {
        this.sort = sort;
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

    public int getRating() {
        return rating;
    }

    public java.sql.Date getEventDate() {
        return eventDate;
    }

    public SortKey getSort() {
        return sort;
    }

    public RecordTag getXML() throws Exception {
        RecordTag result = null;
        try {
            result = new RecordTag("Rating");
            result.addTag(new ValueTag("ContestName", contestName));
            result.addTag(new ValueTag("ContestId", contestId));
            result.addTag(new ValueTag("RoundName", roundName));
            result.addTag(new ValueTag("RoundId", roundId));
            result.addTag(new ValueTag("Rating", rating));
            result.addTag(new ValueTag("EventDate", DateFormat.getDateInstance(DateFormat.MEDIUM).format(eventDate)));
            result.addTag(sort.getXML());
        } catch (Exception e) {
            e.printStackTrace();
            throw new Exception("common.web.data.stat.coder.Rating getXML ERROR: " + e);
        }
        return result;
    }

}

