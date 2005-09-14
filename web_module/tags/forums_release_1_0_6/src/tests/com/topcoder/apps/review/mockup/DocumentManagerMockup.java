/**
 * Copyright � 2003, TopCoder, Inc. All rights reserved
 */
package com.topcoder.apps.review.mockup;

import com.topcoder.apps.review.document.AggregationReview;
import com.topcoder.apps.review.document.AggregationWorksheet;
import com.topcoder.apps.review.document.DocumentManagerLocal;
import com.topcoder.apps.review.document.FinalFixSubmission;
import com.topcoder.apps.review.document.FinalReview;
import com.topcoder.apps.review.document.InitialSubmission;
import com.topcoder.apps.review.document.ReviewScorecard;
import com.topcoder.apps.review.document.ScreeningScorecard;
import com.topcoder.apps.review.document.TestCaseReview;
import com.topcoder.apps.review.projecttracker.Project;
import com.topcoder.security.TCSubject;

import java.util.List;

/**
 * Mockup implementation of the DocumentManager EJB.
 *
 * @author adic
 * @version 1.0
 */
public class DocumentManagerMockup extends EJBBase implements DocumentManagerLocal {

    public void createAggregation(Project project) {
    }


    public InitialSubmission[] getInitialSubmissions(Project project, TCSubject requestor) {
        return MockupData.getInitialSubmissions(project, requestor);
    }

    public ScreeningScorecard[] getScreeningScorecard(Project project, TCSubject requestor) {
        return MockupData.getScreeningScorecards(project, requestor);
    }

    public ReviewScorecard getReviewScorecard(Project project, long reviewerId, long submitterId, TCSubject requestor) {
        return MockupData.getReviewScorecard(submitterId, project.getId(), reviewerId, requestor);
    }


    public ReviewScorecard[] getReviewScorecard(Project project, TCSubject requestor) {
        return MockupData.getReviewScorecards(project, requestor);
    }

    public TestCaseReview[] getTestCaseReview(Project project, TCSubject requestor) {
        return MockupData.getTestCaseReviews(project, requestor);
    }

    public AggregationWorksheet getAggregation(Project project, TCSubject requestor) {
        return MockupData.getAggregation(project, requestor);
    }

    public AggregationReview[] getAggregationReview(Project project, TCSubject requestor) {
        return MockupData.getAggregationReview(project, requestor);
    }

    public FinalFixSubmission getFinalFixSubmission(Project project, TCSubject requestor) {
        return MockupData.getFinalFixSubmission(project, requestor);
    }

    public FinalReview getFinalReview(Project project, TCSubject requestor) {
        return MockupData.getFinalReview(project, requestor);
    }

    public void saveInitialSubmission(InitialSubmission submission, TCSubject requestor) {
    }

    public void saveScreeningScorecard(ScreeningScorecard scorecard, TCSubject requestor) {
    }

    public void saveReviewScorecard(ReviewScorecard scorecard, TCSubject requestor) {
    }

    public void saveTestCaseReview(TestCaseReview tcReview, TCSubject requestor) {
    }

    public void saveAggregation(AggregationWorksheet worksheet, TCSubject requestor) {
    }

    public void saveAggregationReview(AggregationReview aggReview, TCSubject requestor) {
    }

    public void saveFinalFixSubmission(FinalFixSubmission submission, TCSubject requestor) {
    }

    public void saveFinalReview(FinalReview finalReview, TCSubject requestor) {
    }

    public List createScorecards(Project project, long authorId, List scorecardList) {
        return null;
    }

}
