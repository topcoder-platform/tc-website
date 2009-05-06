/*
 * Copyright (c) 2004-2009 TopCoder, Inc. All rights reserved.
 */

package com.topcoder.web.tc.model;

import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;


/**
 * <p>This class represents the information about searching member.</p>
 * 
 * <p>
 *   Version 1.1 (Member Profile Enhancement 1.0) Change notes:
 *   <ol>
 *     <li>
 *     Added serveral fields and getters/setters that represents the min/max
 *     values for searching the newly added tracks in this assembly.
 *     </li>
 *   </ol>
 * </p>
 *
 * @author TCSDEVELOPER
 * @version 1.1
 */
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

    /**
     * <p>
     * Conceptualization minimum rating.
     * </p>
     *
     * @since Member Profile Enhancement
     */
    private Integer minConceptRating = null;

    /**
     * <p>
     * Conceptualization maximum rating.
     * </p>
     *
     * @since Member Profile Enhancement
     */
    private Integer maxConceptRating = null;

    /**
     * <p>
     * Specification minimum rating.
     * </p>
     *
     * @since Member Profile Enhancement
     */
    private Integer minSpecRating = null;

    /**
     * <p>
     * Specification maximum rating.
     * </p>
     *
     * @since Member Profile Enhancement
     */
    private Integer maxSpecRating = null;

    /**
     * <p>
     * Architecture minimum rating.
     * </p>
     *
     * @since Member Profile Enhancement
     */
    private Integer minArchRating = null;

    /**
     * <p>
     * Architecture maximum rating.
     * </p>
     *
     * @since Member Profile Enhancement
     */
    private Integer maxArchRating = null;

    /**
     * <p>
     * Assembly minimum rating.
     * </p>
     *
     * @since Member Profile Enhancement
     */
    private Integer minAssRating = null;

    /**
     * <p>
     * Assembly maximum rating.
     * </p>
     *
     * @since Member Profile Enhancement
     */
    private Integer maxAssRating = null;

    /**
     * <p>
     * Application Testing minimum rating.
     * </p>
     *
     * @since Member Profile Enhancement
     */
    private Integer minTestRating = null;

    /**
     * <p>
     * Application Testing maximum rating.
     * </p>
     *
     * @since Member Profile Enhancement
     */
    private Integer maxTestRating = null;

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

    /**
     * <p>
     * Get conceptualization minimum rating.
     * </p>
     *
     * @return conceptualization minimum rating.
     */
    public Integer getMinConceptRating() {
        return minConceptRating;
    }

    /**
     * <p>
     * Set conceptualization minimum rating.
     * </p>
     *
     * @param minConceptRating
     *            conceptualization minimum rating.
     */
    public void setMinConceptRating(Integer minConceptRating) {
        this.minConceptRating = minConceptRating;
    }

    /**
     * <p>
     * Get conceptualization maximum rating.
     * </p>
     *
     * @return conceptualization maximum rating.
     */
    public Integer getMaxConceptRating() {
        return maxConceptRating;
    }

    /**
     * <p>
     * Set conceptualization maximum rating.
     * </p>
     *
     * @param maxConceptRating
     *            conceptualization maximum rating.
     */
    public void setMaxConceptRating(Integer maxConceptRating) {
        this.maxConceptRating = maxConceptRating;
    }

    /**
     * <p>
     * Get specification minimum rating.
     * </p>
     *
     * @return specification minimum rating.
     */
    public Integer getMinSpecRating() {
        return minSpecRating;
    }

    /**
     * <p>
     * Set specification minimum rating.
     * </p>
     *
     * @param minSpecRating
     *            specification minimum rating.
     */
    public void setMinSpecRating(Integer minSpecRating) {
        this.minSpecRating = minSpecRating;
    }

    /**
     * <p>
     * Get specification maximum rating.
     * </p>
     *
     * @return specification maximum rating.
     */
    public Integer getMaxSpecRating() {
        return maxSpecRating;
    }

    /**
     * <p>
     * Set specification maximum rating.
     * </p>
     *
     * @param maxSpecRating
     *            specification maximum rating.
     */
    public void setMaxSpecRating(Integer maxSpecRating) {
        this.maxSpecRating = maxSpecRating;
    }

    /**
     * <p>
     * Get architecture minimum rating.
     * </p>
     *
     * @return architecture minimum rating.
     */
    public Integer getMinArchRating() {
        return minArchRating;
    }

    /**
     * <p>
     * Set architecture minimum rating.
     * </p>
     *
     * @param minArchRating
     *            architecture minimum rating.
     */
    public void setMinArchRating(Integer minArchRating) {
        this.minArchRating = minArchRating;
    }

    /**
     * <p>
     * Get architecture maximum rating.
     * </p>
     *
     * @return architecture maximum rating.
     */
    public Integer getMaxArchRating() {
        return maxArchRating;
    }

    /**
     * <p>
     * Set architecture maximum rating.
     * </p>
     *
     * @param maxArchRating
     *            architecture maximum rating.
     */
    public void setMaxArchRating(Integer maxArchRating) {
        this.maxArchRating = maxArchRating;
    }

    /**
     * <p>
     * Get assembly minimum rating.
     * </p>
     *
     * @return assembly minimum rating.
     */
    public Integer getMinAssRating() {
        return minAssRating;
    }

    /**
     * <p>
     * Set assembly minimum rating.
     * </p>
     *
     * @param minAssRating
     *            assembly minimum rating.
     */
    public void setMinAssRating(Integer minAssRating) {
        this.minAssRating = minAssRating;
    }

    /**
     * <p>
     * Get assembly maximum rating.
     * </p>
     *
     * @return assembly maximum rating.
     */
    public Integer getMaxAssRating() {
        return maxAssRating;
    }

    /**
     * <p>
     * Set assembly maximum rating.
     * </p>
     *
     * @param maxAssRating
     *            assembly maximum rating.
     */
    public void setMaxAssRating(Integer maxAssRating) {
        this.maxAssRating = maxAssRating;
    }

    /**
     * <p>
     * Get application testing minimum rating.
     * </p>
     *
     * @return application testing minimum rating.
     */
    public Integer getMinTestRating() {
        return minTestRating;
    }

    /**
     * <p>
     * Set application testing minimum rating.
     * </p>
     *
     * @param minTestRating
     *            application testing minimum rating.
     */
    public void setMinTestRating(Integer minTestRating) {
        this.minTestRating = minTestRating;
    }

    /**
     * <p>
     * Get application testing maximum rating.
     * </p>
     *
     * @return application testing maximum rating.
     */
    public Integer getMaxTestRating() {
        return maxTestRating;
    }

    /**
     * <p>
     * Set application testing maximum rating.
     * </p>
     *
     * @param maxTestRating
     *            application testing maximum rating.
     */
    public void setMaxTestRating(Integer maxTestRating) {
        this.maxTestRating = maxTestRating;
    }
}
