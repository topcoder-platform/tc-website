package com.topcoder.apps.review.accuracytests.ejb;

import com.topcoder.apps.review.IncorrectProjectStateException;
import com.topcoder.apps.review.document.*;
import com.topcoder.apps.review.projecttracker.*;
import com.topcoder.security.TCSubject;

import java.rmi.RemoteException;

/**
 * Assists in UnitTesting by serving as the DocumentManager.<p>
 *
 * @author TCDEVELOPER
 * @version 1.0
 * @version Copyright � 2003, TopCoder Software, Inc. All rights reserved
 */
public class DocumentManagerTester implements DocumentManagerLocal, DocumentManager {

    private long projectId;
    private ScreeningScorecard[] screeningScorecards;
    private ReviewScorecard[] reviewScorecards;
    private InitialSubmission[] initialSubmission;
    private TestCaseReview[] testCaseReview;
    private AggregationWorksheet aggregationWorksheet;
    private FinalFixSubmission finalFixSubmission;
    private AggregationReview[] aggregationReview;
    private FinalReview finalReview;
    private DocumentAlreadySubmittedException documentAlreadySubmittedException;
    private InvalidEditException invalidEditException;
    private IncorrectProjectStateException incorrectProjectStateException;

    public void setProjectId(long projectId) {
        this.projectId = projectId;
    }

    public void setScreeningScorecards(ScreeningScorecard[] screeningScorecards) {
        this.screeningScorecards = screeningScorecards;
    }

    public void setReviewScorecards(ReviewScorecard[] reviewScorecards) {
        this.reviewScorecards = reviewScorecards;
    }

    public void setInitialSubmission(InitialSubmission[] initialSubmission) {
        this.initialSubmission = initialSubmission;
    }

    public void setTestCaseReview(TestCaseReview[] testCaseReview) {
        this.testCaseReview = testCaseReview;
    }

    public void setAggregationWorksheet(AggregationWorksheet aggregationWorksheet) {
        this.aggregationWorksheet = aggregationWorksheet;
    }

    public void setFinalFixSubmission(FinalFixSubmission finalFixSubmission) {
        this.finalFixSubmission = finalFixSubmission;
    }

    public void setAggregationReview(AggregationReview[] aggregationReview) {
        this.aggregationReview = aggregationReview;
    }

    public void setFinalReview(FinalReview finalReview) {
        this.finalReview = finalReview;
    }

    public void setDocumentAlreadySubmittedException(DocumentAlreadySubmittedException documentAlreadySubmittedException) {
        this.documentAlreadySubmittedException = documentAlreadySubmittedException;
    }

    public void setInvalidEditException(InvalidEditException invalidEditException) {
        this.invalidEditException = invalidEditException;
    }

    public void setIncorrectProjectStateException(IncorrectProjectStateException incorrectProjectStateException) {
        this.incorrectProjectStateException = incorrectProjectStateException;
    }

    public void clear() {
        screeningScorecards = null;
        reviewScorecards = null;
        initialSubmission = null;
        testCaseReview = null;
        aggregationWorksheet = null;
        finalFixSubmission = null;
        aggregationReview = null;
        finalReview = null;
        documentAlreadySubmittedException = null;
        invalidEditException = null;
        incorrectProjectStateException = null;
    }

    public ScreeningScorecard[] getScreeningScorecard(Project project, TCSubject user) {
        if (projectId != project.getId()) return null;
        return (ScreeningScorecard[]) screeningScorecards.clone();
    }

    public void saveScreeningScorecard(ScreeningScorecard scorecard, TCSubject req) throws InvalidEditException, DocumentAlreadySubmittedException, IncorrectProjectStateException {
        throwMe();
    }

    public ReviewScorecard getReviewScorecard(Project proj, long reviewerId, long submitterId, TCSubject requestorId) {
        if (this.projectId != projectId) return null;
        for (int i = 0; i < reviewScorecards.length; i++) {
            if (reviewScorecards[i].getSubmission().getSubmitter().getId() == submitterId &&
                    reviewScorecards[i].getAuthor().getId() == reviewerId)
                return reviewScorecards[i];
        }
        return null;
    }

