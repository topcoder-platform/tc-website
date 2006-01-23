package com.topcoder.dde.persistencelayer.interfaces;

import javax.ejb.EJBLocalObject;
import java.sql.Timestamp;

/**
 * The local interface representing the CMP bean for the comp_versions table.
 *
 * @version     1.0
 * @author      David Messinger
 */
public interface LocalDDECompVersionDates extends EJBLocalObject {

    /**
     * Gets the posting date.
     *
     * @return  date the component was posted
     */
    Timestamp getPostingDate();

    /**
     * Sets the posting date.
     *
     * @param postingDate date the component was posted
     */
    void setPostingDate(Timestamp postingDate);

    /**
     * Gets the phase completion date.
     *
     * @return  date the component completes the phase
     */
    Timestamp getPhaseCompleteDate();

    /**
     * Sets the phase complete date.
     *
     * @param phaseCompleteDate date the component's phase completed
     */
    void setPhaseCompleteDate(Timestamp phaseCompleteDate);


    /**
     * Gets the aggregation date.
     *
     * @return  date the component completes aggregation
     */
    Timestamp getAggregationCompleteDate();

    /**
     * Sets the aggregation complete date.
     *
     * @param aggregationCompleteDate date the component's aggregation completed
     */
    void setAggregationCompleteDate(Timestamp aggregationCompleteDate);

    /**
     * Gets the review date.
     *
     * @return  date the component completes screening
     */
    Timestamp getReviewCompleteDate();

    /**
     * Sets the review complete date.
     *
     * @param reviewCompleteDate date the component was reviewed
     */
    void setReviewCompleteDate(Timestamp reviewCompleteDate);


    /**
     * Gets the screening date.
     *
     * @return  date the component completes screening
     */
    Timestamp getScreeningCompleteDate();

    /**
     * Sets the screening date.
     *
     * @param screeningCompleteDate date the component was screened
     */
    void setScreeningCompleteDate(Timestamp screeningCompleteDate);


    /**
     * Gets the date the component is due
     *
     * @return  date date the component is due
     */
    Timestamp getInitialSubmissionDate();

    /**
     * Sets the date the component is due
     *
     * @param initialSubmissionDate  date the component is due
     */
    void setInitialSubmissionDate(Timestamp initialSubmissionDate);


    /**
     * Gets the estimated development begin date
     *
     * @return  date the component was posted
     */
    Timestamp getEstimatedDevDate();

    /**
     * Sets the estimated development begin date.
     *
     * @param estimatedDevDate  date the component was posted
     */
    void setEstimatedDevDate(Timestamp estimatedDevDate);

    /**
     * Gets the date the winner is announce.
     *
     * @return  date the winner is announce.
     */
    Timestamp getWinnerAnnouncedDate();

    /**
     * Sets the date the winner is announce.
     *
     * @param winnerAnnouncedDate  date the winner is announce.
     */
    void setWinnerAnnouncedDate(Timestamp winnerAnnouncedDate);


    /**
     * Gets the date the winner is announce.
     *
     * @return  the date the winner must submit their final submission
     */
    Timestamp getFinalSubmissionDate();

    /**
     * Sets the date the winner must submit their final submission
     *
     * @param finalSubmissionDate  the date the winner must submit their final submission
     */
    void setFinalSubmissionDate(Timestamp finalSubmissionDate);


    /**
     * Gets the component's level id at time of inquiry
     *
     * @return  the component's level id at time of inquiry
     */
    long getLevelId();

    /**
     * Sets the component's level id at time of inquiry
     *
     * @param phase the component's level id at time of inquiry
     */
    void setLevelId(long levelId);

    /**
     * Gets the component's phase at time of inquiry
     *
     * @return  the component's phase at time of inquiry
     */
    long getPhaseId();

    /**
     * Sets the component's phase at time of inquiry
     *
     * @param phase the component's phase at time of inquiry
     */
    void setPhaseId(long phaseId);

    /**
     * Gets the component's version id
     *
     * @return  component's version id
     */
    long getComponentVersionId();

    /**
     * Sets the component's version id
     *
     * @param componentVersionId component's version id
     */
    void setComponentVersionId(long componentVersionId);

    /**
     * Gets the component's price
     *
     * @return  component's price
     */
    double getPrice();

    /**
     * Sets the component's price
     *
     * @param price component's price
     */
    void setPrice(double price);

    /**
     * Gets the component's status
     *
     * @return  component's status
     */
    long getStatusId();

    /**
     * Sets the component's status
     *
     * @param price component's status
     */
    void setStatusId(long statusId);


    /**
     * Gets the phase completion date comment.
     *
     * @return  date the component completes the phase comment
     */
    String getPhaseCompleteDateComment();

    /**
     * Sets the phase complete date comment.
     *
     * @param phaseCompleteDate date the component's phase completed comment
     */
    void setPhaseCompleteDateComment(String phaseCompleteDateComment);


    /**
     * Gets the aggregation date.
     *
     * @return  date the component completes aggregation
     */
    String getAggregationCompleteDateComment();

    /**
     * Sets the aggregation complete date.
     *
     * @param aggregationCompleteDate date the component's aggregation completed
     */
    void setAggregationCompleteDateComment(String aggregationCompleteDateComment);

    /**
     * Gets the review date.
     *
     * @return  date the component completes screening
     */
    String getReviewCompleteDateComment();

    /**
     * Sets the review complete date.
     *
     * @param reviewCompleteDate date the component was reviewed
     */
    void setReviewCompleteDateComment(String reviewCompleteDateComment);

    /**
     * Gets the screening date.
     *
     * @return  date the component completes screening
     */
    String getScreeningCompleteDateComment();

    /**
     * Sets the screening date.
     *
     * @param screeningCompleteDate date the component was screened
     */
    void setScreeningCompleteDateComment(String screeningCompleteDateComment);

    /**
     * Gets the date the component is due
     *
     * @return  date date the component is due
     */
    String getInitialSubmissionDateComment();

    /**
     * Sets the date the component is due
     *
     * @param initialSubmissionDate  date the component is due
     */
    void setInitialSubmissionDateComment(String initialSubmissionDateComment);

    /**
     * Gets the date the winner is announce.
     *
     * @return  date the winner is announce.
     */
    String getWinnerAnnouncedDateComment();

    /**
     * Sets the date the winner is announce.
     *
     * @param winnerAnnouncedDate  date the winner is announce.
     */
    void setWinnerAnnouncedDateComment(String winnerAnnouncedDateComment);


    /**
     * Gets the date the winner is announce.
     *
     * @return  the date the winner must submit their final submission
     */
    String getFinalSubmissionDateComment();

    /**
     * Sets the date the winner must submit their final submission
     *
     * @param finalSubmissionDate  the date the winner must submit their final submission
     */
    void setFinalSubmissionDateComment(String finalSubmissionDateComment);

    /**
     * Gets the review date.
     *
     * @return  date the component completes screening
     */
    Timestamp getProductionDate();


    /**
     * Sets the review complete date.
     *
     * @param reviewCompleteDate date the component was reviewed
     */
    void setProductionDate(Timestamp productionDate);

    /**
     * Gets the review date.
     *
     * @return  date the component completes screening
     */
    String getProductionDateComment();


    /**
     * Sets the review complete date.
     *
     * @param reviewCompleteDate date the component was reviewed
     */
    void setProductionDateComment(String productionDateComment);
}
