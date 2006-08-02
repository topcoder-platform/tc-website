package com.topcoder.web.corp.model;

import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.DateUtils;

import java.util.Calendar;
import java.util.Date;
import java.util.TimeZone;

public class TestSessionInfo extends BaseModel {
    private final static Logger log = Logger.getLogger(TestSessionInfo.class);

    private static int[] months =
            new int[]{-1, Calendar.JANUARY, Calendar.FEBRUARY, Calendar.MARCH,
                      Calendar.APRIL, Calendar.MAY, Calendar.JUNE, Calendar.JULY,
                      Calendar.AUGUST, Calendar.SEPTEMBER, Calendar.OCTOBER,
                      Calendar.NOVEMBER, Calendar.DECEMBER};
    private String profileId;
    private long sessionId;
    private String candidateId;
    private ResultSetContainer profileList;
    private ResultSetContainer candidateList;
    private String beginMonth;
    private String beginDay;
    private String beginYear;
    private String beginHour;
    private String endMonth;
    private String endDay;
    private String endYear;
    private String endHour;
    private String candidateEmail;
    private String repEmail;
    private String timeZone;
    private long testSetALength = 75*60*1000;  //default to 75 minutes
    private long testSetBLength = 60*60*1000;  //default to 1 hour

    public TestSessionInfo() {
        this(TimeZone.getDefault().getID());
    }

    /**
     * constructor that sets the timezone as well
     * @param timeZone
     */
    public TestSessionInfo(String timeZone) {
        candidateEmail = "YES";
        repEmail = "YES";
        Calendar c = Calendar.getInstance();
        c.setTime(DateUtils.getConvertedDate(c.getTime(), timeZone));
        beginMonth = endMonth = String.valueOf(c.get(Calendar.MONTH) + 1);
        beginDay = endDay = String.valueOf(c.get(Calendar.DAY_OF_MONTH));
        beginYear = endYear = String.valueOf(c.get(Calendar.YEAR));
        beginHour = endHour = String.valueOf(c.get(Calendar.HOUR_OF_DAY));
        this.timeZone = timeZone;
        sessionId = 0;

    }

    /**
     * Sets the value of <code>profile</code>.
     *
     * @param val
     */
    public void setProfileId(String val) {
        profileId = val;
    }

    /**
     * Gets the value of <code>profile</code>.
     *
     * @return
     */
    public String getProfileId() {
        return profileId;
    }

    /**
     * Sets the value of <code>candidate</code>.
     *
     * @param val
     */
    public void setCandidateId(String val) {
        candidateId = val;
    }

    /**
     * Gets the value of <code>candidate</code>.
     *
     * @return
     */
    public String getCandidateId() {
        return candidateId;
    }

    /**
     * Sets the value of <code>profileList</code>.
     *
     * @param val
     */
    public void setProfileList(ResultSetContainer val) {
        profileList = val;
    }

    /**
     * Gets the value of <code>profileList</code>.
     *
     * @return
     */
    public ResultSetContainer getProfileList() {
        return profileList;
    }

    /**
     * Sets the value of <code>candidateList</code>.
     *
     * @param val
     */
    public void setCandidateList(ResultSetContainer val) {
        candidateList = val;
    }

    /**
     * Gets the value of <code>candidateList</code>.
     *
     * @return
     */
    public ResultSetContainer getCandidateList() {
        return candidateList;
    }

    /**
     * Gets the value of <code>beginMonth</code>.
     * This should only be used for validation.  actual values
     * should be retrieved via <code>getBeginDate()</code>
     * It'll be in timezone associated with this object
     * @return
     */
    public String getBeginMonth() {
        return beginMonth;
    }

    /**
     * Gets the value of <code>beginDay</code>.
     * This should only be used for validation.  actual values
     * should be retrieved via <code>getBeginDate()</code>
     * It'll be in timezone associated with this object
     * @return
     */
    public String getBeginDay() {
        return beginDay;
    }

    /**
     * Gets the value of <code>beginYear</code>.
     * This should only be used for validation.  actual values
     * should be retrieved via <code>getBeginDate()</code>
     * It'll be in timezone associated with this object
     * @return
     */
    public String getBeginYear() {
        return beginYear;
    }

    /**
     * Gets the value of <code>beginHour</code>.
     * This should only be used for validation.  actual values
     * should be retrieved via <code>getBeginDate()</code>
     * It'll be in timezone associated with this object
     * @return
     */
    public String getBeginHour() {
        return beginHour;
    }

    /**
     * Gets the value of <code>endMonth</code>.
     * This should only be used for validation.  actual values
     * should be retrieved via <code>getEndDate()</code>
     * It'll be in timezone associated with this object
     * @return
     */
    public String getEndMonth() {
        return endMonth;
    }

    /**
     * Gets the value of <code>endDay</code>.
     * This should only be used for validation.  actual values
     * should be retrieved via <code>getEndDate()</code>
     * It'll be in timezone associated with this object
     * @return
     */
    public String getEndDay() {
        return endDay;
    }


    /**
     * Gets the value of <code>endYear</code>.
     * This should only be used for validation.  actual values
     * should be retrieved via <code>getEndDate()</code>
     * It'll be in timezone associated with this object
     * @return
     */
    public String getEndYear() {
        return endYear;
    }


    /**
     * Gets the value of <code>endHour</code>.
     * This should only be used for validation.  actual values
     * should be retrieved via <code>getEndDate()</code>
     * It'll be in timezone associated with this object
     * @return
     */
    public String getEndHour() {
        return endHour;
    }

