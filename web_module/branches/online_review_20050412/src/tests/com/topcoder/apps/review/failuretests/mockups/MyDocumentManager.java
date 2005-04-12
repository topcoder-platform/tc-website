/*
 * MyDocumentManager.java 1.0 6/30/2003
 *
 * Copyright � 2003, TopCoder, Inc. All rights reserved
 */
package com.topcoder.apps.review.failuretests.mockups;

import java.rmi.RemoteException;
import javax.ejb.CreateException;
import javax.ejb.SessionBean;
import javax.ejb.SessionContext;

import com.topcoder.apps.review.mockup.EJBBase;
import com.topcoder.apps.review.document.*;
import com.topcoder.security.TCSubject;
import com.topcoder.apps.review.projecttracker.User;
import com.topcoder.apps.review.projecttracker.Project;
import com.topcoder.apps.review.IncorrectProjectStateException;

/**
 * <p>A mockup implementation of DocumentManager used for testing.</p>
 *
 * @author veredox
 * @version 1.0
 */
public class MyDocumentManager extends EJBBase implements DocumentManagerLocal {

    private ScreeningScorecard[] screeningScorecards;
    private ReviewScorecard[] reviewScorecards;
    private ReviewScorecard reviewScorecard;
    private InitialSubmission[] initialSubmissions;
    private TestCaseReview[] testCaseReviews;
    private AggregationWorksheet aggregationWorksheet;
    private FinalFixSubmission finalFixSubmission;
    private AggregationReview[] aggregationReviews;
    private FinalReview finalReview;
    private RemoteException remoteException;
    private DocumentAlreadySubmittedException documentAlreadySubmittedException;
    private InvalidEditException invalidEditException;
    private IncorrectProjectStateException incorrectProjectStateException;

    public void setScreeningScorecards(ScreeningScorecard[] screeningScorecards) {
        this.screeningScorecards = screeningScorecards;
    }

    public void setReviewScorecards(ReviewScorecard[] reviewScorecards) {
        this.reviewScorecards = reviewScorecards;
    }

    public void setReviewScorecard(ReviewScorecard reviewScorecard) {
        this.reviewScorecard = reviewScorecard;
    }

    public void setInitialSubmissions(InitialSubmission[] initialSubmissions) {
        this.initialSubmissions = initialSubmissions;
    }

    public void setTestCaseReviews(TestCaseReview[] testCaseReviews) {
        this.testCaseReviews = testCaseReviews;
    }

    public void setAggregationWorksheet(AggregationWorksheet aggregationWorksheet) {
        this.aggregationWorksheet = aggregationWorksheet;
    }

    public void setFinalFixSubmission(FinalFixSubmission finalFixSubmission) {
        this.finalFixSubmission = finalFixSubmission;
    }

    public void setAggregationReviews(AggregationReview[] aggregationReview) {
        this.aggregationReviews = aggregationReviews;
    }

    public void setFinalReview(FinalReview finalReview) {
        this.finalReview = finalReview;
    }

    public void setRemoteException(RemoteException remoteException) {
        this.remoteException = remoteException;
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
        reviewScorecard = null;
        initialSubmissions = null;
        testCaseReviews = null;
        aggregationWorksheet = null;
        finalFixSubmission = null;
        aggregationReviews = null;
        finalReview = null;
        remoteException = null;
        documentAlreadySubmittedException = null;
        invalidEditException = null;
        incorrectProjectStateException = null;
    }

    public ScreeningScorecard[] getScreeningScorecard(Project project,
                                                      TCSubject requestor) {
        return screeningScorecards;
    }

    public void saveScreeningScorecard(ScreeningScorecard scorecard,
                                       TCSubject requestor)
            throws InvalidEditException,
            DocumentAlreadySubmittedException,
            IncorrectProjectStateException {
    }

    public ReviewScorecard getReviewScorecard(Project project,
                                              long reviewerId, long submitterId, TCSubject requestor) {
        return reviewScorecard;
    }

    public ReviewScorecard[] getReviewScorecard(Project project,
                                                TCSubject requestor) {
        return reviewScorecards;
    }

    public void saveReviewScorecard(ReviewScorecard scorecard, TCSubject requestor)
            throws InvalidEditException,
            DocumentAlreadySubmittedException,
            IncorrectProjectStateException {
    }

    public TestCaseReview[] getTestCaseReview(Project project,
                                              TCSubject requestor) {
        return testCaseReviews;
    }

    public void saveTestCaseReview(TestCaseReview tcReview, TCSubject requestor)
            throws InvalidEditException,
            DocumentAlreadySubmittedException,
            IncorrectProjectStateException {
    }

    public InitialSubmission[] getInitialSubmissions(Project project,
                                                     TCSubject requestor) {
        return initialSubmissions;
    }

    public void saveInitialSubmission(InitialSubmission submission,
                                      TCSubject requestor)
            throws InvalidEditException,
            IncorrectProjectStateException {
    }

    public AggregationWorksheet getAggregation(Project project,
                                               TCSubject requestor) {
        return aggregationWorksheet;
    }

    public void saveAggregation(AggregationWorksheet worksheet, TCSubject requestor)
            throws InvalidEditException,
            DocumentAlreadySubmittedException,
            IncorrectProjectStateException {
    }

    public FinalFixSubmission getFinalFixSubmission(Project project,
                                                    TCSubject requestor) {
        return finalFixSubmission;
    }

    public void saveFinalFixSubmission(FinalFixSubmission submission, TCSubject requestor)
            throws InvalidEditException,
            IncorrectProjectStateException {
    }

    public AggregationReview[] getAggregationReview(Project project,
                                                    TCSubject requestor) {
        return aggregationReviews;
    }

    public void saveAggregationReview(AggregationReview aggReview, TCSubject requestor)
            throws InvalidEditException,
            DocumentAlreadySubmittedException,
            IncorrectProjectStateException {
    }

    public FinalReview getFinalReview(Project project, TCSubject requestor) {
        return finalReview;
    }

    public void saveFinalReview(FinalReview finalReview, TCSubject requestor)
            throws InvalidEditException,
            DocumentAlreadySubmittedException,
            IncorrectProjectStateException {
    }
}
