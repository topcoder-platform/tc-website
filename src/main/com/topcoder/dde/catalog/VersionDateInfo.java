/*
 * ComponentVersionInfo.java
 * 26 August 2002
 * 1.0
 *
 * Copyright (c) 2002, TopCoder, Inc.
 * All rights reserved.
 */


package com.topcoder.dde.catalog;

import java.util.Date;

public class VersionDateInfo implements java.io.Serializable {

    private long id = -1;
    private long componentVersionId = -1;
    private long phaseId = -1;
    private Date postingDate = null;
    private Date initialSubmissionDate = null;
    private Date finalSubmissionDate = null;
    private Date winnerAnnouncedDate = null;
    private Date estimatedDevDate = null;
    Date screeningCompleteDate = null;
    Date reviewCompleteDate = null;
    Date aggregationCompleteDate = null;
    Date phaseCompleteDate = null;
    Date productionDate = null;
    private String aggregationCompleteDateComment = null;
    private String phaseCompleteDateComment = null;
    private String reviewCompleteDateComment = null;
    private String winnerAnnouncedDateComment = null;
    private String initialSubmissionDateComment = null;
    private String screeningCompleteDateComment = null;
    private String finalSubmissionDateComment = null;
    private String productionDateComment = null;
    private double price = 0;
    private long statusId = NEW_POSTING;
    private long levelId = 0;

    static public final long NEW_POSTING = 301L;
    static public final long RE_POSTING = 302L;

    private static org.apache.log4j.Logger log = org.apache.log4j.Logger.getLogger(VersionDateInfo.class);

    public VersionDateInfo(long id, long componentVersionId, long phaseId, Date postingDate, Date initialSubmissionDate, Date finalSubmissionDate, Date winnerAnnouncedDate, Date estimatedDevDate, double price, long statusId, long levelId,
                           Date screeningDate, Date phaseCompleteDate, Date aggregationCompleteDate, Date reviewCompleteDate, String phaseCompleteDateComment,
                           String aggregationCompleteDateComment, String reviewCompleteDateComment, String screeningCompleteDateComment, String initialSubmissionDateComment, String finalSubmissionDateComment, String winnerAnnouncedDateComment,
                           Date productionDate, String productionDateComment) {
        this(componentVersionId, phaseId, postingDate, initialSubmissionDate, finalSubmissionDate, winnerAnnouncedDate, estimatedDevDate, price, statusId, levelId,
                screeningDate, phaseCompleteDate, aggregationCompleteDate, reviewCompleteDate, phaseCompleteDateComment,
                aggregationCompleteDateComment, reviewCompleteDateComment, screeningCompleteDateComment, initialSubmissionDateComment, finalSubmissionDateComment, winnerAnnouncedDateComment, productionDate, productionDateComment);
        this.setId(id);
    }

    public VersionDateInfo(long componentVersionId, long phaseId, Date postingDate, Date initialSubmissionDate, Date finalSubmissionDate, Date winnerAnnouncedDate, Date estimatedDevDate, double price, long statusId, long levelId,
                           Date screeningDate, Date phaseCompleteDate, Date aggregationCompleteDate, Date reviewCompleteDate, String phaseCompleteDateComment,
                           String aggregationCompleteDateComment, String reviewCompleteDateComment, String screeningCompleteDateComment, String initialSubmissionDateComment, String finalSubmissionDateComment, String winnerAnnouncedDateComment,
                           Date productionDate, String productionDateComment) {
        setComponentVersionId(componentVersionId);
        setPhaseId(phaseId);
        setPostingDate(postingDate);
        setInitialSubmissionDate(initialSubmissionDate);
        setFinalSubmissionDate(finalSubmissionDate);
        setWinnerAnnouncedDate(winnerAnnouncedDate);
        setEstimatedDevDate(estimatedDevDate);
        setPrice(price);
        setStatusId(statusId);
        log.debug("level id" + levelId);
        setLevelId(levelId);
        setScreeningCompleteDate(screeningDate);
        setPhaseCompleteDate(phaseCompleteDate);
        setAggregationCompleteDate(aggregationCompleteDate);
        setReviewCompleteDate(reviewCompleteDate);
        setPhaseCompleteDateComment(phaseCompleteDateComment);
        setAggregationCompleteDateComment(aggregationCompleteDateComment);
        setReviewCompleteDateComment(reviewCompleteDateComment);
        setScreeningCompleteDateComment(screeningCompleteDateComment);
        setInitialSubmissionDateComment(initialSubmissionDateComment);
        setFinalSubmissionDateComment(finalSubmissionDateComment);
        setWinnerAnnouncedDateComment(winnerAnnouncedDateComment);
        setProductionDate(productionDate);
        setProductionDateComment(productionDateComment);
    }

    public VersionDateInfo() {
    }


    /**
     * Returns the level id
     *
     * @return level id
     */
    public long getLevelId() {
        return this.levelId;
    }

    /**
     * sets the level id
     *
     * @param levelId the level
     */
    public void setLevelId(long levelId) {
        this.levelId = levelId;
    }

