/**
 * Copyright ?2003, TopCoder, Inc. All rights reserved
 */

package com.topcoder.apps.review;

import com.topcoder.apps.review.document.*;
import com.topcoder.apps.review.document.FinalReview;
import com.topcoder.apps.review.document.TestCaseReview;
import com.topcoder.apps.review.projecttracker.*;

import java.net.URL;
import java.util.GregorianCalendar;

/**
 * <p>
 * The mockup data for the testing of FE layer.
 * </p>
 *
 * @author TCSDEVELOPER
 * @version 1.0
 */
public final class FEMockupData {

    // --------------------------------------------------- Instance Variables

    /**
     * The objective evaluations.
     */
    private Evaluation[] objectiveEvals = {
        new Evaluation(1, "Yes", 1),
        new Evaluation(2, "No", 0)
    };

    /**
     * The subjective evaluations.
     */
    private Evaluation[] subjectiveEvals = {
        new Evaluation(1, "Strongly Agree", 4),
        new Evaluation(2, "Agree", 3),
        new Evaluation(3, "Somewhat Agree", 2),
        new Evaluation(4, "Disagree", 1)
    };

    /**
     * The response types.
     */
    private ResponseType[] responseTypes = {
        new ResponseType(1, "Required"),
        new ResponseType(2, "Recommended"),
        new ResponseType(3, "Comment")
    };

    /**
     * The project types.
     */
    private ProjectType[] projectTypes = {
        new ProjectType(1, "Design"),
        new ProjectType(2, "Develop")
    };

    /**
     * The payment statuses.
     */
    private PaymentStatus[] paymentStatuses = {
        new PaymentStatus(1, "Yes"),
        new PaymentStatus(2, "No")
    };

    /**
     * The reviewer responsibilities.
     */
    private ReviewerResponsibility[] reviewerResponsibilities = {
        new ReviewerResponsibility(1, "Accuracy Test"),
        new ReviewerResponsibility(2, "Stress Test"),
        new ReviewerResponsibility(3, "Failure Test")
    };

    /**
     * The phases.
     */
    private Phase[] phases = {
        new Phase(1, 1, "Submission"),
        new Phase(2, 2, "Screening"),
        new Phase(3, 3, "Review"),
        new Phase(4, 4, "Aggregation"),
        new Phase(5, 5, "Agg. Review"),
        new Phase(6, 6, "Final Fixes"),
        new Phase(7, 7, "Final Review")
    };

    /**
     * The test case approvals.
     */
    private TestCaseApproval[] testCaseApprovals = {
        new TestCaseApproval(1, "Approval"),
        new TestCaseApproval(2, "Rejected")
    };

    /**
     * The aggregation approvals.
     */
    private AggregationApproval[] aggregationApprovals = {
        new AggregationApproval(1, "Accept"),
        new AggregationApproval(2, "Reject")
    };

    /**
     * The aggregation response statuses.
     */
    private AggregationResponseStatus[] aggregationResponseStatuses = {
        new AggregationResponseStatus(1, "Accepted"),
        new AggregationResponseStatus(2, "Rejected"),
        new AggregationResponseStatus(3, "Duplicate")
    };

    /**
     * The final fix statuses.
     */
    private FinalFixStatus[] finalFixStatuses = {
        new FinalFixStatus(1, "Completed"),
        new FinalFixStatus(2, "Not Completed")
    };

    /**
     * The roles.
     */
    private Role[] roles = {
        new Role(1, "Designer / Developer"),
        new Role(2, "Screener"),
        new Role(3, "Reviewer"),
        new Role(4, "Aggregator"),
        new Role(5, "FinalReviewer"),
        new Role(6, "Manager"),
        new Role(7, "Removed")
    };

