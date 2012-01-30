/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc.dto;

import java.util.Date;

/**
 * <p>
 * This class is a simple container class that contains the information of the status of a contest.
 * </p>
 * <p>
 * Thread Safety: This class is not thread-safe because it's mutable.
 * </p>
 *
 * <p>
 * Changes in Version 1.1 : Added {@link #contestId} field.
 * </p>
 *
 * <p>
 * Changes in Version 1.2 : Removed subType property and corresponding getter/setter methods.
 * </p>
 * 
 * <p>
 * Changes in Version 1.3 : Added {@link #contestName} field.
 * </p>
 *
 * @author mekanizumu, TCSDEVELOPER, pinoydream, bugbuka
 * @version 1.3
 */
public class ContestStatusDTO {
    /**
     * Represents the contest id.
     */
    private long contestId;
    
    /**
     * Represents the contest name.
     */
    private String contestName;
    
    /**
     * <p>
     * The contest type. It has both getter and setter. It can be any value. It does not need to be
     * initialized when the instance is created. It is used in getType(), setType().
     * </p>
     */
    private String type;

    /**
     * <p>
     * The contest catalog. It has both getter and setter. It can be any value. It does not need to be
     * initialized when the instance is created. It is used in setCatalog(), getCatalog().
     * </p>
     */
    private String catalog;

    /**
     * <p>
     * The submission due date. It has both getter and setter. It can be any value. It does not need to be
     * initialized when the instance is created. It is used in setSubmissionDueDate(), getSubmissionDueDate().
     * </p>
     */
    private Date submissionDueDate;

    /**
     * <p>
     * The final review due date. It has both getter and setter. It can be any value. It does not need to be
     * initialized when the instance is created. It is used in setFinalReviewDueDate(),
     * getFinalReviewDueDate().
     * </p>
     */
    private Date finalReviewDueDate;

    /**
     * <p>
     * The current phase of the contest. It has both getter and setter. It can be any value. It does not need
     * to be initialized when the instance is created. It is used in setCurrentPhase(), getCurrentPhase().
     * </p>
     */
    private String currentPhase;

    /**
     * <p>
     * The first place handle. It has both getter and setter. It can be any value. It does not need to be
     * initialized when the instance is created. It is used in getFirstPlaceHandle(), setFirstPlaceHandle().
     * </p>
     */
    private String firstPlaceHandle;

    /**
     * <p>
     * The second place handle. It has both getter and setter. It can be any value. It does not need to be
     * initialized when the instance is created. It is used in setSecondPlaceHandle(), getSecondPlaceHandle().
     * </p>
     */
    private String secondPlaceHandle;

    /**
     * <p>
     * This is the default constructor for the class.
     * </p>
     */
    public ContestStatusDTO() {
        // Empty
    }

    /**
     * <p>
     * Getter method for type, simply return the value of the namesake field.
     * </p>
     *
     * @return the type
     */
    public String getType() {
        return type;
    }

    /**
     * <p>
     * Setter method for the type, simply set the value to the namesake field.
     * </p>
     *
     * @param type
     *            The contest type to set
     */
    public void setType(String type) {
        this.type = type;
    }

    /**
     * <p>
     * Getter method for catalog, simply return the value of the namesake field.
     * </p>
     *
     * @return the catalog
     */
    public String getCatalog() {
        return catalog;
    }

    /**
     * <p>
     * Setter method for the catalog, simply set the value to the namesake field.
     * </p>
     *
     * @param catalog
     *            The contest catalog to set
     */
    public void setCatalog(String catalog) {
        this.catalog = catalog;
    }

    /**
     * <p>
     * Getter method for submissionDueDate, simply return the value of the namesake field.
     * </p>
     *
     * @return the submissionDueDate
     */
    public Date getSubmissionDueDate() {
        return submissionDueDate;
    }

    /**
     * <p>
     * Setter method for the submissionDueDate, simply set the value to the namesake field.
     * </p>
     *
     * @param submissionDueDate
     *            The submission due date to set
     */
    public void setSubmissionDueDate(Date submissionDueDate) {
        this.submissionDueDate = submissionDueDate;
    }

    /**
     * <p>
     * Getter method for finalReviewDueDate, simply return the value of the namesake field.
     * </p>
     *
     * @return the finalReviewDueDate
     */
    public Date getFinalReviewDueDate() {
        return finalReviewDueDate;
    }

    /**
     * <p>
     * Setter method for the finalReviewDueDate, simply set the value to the namesake field.
     * </p>
     *
     * @param finalReviewDueDate
     *            The final review due date to set
     */
    public void setFinalReviewDueDate(Date finalReviewDueDate) {
        this.finalReviewDueDate = finalReviewDueDate;
    }

    /**
     * <p>
     * Getter method for currentPhase, simply return the value of the namesake field.
     * </p>
     *
     * @return the currentPhase
     */
    public String getCurrentPhase() {
        return currentPhase;
    }

    /**
     * <p>
     * Setter method for the currentPhase, simply set the value to the namesake field.
     * </p>
     *
     * @param currentPhase
     *            The current phase of the contest to set
     */
    public void setCurrentPhase(String currentPhase) {
        this.currentPhase = currentPhase;
    }

    /**
     * <p>
     * Getter method for firstPlaceHandle, simply return the value of the namesake field.
     * </p>
     *
     * @return the firstPlaceHandle
     */
    public String getFirstPlaceHandle() {
        return firstPlaceHandle;
    }

    /**
     * <p>
     * Setter method for the firstPlaceHandle, simply set the value to the namesake field.
     * </p>
     *
     * @param firstPlaceHandle
     *            The first place handle to set
     */
    public void setFirstPlaceHandle(String firstPlaceHandle) {
        this.firstPlaceHandle = firstPlaceHandle;
    }

    /**
     * <p>
     * Getter method for secondPlaceHandle, simply return the value of the namesake field.
     * </p>
     *
     * @return the secondPlaceHandle
     */
    public String getSecondPlaceHandle() {
        return secondPlaceHandle;
    }

    /**
     * <p>
     * Setter method for the secondPlaceHandle, simply set the value to the namesake field.
     * </p>
     *
     * @param secondPlaceHandle
     *            The second place handle to set
     */
    public void setSecondPlaceHandle(String secondPlaceHandle) {
        this.secondPlaceHandle = secondPlaceHandle;
    }

    /**
     * Gets the contest id.
     * 
     * @return the contest id.
     */
    public long getContestId() {
        return contestId;
    }

    /**
     * Sets the contest id.
     * 
     * @param contestId the contest id.
     */
    public void setContestId(long contestId) {
        this.contestId = contestId;
    }
    
    /**
     * Gets the contest name.
     * 
     * @return the contest name.
     */
    public String getContestName() {
        return contestName;
    }

    /**
     * Sets the contest name.
     * 
     * @param contestId the contest name.
     */
    public void setContestName(String contestName) {
        this.contestName = contestName;
    }
}
