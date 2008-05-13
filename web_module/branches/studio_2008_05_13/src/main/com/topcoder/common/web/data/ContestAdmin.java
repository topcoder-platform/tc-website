package com.topcoder.common.web.data;

import com.topcoder.shared.docGen.xml.RecordTag;
import com.topcoder.shared.docGen.xml.TagRenderer;
import com.topcoder.shared.docGen.xml.ValueTag;

import java.io.Serializable;
import java.util.ArrayList;


public final class ContestAdmin implements Serializable, TagRenderer {

    private int ContestId;
    private String ContestName;
    private java.sql.Date ContestStart;
    private java.sql.Date ContestEnd;
    private java.sql.Timestamp ContestStartTimestamp;
    private String StartTime;
    private int StartYear;
    private int StartMonthNum;
    private int StartDay;
    private int StartHour;
    private int StartMinute;
    private int StartSecond;
    private java.sql.Timestamp ContestEndTimestamp;
    private String EndTime;
    private int EndYear;
    private int EndMonthNum;
    private int EndDay;
    private int EndHour;
    private int EndMinute;
    private int EndSecond;
    private String Status;
    private Language language;
    private ArrayList ContestTexts;
    private ArrayList qualifiedCoders; // ArrayList of ContestCoder
    private ArrayList rooms; // ArrayList of group_id's for the contest
    private ArrayList roundList; // ArrayList of round attributes for the contest
    private String Modified;
    private Group group;
    private String AdText;
    private java.sql.Date AdStart;
    private java.sql.Date AdEnd;
    private String AdTask;
    private String AdCommand;
    private String Region;
    private java.sql.Timestamp AdStartTimestamp;
    private String AdStartTime;
    private int AdStartYear;
    private int AdStartMonthNum;
    private int AdStartDay;
    private int AdStartHour;
    private int AdStartMinute;
    private int AdStartSecond;
    private java.sql.Timestamp AdEndTimestamp;
    private String AdEndTime;
    private int AdEndYear;
    private int AdEndMonthNum;
    private int AdEndDay;
    private int AdEndHour;
    private int AdEndMinute;
    private int AdEndSecond;

    public ContestAdmin() {
        ContestId = 0;
        ContestName = "";
        ContestStart = null;
        ContestEnd = null;
        ContestStartTimestamp = null;
        StartTime = "";
        StartYear = 0;
        StartMonthNum = 0;
        StartDay = 0;
        StartHour = 0;
        StartMinute = 0;
        StartSecond = 0;
        ContestEndTimestamp = null;
        EndTime = "";
        EndYear = 0;
        EndMonthNum = 0;
        EndDay = 0;
        EndHour = 0;
        EndMinute = 0;
        EndSecond = 0;
        Status = "";
        language = new Language();
        ContestTexts = new ArrayList();
        qualifiedCoders = new ArrayList();
        rooms = new ArrayList();
        roundList = new ArrayList();
        Modified = "";
        group = new Group();
        AdText = "";
        AdStart = null;
        AdEnd = null;
        AdTask = "";
        AdCommand = "";
        Region = "";
        AdStartTimestamp = null;
        AdStartTime = "";
        AdStartYear = 0;
        AdStartMonthNum = 0;
        AdStartDay = 0;
        AdStartHour = 0;
        AdStartMinute = 0;
        AdStartSecond = 0;
        AdEndTimestamp = null;
        AdEndTime = "";
        AdEndYear = 0;
        AdEndMonthNum = 0;
        AdEndDay = 0;
        AdEndHour = 0;
        AdEndMinute = 0;
        AdEndSecond = 0;
    }


// set

    public void setGroup(Group group) {
        this.group = group;
    }

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

    public void setContestStartTimestamp(java.sql.Timestamp ContestStartTimestamp) {
        this.ContestStartTimestamp = ContestStartTimestamp;
        this.StartTime = getTime(ContestStartTimestamp);
    }

    public void setStartYear(int StartYear) {
        this.StartYear = StartYear;
    }

    public void setStartMonthNum(int StartMonthNum) {
        this.StartMonthNum = StartMonthNum;
    }

    public void setStartDay(int StartDay) {
        this.StartDay = StartDay;
    }

    public void setStartHour(int StartHour) {
        this.StartHour = StartHour;
    }

    public void setStartMinute(int StartMinute) {
        this.StartMinute = StartMinute;
    }

    public void setStartSecond(int StartSecond) {
        this.StartSecond = StartSecond;
    }

    public void setContestEndTimestamp(java.sql.Timestamp ContestEndTimestamp) {
        this.ContestEndTimestamp = ContestEndTimestamp;
        this.EndTime = getTime(ContestEndTimestamp);
    }

    public void setEndYear(int EndYear) {
        this.EndYear = EndYear;
    }

    public void setEndMonthNum(int EndMonthNum) {
        this.EndMonthNum = EndMonthNum;
    }

    public void setEndDay(int EndDay) {
        this.EndDay = EndDay;
    }

