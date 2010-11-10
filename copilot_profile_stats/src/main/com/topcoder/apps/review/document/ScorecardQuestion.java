/*
 * ScorecardQuestion.java
 *
 * Copyright � 2003, TopCoder, Inc. All rights reserved
 *
 */
package com.topcoder.apps.review.document;

import java.io.Serializable;


/**
 * ScorecardQuestions are the basic building block of scorecards. They provide
 * a read-only reference to a question and track a reviewer's response to this
 * question. Further, they contain scoring information including individual
 * question weight and a reference to the section of the scorecard this
 * question resides.  The base ScorecardQuestion supports only objective
 * (yes/no) responses.
 *
 * @author FatClimber
 * @version 1.0
 */
public class ScorecardQuestion implements Serializable {
    /** SCORECARD_TYPE */
    public static final int SCORECARD_TYPE = 1;

    /** doc */
    protected long id;

    /** doc */
    protected Evaluation evaluation;

    /** doc */
    protected String questionText;

    /** doc */
    protected int weight;

    /** doc */
    protected ScorecardSection scorecardSection;

    /** doc */
    protected int sequenceLocation;

    /** doc */
    protected long templateVersionId;

    /** dirtyFlag */
    protected boolean dirtyFlag = false;

    /** doc */
    protected long versionId;

    /**
     *
     */
    public ScorecardQuestion(long id, Evaluation evaluation, String questionText, int weight,
                             ScorecardSection scorecardSection, int sequenceLocation, long templateVersionId, long versionId) {
        this.id = id;
        this.evaluation = evaluation;
        this.questionText = questionText;
        this.weight = weight;
        this.scorecardSection = scorecardSection;
        this.sequenceLocation = sequenceLocation;
        this.templateVersionId = templateVersionId;
        this.versionId = versionId;
        if (id < 0) {
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
     * @param dirtyFlag
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
     * Return the id of this the question.
     * </p>
     *
     * @return the id of this the question.
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
     * Return the evaluation of this question.
     * </p>
     *
     * @return the evaluation of this question.
     */
    public Evaluation getEvaluation() {
        return evaluation;
    }

    /**
     * <p>
     * Set the evaluation of this question.
     * </p>
     *
     * @param eval The evaluation of this question.
     */
    public void setEvaluation(Evaluation eval) {
        this.evaluation = eval;
        this.dirtyFlag = true;
    }

    /**
     * <p>
     * Return the text of this question.
     * </p>
     *
     * @return a String with the text of this question.
     */
    public String getQuestionText() {
        return questionText;
    }

    /**
     * <p>
     * Return the weight of this question.
     * </p>
     *
     * @return the weight of this question.
     */
    public int getWeight() {
        return weight;
    }

    /**
     * <p>
     * Return the section of this question.
     * </p>
     *
     * @return the section of this question.
     */
    public ScorecardSection getScorecardSection() {
        return scorecardSection;
    }

    /**
     * <p>
     * Return the location of this question.
     * </p>
     *
     * @return the location of this question.
     */
    public int getSequenceLocation() {
        return sequenceLocation;
    }

    /**
     * <p>
     * Return the template version used to construct this question.
     * </p>
     *
     * @return the template version used to construct this question.
     */
    public long getVersion() {
        return this.templateVersionId;
    }

    /* (non-Javadoc)
     * @see java.lang.Object#equals(java.lang.Object)
     */
    public boolean equals(Object o) {
        if (o == this) {
            return true;
        }

        if (!(o instanceof ScorecardQuestion)) {
            return false;
        }

        ScorecardQuestion question = (ScorecardQuestion) o;

        return question.getId() == this.id;
    }

    /* (non-Javadoc)
     * @see java.lang.Object#hashCode()
     */
    public int hashCode() {
        return (int) (id ^ (id >>> 32));
    }
}
