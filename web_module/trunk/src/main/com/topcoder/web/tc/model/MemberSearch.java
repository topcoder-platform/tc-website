package com.topcoder.web.tc.model;

import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;

public class MemberSearch {

    private Integer start = null;
    private Integer end = null;
    private int total = 0;
    private String handle = null;
    private String stateCode = null;
    private Integer minRating = null;
    private Integer maxRating = null;
    private Integer minNumRatings = null;
    private Integer maxNumRatings = null;
    private ResultSetContainer stateList = null;
    private ResultSetContainer results = null;
    private ResultSetContainer countryList = null;

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
}