    public void setEndHour(int EndHour) {
        this.EndHour = EndHour;
    }

    public void setEndMinute(int EndMinute) {
        this.EndMinute = EndMinute;
    }

    public void setEndSecond(int EndSecond) {
        this.EndSecond = EndSecond;
    }

    public void setStatus(String Status) {
        this.Status = Status;
    }

    public void setLanguage(Language language) {
        this.language = language;
    }

    public void setContestTexts(ArrayList ContestTexts) {
        this.ContestTexts = ContestTexts;
    }

    public void setRoundList(ArrayList roundList) {
        this.roundList = roundList;
    }

    public void setRooms(ArrayList rooms) {
        this.rooms = rooms;
    }

    public void setModified(String Modified) {
        this.Modified = Modified;
    }

    public void setAdText(String AdText) {
        this.AdText = AdText;
    }

    public void setAdStart(java.sql.Date AdStart) {
        this.AdStart = AdStart;
    }

    public void setAdEnd(java.sql.Date AdEnd) {
        this.AdEnd = AdEnd;
    }

    public void setAdTask(String AdTask) {
        this.AdTask = AdTask;
    }

    public void setAdCommand(String AdCommand) {
        this.AdCommand = AdCommand;
    }

    public void setRegion(String Region) {
        this.Region = Region;
    }

    public void setAdStartTimestamp(java.sql.Timestamp AdStartTimestamp) {
        this.AdStartTimestamp = AdStartTimestamp;
        this.AdStartTime = getTime(AdStartTimestamp);
    }

    public void setAdStartYear(int AdStartYear) {
        this.AdStartYear = AdStartYear;
    }

    public void setAdStartMonthNum(int AdStartMonthNum) {
        this.AdStartMonthNum = AdStartMonthNum;
    }

    public void setAdStartDay(int AdStartDay) {
        this.AdStartDay = AdStartDay;
    }

    public void setAdStartHour(int AdStartHour) {
        this.AdStartHour = AdStartHour;
    }

    public void setAdStartMinute(int AdStartMinute) {
        this.AdStartMinute = AdStartMinute;
    }

    public void setAdStartSecond(int AdStartSecond) {
        this.AdStartSecond = AdStartSecond;
    }

    public void setAdEndTimestamp(java.sql.Timestamp AdEndTimestamp) {
        this.AdEndTimestamp = AdEndTimestamp;
        this.AdEndTime = getTime(AdEndTimestamp);
    }

    public void setAdEndYear(int AdEndYear) {
        this.AdEndYear = AdEndYear;
    }

    public void setAdEndMonthNum(int AdEndMonthNum) {
        this.AdEndMonthNum = AdEndMonthNum;
    }

    public void setAdEndDay(int AdEndDay) {
        this.AdEndDay = AdEndDay;
    }

    public void setAdEndHour(int AdEndHour) {
        this.AdEndHour = AdEndHour;
    }

    public void setAdEndMinute(int AdEndMinute) {
        this.AdEndMinute = AdEndMinute;
    }

    public void setAdEndSecond(int AdEndSecond) {
        this.AdEndSecond = AdEndSecond;
    }
// get

    public Group getGroup() {
        return this.group;
    }

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

    public java.sql.Timestamp getContestStartTimestamp() {
        return this.ContestStartTimestamp;
    }

    public String getStartTime() {
        return this.StartTime;
    }

    public int getStartYear() {
        return this.StartYear;
    }

    public int getStartMonthNum() {
        return this.StartMonthNum;
    }

    public int getStartDay() {
        return this.StartDay;
    }

    public int getStartHour() {
        return this.StartHour;
    }

    public int setStartMinute() {
        return this.StartMinute;
    }

    public int getStartSecond() {
        return this.StartSecond;
    }


    public java.sql.Timestamp getContestEndTimestamp() {
        return this.ContestEndTimestamp;
    }

    public String getEndTime() {
        return this.EndTime;
    }

    public int getEndYear() {
        return this.EndYear;
    }

    public int getEndMonthNum() {
        return this.EndMonthNum;
    }

    public int getEndDay() {
        return this.EndDay;
    }

    public int getEndHour() {
        return this.EndHour;
    }

    public int setEndMinute() {
        return this.EndMinute;
    }

    public int getEndSecond() {
        return this.EndSecond;
    }

    public String getStatus() {
        return this.Status;
    }

    public Language getLanguage() {
        return this.language;
    }

    public ArrayList getContestTexts() {
        return this.ContestTexts;
    }

    public ArrayList getRoundList() {
        return this.roundList;
    }

    public ArrayList getRooms() {
        return this.rooms;
    }

    public String getModified() {
        return this.Modified;
    }

    public String getAdText() {
        return this.AdText;
    }

    public java.sql.Date getAdStart() {
        return this.AdStart;
    }

    public java.sql.Date getAdEnd() {
        return this.AdEnd;
    }

    public String getAdTask() {
        return this.AdTask;
    }

    public String getAdCommand() {
        return this.AdCommand;
    }

