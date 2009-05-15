/*
 * ActionDataUtil.java 1.0 9/21/2003
 *
 * Copyright � 2003, TopCoder, Inc. All rights reserved
 */
package com.topcoder.apps.review.failuretests.mockups;

import junit.framework.Test;
import junit.framework.TestCase;
import junit.framework.TestSuite;

import java.io.File;

import com.topcoder.apps.review.*;
import com.topcoder.apps.review.security.*;
import com.topcoder.apps.review.document.*;
import com.topcoder.apps.review.projecttracker.*;
import com.topcoder.apps.review.document.FinalReview;
import com.topcoder.apps.review.document.TestCaseReview;

/**
 * <p>This class provides static utility methods for creating
 * instances of ActionData subclassess.</p>
 *
 * @author kolanovic
 * @version 1.0
 */
public class ActionDataUtil {
    public static LoginData getLoginData(String username, String password) {
        return (new LoginData(username, password) {
        });
    }

    public static OnlineReviewData getOnlineReviewData(
            SecurityEnabledUser user) {
        return (new OnlineReviewData(user) {
        });
    }

    public static OnlineReviewProjectData getOnlineReviewProjectData(
            SecurityEnabledUser user,
            UserProjectInfo info) {
        return (new OnlineReviewProjectData(user, info) {
        });
    }

    public static AggregationData getAggregationData(
            SecurityEnabledUser user,
            UserProjectInfo info,
            AggregationWorksheet worksheet) {
        OnlineReviewProjectData orpd = getOnlineReviewProjectData(user, info);
        return (new AggregationData(orpd, worksheet) {
        });
    }

    public static ContactPMData getContactPMData(
            SecurityEnabledUser user,
            UserProjectInfo info,
            String subject, String text) {
        OnlineReviewProjectData orpd = getOnlineReviewProjectData(user, info);
        return (new ContactPMData(orpd, subject, text) {
        });
    }

    public static FinalReviewData getFinalReviewData(
            SecurityEnabledUser user,
            UserProjectInfo info,
            FinalReview finalReview) {
        OnlineReviewProjectData orpd = getOnlineReviewProjectData(user, info);
        return (new FinalReviewData(orpd, finalReview) {
        });
    }

    public static ProjectData getProjectData(
            SecurityEnabledUser user,
            Project project,
            String reason) {
        OnlineReviewData ord = getOnlineReviewData(user);
        AbstractSubmission[] submissions = new MySubmission[1];
        submissions[0] = new MySubmission(user, project);
        return (new ProjectData(ord, project, reason, submissions) {
        });
    }

    public static ReviewScorecardsData getReviewScorecardsData(
            SecurityEnabledUser user,
            UserProjectInfo info) {
        OnlineReviewProjectData orpd = getOnlineReviewProjectData(user, info);
        return (new ReviewScorecardsData(orpd) {
        });
    }

    public static ScreeningScorecardsData getScreeningScorecardsData(
            SecurityEnabledUser user,
            UserProjectInfo info) {
        OnlineReviewProjectData orpd = getOnlineReviewProjectData(user, info);
        return (new ScreeningScorecardsData(orpd) {
        });
    }

    public static ReviewData getReviewData(
            SecurityEnabledUser user,
            UserProjectInfo info,
            long submitterId,
            long reviewerId,
            ReviewScorecard reviewScorecard) {
        OnlineReviewProjectData orpd = getOnlineReviewProjectData(user, info);
        return (new ReviewData(orpd, submitterId, reviewerId, reviewScorecard) {
        });
    }

    public static ScreeningData getScreeningData(
            SecurityEnabledUser user,
            UserProjectInfo info,
            long submitterId,
            ScreeningScorecard ScreeningScorecard) {
        OnlineReviewProjectData orpd = getOnlineReviewProjectData(user, info);
        return (new ScreeningData(orpd, submitterId, ScreeningScorecard) {
        });
    }

    public static SolutionData getSolutionData(
            SecurityEnabledUser user,
            UserProjectInfo info,
            AbstractSubmission solution,
            File file) {
        OnlineReviewProjectData orpd = getOnlineReviewProjectData(user, info);
        return (new SolutionData(orpd, solution, file) {
        });
    }

    public static TestCaseReviewData getTestCaseReviewData(
            SecurityEnabledUser user,
            UserProjectInfo info,
            TestCaseReview review) {
        OnlineReviewProjectData orpd = getOnlineReviewProjectData(user, info);
        TestCaseReview[] testCaseReviews = new TestCaseReview[1];
        testCaseReviews[0] = review;
        return (new TestCaseReviewData(orpd, testCaseReviews) {
        });
    }
}