    /**
     * The users.
     */
    private User[] users = {
        new SecurityEnabledUser(1, "pzhao", "peng", "zhao", "peng_zhao2000@yahoo.com", null, null),
        new User(2, "renhc", "huanchun", "ren", "renhc@sina.com"),
        new User(3, "longli", "long", "li", "longli@cs.ubc.ca"),
        new User(4, "xjwu", "xiaojing", "wu", "xjwu@cs.ubc.ca"),
        new User(5, "dxiao", "dan", "xiao", "dxiao@cs.ubc.ca"),
        new User(6, "lzhong", "lin", "zhong", "lzhong@cs.ubc.ca"),
        new SecurityEnabledUser(7, "MModell", "Micah", "Modell", "MModell@topcoder.com", null, null),
        new User(8, "hhh", "ffff", "lllll", "invalid@topcoder.com")
    };

    /**
     * The payment information.
     */
    private PaymentInfo[] paymentInfos = {
        new PaymentInfo(1, 100.0F, paymentStatuses[0], 1),
        new PaymentInfo(2, 200.0F, paymentStatuses[1], 2)
    };

    /**
     * The project status.
     */
    private ProjectStatus[] projectStatuses = {
        new ProjectStatus(1, "In Progress"),
        new ProjectStatus(2, "Terminated"),
        new ProjectStatus(3, "Pending Start")
    };

    /**
     * The user roles.
     */
    private UserRole[] userRoles = {
        new UserRole(1, roles[0], users[0], paymentInfos[0], null, 1),
        new UserRole(2, roles[1], users[0], paymentInfos[1], null, 2),
        new UserRole(3, roles[2], users[0], paymentInfos[0],
                reviewerResponsibilities[0], 3),
        new UserRole(4, roles[2], users[1], paymentInfos[1],
                reviewerResponsibilities[1], 4),
        new UserRole(5, roles[2], users[2], paymentInfos[0],
                reviewerResponsibilities[2], 5),
        new UserRole(6, roles[3], users[0], paymentInfos[1], null, 6),
        new UserRole(7, roles[4], users[0], paymentInfos[0], null, 7),
        new UserRole(8, roles[5], users[6], paymentInfos[1], null, 8),
        new UserRole(9, roles[6], users[7], paymentInfos[0], null, 9)
    };

    /**
     * The review scorecard section groups.
     */
    ScorecardSectionGroup[] reviewSectionGroups = {
        new ScorecardSectionGroup(1, "Minimum Requirements Checklist", 1),
        new ScorecardSectionGroup(2, "Class Diagram", 2),
        new ScorecardSectionGroup(3, "Overall", 3)
    };

    /**
     * The review scorecard sections.
     */
    ScorecardSection[] reviewSections = {
        new ScorecardSection(1, "Component Development", 1, 1, reviewSectionGroups[0]),
        new ScorecardSection(2, "Class Implementation", 1, 2, reviewSectionGroups[1]),
        new ScorecardSection(3, "Code Review", 1, 3, reviewSectionGroups[1]),
        new ScorecardSection(4, "Test Cases", 1, 4, reviewSectionGroups[1]),
        new ScorecardSection(5, "Overall Score", 1, 5, reviewSectionGroups[2])
    };

