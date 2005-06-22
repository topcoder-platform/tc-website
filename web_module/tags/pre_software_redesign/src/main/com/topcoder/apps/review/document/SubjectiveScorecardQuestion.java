/*
 * SubjectiveScorecardQuestion.java
 *
 * Copyright � 2003, TopCoder, Inc. All rights reserved
 *
 */
package com.topcoder.apps.review.document;

import java.io.Serializable;


/**
 * Subjective questions support evaluation of the extent to which the response
 * to a question is answerable in the affirmative.  Such questions require
 * supporting SubjectiveResponse objects.
 *
 * @author FatClimber
 * @version 1.0
 */
public class SubjectiveScorecardQuestion extends ScorecardQuestion implements Serializable {
    /** SCORECARD_TYPE */
    public static final int SCORECARD_TYPE = 2;
    public static final int SCORECARD_TYPE_YESNO = 4;

    private long id;
    private SubjectiveResponse[] subjectiveResponse;
    private boolean subjDirtyFlag = false;
    private int answerType = SubjectiveScorecardQuestion.ANSWER_1234;

    /** Answer types */
    public static final int ANSWER_1234 = 1;
    public static final int ANSWER_YESNO = 2;

    /**
     *
     */
    public SubjectiveScorecardQuestion(long id, Evaluation evaluation, String questionText, int weight,
                                       ScorecardSection scorecardSection, int sequenceLocation, SubjectiveResponse[] subjectiveResponse,
                                       int answerType, long questionTemplateId, long versionId) {
        super(id, evaluation, questionText, weight, scorecardSection, sequenceLocation, questionTemplateId, versionId);
        this.subjectiveResponse = subjectiveResponse;
        this.answerType = answerType;
    }

    public SubjectiveScorecardQuestion(long id, Evaluation evaluation, String questionText, int weight,
                                       ScorecardSection scorecardSection, int sequenceLocation, SubjectiveResponse[] subjectiveResponse,
                                       long questionTemplateId, long versionId) {
        super(id, evaluation, questionText, weight, scorecardSection, sequenceLocation, questionTemplateId, versionId);
        this.subjectiveResponse = subjectiveResponse;
        this.answerType = SubjectiveScorecardQuestion.ANSWER_1234;
    }

    /**
     * DOCUMENT ME!
     *
     * @return DOCUMENT ME!
     */
    protected boolean getSubjDirty() {
        return subjDirtyFlag;
    }

    /**
     * DOCUMENT ME!
     *
     * @param dirtyFlag
     */
    protected void setSubjDirty(boolean dirtyFlag) {
        this.subjDirtyFlag = dirtyFlag;
    }

    /**
     * <p>
     * Return the responses of this question.
     * </p>
     *
     * @return a SubjectiveResponse[] with the responses of this question.
     */
    public SubjectiveResponse[] getResponses() {
        return subjectiveResponse;
    }

    /**
     * <p>
     * Set the responses of this question.
     * </p>
     *
     * @param responses The responses of this question.
     */
    public void setResponses(SubjectiveResponse[] responses) {
        this.subjectiveResponse = responses;
        this.subjDirtyFlag = true;
    }

    /**
     * Get the answerType for this question.
     * @return answerType for this question.
     */
    public int getAnswerType() {
        return answerType;
    }
}