    /**
     * Returns the primary key of this component technology.
     *
     * @return the primary key of this technology, or -1 if this technology was
     * constructed by the client (instead of returned by the component catalog)
     */
    public long getId() {
        return id;
    }

    /**
     * Returns the primary key of this component technology.
     *
     * @return the primary key of this technology, or -1 if this technology was
     * constructed by the client (instead of returned by the component catalog)
     */
    public void setId(long id) {
        this.id = id;
    }

    /**
     * Gets the posting date.
     *
     * @return  date the component was posted
     */
    public Date getPostingDate() {
        return this.postingDate;
    }

    /**
     * Sets the posting date.
     *
     * @param postingDate date the component was posted
     */
    public void setPostingDate(Date postingDate) {
        this.postingDate = postingDate;
    }

    /**
     * Gets the date the component is due
     *
     * @return  date date the component is due
     */
    public Date getInitialSubmissionDate() {
        return initialSubmissionDate;
    }

    /**
     * Sets the date the component is due
     *
     * @param initialSubmissionDate  date the component is due
     */
    public void setInitialSubmissionDate(Date initialSubmissionDate) {
        this.initialSubmissionDate = initialSubmissionDate;
    }


    /**
     * Gets the estimated development begin date
     *
     * @return  date the component was posted
     */
    public Date getEstimatedDevDate() {
        return estimatedDevDate;
    }

    /**
     * Sets the estimated development begin date.
     *
     * @param estimatedDevDate  date the component was posted
     */
    public void setEstimatedDevDate(Date estimatedDevDate) {
        this.estimatedDevDate = estimatedDevDate;
    }

    /**
     * Gets the date the winner is announce.
     *
     * @return  date the winner is announce.
     */
    public Date getWinnerAnnouncedDate() {
        return this.winnerAnnouncedDate;
    }

    /**
     * Sets the date the winner is announce.
     *
     * @param winnerAnnouncedDate  date the winner is announce.
     */
    public void setWinnerAnnouncedDate(Date winnerAnnouncedDate) {
        this.winnerAnnouncedDate = winnerAnnouncedDate;
    }


    /**
     * Gets the date the winner is announce.
     *
     * @return  the date the winner must submit their final submission
     */
    public Date getFinalSubmissionDate() {
        return this.finalSubmissionDate;
    }

    /**
     * Sets the date the winner must submit their final submission
     *
     * @param finalSubmissionDate  the date the winner must submit their final submission
     */
    public void setFinalSubmissionDate(Date finalSubmissionDate) {
        this.finalSubmissionDate = finalSubmissionDate;
    }


    /**
     * Gets the component's phase at time of inquiry
     *
     * @return  the component's phase at time of inquiry
     */
    public long getPhaseId() {
        return phaseId;
    }

    /**
     * Sets the component's phase at time of inquiry
     *
     * @param phase the component's phase at time of inquiry
     */
    public void setPhaseId(long phaseId) {
        this.phaseId = phaseId;
    }

    /**
     * Gets the component's version id
     *
     * @return  component's version id
     */
    long getComponentVersionId() {
        return componentVersionId;
    }

    /**
     * Sets the component's version id
     *
     * @param componentVersionId component's version id
     */
    public void setComponentVersionId(long componentVersionId) {
        this.componentVersionId = componentVersionId;
    }

    /**
     * Gets the component's price
     *
     * @return  component's price
     */
    public double getPrice() {
        return this.price;
    }

    /**
     * Sets the component's price
     *
     * @param price component's price
     */
    public void setPrice(double price) {
        this.price = price;
    }

    /**
     * Gets the component's price
     *
     * @return  component's price
     */
    public long getStatusId() {
        return this.statusId;
    }

    /**
     * Sets the component's price
     *
     * @param price component's price
     */
    public void setStatusId(long statusId) {
        this.statusId = statusId;
    }

    public String toString() {
        return getComponentVersionId() + " - " +
                "phase: " + getPhaseId() + " - " +
                "posting: " + getPostingDate() + " - " +
                "initial: " + getInitialSubmissionDate() + " - " +
                "final: " + getFinalSubmissionDate() + " - " +
                "winner: " + getWinnerAnnouncedDate() + " - " +
                "estimatedDev: " + getEstimatedDevDate() + " - " +
                "price: " + getPrice() + " - " +
                "status: " + getStatusId();

    }

    /**
     * Gets the phase completion date.
     *
     * @return  date the component completes the phase
     */
    public Date getPhaseCompleteDate() {
        return this.phaseCompleteDate;
    }

    /**
     * Sets the phase complete date.
     *
     * @param phaseCompleteDate date the component's phase completed
     */
    public void setPhaseCompleteDate(Date phaseCompleteDate) {
        this.phaseCompleteDate = phaseCompleteDate;
    }


    /**
     * Gets the aggregation date.
     *
     * @return  date the component completes aggregation
     */
    public Date getAggregationCompleteDate() {
        return this.aggregationCompleteDate;
    }