    /**
     * The review scorecard questions.
     */
    ScorecardQuestion[] reviewQuestions = {
        new ScorecardQuestion(1, null, "Class Diagram exists", 1,
                reviewSections[0], 1, 1, 1),
        new ScorecardQuestion(2, null, "Use-Case Diagram(s) exists covering each public method in the Class Diagram",
                1, reviewSections[0], 2, 1, 2),
        new ScorecardQuestion(3, null, "Sequence Diagram(s) exists", 1,
                reviewSections[0], 3, 1, 3),
        new ScorecardQuestion(4, null, "Component Specification exists", 1,
                reviewSections[0], 4, 1, 4),
        new SubjectiveScorecardQuestion(5, null, "Class Diagram exists", 1,
                reviewSections[1], 1, null, 1, 5),

        new SubjectiveScorecardQuestion(6, null,
                "Provides descriptive overview of class usage",
                1, reviewSections[1], 2, null, 1, 6),
        new SubjectiveScorecardQuestion(7, null,
                "Where applicable sub-packages ahve been created to separate functionality",
                1, reviewSections[1], 3, null, 1, 7),
        new SubjectiveScorecardQuestion(8, null,
                "Class scope properly matches class usage. (ie objects defined as public packages)",
                1, reviewSections[1], 4, null, 1, 8),
        new SubjectiveScorecardQuestion(9, null,
                "Suitable constructors are defined for the component",
                1, reviewSections[1], 5, null, 1, 9),
        new SubjectiveScorecardQuestion(10, null,
                "Class modifiers such as final, static, and abstract are appropriately used where applicable",
                1, reviewSections[1], 6, null, 1, 10),

        new SubjectiveScorecardQuestion(11, null, "Class Diagram exists", 1,
                reviewSections[2], 1, null, 1, 11),
        new SubjectiveScorecardQuestion(12, null,
                "Provides descriptive overview of class usage",
                1, reviewSections[2], 2, null, 1, 12),
        new SubjectiveScorecardQuestion(13, null,
                "Where applicable sub-packages ahve been created to separate functionality",
                1, reviewSections[2], 3, null, 1, 13),

        new SubjectiveScorecardQuestion(14, null,
                "Scope is correctly defined (ie Not everything is public)",
                2, reviewSections[3], 1, null, 1, 14),
        new SubjectiveScorecardQuestion(15, null,
                "Modifiers are properly used where applicable",
                2, reviewSections[3], 2, null, 1, 15),
        new SubjectiveScorecardQuestion(16, null,
                "The required API as stated in the Requirements Specification is available",
                2, reviewSections[3], 3, null, 1, 16),

        new SubjectiveScorecardQuestion(17, null,
                "Overall, this is a quality implementation that meets all requirements.",
                2, reviewSections[4], 1, null, 1, 17)
    };

    /**
     * The screening scorecard section groups.
     */
    ScorecardSectionGroup[] screeningSectionGroups = {
        new ScorecardSectionGroup(1, "Minimum Requirements Checklist", 1),
        new ScorecardSectionGroup(2, "Class Diagram", 2),
        new ScorecardSectionGroup(3, "Overall", 3)
    };

    /**
     * The screening scorecard sections.
     */
    ScorecardSection[] screeningSections = {
        new ScorecardSection(1, "Deliverable", 1, 1, screeningSectionGroups[0]),
        new ScorecardSection(2, "Class Definition", 1, 2, screeningSectionGroups[1]),
        new ScorecardSection(3, "Variable Definition", 1, 3, screeningSectionGroups[1]),
        new ScorecardSection(4, "Method Definition", 1, 4, screeningSectionGroups[1]),
        new ScorecardSection(5, "Overall Score", 1, 5, screeningSectionGroups[2])
    };

