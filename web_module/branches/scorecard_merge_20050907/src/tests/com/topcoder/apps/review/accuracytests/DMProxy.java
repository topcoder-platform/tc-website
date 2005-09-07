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
import com.topcoder.apps.review.document.FinalFixSubmission;
import com.topcoder.apps.review.document.FinalReview;
import com.topcoder.apps.review.document.InitialSubmission;
import com.topcoder.apps.review.document.ReviewScorecard;
import com.topcoder.apps.review.document.ScreeningScorecard;
import com.topcoder.apps.review.document.TestCaseReview;

import java.util.List;

/**
 * An interface defining the behavior od adapter objects that serve as proxies
 * for DocumentManager interface implementations.  By using adapters the
 * differences between submissions can be hidden from the rest of the test
 * suite.
 *
 * @author ThinMan
 * @version 1.0
 */
interface DMProxy {

    InitialSubmission[] getInitialSubmission(Project project, User requestor);

    void saveSubmission(InitialSubmission submission, User requestor)
            throws Exception;

    ScreeningScorecard[] getScreeningScorecard(Project project,
                                               User requestor);

    void saveScreeningScorecard(ScreeningScorecard scorecard, User requestor)
            throws Exception;

    ReviewScorecard getReviewScorecard(Project project, long reviewerId,
                                       long submitterId, User requestor);

    ReviewScorecard[] getReviewScorecard(Project project, User requestor);

    void saveReviewScorecard(ReviewScorecard scorecard, User requestor)
            throws Exception;

    TestCaseReview[] getTestCaseReview(Project project, User requestor);

    void saveTestCaseReview(TestCaseReview tcReview, User requestor)
            throws Exception;

    AggregationWorksheet getAggregation(Project project, User requestor);

    void saveAggregation(AggregationWorksheet worksheet, User requestor)
            throws Exception;

    AggregationReview[] getAggregationReview(Project project, User requestor);

    void saveAggregationReview(AggregationReview aggReview, User requestor)
            throws Exception;

    FinalFixSubmission getFinalFixes(Project project, User requestor);

    void saveFinalFixSubmission(FinalFixSubmission submission, User requestor)
            throws Exception;

    FinalReview getFinalReview(Project project, User requestor);

    void saveFinalReview(FinalReview finalReview, User requestor)
            throws Exception;

    void remove() throws Exception;
}

