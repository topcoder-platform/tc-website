/*
 * TestCaseScorecardQuestion.java
 *
 * Copyright � 2003, TopCoder, Inc. All rights reserved
 *
 */
package com.topcoder.apps.review.document;

import java.io.Serializable;


/**
 * TestCaseScorecardQuestions represents a scorecard question representing
 * test cases. It contains number of total testcases and number of passed
 * testcases.
 * They have SubjectiveResponse objects to represent info about failed
 * testcases.
 *
 * @author FatClimber
 * @version 1.0
 */
public class TestCaseScorecardQuestion extends ScorecardQuestion implements Serializable {
    /** SCORECARD_TYPE */
    public static final int SCORECARD_TYPE = 3;
    private long id;
    private SubjectiveResponse[] subjectiveResponse;
    private int totalTests;
    private int totalPass;
    private boolean testCaseDirtyFlag = false;

    /**
     *
     */
    public TestCaseScorecardQuestion(long id, Evaluation evaluation, String questionText, int weight,
                                     ScorecardSection scorecardSection, int sequenceLocation, SubjectiveResponse[] subjectiveResponse,
                                     int totalPass, int totalTests,
                                     long questionTemplateId, long versionId) {
        super(id, evaluation, questionText, weight, scorecardSection, sequenceLocation, questionTemplateId, versionId);
        this.subjectiveResponse = subjectiveResponse;
        this.totalPass = totalPass;
        this.totalTests = totalTests;
    }

    /**
     * DOCUMENT ME!
     *
     * @return DOCUMENT ME!
     */
    protected boolean getTestCaseDirty() {
        return testCaseDirtyFlag;
    }

    /**
     * DOCUMENT ME!
     *
     * @param dirtyFlag
     */
    protected void setTestCaseDirty(boolean dirtyFlag) {
        this.testCaseDirtyFlag = dirtyFlag;
    }

    /**
     * DOCUMENT ME!
     *
     * @return DOCUMENT ME!
     */
    public double getValue() {
        return (double) totalPass / totalTests;
    }

    /**
     * @return
     */
    public int getTotalTests() {
        return totalTests;
    }

    /**
     * @return
     */
    public int getTotalPass() {
        return totalPass;
    }

    /**
     * @param totalTests
     */
    public void setTotalTests(int totalTests) {
        this.totalTests = totalTests;
        this.testCaseDirtyFlag = true;
    }

    /**
     * @param totalPass
     */
    public void setTotalPass(int totalPass) {
        this.totalPass = totalPass;
        this.testCaseDirtyFlag = true;
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
        this.testCaseDirtyFlag = true;
    }
}