    /**
     * The screening scorecard questions.
     */
    ScorecardQuestion[] screeningQuestions = {
        new ScorecardQuestion(1, null, "Class Diagram exists", 1,
                screeningSections[0], 1, 1, 1),
        new ScorecardQuestion(2, null, "Use-Case Diagram(s) exists covering each public method in the Class Diagram",
                1, screeningSections[0], 2, 1, 2),
        new ScorecardQuestion(3, null, "Sequence Diagram(s) exists", 1,
                screeningSections[0], 3, 1, 3),
        new ScorecardQuestion(4, null, "Component Specification exists", 1,
                screeningSections[0], 4, 1, 4),
        new SubjectiveScorecardQuestion(5, null, "Class Diagram exists", 1,
                screeningSections[1], 1, null, 1, 5),

        new SubjectiveScorecardQuestion(6, null,
                "Provides descriptive overview of class usage",
                1, screeningSections[1], 2, null, 1, 6),
        new SubjectiveScorecardQuestion(7, null,
                "Where applicable sub-packages ahve been created to separate functionality",
                1, screeningSections[1], 3, null, 1, 7),
        new SubjectiveScorecardQuestion(8, null,
                "Class scope properly matches class usage. (ie objects defined as public packages)",
                1, screeningSections[1], 4, null, 1, 8),
        new SubjectiveScorecardQuestion(9, null,
                "Suitable constructors are defined for the component",
                1, screeningSections[1], 5, null, 1, 9),
        new SubjectiveScorecardQuestion(10, null,
                "Class modifiers such as final, static, and abstract are appropriately used where applicable",
                1, screeningSections[1], 6, null, 1, 10),

        new SubjectiveScorecardQuestion(11, null, "Class Diagram exists", 1,
                screeningSections[2], 1, null, 1, 11),
        new SubjectiveScorecardQuestion(12, null,
                "Provides descriptive overview of class usage",
                1, screeningSections[2], 2, null, 1, 12),
        new SubjectiveScorecardQuestion(13, null,
                "Where applicable sub-packages ahve been created to separate functionality",
                1, screeningSections[2], 3, null, 1, 13),

        new SubjectiveScorecardQuestion(14, null,
                "Scope is correctly defined (ie Not everything is public)",
                2, screeningSections[3], 1, null, 1, 14),
        new SubjectiveScorecardQuestion(15, null,
                "Modifiers are properly used where applicable",
                2, screeningSections[3], 2, null, 1, 15),
        new SubjectiveScorecardQuestion(16, null,
                "The required API as stated in the Requirements Specification is available",
                2, screeningSections[3], 3, null, 1, 16),

        new SubjectiveScorecardQuestion(17, null,
                "Overall, this is a quality implementation that meets all requirements.",
                2, screeningSections[4], 1, null, 1, 17)
    };

    /**
     * The subjective responses.
     */
    SubjectiveResponse[] subjectiveResponses = {
        new SubjectiveResponse(1, "Best", responseTypes[0], 1),
        new SubjectiveResponse(2, "Better", responseTypes[1], 1),
        new SubjectiveResponse(3, "Good", responseTypes[2], 1),
        new SubjectiveResponse(4, "Bad", responseTypes[0], 1),
        new SubjectiveResponse(5, "Worse", responseTypes[1], 1),
        new SubjectiveResponse(6, "Worst", responseTypes[2], 1)
    };

    /**
     * The aggregation responses.
     */
    AggregationResponse[] aggregationResponses = {
        new AggregationResponse(1, subjectiveResponses[0], null,
                (SubjectiveScorecardQuestion) reviewQuestions[4], users[0], 1),
        new AggregationResponse(2, subjectiveResponses[1], null,
                (SubjectiveScorecardQuestion) reviewQuestions[4], users[0], 1),
        new AggregationResponse(3, subjectiveResponses[2], null,
                (SubjectiveScorecardQuestion) reviewQuestions[4], users[1], 1),
        new AggregationResponse(4, subjectiveResponses[3], null,
                (SubjectiveScorecardQuestion) reviewQuestions[4], users[2], 1),
        new AggregationResponse(5, subjectiveResponses[4], null,
                (SubjectiveScorecardQuestion) reviewQuestions[11], users[0], 1),
        new AggregationResponse(6, subjectiveResponses[5], null,
                (SubjectiveScorecardQuestion) reviewQuestions[13], users[1], 1),
    };

    /**
     * The fix items.
     */
    private FixItem[] fixItems = {
        new FixItem(1, finalFixStatuses[0], aggregationResponses[0], 1),
        new FixItem(2, finalFixStatuses[0], aggregationResponses[1], 2),
        new FixItem(3, finalFixStatuses[0], aggregationResponses[2], 3),
        new FixItem(4, finalFixStatuses[0], aggregationResponses[3], 4),
        new FixItem(5, finalFixStatuses[0], aggregationResponses[4], 5),
        new FixItem(6, finalFixStatuses[0], aggregationResponses[5], 6)
    };

    /**
     * The aggregation worksheet.
     */
    private AggregationWorksheet aggregationWorksheet = null;

    /**
     * The aggregation review.
     */
    private AggregationReview[] aggregationReviews = null;

    /**
     * The final review.
     */
    private FinalReview finalReview = null;