    public ReviewScorecard[] getReviewScorecard(Project project, TCSubject user) {
        if (projectId != project.getId()) return null;
        return (ReviewScorecard[]) reviewScorecards.clone();
    }

    public TestCaseReview[] getTestCaseReview(Project project, TCSubject user) {
        if (projectId != project.getId()) return null;
        return (TestCaseReview[]) testCaseReview.clone();
    }

    public void saveReviewScorecard(ReviewScorecard scorecard, TCSubject user) throws InvalidEditException, DocumentAlreadySubmittedException, IncorrectProjectStateException {
        throwMe();
    }

    public void saveTestCaseReview(TestCaseReview tcReview, TCSubject user) throws InvalidEditException, DocumentAlreadySubmittedException, IncorrectProjectStateException {
        throwMe();
    }

    public InitialSubmission[] getInitialSubmissions(Project project, TCSubject user) {
        if (projectId != project.getId()) return null;
        for (int i = 0; i < initialSubmission.length; i++) {
            if (initialSubmission[i].getSubmitter().getId() == user.getUserId()) {
                return new InitialSubmission[]{initialSubmission[i]};
            }
        }
        return initialSubmission;
    }

    public void saveInitialSubmission(InitialSubmission submission, TCSubject user) throws IncorrectProjectStateException {
        throwMe();
    }

    public AggregationWorksheet getAggregation(Project project, TCSubject user) {
        if (projectId != project.getId()) return null;
        return aggregationWorksheet;
    }

    public void saveAggregation(AggregationWorksheet worksheet, TCSubject user) throws InvalidEditException, DocumentAlreadySubmittedException, IncorrectProjectStateException {
        throwMe();
    }

    public FinalFixSubmission getFinalFixSubmission(Project project, TCSubject user) {
        if (projectId != project.getId()) return null;
        return finalFixSubmission;
    }

    public void saveFinalFixSubmission(FinalFixSubmission submission, TCSubject user) throws IncorrectProjectStateException {
        throwMe();
    }

    public AggregationReview[] getAggregationReview(Project project, TCSubject user) {
        if (projectId != project.getId()) return null;
        return aggregationReview;
    }

    public void saveAggregationReview(AggregationReview aggReview, TCSubject user) throws InvalidEditException, DocumentAlreadySubmittedException, IncorrectProjectStateException {
        throwMe();
    }

    public FinalReview getFinalReview(Project project, TCSubject user) {
        if (projectId != project.getId()) return null;
        return finalReview;
    }

    public void saveFinalReview(FinalReview finalReview, TCSubject user) throws InvalidEditException, DocumentAlreadySubmittedException, IncorrectProjectStateException {
        throwMe();
    }


    public void throwMe() {
        if (incorrectProjectStateException != null) throw incorrectProjectStateException;
        if (invalidEditException != null) throw invalidEditException;
        // TODO: if (documentAlreadySubmittedException != null) throw documentAlreadySubmittedException;
    }

    public javax.ejb.EJBLocalHome getEJBLocalHome() throws javax.ejb.EJBException {
        return null;
    }

    public javax.ejb.EJBHome getEJBHome() throws javax.ejb.EJBException {
        return null;
    }

    public Object getPrimaryKey() throws javax.ejb.EJBException {
        return null;
    }

    public boolean isIdentical(javax.ejb.EJBLocalObject eJBLocalObject) throws javax.ejb.EJBException {
        return false;
    }

    public boolean isIdentical(javax.ejb.EJBObject eJBLocalObject) throws javax.ejb.EJBException {
        return false;
    }

    public void remove() throws javax.ejb.RemoveException, javax.ejb.EJBException {
    }

    public javax.ejb.Handle getHandle() throws java.rmi.RemoteException {
        return null;
    }

    public java.util.List createScorecards(Project project, long authorId, java.util.List scorecardList) {
        return new java.util.ArrayList();
    }

    public void createAggregation(Project project) {
    }
}
