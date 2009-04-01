/*
 * TCS Online Review
 *
 * DMProxy.java
 *
 * Copyright (c) 2003  TopCoder, Inc.  All rights reserved.
 */

package com.topcoder.apps.review.accuracytests;

import com.topcoder.apps.review.projecttracker.Project;
import com.topcoder.apps.review.projecttracker.User;
import com.topcoder.apps.review.document.AggregationReview;
import com.topcoder.apps.review.document.AggregationWorksheet;
import com.topcoder.apps.review.document.DocumentManagerLocal;
import com.topcoder.apps.review.document.DocumentManagerLocalHome;
import com.topcoder.apps.review.document.FinalFixSubmission;
import com.topcoder.apps.review.document.FinalReview;
import com.topcoder.apps.review.document.InitialSubmission;
import com.topcoder.apps.review.document.ReviewScorecard;
import com.topcoder.apps.review.document.ScreeningScorecard;
import com.topcoder.apps.review.document.TestCaseReview;

import com.topcoder.security.TCSubject;

import javax.naming.Context;
import javax.naming.InitialContext;

import java.util.List;

/**
 * An implementation of the DMProxy interface specific to Submitter2's
 * development submission.
 *
 * @author ThinMan
 * @version 1.0
 */
class Sub2DMProxy implements DMProxy {

    private final static String HOME_NAME =
            "java:comp/env/document/DocumentManager";
    private DocumentManagerLocal bean;

    public Sub2DMProxy() throws Exception {
        Context ctx = new InitialContext();
        DocumentManagerLocalHome home =
                (DocumentManagerLocalHome) ctx.lookup(HOME_NAME);
        bean = home.create();
    }

    public ScreeningScorecard[] getScreeningScorecard(Project project,
                                                      User requestor) {
        return bean.getScreeningScorecard(project,
                new TCSubject(requestor.getId()));
    }

    public void saveScreeningScorecard(ScreeningScorecard scorecard,
                                       User requestor)
            throws Exception {
        bean.saveScreeningScorecard(scorecard,
                new TCSubject(requestor.getId()));
    }

    public ReviewScorecard getReviewScorecard(Project project, long reviewerId,
                                              long submitterId, User requestor) {
        return bean.getReviewScorecard(project, reviewerId, submitterId,
                new TCSubject(requestor.getId()));
    }

    public ReviewScorecard[] getReviewScorecard(Project project, User requestor) {
        return bean.getReviewScorecard(project,
                new TCSubject(requestor.getId()));
    }

    public void saveReviewScorecard(ReviewScorecard scorecard,
                                    User requestor)
            throws Exception {
        bean.saveReviewScorecard(scorecard, new TCSubject(requestor.getId()));
    }

    public TestCaseReview[] getTestCaseReview(Project project, User requestor) {
        return bean.getTestCaseReview(project,
                new TCSubject(requestor.getId()));
    }

    public void saveTestCaseReview(TestCaseReview tcReview,
                                   User requestor) throws Exception {
        bean.saveTestCaseReview(tcReview, new TCSubject(requestor.getId()));
    }

    public InitialSubmission[] getInitialSubmission(Project project,
                                                    User requestor) {
        return bean.getInitialSubmissions(project,
                new TCSubject(requestor.getId()));
    }

    public void saveSubmission(InitialSubmission submission,
                               User requestor) throws Exception {
        bean.saveInitialSubmission(submission,
                new TCSubject(requestor.getId()));
    }

    public AggregationWorksheet getAggregation(Project project, User requestor) {
        return bean.getAggregation(project, new TCSubject(requestor.getId()));
    }

    public void saveAggregation(AggregationWorksheet worksheet,
                                User requestor)
            throws Exception {
        bean.saveAggregation(worksheet, new TCSubject(requestor.getId()));
    }

    public FinalFixSubmission getFinalFixes(Project project, User requestor) {
        return bean.getFinalFixSubmission(project,
                new TCSubject(requestor.getId()));
    }

    public void saveFinalFixSubmission(FinalFixSubmission submission,
                                       User requestor)
            throws Exception {
        bean.saveFinalFixSubmission(submission,
                new TCSubject(requestor.getId()));
    }

    public AggregationReview[] getAggregationReview(Project project,
                                                    User requestor) {
        return bean.getAggregationReview(project,
                new TCSubject(requestor.getId()));
    }

    public void saveAggregationReview(AggregationReview aggReview,
                                      User requestor) throws Exception {
        bean.saveAggregationReview(aggReview, new TCSubject(requestor.getId()));
    }

    public FinalReview getFinalReview(Project project, User requestor) {
        return bean.getFinalReview(project, new TCSubject(requestor.getId()));
    }

    public void saveFinalReview(FinalReview finalReview,
                                User requestor) throws Exception {
        bean.saveFinalReview(finalReview, new TCSubject(requestor.getId()));
    }

    public void remove() throws Exception {
        bean.remove();
    }
}