    /**
     * The review scorecards.
     */
    private ReviewScorecard[] reviewScorecards = null;

    /**
     * The screening scorecards.
     */
    private ScreeningScorecard[] screeningScorecards = null;

    /**
     * The test case reviews.
     */
    private TestCaseReview[] testCaseReviews = null;

    /**
     * The phase intances.
     */
    private PhaseInstance[] phaseInstances = null;

    /**
     * The user project infos
     */
    private UserProjectInfo[] userProjectInfos = null;

    /**
     * The projects
     */
    private Project[] projects = null;

    /**
     * The initial submissions.
     */
    private InitialSubmission[] submissions = null;

    // ------------------------------------------------------------ Constructor

    /**
     * Initialize the variables.
     */
    public FEMockupData() {
        try {
            // Phase intances
            phaseInstances = new PhaseInstance[phases.length];

            for (int i = 0; i < phases.length; i++) {
                GregorianCalendar start =
                        new GregorianCalendar(2003, 5, i * 3 + 1);
                GregorianCalendar stop =
                        new GregorianCalendar(2003, 5, i * 3 + 4);
                phaseInstances[i] =
                        new PhaseInstance(i + 1, phases[i], start.getTime(),
                                stop.getTime(), 1);
            }

            // User project infos
            userProjectInfos = new UserProjectInfo[phaseInstances.length];

            for (int i = 0; i < phaseInstances.length; i++) {
                String pName = phaseInstances[i].getPhase().getName()
                        + " project";
                userProjectInfos[i] =
                        new UserProjectInfo(phaseInstances[i].getPhase().getId(),
                                pName, "1." + i, userRoles,
                                phaseInstances[i],
                                projectTypes[i / 5],
                                users[0],
                                projectStatuses[0]);
            }

            // Projects
            projects = new Project[userProjectInfos.length];

            for (int i = 0; i < userProjectInfos.length; i++) {
                projects[i] =
                        new Project(userProjectInfos[i].getId(), 1, 1, 1,
                                userProjectInfos[i].getProjectName(),
                                userProjectInfos[i].getProjectVersion(),
                                users[6], users[0],
                                phaseInstances,
                                userProjectInfos[i].getCurrentPhaseInstance(),
                                userProjectInfos[i].getUserRoles(),
                                "notes notes notes",
                                "overview overview overview",
                                userProjectInfos[i].getProjectType(),
                                projectStatuses[0], true, -1, -1, 1, 1, 100, false);
            }

            // Test case reviews
            testCaseReviews = new TestCaseReview[]{
                new TestCaseReview(1, null, projects[2], null,
                        users[0], users[1], true, 1, 1),
                new TestCaseReview(2, null, projects[2], null,
                        users[0], users[2], true, 2, 1)
            };

            // The initial submissions.
            submissions = new InitialSubmission[2];
            submissions[0] = new InitialSubmission(1,
                    new URL("http://www.cs.ubc.ca/"),
                    "good good good", "ok ok ok", users[1],
                    projects[1], false, -1, -1, false, false, 1, 1);
            submissions[1] = new InitialSubmission(2,
                    new URL("http://www.yahoo.com/"),
                    "good good good", "ok ok ok", users[2],
                    projects[2], false, -1, -1, false, false, 2, 1);

            // The screening scorecards.
            screeningScorecards = new ScreeningScorecard[2];
            screeningScorecards[0] =
                    new ScreeningScorecard(1, false, false, screeningQuestions,
                            users[0], projects[1],
                            submissions[0], 0.0, 1, 1, 0.0, null);
            screeningScorecards[1] =
                    new ScreeningScorecard(2, false, false, screeningQuestions,
                            users[1], projects[1],
                            submissions[1], 0.0, 2, 1, 0.0, null);

            // The review scorecards.
            reviewScorecards = new ReviewScorecard[6];
            reviewScorecards[0] =
                    new ReviewScorecard(1, true, false, reviewQuestions, users[0],
                            projects[2], submissions[0], 60.0, 1, 1, 0.0, null);
            reviewScorecards[1] =
                    new ReviewScorecard(2, false, false, reviewQuestions, users[0],
                            projects[2], submissions[1], 0.0, 2, 1, 0.0, null);
            reviewScorecards[2] =
                    new ReviewScorecard(1, true, false, reviewQuestions, users[1],
                            projects[2], submissions[0], 70.0, 1, 1, 0.0, null);
            reviewScorecards[3] =
                    new ReviewScorecard(2, true, false, reviewQuestions, users[1],
                            projects[2], submissions[1], 50.0, 2, 1, 0.0, null);
            reviewScorecards[4] =
                    new ReviewScorecard(1, true, false, reviewQuestions, users[2],
                            projects[2], submissions[0], 50.0, 1, 1, 0.0, null);
            reviewScorecards[5] =
                    new ReviewScorecard(2, true, false, reviewQuestions, users[2],
                            projects[2], submissions[1], 60.0, 2, 1, 0.0, null);

            // The aggregation worksheet.
            aggregationWorksheet =
                    new AggregationWorksheet(1, false, false, users[0],
                            aggregationResponses, projects[3],
                            1, 1);

            // The aggregation review.
            aggregationReviews = new AggregationReview[3];
            aggregationReviews[0] =
                    new AggregationReview(1, aggregationApprovals[0], null, false,
                            aggregationWorksheet, false, users[0],
                            1, 1);
            aggregationReviews[1] =
                    new AggregationReview(1, aggregationApprovals[0], null, false,
                            aggregationWorksheet, false, users[1],
                            1, 1);
            aggregationReviews[2] =
                    new AggregationReview(1, aggregationApprovals[1], null, false,
                            aggregationWorksheet, false, users[2],
                            1, 1);

            // The final review.
            finalReview = new FinalReview(1, fixItems, aggregationWorksheet,
                    false, 1, 1);
        } catch (Exception e) {
            System.out.println("error........");
        }
    }

