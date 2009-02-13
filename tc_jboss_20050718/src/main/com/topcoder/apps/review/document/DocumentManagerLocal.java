/*
 * DocumentManagerLocal.java
 *
 * Copyright ? 2003, TopCoder, Inc. All rights reserved
 *
 */
package com.topcoder.apps.review.document;

import com.topcoder.apps.review.ConcurrentModificationException;
import com.topcoder.apps.review.GeneralSecurityException;
import com.topcoder.apps.review.IncorrectProjectStateException;
import com.topcoder.apps.review.projecttracker.Project;
import com.topcoder.security.TCSubject;

import javax.ejb.EJBLocalObject;


/**
 * The DocumentManager provides storage and retrieval services for all the documents managed by the system.  The
 * system's documents include: InitialSubmission, ScreeningScorecard, ReviewScorecard, TestCaseReview,
 * AggregationWorksheet, AggregationReview, FinalFixSubmission and FinalReview.  Each of these documents has a
 * corresponding get____ and save____ method specified by this interface.
 *
 * @author TCSDeveloper
 */
public interface DocumentManagerLocal extends EJBLocalObject {
    /**
     * DOCUMENT ME!
     *
     * @param project DOCUMENT ME!
     * @param requestor DOCUMENT ME!
     *
     * @return DOCUMENT ME!
     */
    public ScreeningScorecard[] getScreeningScorecard(Project project, TCSubject requestor);

    /**
     * DOCUMENT ME!
     *
     * @param project DOCUMENT ME!
     * @param requestor DOCUMENT ME!
     *
     * @return DOCUMENT ME!
     */
    public ScreeningScorecard[] getScreeningScorecardFull(Project project, TCSubject requestor);

    /**
     * DOCUMENT ME!
     *
     * @param scorecard DOCUMENT ME!
     * @param requestor the TCSubject for the requestor
     *
     * @throws InvalidEditException DOCUMENT ME!
     * @throws DocumentAlreadySubmittedException DOCUMENT ME!
     * @throws IncorrectProjectStateException DOCUMENT ME!
     */
    public void saveScreeningScorecard(ScreeningScorecard scorecard, TCSubject requestor)
            throws InvalidEditException,
            DocumentAlreadySubmittedException,
            IncorrectProjectStateException,
            GeneralSecurityException,
            ConcurrentModificationException;

    /**
     * DOCUMENT ME!
     *
     * @param project DOCUMENT ME!
     * @param reviewerId DOCUMENT ME!
     * @param submitterId DOCUMENT ME!
     * @param requestor DOCUMENT ME!
     *
     * @return DOCUMENT ME!
     */
    public ReviewScorecard getReviewScorecard(Project project, long reviewerId, long submitterId, TCSubject requestor);

    /**
     * DOCUMENT ME!
     *
     * @param project DOCUMENT ME!
     * @param requestor DOCUMENT ME!
     *
     * @return DOCUMENT ME!
     */
    public ReviewScorecard[] getReviewScorecard(Project project, TCSubject requestor);

    /**
     * DOCUMENT ME!
     *
     * @param project DOCUMENT ME!
     * @param requestor DOCUMENT ME!
     *
     * @return DOCUMENT ME!
     */
    public ReviewScorecard[] getReviewScorecardFull(Project project, TCSubject requestor);

    /**
     * DOCUMENT ME!
     *
     * @param scorecard DOCUMENT ME!
     *
     * @throws InvalidEditException DOCUMENT ME!
     * @throws DocumentAlreadySubmittedException DOCUMENT ME!
     * @throws IncorrectProjectStateException DOCUMENT ME!
     */
    public void saveReviewScorecard(ReviewScorecard scorecard, TCSubject requestor)
            throws InvalidEditException,
            DocumentAlreadySubmittedException,
            IncorrectProjectStateException,
            GeneralSecurityException,
            ConcurrentModificationException;

    /**
     * DOCUMENT ME!
     *
     * @param project DOCUMENT ME!
     * @param requestor DOCUMENT ME!
     *
     * @return DOCUMENT ME!
     */
    public TestCaseReview[] getTestCaseReview(Project project, TCSubject requestor);

    /**
     * DOCUMENT ME!
     *
     * @param tcReview DOCUMENT ME!
     *
     * @throws InvalidEditException DOCUMENT ME!
     * @throws DocumentAlreadySubmittedException DOCUMENT ME!
     * @throws IncorrectProjectStateException DOCUMENT ME!
     * @throws ConcurrentModificationException DOCUMENT ME!
     */
    public void saveTestCaseReview(TestCaseReview tcReview, TCSubject requestor)
            throws InvalidEditException,
            DocumentAlreadySubmittedException,
            IncorrectProjectStateException,
            ConcurrentModificationException;

    /**
     * DOCUMENT ME!
     *
     * @param project DOCUMENT ME!
     * @param retrieveRemoved DOCUMENT ME!
     * @param requestor DOCUMENT ME!
     *
     * @return DOCUMENT ME!
     */
    public InitialSubmission[] getInitialSubmissions(Project project, boolean retrieveRemoved, TCSubject requestor);

    public InitialSubmission getInitialSubmission(Project project, long subId, TCSubject requestor);

    /**
     * DOCUMENT ME!
     *
     * @param submission DOCUMENT ME!
     *
     * @throws InvalidEditException DOCUMENT ME!
     * @throws IncorrectProjectStateException DOCUMENT ME!
     */
    public void saveInitialSubmission(InitialSubmission submission, TCSubject requestor)
            throws InvalidEditException,
            IncorrectProjectStateException,
            ConcurrentModificationException;

