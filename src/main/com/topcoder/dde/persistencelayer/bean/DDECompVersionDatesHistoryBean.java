package com.topcoder.dde.persistencelayer.bean;

import javax.ejb.CreateException;
import java.sql.Timestamp;

/**
 * The bean implementation class representing the CMP bean for the comp_versions table.
 *
 * @version     1.0
 * @author      David Messinger
 */
public abstract class DDECompVersionDatesHistoryBean extends DDEBaseEntityBean {

    /**
     * Creates a new instance.
     */
    public DDECompVersionDatesHistoryBean() {
    }

    /**
     * Gets the posting date.
     *
     * @return  date the component was posted
     */
    public abstract Timestamp getPostingDate();

    /**
     * Sets the posting date.
     *
     * @param postingDate date the component was posted
     */
    public abstract void setPostingDate(Timestamp postingDate);


    /**
     * Gets the phase completion date.
     *
     * @return  date the component completes the phase
     */
    public abstract Timestamp getPhaseCompleteDate();


    /**
     * Sets the phase complete date.
     *
     * @param phaseCompleteDate date the component's phase completed
     */
    public abstract void setPhaseCompleteDate(Timestamp phaseCompleteDate);


    /**
     * Gets the phase completion date comment.
     *
     * @return  date the component completes the phase comment
     */
    public abstract String getPhaseCompleteDateComment();

    /**
     * Sets the phase complete date comment.
     *
     * @param phaseCompleteDate date the component's phase completed comment
     */
    public abstract void setPhaseCompleteDateComment(String phaseCompleteDateComment);


    /**
     * Gets the aggregation date.
     *
     * @return  date the component completes aggregation
     */
    public abstract Timestamp getAggregationCompleteDate();

    /**
     * Sets the aggregation complete date.
     *
     * @param aggregationCompleteDate date the component's aggregation completed
     */
    public abstract void setAggregationCompleteDate(Timestamp aggregationCompleteDate);

    /**
     * Gets the aggregation date.
     *
     * @return  date the component completes aggregation
     */
    public abstract String getAggregationCompleteDateComment();

    /**
     * Sets the aggregation complete date.
     *
     * @param aggregationCompleteDate date the component's aggregation completed
     */
    public abstract void setAggregationCompleteDateComment(String aggregationCompleteDateComment);

    /**
     * Gets the review date.
     *
     * @return  date the component completes screening
     */
    public abstract Timestamp getReviewCompleteDate();

    /**
     * Sets the review complete date.
     *
     * @param reviewCompleteDate date the component was reviewed
     */
    public abstract void setReviewCompleteDate(Timestamp reviewCompleteDate);

    /**
     * Gets the review date.
     *
     * @return  date the component completes screening
     */
    public abstract String getReviewCompleteDateComment();

    /**
     * Sets the review complete date.
     *
     * @param reviewCompleteDate date the component was reviewed
     */
    public abstract void setReviewCompleteDateComment(String reviewCompleteDateComment);


    /**
     * Gets the screening date.
     *
     * @return  date the component completes screening
     */
    public abstract Timestamp getScreeningCompleteDate();

    /**
     * Sets the screening date.
     *
     * @param screeningCompleteDate date the component was screened
     */
    public abstract void setScreeningCompleteDate(Timestamp screeningCompleteDate);

    /**
     * Gets the screening date.
     *
     * @return  date the component completes screening
     */
    public abstract String getScreeningCompleteDateComment();

    /**
     * Sets the screening date.
     *
     * @param screeningCompleteDate date the component was screened
     */
    public abstract void setScreeningCompleteDateComment(String screeningCompleteDateComment);

    /**
     * Gets the date the component is due
     *
     * @return  date date the component is due
     */
    public abstract Timestamp getInitialSubmissionDate();

    /**
     * Sets the date the component is due
     *
     * @param initialSubmissionDate  date the component is due
     */
    public abstract void setInitialSubmissionDate(Timestamp initialSubmissionDate);

    /**
     * Gets the date the component is due
     *
     * @return  date date the component is due
     */
    public abstract String getInitialSubmissionDateComment();

    /**
     * Sets the date the component is due
     *
     * @param initialSubmissionDate  date the component is due
     */
    public abstract void setInitialSubmissionDateComment(String initialSubmissionDateComment);


    /**
     * Gets the estimated development begin date
     *
     * @return  date the component was posted
     */
    public abstract Timestamp getEstimatedDevDate();

    /**
     * Sets the estimated development begin date.
     *
     * @param estimatedDevDate  date the component was posted
     */
    public abstract void setEstimatedDevDate(Timestamp estimatedDevDate);

    /**
     * Gets the date the winner is announce.
     *
     * @return  date the winner is announce.
     */
    public abstract Timestamp getWinnerAnnouncedDate();

    /**
     * Sets the date the winner is announce.
     *
     * @param winnerAnnouncedDate  date the winner is announce.
     */
    public abstract void setWinnerAnnouncedDate(Timestamp winnerAnnouncedDate);


    /**
     * Gets the date the winner is announce.
     *
     * @return  date the winner is announce.
     */
    public abstract String getWinnerAnnouncedDateComment();

    /**
     * Sets the date the winner is announce.
     *
     * @param winnerAnnouncedDate  date the winner is announce.
     */
    public abstract void setWinnerAnnouncedDateComment(String winnerAnnouncedDateComment);


    /**
     * Gets the date the winner is announce.
     *
     * @return  the date the winner must submit their final submission
     */
    public abstract Timestamp getFinalSubmissionDate();