    public String getRegion() {
        return this.Region;
    }

    public java.sql.Timestamp getAdStartTimestamp() {
        return this.AdStartTimestamp;
    }

    public String getAdStartTime() {
        return this.AdStartTime;
    }

    public int getAdStartYear() {
        return this.AdStartYear;
    }

    public int getAdStartMonthNum() {
        return this.AdStartMonthNum;
    }

    public int getAdStartDay() {
        return this.AdStartDay;
    }

    public int getAdStartHour() {
        return this.AdStartHour;
    }

    public int setAdStartMinute() {
        return this.AdStartMinute;
    }

    public int getAdStartSecond() {
        return this.AdStartSecond;
    }


    public java.sql.Timestamp getAdEndTimestamp() {
        return this.AdEndTimestamp;
    }

    public String getAdEndTime() {
        return this.AdEndTime;
    }

    public int getAdEndYear() {
        return this.AdEndYear;
    }

    public int getAdEndMonthNum() {
        return this.AdEndMonthNum;
    }

    public int getAdEndDay() {
        return this.AdEndDay;
    }

    public int getAdEndHour() {
        return this.AdEndHour;
    }

    public int setAdEndMinute() {
        return this.AdEndMinute;
    }

    public int getAdEndSecond() {
        return this.AdEndSecond;
    }


    public RecordTag getXML() throws Exception {
        RecordTag result = null;
        try {
            result = new RecordTag("Contest");
            result.addTag(new ValueTag("ContestId", ContestId));
            result.addTag(new ValueTag("ContestName", ContestName));
            result.addTag(new ValueTag("ContestStart", ContestStart));
            result.addTag(new ValueTag("ContestEnd", ContestEnd));
            result.addTag(new ValueTag("StartYear", StartYear));
            result.addTag(new ValueTag("StartMonthNum", StartMonthNum));
            result.addTag(new ValueTag("StartDay", StartDay));
            result.addTag(new ValueTag("StartHour", StartHour));
            result.addTag(new ValueTag("StartMinute", StartMinute));
            result.addTag(new ValueTag("StartSecond", StartSecond));
            result.addTag(new ValueTag("ContestEndTimestamp", ContestEndTimestamp));
            result.addTag(new ValueTag("EndTime", EndTime));
            result.addTag(new ValueTag("ContestStartTimestamp", ContestStartTimestamp));
            result.addTag(new ValueTag("StartTime", StartTime));
            result.addTag(new ValueTag("EndYear", EndYear));
            result.addTag(new ValueTag("EndMonthNum", EndMonthNum));
            result.addTag(new ValueTag("EndDay", EndDay));
            result.addTag(new ValueTag("EndHour", EndHour));
            result.addTag(new ValueTag("EndMinute", EndMinute));
            result.addTag(new ValueTag("EndSecond", EndSecond));
            result.addTag(new ValueTag("Status", Status));
            result.addTag(new ValueTag("Region", Region));
            result.addTag(new ValueTag("AdText", AdText));
            result.addTag(new ValueTag("AdStart", AdStart));
            result.addTag(new ValueTag("AdEnd", AdEnd));
            result.addTag(new ValueTag("AdTask", AdTask));
            result.addTag(new ValueTag("AdCommand", AdCommand));
            result.addTag(new ValueTag("AdStartYear", AdStartYear));
            result.addTag(new ValueTag("AdStartMonthNum", AdStartMonthNum));
            result.addTag(new ValueTag("AdStartDay", AdStartDay));
            result.addTag(new ValueTag("AdStartHour", AdStartHour));
            result.addTag(new ValueTag("AdStartMinute", AdStartMinute));
            result.addTag(new ValueTag("AdStartSecond", AdStartSecond));
            result.addTag(new ValueTag("AdEndTimestamp", AdEndTimestamp));
            result.addTag(new ValueTag("AdEndTime", AdEndTime));
            result.addTag(new ValueTag("AdStartTimestamp", AdStartTimestamp));
            result.addTag(new ValueTag("AdStartTime", AdStartTime));
            result.addTag(new ValueTag("AdEndYear", AdEndYear));
            result.addTag(new ValueTag("AdEndMonthNum", AdEndMonthNum));
            result.addTag(new ValueTag("AdEndDay", AdEndDay));
            result.addTag(new ValueTag("AdEndHour", AdEndHour));
            result.addTag(new ValueTag("AdEndMinute", AdEndMinute));
            result.addTag(new ValueTag("AdEndSecond", AdEndSecond));
            result.addTag(language.getXML());
            result.addTag(new ValueTag("Modified", Modified));

            int i = 0;
            ContestText contestText = null;
            for (i = 0; i < ContestTexts.size(); i++) {
                contestText = (ContestText) ContestTexts.get(i);
                result.addTag(contestText.getXML());
            }

            int y = 0;
            Round round = null;
            for (y = 0; y < roundList.size(); y++) {
                round = (Round) roundList.get(y);
                result.addTag(round.getXML());
            }
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

