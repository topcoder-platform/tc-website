/*
 * AggregationResponse.java
 *
 * Copyright � 2003, TopCoder, Inc. All rights reserved
 *
 */
package com.topcoder.apps.review.document;

import com.topcoder.apps.review.projecttracker.User;

import java.io.Serializable;


/**
 * AggregationResponses are primarily constructed by the system when the
 * AggregationWorksheet is initially created. Only admin users can create
 * new AggregationResponses manually during their review processes. The
 * initial AggregationResponses created have a one-to-one relationship
 * with the SubjectiveResponses constructed in previous phases of the project.
 *
 * @author FatClimber
 * @version 1.0
 */
public class AggregationResponse implements Serializable {
    private long id;
    private SubjectiveResponse subjectiveResponse;
    private AggregationResponseStatus aggregationResponseStatus;
    private ScorecardQuestion scorecardQuestion;
    private User reviewer;
    private boolean dirtyFlag = false;
    private long versionId;

    /**
     * Constructor
     *
     * @param id DOCUMENT ME!
     * @param subjResp DOCUMENT ME!
     * @param aggRespStatus DOCUMENT ME!
     * @param subjScorecardQuestion DOCUMENT ME!
     * @param versionId DOCUMENT ME!
     */
    public AggregationResponse(long id, SubjectiveResponse subjResp, AggregationResponseStatus aggRespStatus,
                               ScorecardQuestion scorecardQuestion, User reviewer, long versionId) {
        this.id = id;
        this.subjectiveResponse = subjResp;
        this.aggregationResponseStatus = aggRespStatus;
        this.scorecardQuestion = scorecardQuestion;
        this.reviewer = reviewer;
        this.versionId = versionId;
        if (id == -1) {
            this.dirtyFlag = true;
        }
    }

    /**
     * DOCUMENT ME!
     *
     * @return DOCUMENT ME!
     */
    protected boolean getDirty() {
        return dirtyFlag;
    }

    /**
     * @param id
     */
    protected void setDirty(boolean dirtyFlag) {
        this.dirtyFlag = dirtyFlag;
    }

    /**
     * DOCUMENT ME!
     *
     * @return DOCUMENT ME!
     */
    protected long getVersionId() {
        return versionId;
    }

    /**
     * @param vid
     */
    protected void setVersionId(long vid) {
        this.versionId = vid;
    }

    /**
     * <p>
     * Return the id for this response.
     * </p>
     *
     * @return id of this response.
     */
    public long getId() {
        return id;
    }

    /**
     * @param id
     */
    protected void setId(long id) {
        this.id = id;
        this.dirtyFlag = true;
    }

    /**
     * <p>
     * Return the response.
     * </p>
     *
     * @return the response.
     */
    public SubjectiveResponse getSubjectiveResponse() {
        return subjectiveResponse;
    }

    /**
     * <p>
     * Set the response.
     * </p>
     *
     * @param response The response to be set.
     */
    public void setSubjectiveResponse(SubjectiveResponse response) {
        this.subjectiveResponse = response;
        this.dirtyFlag = true;
    }

    /**
     * <p>
     * Return the response status.
     * </p>
     *
     * @return the response status.
     */
    public AggregationResponseStatus getAggregationResponseStatus() {
        return aggregationResponseStatus;
    }

    /**
     * <p>
     * Set the response status.
     * </p><p>
     *
     * @param ars The response status.
     */
    public void setAggregationResponseStatus(AggregationResponseStatus ars) {
        this.aggregationResponseStatus = ars;
        this.dirtyFlag = true;
    }

    /**
     * <p>
     * Return the related question.
     * </p>
     *
     * @return the related question.
     */
    public ScorecardQuestion getScorecardQuestion() {
        return scorecardQuestion;
    }

    /**
     * <p>
     * Return the reviewer.
     * </p>
     *
     * @return the reviewer.
     */
    public User getReviewer() {
        return reviewer;
    }

    /* (non-Javadoc)
     * @see java.lang.Object#equals(java.lang.Object)
     */
    public boolean equals(Object o) {
        if (o == this) {
            return true;
        }

        if (!(o instanceof AggregationResponse)) {
            return false;
        }

        AggregationResponse aggResponse = (AggregationResponse) o;

        return aggResponse.getId() == this.id;
    }

    /* (non-Javadoc)
     * @see java.lang.Object#hashCode()
     */
    public int hashCode() {
        return (int) (id ^ (id >>> 32));
    }

}
