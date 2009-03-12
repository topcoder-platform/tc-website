package com.topcoder.common.web.data;

import com.topcoder.shared.docGen.xml.RecordTag;
import com.topcoder.shared.docGen.xml.TagRenderer;
import com.topcoder.shared.docGen.xml.ValueTag;

import java.io.Serializable;


public final class Contest implements Serializable, TagRenderer, Comparable {

    private int contestId;
    private String contestName;
    private java.sql.Date contestStart;
    private java.sql.Date contestEnd;
    private java.sql.Timestamp contestStartTimestamp;
    private java.sql.Timestamp contestEndTimestamp;
    private String status;
    private Language language;
    private Group group;
    private String adText;
    private java.sql.Date adStart;
    private java.sql.Date adEnd;
    private String adTask;
    private String adCommand;

    public Contest() {
        contestId = 0;
        contestName = "";
        contestStart = null;
        contestEnd = null;
        contestStartTimestamp = null;
        contestEndTimestamp = null;
        status = "";
        language = new Language();
        group = new Group();
        adText = "";
        adStart = null;
        adEnd = null;
        adTask = "";
        adCommand = "";
    }

    public int compareTo(Object other) {
        int result = 0;
        Contest otherContest = (Contest) other;
        if (this.contestStartTimestamp == null && otherContest.getContestStartTimestamp() != null) {
            result = -1;
        } else if (this.contestStartTimestamp != null && otherContest.getContestStartTimestamp() == null) {
            result = 1;
        } else if (this.contestStartTimestamp == null && otherContest.getContestStartTimestamp() == null) {
            result = 0;
        } else {
            result = this.contestStartTimestamp.compareTo(otherContest.getContestStartTimestamp());
        }
        return result;
    }

// set

    public void setGroup(Group group) {
        this.group = group;
    }

    public void setContestId(int contestId) {
        this.contestId = contestId;
    }

    public void setContestName(String contestName) {
        this.contestName = contestName;
    }

    public void setContestStart(java.sql.Date contestStart) {
        this.contestStart = contestStart;
    }

    public void setContestEnd(java.sql.Date contestEnd) {
        this.contestEnd = contestEnd;
    }

    public void setContestStartTimestamp(java.sql.Timestamp contestStartTimestamp) {
        this.contestStartTimestamp = contestStartTimestamp;
    }

    public void setContestEndTimestamp(java.sql.Timestamp contestEndTimestamp) {
        this.contestEndTimestamp = contestEndTimestamp;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public void setLanguage(Language language) {
        this.language = language;
    }

    public void setAdText(String adText) {
        this.adText = adText;
    }

    public void setAdStart(java.sql.Date adStart) {
        this.adStart = adStart;
    }

    public void setAdEnd(java.sql.Date adEnd) {
        this.adEnd = adEnd;
    }

    public void setAdTask(String adTask) {
        this.adTask = adTask;
    }

    public void setAdCommand(String adCommand) {
        this.adCommand = adCommand;
    }


// get

    public Group getGroup() {
        return this.group;
    }

    public int getContestId() {
        return this.contestId;
    }

    public String getContestName() {
        return this.contestName;
    }

    public java.sql.Date getContestStart() {
        return this.contestStart;
    }

    public java.sql.Date getContestEnd() {
        return this.contestEnd;
    }

    public java.sql.Timestamp getContestStartTimestamp() {
        return this.contestStartTimestamp;
    }

    public java.sql.Timestamp getContestEndTimestamp() {
        return this.contestEndTimestamp;
    }

    public String getStatus() {
        return this.status;
    }

    public Language getLanguage() {
        return this.language;
    }

    public String getAdText() {
        return this.adText;
    }

    public java.sql.Date getAdStart() {
        return this.adStart;
    }

    public java.sql.Date getAdEnd() {
        return this.adEnd;
    }

    public String getAdTask() {
        return this.adTask;
    }

    public String getAdCommand() {
        return this.adCommand;
    }


    public RecordTag getXML() throws Exception {
        RecordTag result = null;
        try {
            result = new RecordTag("Contest");
            result.addTag(new ValueTag("ContestId", contestId));
            result.addTag(new ValueTag("ContestName", contestName));
            result.addTag(new ValueTag("ContestStart", contestStart));
            result.addTag(new ValueTag("ContestEnd", contestEnd));
            result.addTag(new ValueTag("ContestEndTimestamp", contestEndTimestamp));
            result.addTag(new ValueTag("ContestStartTimestamp", contestStartTimestamp));
            result.addTag(new ValueTag("Status", status));
            result.addTag(new ValueTag("AdText", adText));
            result.addTag(new ValueTag("AdStart", adStart));
            result.addTag(new ValueTag("AdEnd", adEnd));
            result.addTag(new ValueTag("AdTask", adTask));
            result.addTag(new ValueTag("AdCommand", adCommand));
            result.addTag(language.getXML());
        } catch (Exception e) {
            throw new Exception("common.web.data.Contest getXML ERROR: " + e);
        }
        return result;
    }

    //Method to retrieve a time value in hh:mm:ss format from a
    //java.sql.Timestamp object
    private String getTime(java.sql.Timestamp timeStamp) {
        String timeStampString = null;
        int spaceIndex = 0;
        String timeVal = null;

        if (timeStamp != null) {
            timeStampString = timeStamp.toString();
            spaceIndex = timeStampString.indexOf(" ") + 1;
            timeVal = timeStampString.substring(spaceIndex, spaceIndex + 8);
        }

        return timeVal;
    }
}