    // --------------------------------------------------------- Public Methods

    /**
     * Process the login and return the result.
     *
     * @return the result of login.
     */
    public ResultData login(ActionData data) {
        LoginData loginData = (LoginData) data;
        if (users[0].getHandle().equals(loginData.getUserName())
                && "xxx".equals(loginData.getPassword())) {
            return new LoginResult((SecurityEnabledUser) users[0]);
        } else if (users[6].getHandle().equals(loginData.getUserName())
                && "yyy".equals(loginData.getPassword())) {
            return new LoginResult((SecurityEnabledUser) users[6]);
        }

        return new FailureResult("User and password mismatch");
    }

    /**
     * Return the review scorecard.
     *
     * @return the review scorecard.
     */
    public ResultData reviewScorecard(ActionData data) {
        return new ReviewScorecardRetrieval(reviewScorecards[0]);
    }

    /**
     * Return the screening scorecard.
     *
     * @return the screening scorecard.
     */
    public ResultData screeningScorecard(ActionData data) {
        return new ScreeningScorecardRetrieval(screeningScorecards[0]);
    }

    /**
     * Return the aggregation worksheet.
     *
     * @return the aggregation worksheet.
     */
    public ResultData aggregationWorksheet(ActionData data) {
        aggregationWorksheet =
                new AggregationWorksheet(1, false, false, users[0],
                        aggregationResponses,
                        projects[(int) ((AggregationData) data).getProject().getId() - 1],
                        1, 1);

        return new AggregationWorksheetRetrieval(aggregationWorksheet);
    }

    /**
     * Return the aggregation reviews.
     *
     * @return the aggregation reviews.
     */
    public ResultData aggregationReview(ActionData data) {
        aggregationWorksheet =
                new AggregationWorksheet(1, false, false, users[0],
                        aggregationResponses,
                        projects[(int) ((AggregationReviewData) data).getProject().getId() - 1],
                        1, 1);
        aggregationReviews[0] =
                new AggregationReview(1, aggregationApprovals[0], null, false,
                        aggregationWorksheet, false, users[0],
                        1, 1);
        aggregationReviews[1] =
                new AggregationReview(1, aggregationApprovals[0], null, false,
                        aggregationWorksheet, false, users[1],
                        1, 1);
        aggregationReviews[2] =
                new AggregationReview(1, aggregationApprovals[1], null, false,
                        aggregationWorksheet, false, users[2],
                        1, 1);

        return new AggregationReviewRetrieval(aggregationReviews);
    }

