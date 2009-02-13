package com.topcoder.web.tc.model;

import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;

public class MemberSearch {

    private Integer start = null;
    private Integer end = null;
    private Integer sortCol = null;
    private boolean sortAsc = true;
    private int total = 0;
    private String handle = null;
    private String stateCode = null;
    private String countryCode = null;
    private String schoolName = null;
    private Integer minRating = null;
    private Integer maxRating = null;
    private Integer minDesignRating = null;
    private Integer maxDesignRating = null;
    private Integer minDevRating = null;
    private Integer maxDevRating = null;
    private Integer minNumRatings = null;
    private Integer maxNumRatings = null;
    private ResultSetContainer stateList = null;
    private ResultSetContainer results = null;
    private ResultSetContainer countryList = null;
    private Integer maxDaysSinceLastComp = null;
    
    private Integer minHSRating = null;
    private Integer maxHSRating = null;
    private Integer minNumHSRatings = null;
    private Integer maxNumHSRatings = null;
    private Integer maxDaysSinceLastHSComp = null;
    
    private Integer minMarRating = null;
    private Integer maxMarRating = null;
    private Integer minNumMarRatings = null;
    private Integer maxNumMarRatings = null;
    private Integer maxDaysSinceLastMarComp = null;

    public Integer getMaxDaysSinceLastHSComp() {
        return maxDaysSinceLastHSComp;
    }

    public void setMaxDaysSinceLastHSComp(Integer maxDaysSinceLastHSComp) {
        this.maxDaysSinceLastHSComp = maxDaysSinceLastHSComp;
    }


    public Integer getMaxHSRating() {
        return maxHSRating;
    }

    public void setMaxHSRating(Integer maxHSRating) {
        this.maxHSRating = maxHSRating;
    }

    public Integer getMaxNumHSRatings() {
        return maxNumHSRatings;
    }

    public void setMaxNumHSRatings(Integer maxNumHSRatings) {
        this.maxNumHSRatings = maxNumHSRatings;
    }

    public Integer getMinHSRating() {
        return minHSRating;
    }

    public void setMinHSRating(Integer minHSRating) {
        this.minHSRating = minHSRating;
    }

    public Integer getMinNumHSRatings() {
        return minNumHSRatings;
    }

    public void setMinNumHSRatings(Integer minNumHSRatings) {
        this.minNumHSRatings = minNumHSRatings;
    }

    public Integer getStart() {
        return start;
    }

    public void setStart(Integer start) {
        this.start = start;
    }

    public Integer getEnd() {
        return end;
    }

    public void setEnd(Integer end) {
        this.end = end;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    public String getHandle() {
        return handle;
    }

    public void setHandle(String handle) {
        this.handle = handle;
    }

    public String getStateCode() {
        return stateCode;
    }

    public void setStateCode(String stateCode) {
        this.stateCode = stateCode;
    }

    public Integer getMinRating() {
        return minRating;
    }

    public void setMinRating(Integer minRating) {
        this.minRating = minRating;
    }

    public Integer getMaxRating() {
        return maxRating;
    }

    public void setMaxRating(Integer maxRating) {
        this.maxRating = maxRating;
    }

    public ResultSetContainer getStateList() {
        return stateList;
    }

    public void setStateList(ResultSetContainer stateList) {
        this.stateList = stateList;
    }

    public ResultSetContainer getResults() {
        return results;
    }

    public void setResults(ResultSetContainer results) {
        this.results = results;
    }

    public ResultSetContainer getCountryList() {
        return countryList;
    }

    public void setCountryList(ResultSetContainer countryList) {
        this.countryList = countryList;
    }

    public Integer getMinNumRatings() {
        return minNumRatings;
    }

    public void setMinNumRatings(Integer minNumRatings) {
        this.minNumRatings = minNumRatings;
    }

    public Integer getMaxNumRatings() {
        return maxNumRatings;
    }

    public void setMaxNumRatings(Integer maxNumRatings) {
        this.maxNumRatings = maxNumRatings;
    }

    public Integer getMaxDaysSinceLastComp() {
        return maxDaysSinceLastComp;
    }

    public void setMaxDaysSinceLastComp(Integer maxDaysSinceLastComp) {
        this.maxDaysSinceLastComp = maxDaysSinceLastComp;
    }

    public String getCountryCode() {
        return countryCode;
    }

    public void setCountryCode(String countryCode) {
        this.countryCode = countryCode;
    }

    public String getSchoolName() {
        return schoolName;
    }

    public void setSchoolName(String schoolName) {
        this.schoolName = schoolName;
    }

    public Integer getMinDesignRating() {
        return minDesignRating;
    }

    public void setMinDesignRating(Integer minDesignRating) {
        this.minDesignRating = minDesignRating;
    }

    public Integer getMaxDesignRating() {
        return maxDesignRating;
    }

    public void setMaxDesignRating(Integer maxDesignRating) {
        this.maxDesignRating = maxDesignRating;
    }

    public Integer getMinDevRating() {
        return minDevRating;
    }

    public void setMinDevRating(Integer minDevRating) {
        this.minDevRating = minDevRating;
    }

    public Integer getMaxDevRating() {
        return maxDevRating;
    }

    public void setMaxDevRating(Integer maxDevRating) {
        this.maxDevRating = maxDevRating;
    }

    public Integer getMinMarRating() {
        return minMarRating;
    }

    public void setMinMarRating(Integer minMarRating) {
        this.minMarRating = minMarRating;
    }

    public Integer getMaxMarRating() {
        return maxMarRating;
    }

    public void setMaxMarRating(Integer maxMarRating) {
        this.maxMarRating = maxMarRating;
    }

    public Integer getMinNumMarRatings() {
        return minNumMarRatings;
    }

    public void setMinNumMarRatings(Integer minNumMarRatings) {
        this.minNumMarRatings = minNumMarRatings;
    }

    public Integer getMaxNumMarRatings() {
        return maxNumMarRatings;
    }

    public void setMaxNumMarRatings(Integer maxNumMarRatings) {
        this.maxNumMarRatings = maxNumMarRatings;
    }

    public Integer getMaxDaysSinceLastMarComp() {
        return maxDaysSinceLastMarComp;
    }

    public void setMaxDaysSinceLastMarComp(Integer maxDaysSinceLastMarComp) {
        this.maxDaysSinceLastMarComp = maxDaysSinceLastMarComp;
    }

    public Integer getSortCol() {
        return sortCol;
    }

    public void setSortCol(Integer sortCol) {
        this.sortCol = sortCol;
    }

    public boolean isSortAsc() {
        return sortAsc;
    }

    public void setSortAsc(boolean sortAsc) {
        this.sortAsc = sortAsc;
    }

}
