package com.topcoder.common.web.data.stat.coder;

import com.topcoder.common.web.data.SortKey;
import com.topcoder.shared.docGen.xml.*;

import java.io.Serializable;
import java.text.DateFormat;

public final class Earning implements Comparable, Serializable, TagRenderer {

    private String contestName;
    private int contestId;
    private String roundName;
    private int roundId;
    private int finishPosition;
    private float amount;
    private java.sql.Date eventDate;
    private SortKey sort;

    public static final int CONTEST_NAME = 0;
    public static final int ROUND_NAME = 1;
    public static final int FINISH_POSITION = 2;
    public static final int AMOUNT = 3;
    public static final int EVENT_DATE = 4;

    public Earning() {
        contestName = "";
        contestId = 0;
        roundName = "";
        roundId = 0;
        finishPosition = 0;
        amount = 0;
        eventDate = null;

        sort = new SortKey(com.topcoder.common.web.constant.Sort.DEFAULT_EARNINGS_HISTORY_SORT_KEY, com.topcoder.common.web.constant.Sort.DEFAULT_EARNINGS_HISTORY_SORT_DIR);

    }


    public int compareTo(Object other) {
        int result = 0;
        Earning otherEarning = (Earning) other;
        Comparable thisComparator = null;
        Comparable otherComparator = null;

        if (sort != null) {
            switch (sort.getKey()) {
                case CONTEST_NAME:
                    thisComparator = this.getContestName().toUpperCase();
                    otherComparator = otherEarning.getContestName().toUpperCase();
                    break;
                case ROUND_NAME:
                    thisComparator = this.getRoundName().toUpperCase();
                    otherComparator = otherEarning.getRoundName().toUpperCase();
                    break;
                case FINISH_POSITION:
                    thisComparator = new Integer(this.getFinishPosition());
                    otherComparator = new Integer(otherEarning.getFinishPosition());
                    break;
                case AMOUNT:
                    thisComparator = new Float(this.getAmount());
                    otherComparator = new Float(otherEarning.getAmount());
                    break;
                case EVENT_DATE:
                    thisComparator = this.getEventDate();
                    otherComparator = otherEarning.getEventDate();
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

    public void setFinishPosition(int finishPosition) {
        this.finishPosition = finishPosition;
    }

    public void setAmount(float amount) {
        this.amount = amount;
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

    public int getFinishPosition() {
        return finishPosition;
    }

    public float getAmount() {
        return amount;
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
            result = new RecordTag("Earning");
            result.addTag(new ValueTag("ContestName", contestName));
            result.addTag(new ValueTag("ContestId", contestId));
            result.addTag(new ValueTag("RoundName", roundName));
            result.addTag(new ValueTag("RoundId", roundId));
            result.addTag(new ValueTag("FinishPosition", finishPosition));
            result.addTag(new ValueTag("Amount", amount));
            result.addTag(new ValueTag("EventDate", DateFormat.getDateInstance(DateFormat.MEDIUM).format(eventDate)));
            result.addTag(sort.getXML());
        } catch (Exception e) {
            e.printStackTrace();
            throw new Exception("common.web.data.stat.coder.Earning getXML ERROR: " + e);
        }
        return result;
    }

}