    /**
     * Sets the value of <code>candidateEmail</code>.
     *
     * @param val
     */
    public void setCandidateEmail(String val) {
        if (val == null) {
            val = "NO";
        }
        candidateEmail = val;
    }

    /**
     * Gets the value of <code>candidateEmail</code>.
     *
     * @return
     */
    public String getCandidateEmail() {
        return candidateEmail;
    }

    public boolean useCandidateEmail() {
        return "YES".equalsIgnoreCase(candidateEmail);
    }

    /**
     * Sets the value of <code>repEmail</code>.
     *
     * @param val
     */
    public void setRepEmail(String val) {
        if (val == null) {
            val = "NO";
        }
        repEmail = val;
    }

    /**
     * Gets the value of <code>repEmail</code>.
     *
     * @return
     */
    public String getRepEmail() {
        return repEmail;
    }

    public boolean useRepEmail() {
        return "YES".equalsIgnoreCase(repEmail);
    }

    public Date getBeginDate() {
        return formDate(beginYear, beginMonth, beginDay, beginHour);
    }

    public Date getEndDate() {
        return formDate(endYear, endMonth, endDay, endHour);
    }

    public long getTestSetALength() {
        return testSetALength;
    }

    public void setTestSetALength(long testSetALength) {
        this.testSetALength = testSetALength;
    }

    public long getTestSetBLength() {
        return testSetBLength;
    }

    public void setTestSetBLength(long testSetBLength) {
        this.testSetBLength = testSetBLength;
    }

    public String getTimeZone() {
        return timeZone;
    }

    public long getSessionId() {
        return sessionId;
    }

    public void setSessionId(long sessionId) {
        this.sessionId = sessionId;
    }

    /**
     * set the begin date.  the user provides the timezone but we'll always return it in the
     * default timezone
     * @param year
     * @param month
     * @param day
     * @param hour
     * @param timeZone
     */
    public void setBeginDate(String year, String month, String day, String hour, String timeZone) {
        this.beginYear = year;
        this.beginMonth = month;
        this.beginDay = day;
        this.beginHour = hour;
        this.timeZone = timeZone;
    }

    /**
     * set the dend date.  the user provides the timezone but we'll always return it in the
     * default timezone
     * @param year
     * @param month
     * @param day
     * @param hour
     * @param timeZone
     */
    public void setEndDate(String year, String month, String day, String hour, String timeZone) {
        this.endYear = year;
        this.endMonth = month;
        this.endDay = day;
        this.endHour = hour;
        this.timeZone = timeZone;
    }

    /**
     * set the begin date.   we assume the given date
     * is in teh default timezone
     * @param beginDate
     */
    public void setBeginDate(Date beginDate) {
        Calendar c = Calendar.getInstance();
        c.setTime(beginDate);
        beginYear = (String.valueOf(c.get(Calendar.YEAR)));
        beginMonth = (String.valueOf(c.get(Calendar.MONTH) + 1));
        beginDay = (String.valueOf(c.get(Calendar.DAY_OF_MONTH)));
        beginHour = (String.valueOf(c.get(Calendar.HOUR_OF_DAY)));
        timeZone = c.getTimeZone().getID();
    }

    /**
     * set the end date.  we assume the given date
     * is in the default timezone
     * @param endDate
     */
    public void setEndDate(Date endDate) {
        Calendar c = Calendar.getInstance();
        c.setTime(endDate);
        endYear = (String.valueOf(c.get(Calendar.YEAR)));
        endMonth = (String.valueOf(c.get(Calendar.MONTH) + 1));
        endDay = (String.valueOf(c.get(Calendar.DAY_OF_MONTH)));
        endHour = (String.valueOf(c.get(Calendar.HOUR_OF_DAY)));
        timeZone = c.getTimeZone().getID();
    }

    public boolean isSelectedProfile(String profileId) {
        return this.profileId != null && this.profileId.equals(profileId);
    }

    public boolean isSelectedCandidate(String candidateId) {
        return this.candidateId != null && this.candidateId.equals(candidateId);
    }

    /**
     * Given a year, month, day and hour return a date object in the default
     * timezone (ie system timezone)
     * @param year
     * @param month
     * @param day
     * @param hour
     * @return
     */
    private Date formDate(String year, String month, String day, String hour) {
        //if we don't have all the values then just exit
        if (year == null || month == null || day == null || hour == null) {
            return new Date(); //so we don't blow up in certain places
        }
        Calendar c = Calendar.getInstance();
        c.set(Integer.parseInt(year),
                months[Integer.parseInt(month)],
                Integer.parseInt(day),
                Integer.parseInt(hour), 0, 0);
        c.set(Calendar.MILLISECOND, 0);
        return DateUtils.getConvertedDate(c.getTime(), timeZone, TimeZone.getDefault().getID());
    }

    /**
     * returns value -1 if the session is in the future, 0 if the session
     * is currently open, 1 if the session is in the past.
     * @param curr
     * @param sessBegin
     * @param segEnd
     * @param sessEnd
     * @return
     */
    public static int sessionStatus(Date curr, Date sessBegin, Date segEnd, Date sessEnd) {
        int ret = 0;
        if (curr.getTime() < sessBegin.getTime())
            ret = -1;
        else if (Math.min(segEnd.getTime(), sessEnd.getTime()) < curr.getTime()) ret = 1;
        return ret;
    }
}