    /**
     * Sets the date the winner must submit their final submission
     *
     * @param finalSubmissionDate  the date the winner must submit their final submission
     */
    public abstract void setFinalSubmissionDate(Timestamp finalSubmissionDate);


    /**
     * Gets the date the winner is announce.
     *
     * @return  the date the winner must submit their final submission
     */
    public abstract String getFinalSubmissionDateComment();

    /**
     * Sets the date the winner must submit their final submission
     *
     * @param finalSubmissionDate  the date the winner must submit their final submission
     */
    public abstract void setFinalSubmissionDateComment(String finalSubmissionDateComment);

    /**
     * Gets the component's level id at time of inquiry
     *
     * @return  the component's level id at time of inquiry
     */
    public abstract long getLevelId();

    /**
     * Sets the component's level id at time of inquiry
     *
     * @param phase the component's level id at time of inquiry
     */
    public abstract void setLevelId(long levelId);

    /**
     * Gets the component's phase at time of inquiry
     *
     * @return  the component's phase at time of inquiry
     */
    public abstract long getPhaseId();

    /**
     * Sets the component's phase at time of inquiry
     *
     * @param phase the component's phase at time of inquiry
     */
    public abstract void setPhaseId(long phaseId);

    /**
     * Gets the component's version id
     *
     * @return  component's version id
     */
    public abstract long getComponentVersionId();

    /**
     * Sets the component's version id
     *
     * @param componentVersionId component's version id
     */
    public abstract void setComponentVersionId(long componentVersionId);

    /**
     * Gets the component's price
     *
     * @return  component's price
     */
    public abstract double getPrice();

    /**
     * Sets the component's price
     *
     * @param price component's price
     */
    public abstract void setPrice(double price);

    /**
     * Gets the component's status
     *
     * @return  component's status
     */
    public abstract long getStatusId();

    /**
     * Sets the component's status
     *
     * @param price component's status
     */
    public abstract void setStatusId(long statusId);


    /**
     * Gets the review date.
     *
     * @return  date the component completes screening
     */
    public abstract Timestamp getProductionDate();


    /**
     * Sets the review complete date.
     *
     * @param reviewCompleteDate date the component was reviewed
     */
    public abstract void setProductionDate(Timestamp productionDate);

    /**
     * Gets the review date.
     *
     * @return  date the component completes screening
     */
    public abstract String getProductionDateComment();


    /**
     * Sets the review complete date.
     *
     * @param reviewCompleteDate date the component was reviewed
     */
    public abstract void setProductionDateComment(String productionDateComment);


    /**
     *
     * @return the entity bean's primary key (should be null for CMP bean implementations).
     * @throws CreateException      an application level error occurred during the create operation.
     */
    public Long ejbCreate(long componentVersionId, long phaseId, Timestamp postingDate, Timestamp initialSubmissionDate, Timestamp finalSubmissionDate, Timestamp winnerAnnouncedDate, Timestamp estimatedDevDate, double price, long statusId,
                          long levelId, Timestamp phaseCompleteDate, Timestamp aggregationCompleteDate, Timestamp reviewCompleteDate, Timestamp screeningCompleteDate, String phaseCompleteDateComment,
                          String aggregationCompleteDateComment, String reviewCompleteDateComment, String screeningCompleteDateComment, String initialSubmissionDateComment, String finalSubmissionDateComment, String winnerAnnouncedDateComment, Timestamp productionDate, String productionDateComment
                          ) throws CreateException {
        setPrimaryKey();
        setComponentVersionId(componentVersionId);
        setPhaseId(phaseId);
        setPostingDate(postingDate);

        setInitialSubmissionDate(initialSubmissionDate);
        setInitialSubmissionDateComment(initialSubmissionDateComment);

        setFinalSubmissionDate(finalSubmissionDate);
        setFinalSubmissionDateComment(finalSubmissionDateComment);

        setWinnerAnnouncedDate(winnerAnnouncedDate);
        setWinnerAnnouncedDateComment(winnerAnnouncedDateComment);

        setEstimatedDevDate(estimatedDevDate);
        setPrice(price);
        setStatusId(statusId);
        setLevelId(levelId);

        setPhaseCompleteDate(phaseCompleteDate);
        setPhaseCompleteDateComment(phaseCompleteDateComment);

        setAggregationCompleteDate(aggregationCompleteDate);
        setAggregationCompleteDateComment(aggregationCompleteDateComment);

        setReviewCompleteDate(reviewCompleteDate);
        setReviewCompleteDateComment(reviewCompleteDateComment);

        setScreeningCompleteDate(screeningCompleteDate);
        setScreeningCompleteDateComment(screeningCompleteDateComment);

        setProductionDate(productionDate);
        setProductionDateComment(productionDateComment);
        return null;

    }

    /**
     * Creates an entity object.
     *
     *
     */
    public void ejbPostCreate(long componentVersionId, long phaseId, Timestamp postingDate, Timestamp initialSubmissionDate, Timestamp finalSubmissionDate, Timestamp winnerAnnouncedDate, Timestamp estimatedDevDate, double price, long statusId, long levelId,
                              Timestamp phaseCompleteDate, Timestamp aggregationCompleteDate, Timestamp reviewCompleteDate, Timestamp screeningCompleteDate, String phaseCompleteDateComment,
                              String aggregationCompleteDateComment, String reviewCompleteDateComment, String screeningCompleteDateComment, String initialSubmissionDateComment, String finalSubmissionDateComment, String winnerAnnouncedDateComment, Timestamp productionDate, String productionDateComment) throws CreateException {
    }
}
