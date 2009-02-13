/*
 * ActionDataFactory.java
 *
 * Created on August 17, 2003, 1:01 PM
 */

package com.topcoder.apps.review;

import com.topcoder.apps.review.document.*;
import com.topcoder.apps.review.projecttracker.*;
import com.topcoder.apps.review.accuracytests.ejb.*;

import java.io.File;

/**
 *
 * @author  valeriy_p
 */
public class ActionDataFactory {

    /** Creates a new instance of ActionDataFactory */
    public ActionDataFactory() {
    }

    public static OnlineReviewData getOnlineReviewData(SecurityEnabledUser user) {
        return new OnlineReviewData(user);
    }

    public static OnlineReviewProjectData getOnlineReviewProjectData(SecurityEnabledUser user, UserProjectInfo info) {
        return new OnlineReviewProjectData(user, info);
    }

    public static SolutionData getSolutionData(OnlineReviewProjectData orpd,
                                               AbstractSubmission solution,
                                               File file) {
        return new SolutionData(orpd, solution, file);
    }

    public static AggregationData getAggregationData(OnlineReviewProjectData orpd,
                                                     AggregationWorksheet worksheet) {
        return new AggregationData(orpd, worksheet);
    }

    public static AggregationReviewData getAggregationReviewData(OnlineReviewProjectData orpd,
                                                                 AggregationReview worksheet) {
        return new AggregationReviewData(orpd, worksheet);
    }

    public static ReviewData getReviewData(OnlineReviewProjectData orpd,
                                           long submitterId, long reviewerId,
                                           ReviewScorecard reviewScorecard) {
        return new ReviewData(orpd, submitterId, reviewerId, reviewScorecard);
    }

    public static ProjectData getProjectData(OnlineReviewData ord, Project project,
                                             String reason, AbstractSubmission[] submissions) {
        return new ProjectData(ord, project, reason, submissions);
    }

    public static FinalReviewData getFinalReviewData(OnlineReviewProjectData orpd,
                                                     com.topcoder.apps.review.document.FinalReview finalReview) {
        return new FinalReviewData(orpd, finalReview);
    }

    public static LoginData getLoginData(String userName, String password) {
        return new LoginData(userName, password);
    }

    public static ReviewScorecardsData getReviewScorecardsData(OnlineReviewProjectData orpd) {
        return new ReviewScorecardsData(orpd);
    }

    public static ScreeningScorecardsData getScreeningScorecardsData(OnlineReviewProjectData orpd) {
        return new ScreeningScorecardsData(orpd);
    }

    public static ScreeningData getScreeningData(OnlineReviewProjectData orpd,
                                                 long submitterId, ScreeningScorecard reviewScorecard) {
        return new ScreeningData(orpd, submitterId, reviewScorecard);
    }

    public static TestCaseReviewData getTestCaseReviewData(OnlineReviewProjectData orpd,
                                                           com.topcoder.apps.review.document.TestCaseReview[] reviewScorecard) {
        return new TestCaseReviewData(orpd, reviewScorecard);
    }

    public static void setTestMode(boolean mode) {
        EJBHelper.setTestMode(mode);
    }

    public static void setMockupClasses(String[] classNames) {
        EJBHelper.setMockupClasses(classNames);
    }

    public static LoginLocalTester getLoginTester() throws Exception {
        return (LoginLocalTester) EJBHelper.getLogin();
    }

    public static PolicyLocalTester getPolicyTester() throws Exception {
        return (PolicyLocalTester) EJBHelper.getPolicy();
    }

    public static UserManagerTester getUserTester() throws Exception {
        return (UserManagerTester) EJBHelper.getUserManager();
    }

    public static ProjectTrackerTester getProjectTester() throws Exception {
        return (ProjectTrackerTester) EJBHelper.getProjectTracker();
    }

    public static DocumentManagerTester getDocumentTester() throws Exception {
        return (DocumentManagerTester) EJBHelper.getDocumentManager();
    }
}