    /**
     * Return the final review.
     *
     * @return the final review.
     */
    public ResultData finalReview(ActionData data) {
        aggregationWorksheet =
                new AggregationWorksheet(1, false, false, users[0],
                        aggregationResponses,
                        projects[(int) ((FinalReviewData) data).getProject().getId() - 1],
                        1, 1);
        finalReview = new FinalReview(1, fixItems, aggregationWorksheet,
                false, 1, 1);

        return new FinalReviewRetrieval(finalReview);
    }

    /**
     * Return the project detail information.
     *
     * @return the project detail information.
     */
    public ResultData projectDetail(ActionData data) {
        long id = ((OnlineReviewProjectData) data).getProject().getId();
        for (int i = 0; i < projects.length; i++) {
            if (projects[i].getId() == id) {
                if (projects[i].getCurrentPhase().getId() == Phase.ID_SCREENING) {
                    return new ProjectRetrieval(projects[i],
                            screeningScorecards,
                            submissions,
                            null,
                            null);
                } else {
                    return new ProjectRetrieval(projects[i],
                            reviewScorecards,
                            submissions,
                            null,
                            null);
                }
            }
        }
        return new FailureResult();
    }

    /**
     * Save the project information.
     *
     * @return the result of saving.
     */
    public ResultData projectAdmin(ActionData data) {
        return new SuccessResult();
    }

    /**
     * Return the my open projects information.
     *
     * @return the my open projects information.
     */
    public ResultData viewMyOpenProjects(ActionData data) {
        String handle = ((OnlineReviewData) data).getUser().getHandle();
        if (users[0].getHandle().equals(handle)
                || users[6].getHandle().equals(handle)) {
            return new ProjectsRetrieval(userProjectInfos);
        } else {
            return new FailureResult();
        }
    }

    /**
     * Return the all projects information.
     *
     * @return the all projects information.
     */
    public ResultData viewAllOpenProjects(ActionData data) {
        String handle = ((OnlineReviewData) data).getUser().getHandle();
        if (users[0].getHandle().equals(handle)
                || users[6].getHandle().equals(handle)) {
            return new ProjectsRetrieval(userProjectInfos);
        } else {
            return new FailureResult();
        }
    }

    /**
     * Return the review scorecard list.
     *
     * @return the review scorecard list.
     */
    public ResultData getReviewList(ActionData data) {
        return new ReviewScorecardsRetrieval(reviewScorecards);
    }

    /**
     * Return the screening scorecard list.
     *
     * @return the screening scorecard list.
     */
    public ResultData getScreeningList(ActionData data) {
        return new ScreeningScorecardsRetrieval(screeningScorecards);
    }

    /**
     * Return the test case review list.
     *
     * @return the test case review list.
     */
    public ResultData testCaseReviews(ActionData data) {
        return new TestCaseReviewRetrieval(testCaseReviews);
    }

    /**
     * Submit the solution.
     *
     * @return the result of submission.
     */
    public ResultData submitSolution(ActionData data) {
        return new SuccessResult();
    }

    /**
     * Submit the final fix.
     *
     * @return the result of submission.
     */
    public ResultData submitFinalFix(ActionData data) {
        return new SuccessResult();
    }

    /**
     * Sent the message to project manager.
     *
     * @return the result of sending.
     */
    public ResultData sendContactPM(ActionData data) {
        return new SuccessResult();
    }

    /**
     * Download the submission file.
     *
     * @param data The input action data.
     * @return the result of submission file download.
     */
    public ResultData submissionDownload(ActionData data) {
        return new FailureResult("The mockup data does not support submission download!");
    }

