package com.topcoder.web.screening.model;

import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;

public class SessionInfo extends BaseModel {
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

    /**
     * Sets the value of <code>profile</code>.
     *
     * @param profile
     */
    public void setProfileId( String val )
    {
        profileId = val;
    }

    /**
     * Gets the value of <code>profile</code>.
     *
     * @return 
     */
    public String getProfileId()
    {
        return profileId;
    }

    /**
     * Sets the value of <code>candidate</code>.
     *
     * @param candidate
     */
    public void setCandidateId( String val )
    {
        candidateId = val;
    }

    /**
     * Gets the value of <code>candidate</code>.
     *
     * @return 
     */
    public String getCandidateId()
    {
        return candidateId;
    }

    /**
     * Sets the value of <code>profileList</code>.
     *
     * @param profileList
     */
    public void setProfileList( ResultSetContainer val )
    {
        profileList = val;
    }

    /**
     * Gets the value of <code>profileList</code>.
     *
     * @return 
     */
    public ResultSetContainer getProfileList()
    {
        return profileList;
    }

    /**
     * Sets the value of <code>candidateList</code>.
     *
     * @param candidateList
     */
    public void setCandidateList( ResultSetContainer val )
    {
        candidateList = val;
    }

    /**
     * Gets the value of <code>candidateList</code>.
     *
     * @return 
     */
    public ResultSetContainer getCandidateList()
    {
        return candidateList;
    }

    /**
     * Sets the value of <code>beginMonth</code>.
     *
     * @param beginMonth
     */
    public void setBeginMonth( String val )
    {
        beginMonth = val;
    }

    /**
     * Gets the value of <code>beginMonth</code>.
     *
     * @return 
     */
    public String getBeginMonth()
    {
        return beginMonth;
    }

    /**
     * Sets the value of <code>beginDay</code>.
     *
     * @param beginDay
     */
    public void setBeginDay( String val )
    {
        beginDay = val;
    }

    /**
     * Gets the value of <code>beginDay</code>.
     *
     * @return 
     */
    public String getBeginDay()
    {
        return beginDay;
    }

    /**
     * Sets the value of <code>beginYear</code>.
     *
     * @param beginYear
     */
    public void setBeginYear( String val )
    {
        beginYear = val;
    }

    /**
     * Gets the value of <code>beginYear</code>.
     *
     * @return 
     */
    public String getBeginYear()
    {
        return beginYear;
    }

    /**
     * Sets the value of <code>beginHour</code>.
     *
     * @param beginHour
     */
    public void setBeginHour( String val )
    {
        beginHour = val;
    }

    /**
     * Gets the value of <code>beginHour</code>.
     *
     * @return 
     */
    public String getBeginHour()
    {
        return beginHour;
    }

    /**
     * Sets the value of <code>endMonth</code>.
     *
     * @param endMonth
     */
    public void setEndMonth( String val )
    {
        endMonth = val;
    }

    /**
     * Gets the value of <code>endMonth</code>.
     *
     * @return 
     */
    public String getEndMonth()
    {
        return endMonth;
    }

    /**
     * Sets the value of <code>endDay</code>.
     *
     * @param endDay
     */
    public void setEndDay( String val )
    {
        endDay = val;
    }

    /**
     * Gets the value of <code>endDay</code>.
     *
     * @return 
     */
    public String getEndDay()
    {
        return endDay;
    }

    /**
     * Sets the value of <code>endYear</code>.
     *
     * @param endYear
     */
    public void setEndYear( String val )
    {
        endYear = val;
    }

    /**
     * Gets the value of <code>endYear</code>.
     *
     * @return 
     */
    public String getEndYear()
    {
        return endYear;
    }

    /**
     * Sets the value of <code>endHour</code>.
     *
     * @param endHour
     */
    public void setEndHour( String val )
    {
        endHour = val;
    }

    /**
     * Gets the value of <code>endHour</code>.
     *
     * @return 
     */
    public String getEndHour()
    {
        return endHour;
    }

    /**
     * Sets the value of <code>candidateEmail</code>.
     *
     * @param candidateEmail
     */
    public void setCandidateEmail( String val )
    {
        candidateEmail = val;
    }

    /**
     * Gets the value of <code>candidateEmail</code>.
     *
     * @return 
     */
    public String getCandidateEmail()
    {
        return candidateEmail;
    }

    /**
     * Sets the value of <code>repEmail</code>.
     *
     * @param repEmail
     */
    public void setRepEmail( String val )
    {
        repEmail = val;
    }

    /**
     * Gets the value of <code>repEmail</code>.
     *
     * @return 
     */
    public String getRepEmail()
    {
        return repEmail;
    }

    public boolean isSelectedProfile(String profileId) {
        return this.profileId != null && this.profileId.equals(profileId);
    }

    public boolean isSelectedCandidate(String candidateId) {
        return this.candidateId != null && this.candidateId.equals(candidateId);
    }

    /*
    private Date formDate(String day,String month,String year,String tod) {
         GregorianCalendar gc = new GregorianCalendar();
         String months[] = new String[]{"April","August","December","February","January","June","July","March","May","November","October","September"};
         if(Arrays.binarySearch(months,month)==-1) return null;
         int monthCode[] = new int[]{Calendar.APRIL,Calendar.AUGUST,Calendar.DECEMBER,Calendar.FEBRUARY,Calendar.JANUARY,Calendar.JUNE,Calendar.JULY,Calendar.MARCH,Calendar.MAY,
         Calendar.NOVEMBER,Calendar.OCTOBER,Calendar.SEPTEMBER};
         gc.set(Calendar.MONTH,monthCode[Arrays.binarySearch(months,month)]);
         gc.set(Calendar.DAY_OF_MONTH,Integer.parseInt(day));
         gc.set(Calendar.YEAR,Integer.parseInt(year));
         int todint = (tod.endsWith("PM")?12:0)+(Integer.parseInt(tod.substring(0,2))%12);
         gc.set(Calendar.HOUR,todint);
         return gc.getTime();
     }
     */
}