    /**
     * DOCUMENT ME!
     *
     * @param project DOCUMENT ME!
     * @param requestor DOCUMENT ME!
     *
     * @return DOCUMENT ME!
     */
    public AggregationWorksheet getAggregation(Project project, TCSubject requestor);

    /**
     * DOCUMENT ME!
     *
     * @param worksheet DOCUMENT ME!
     *
     * @throws InvalidEditException DOCUMENT ME!
     * @throws DocumentAlreadySubmittedException DOCUMENT ME!
     * @throws IncorrectProjectStateException DOCUMENT ME!
     * @throws ConcurrentModificationException
     */
    public void saveAggregation(AggregationWorksheet worksheet, TCSubject requestor)
            throws InvalidEditException,
            DocumentAlreadySubmittedException,
            IncorrectProjectStateException,
            ConcurrentModificationException;

    /**
     * DOCUMENT ME!
     *
     * @param project DOCUMENT ME!
     * @param requestor DOCUMENT ME!
     *
     * @return DOCUMENT ME!
     */
    public FinalFixSubmission getFinalFixSubmission(Project project, TCSubject requestor);

    /**
     * DOCUMENT ME!
     *
     * @param submission DOCUMENT ME!
     *
     * @throws InvalidEditException DOCUMENT ME!
     * @throws IncorrectProjectStateException DOCUMENT ME!
     */
    public void saveFinalFixSubmission(FinalFixSubmission submission, TCSubject requestor)
            throws InvalidEditException,
            IncorrectProjectStateException,
            ConcurrentModificationException;

    /**
     * DOCUMENT ME!
     *
     * @param project DOCUMENT ME!
     * @param requestor DOCUMENT ME!
     *
     * @return DOCUMENT ME!
     */
    public AggregationReview[] getAggregationReview(Project project, TCSubject requestor);

    /**
     * DOCUMENT ME!
     *
     * @param aggReview DOCUMENT ME!
     *
     * @throws InvalidEditException DOCUMENT ME!
     * @throws DocumentAlreadySubmittedException DOCUMENT ME!
     * @throws IncorrectProjectStateException DOCUMENT ME!
     */
    public void saveAggregationReview(AggregationReview aggReview, TCSubject requestor)
            throws InvalidEditException,
            DocumentAlreadySubmittedException,
            IncorrectProjectStateException,
            ConcurrentModificationException;

    /**
     * DOCUMENT ME!
     *
     * @param project DOCUMENT ME!
     * @param retrieveFull DOCUMENT ME!
     * @param requestor DOCUMENT ME!
     *
     * @return DOCUMENT ME!
     */
    public FinalReview getFinalReview(Project project, boolean retrieveFull, TCSubject requestor);

    /**
     * DOCUMENT ME!
     *
     * @param finalReview DOCUMENT ME!
     *
     * @throws InvalidEditException DOCUMENT ME!
     * @throws DocumentAlreadySubmittedException DOCUMENT ME!
     * @throws IncorrectProjectStateException DOCUMENT ME!
     */
    public void saveFinalReview(FinalReview finalReview, TCSubject requestor)
            throws InvalidEditException,
            DocumentAlreadySubmittedException,
            IncorrectProjectStateException,
            ConcurrentModificationException;

    /**
     * @param project
     */
    public void createAggregation(Project project);

    /**
     * Check if the project is aggregated, with the
     * aggregation completed and pm-reviewed.
     *
     * @param projectId The ProjectId
     * @return true if project is aggregated
     */
    public boolean isProjectAggregated(long projectId);

    /**
     * Get testcases-object from the database.
     *
     * @param project
     * @param reqReviewerId
     * @param requestor
     *
     * @return TestCase[]
     *
     * @throws RuntimeException DOCUMENT ME!
     */
    public TestCase[] getTestCases(Project project, long reqReviewerId, TCSubject requestor);

    /**
     * Save a testcases object to the database.
     *
     * @param testCase
     * @param requestor
     *
     * @throws InvalidEditException DOCUMENT ME!
     * @throws IncorrectProjectStateException
     */
    public void saveTestCase(TestCase testCase, TCSubject requestor)
            throws InvalidEditException,
            IncorrectProjectStateException,
            ConcurrentModificationException;

    public Appeal[] getAppeals(Project project, long appealerId, long questionId, TCSubject requestor);

    /**
     * Save Appeal to DB.
     *
     * @param appeal
     * @param project
     * @param requestor
     * @throws DocumentAlreadySubmittedException
     * @throws ConcurrentModificationException
     */
    public void saveAppeal(Appeal appeal, Project project, TCSubject requestor)
            throws DocumentAlreadySubmittedException, ConcurrentModificationException;

    public ScorecardTemplate[] getScorecardTemplates();

    public ScorecardTemplate getScorecardTemplate(long reqTemplateId);

    public ScorecardTemplate getDefaultScorecardTemplate(long projectTypeId, long scorecardTypeId);

    public void saveScorecardTemplate(ScorecardTemplate template,
                                      boolean saveNew, boolean saveQuestions);

    public ComponentScores getComponentScores(int type, long projectId);

    /**
     * @param project
     */
    //public List createScorecards(Project project, long authorId, List scorecardList);
}