    // --------------------------------------------------------- Utility Methods

    /**
     * Return the submission list.
     *
     * @return the submission list.
     */
    public ProjectType[] getProjectTypes() {
        return projectTypes;
    }

    /**
     * Return the response types.
     *
     * @return the response types.
     */
    public ResponseType[] getResponseTypes() {
        return responseTypes;
    }

    /**
     * Return the objective evaluations.
     *
     * @return the objective evaluations.
     */
    public Evaluation[] getObjectiveEvaluations() {
        return objectiveEvals;
    }

    /**
     * Return the subjective evaluations.
     *
     * @return the subjective evaluations.
     */
    public Evaluation[] getSubjectiveEvaluations() {
        return subjectiveEvals;
    }

    /**
     * Return the review sections.
     *
     * @return the review sections.
     */
    public ScorecardSection[] getReviewSections() {
        return reviewSections;
    }

    /**
     * Return the screening sections.
     *
     * @return the screening sections.
     */
    public ScorecardSection[] getScreeningSections() {
        return screeningSections;
    }

    /**
     * Return the reviewer responsibilities.
     *
     * @return the reviewer responsibilities.
     */
    public ReviewerResponsibility[] getReviewerResponsibilities() {
        return reviewerResponsibilities;
    }

    /**
     * Return the test case approvals.
     *
     * @return the test case approvals.
     */
    public TestCaseApproval[] getTestCaseApprovals() {
        return testCaseApprovals;
    }

    /**
     * Return the aggregation response statuses.
     *
     * @return the aggregation response statuses.
     */
    public AggregationResponseStatus[] getAggregationResponseStatuses() {
        return aggregationResponseStatuses;
    }

    /**
     * Return the aggregation approvals.
     *
     * @return the aggregation approvals.
     */
    public AggregationApproval[] getAggregationApprovals() {
        return aggregationApprovals;
    }

    /**
     * Return the final fix statuses.
     *
     * @return the final fix statuses.
     */
    public FinalFixStatus[] getFinalFixStatuses() {
        return finalFixStatuses;
    }

    /**
     * Return the payment statuses.
     *
     * @return the payment statuses.
     */
    public PaymentStatus[] getPaymentStatuses() {
        return paymentStatuses;
    }

    /**
     * Return the project statuses.
     *
     * @return the project statuses.
     */
    public ProjectStatus[] getProjectStatuses() {
        return projectStatuses;
    }

    /**
     * Return the user by handle.
     *
     * @return the user according to the handle.
     */
    public User getUserByHandle(String handle) {
        for (int i = 0; i < users.length; i++) {
            if (users[i].getHandle().equals(handle)) {
                return users[i];
            }
        }
        return null;
    }

    /**
     * Return whether the user is admin.
     *
     * @return whether the user is admin.
     */
    public boolean getAdmin(SecurityEnabledUser user) {
        return (users[6].getHandle().equals(user.getHandle()));
    }

    // ------------------------------------------------------- Methods for tests

    public User[] getUsers() {
        return users;
    }

    public UserProjectInfo[] getUserProjectInfos() {
        return userProjectInfos;
    }

    public ScreeningScorecard[] getScreeningScorecards() {
        return screeningScorecards;
    }

    public ReviewScorecard[] getReviewScorecards() {
        return reviewScorecards;
    }

    public TestCaseReview[] getTestCaseReviews() {
        return testCaseReviews;
    }

    public AggregationWorksheet getAggregationWorksheet() {
        return aggregationWorksheet;
    }

    public AggregationReview[] getAggregationReviews() {
        return aggregationReviews;
    }

    public FinalReview getFinalReview() {
        return finalReview;
    }

    public AbstractSubmission[] getSubmissions() {
        return submissions;
    }

    public Project[] getProjects() {
        return projects;
    }

    public ScorecardQuestion[] getScreeningQuestions() {
        return screeningQuestions;
    }

    public ScorecardQuestion[] getReviewQuestions() {
        return reviewQuestions;
    }
}