    /**
     * Sets the aggregation complete date.
     *
     * @param aggregationCompleteDate date the component's aggregation completed
     */
    public void setAggregationCompleteDate(Date aggregationCompleteDate) {
        this.aggregationCompleteDate = aggregationCompleteDate;
    }

    /**
     * Gets the review date.
     *
     * @return  date the component completes screening
     */
    public Date getReviewCompleteDate() {
        return this.reviewCompleteDate;
    }

    /**
     * Sets the review complete date.
     *
     * @param reviewCompleteDate date the component was reviewed
     */
    public void setReviewCompleteDate(Date reviewCompleteDate) {
        this.reviewCompleteDate = reviewCompleteDate;
    }

    /**
     * Gets the review date.
     *
     * @return  date the component completes screening
     */
    public Date getProductionDate() {
        return this.productionDate;
    }

    /**
     * Sets the review complete date.
     *
     * @param reviewCompleteDate date the component was reviewed
     */
    public void setProductionDate(Date productionDate) {
        this.productionDate = productionDate;
    }

    /**
     * Gets the review date.
     *
     * @return  date the component completes screening
     */
    public String getProductionDateComment() {
        return this.productionDateComment;
    }

    /**
     * Sets the review complete date.
     *
     * @param reviewCompleteDate date the component was reviewed
     */
    public void setProductionDateComment(String productionDateComment) {
        this.productionDateComment = productionDateComment;
    }

    /**
     * Gets the screening date.
     *
     * @return  date the component completes screening
     */
    public Date getScreeningCompleteDate() {
        return this.screeningCompleteDate;
    }

    /**
     * Sets the screening date.
     *
     * @param screeningCompleteDate date the component was screened
     */
    public void setScreeningCompleteDate(Date screeningCompleteDate) {
        this.screeningCompleteDate = screeningCompleteDate;
    }


    /**
     * Gets the phase completion date comment.
     *
     * @return  date the component completes the phase comment
     */
    public String getPhaseCompleteDateComment() {
        return this.phaseCompleteDateComment;
    }

    /**
     * Sets the phase complete date comment.
     *
     * @param phaseCompleteDate date the component's phase completed comment
     */
    public void setPhaseCompleteDateComment(String phaseCompleteDateComment) {
        this.phaseCompleteDateComment = phaseCompleteDateComment;
    }


    /**
     * Gets the aggregation date.
     *
     * @return  date the component completes aggregation
     */
    public String getAggregationCompleteDateComment() {
        return this.aggregationCompleteDateComment;
    }

    /**
     * Sets the aggregation complete date.
     *
     * @param aggregationCompleteDate date the component's aggregation completed
     */
    public void setAggregationCompleteDateComment(String aggregationCompleteDateComment) {
        this.aggregationCompleteDateComment = aggregationCompleteDateComment;
    }

    /**
     * Gets the review date.
     *
     * @return  date the component completes screening
     */
    public String getReviewCompleteDateComment() {
        return this.reviewCompleteDateComment;
    }

    /**
     * Sets the review complete date.
     *
     * @param reviewCompleteDate date the component was reviewed
     */
    public void setReviewCompleteDateComment(String reviewCompleteDateComment) {
        this.reviewCompleteDateComment = reviewCompleteDateComment;
    }

    /**
     * Gets the screening date.
     *
     * @return  date the component completes screening
     */
    public String getScreeningCompleteDateComment() {
        return this.screeningCompleteDateComment;
    }

    /**
     * Sets the screening date.
     *
     * @param screeningCompleteDate date the component was screened
     */
    public void setScreeningCompleteDateComment(String screeningCompleteDateComment) {
        this.screeningCompleteDateComment = screeningCompleteDateComment;
    }

    /**
     * Gets the date the component is due
     *
     * @return  date date the component is due
     */
    public String getInitialSubmissionDateComment() {
        return initialSubmissionDateComment;
    }

    /**
     * Sets the date the component is due
     *
     * @param initialSubmissionDate  date the component is due
     */
    public void setInitialSubmissionDateComment(String initialSubmissionDateComment) {
        this.initialSubmissionDateComment = initialSubmissionDateComment;
    }

    /**
     * Gets the date the winner is announce.
     *
     * @return  date the winner is announce.
     */
    public String getWinnerAnnouncedDateComment() {
        return winnerAnnouncedDateComment;
    }

    /**
     * Sets the date the winner is announce.
     *
     * @param winnerAnnouncedDate  date the winner is announce.
     */
    public void setWinnerAnnouncedDateComment(String winnerAnnouncedDateComment) {
        this.winnerAnnouncedDateComment = winnerAnnouncedDateComment;
    }

    /**
     * Gets the date the winner is announce.
     *
     * @return  the date the winner must submit their final submission
     */
    public String getFinalSubmissionDateComment() {
        return this.finalSubmissionDateComment;
    }

    /**
     * Sets the date the winner must submit their final submission
     *
     * @param finalSubmissionDate  the date the winner must submit their final submission
     */
    public void setFinalSubmissionDateComment(String finalSubmissionDateComment) {
        this.finalSubmissionDateComment = finalSubmissionDateComment;
    }


}
