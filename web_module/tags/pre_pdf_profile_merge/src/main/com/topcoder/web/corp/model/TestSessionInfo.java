package com.topcoder.web.corp.model;

import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.logging.Logger;

import java.util.Calendar;
import java.util.Date;

public class TestSessionInfo extends BaseModel {
    private final static Logger log = Logger.getLogger(TestSessionInfo.class);

    private static int[] months =
            new int[]{-1, Calendar.JANUARY, Calendar.FEBRUARY, Calendar.MARCH,
                      Calendar.APRIL, Calendar.MAY, Calendar.JUNE, Calendar.JULY,
                      Calendar.AUGUST, Calendar.SEPTEMBER, Calendar.OCTOBER,
                      Calendar.NOVEMBER, Calendar.DECEMBER};
    private String profileId;
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

    public TestSessionInfo() {
        candidateEmail = "YES";
        repEmail = "YES";

        Calendar c = Calendar.getInstance();
        beginMonth = endMonth = String.valueOf(c.get(Calendar.MONTH) + 1);
        beginDay = endDay = String.valueOf(c.get(Calendar.DAY_OF_MONTH));
        beginYear = endYear = String.valueOf(c.get(Calendar.YEAR));
        beginHour = endHour = String.valueOf(c.get(Calendar.HOUR_OF_DAY));
    }

    /**
     * Sets the value of <code>profile</code>.
     *
     * @param profile
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
     * @param candidate
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
     * @param profileList
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
     * @param candidateList
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
     * Sets the value of <code>beginMonth</code>.
     *
     * @param beginMonth
     */
    public void setBeginMonth(String val) {
        beginMonth = val;
    }

    /**
     * Gets the value of <code>beginMonth</code>.
     *
     * @return
     */
    public String getBeginMonth() {
        return beginMonth;
    }

    /**
     * Sets the value of <code>beginDay</code>.
     *
     * @param beginDay
     */
    public void setBeginDay(String val) {
        beginDay = val;
    }

    /**
     * Gets the value of <code>beginDay</code>.
     *
     * @return
     */
    public String getBeginDay() {
        return beginDay;
    }

    /**
     * Sets the value of <code>beginYear</code>.
     *
     * @param beginYear
     */
    public void setBeginYear(String val) {
        beginYear = val;
    }

    /**
     * Gets the value of <code>beginYear</code>.
     *
     * @return
     */
    public String getBeginYear() {
        return beginYear;
    }

    /**
     * Sets the value of <code>beginHour</code>.
     *
     * @param beginHour
     */
    public void setBeginHour(String val) {
        beginHour = val;
    }

    /**
     * Gets the value of <code>beginHour</code>.
     *
     * @return
     */
    public String getBeginHour() {
        return beginHour;
    }

    /**
     * Sets the value of <code>endMonth</code>.
     *
     * @param endMonth
     */
    public void setEndMonth(String val) {
        endMonth = val;
    }

    /**
     * Gets the value of <code>endMonth</code>.
     *
     * @return
     */
    public String getEndMonth() {
        return endMonth;
    }

    /**
     * Sets the value of <code>endDay</code>.
     *
     * @param endDay
     */
    public void setEndDay(String val) {
        endDay = val;
    }

    /**
     * Gets the value of <code>endDay</code>.
     *
     * @return
     */
    public String getEndDay() {
        return endDay;
    }

    /**
     * Sets the value of <code>endYear</code>.
     *
     * @param endYear
     */
    public void setEndYear(String val) {
        endYear = val;
    }

    /**
     * Gets the value of <code>endYear</code>.
     *
     * @return
     */
    public String getEndYear() {
        return endYear;
    }

    /**
     * Sets the value of <code>endHour</code>.
     *
     * @param endHour
     */
    public void setEndHour(String val) {
        endHour = val;
    }

    /**
     * Gets the value of <code>endHour</code>.
     *
     * @return
     */
    public String getEndHour() {
        return endHour;
    }

    /**
     * Sets the value of <code>candidateEmail</code>.
     *
     * @param candidateEmail
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
     * @param repEmail
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

    public void setBeginDate(Date beginDate) {
        Calendar c = Calendar.getInstance();
        c.setTime(beginDate);
        setBeginYear(String.valueOf(c.get(Calendar.YEAR)));
        setBeginMonth(String.valueOf(c.get(Calendar.MONTH) + 1));
        setBeginDay(String.valueOf(c.get(Calendar.DAY_OF_MONTH)));
        setBeginHour(String.valueOf(c.get(Calendar.HOUR_OF_DAY)));
    }

    public void setEndDate(Date endDate) {
        Calendar c = Calendar.getInstance();
        c.setTime(endDate);
        setEndYear(String.valueOf(c.get(Calendar.YEAR)));
        setEndMonth(String.valueOf(c.get(Calendar.MONTH) + 1));
        setEndDay(String.valueOf(c.get(Calendar.DAY_OF_MONTH)));
        setEndHour(String.valueOf(c.get(Calendar.HOUR_OF_DAY)));
    }

    public boolean isSelectedProfile(String profileId) {
        return this.profileId != null && this.profileId.equals(profileId);
    }

    public boolean isSelectedCandidate(String candidateId) {
        return this.candidateId != null && this.candidateId.equals(candidateId);
    }

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
        return c.getTime();
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
