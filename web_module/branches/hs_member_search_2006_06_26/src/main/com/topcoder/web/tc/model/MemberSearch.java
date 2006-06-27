package com.topcoder.web.tc.model;

import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;

public class MemberSearch {

    private Integer start = null;
    private Integer end = null;
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
    
    private Integer minHsRating = null;
    private Integer maxHsRating = null;
    private Integer minNumHsRatings = null;
    private Integer maxNumHsRatings = null;
    private Integer maxDaysSinceLastHSComp = null;
    
    public Integer getMaxDaysSinceLastHSComp() {
        return maxDaysSinceLastHSComp;
    }

    public void setMaxDaysSinceLastHSComp(Integer maxDaysSinceLastHSComp) {
        this.maxDaysSinceLastHSComp = maxDaysSinceLastHSComp;
    }

    public Integer getMaxHsRating() {
        return maxHsRating;
    }

    public void setMaxHsRating(Integer maxHsRating) {
        this.maxHsRating = maxHsRating;
    }

    public Integer getMaxNumHsRatings() {
        return maxNumHsRatings;
    }

    public void setMaxNumHsRatings(Integer maxNumHsRatings) {
        this.maxNumHsRatings = maxNumHsRatings;
    }

    public Integer getMinHsRating() {
        return minHsRating;
    }

    public void setMinHsRating(Integer minHsRating) {
        this.minHsRating = minHsRating;
    }

    public Integer getMinNumHsRatings() {
        return minNumHsRatings;
    }

    public void setMinNumHsRatings(Integer minNumHsRatings) {
        this.minNumHsRatings = minNumHsRatings;
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

}
