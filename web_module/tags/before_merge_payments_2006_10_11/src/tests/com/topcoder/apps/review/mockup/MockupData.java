/**
 * Copyright � 2003, TopCoder, Inc. All rights reserved
 */
package com.topcoder.apps.review.mockup;

import com.topcoder.apps.review.document.AggregationApproval;
import com.topcoder.apps.review.document.AggregationResponse;
import com.topcoder.apps.review.document.AggregationReview;
import com.topcoder.apps.review.document.AggregationWorksheet;
import com.topcoder.apps.review.document.Evaluation;
import com.topcoder.apps.review.document.FinalFixSubmission;
import com.topcoder.apps.review.document.FinalReview;
import com.topcoder.apps.review.document.FixItem;
import com.topcoder.apps.review.document.InitialSubmission;
import com.topcoder.apps.review.document.ReviewScorecard;
import com.topcoder.apps.review.document.ScorecardQuestion;
import com.topcoder.apps.review.document.ScorecardSection;
import com.topcoder.apps.review.document.ScorecardSectionGroup;
import com.topcoder.apps.review.document.ScreeningScorecard;
import com.topcoder.apps.review.document.SubjectiveScorecardQuestion;
import com.topcoder.apps.review.document.TestCaseApproval;
import com.topcoder.apps.review.document.TestCaseReview;
import com.topcoder.apps.review.document.TestCaseScorecardQuestion;
import com.topcoder.apps.review.projecttracker.PaymentInfo;
import com.topcoder.apps.review.projecttracker.PaymentStatus;
import com.topcoder.apps.review.projecttracker.Phase;
import com.topcoder.apps.review.projecttracker.PhaseInstance;
import com.topcoder.apps.review.projecttracker.Project;
import com.topcoder.apps.review.projecttracker.ProjectStatus;
import com.topcoder.apps.review.projecttracker.ProjectType;
import com.topcoder.apps.review.projecttracker.ReviewerResponsibility;
import com.topcoder.apps.review.projecttracker.Role;
import com.topcoder.apps.review.projecttracker.SecurityEnabledUser;
import com.topcoder.apps.review.projecttracker.User;
import com.topcoder.apps.review.projecttracker.UserProjectInfo;
import com.topcoder.apps.review.projecttracker.UserRole;
import com.topcoder.apps.review.security.AdminPermission;
import com.topcoder.apps.review.security.AggregationPermission;
import com.topcoder.apps.review.security.FinalReviewPermission;
import com.topcoder.apps.review.security.ReviewPermission;
import com.topcoder.apps.review.security.ScreenPermission;
import com.topcoder.apps.review.security.SubmitFinalFixPermission;
import com.topcoder.apps.review.security.SubmitPermission;
import com.topcoder.apps.review.security.ViewProjectPermission;
import com.topcoder.security.RolePrincipal;
import com.topcoder.security.TCSubject;
import com.topcoder.security.policy.PermissionCollection;
import com.topcoder.security.policy.TCPermission;

import java.io.File;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.Date;

/**
 * Mockup data used in the unit tests.
 *
 * @author adic
 * @version 1.0
 */
public class MockupData {

    // hardcoded mockup data

    public static PermissionCollection permcol = new PermissionCollection();
    public static SecurityEnabledUser admin1 = new SecurityEnabledUser(1, "marc", "Marc", "Grzeskowiak", "MGrzeskowiak@topcoder.com", permcol, new TCSubject(1));
    public static SecurityEnabledUser admin2 = new SecurityEnabledUser(2, "dave", "David", "Messinger", "DMessinger@topcoder.com", permcol, new TCSubject(2));
    public static SecurityEnabledUser user1 = new SecurityEnabledUser(3, "user1", "user1", "user1", "user1@topcoder.com", permcol, new TCSubject(3));
    public static SecurityEnabledUser user2 = new SecurityEnabledUser(4, "user2", "user2", "user2", "user2@topcoder.com", permcol, new TCSubject(4));
    public static SecurityEnabledUser user3 = new SecurityEnabledUser(5, "user3", "user3", "user3", "user3@topcoder.com", permcol, new TCSubject(5));
    public static SecurityEnabledUser user4 = new SecurityEnabledUser(6, "user4", "user4", "user4", "user4@topcoder.com", permcol, new TCSubject(6));
    public static SecurityEnabledUser user5 = new SecurityEnabledUser(7, "user5", "user5", "user5", "user5@topcoder.com", permcol, new TCSubject(7));
    public static SecurityEnabledUser[] admins = {admin1, admin2};
    public static SecurityEnabledUser[] users = {admin1, admin2, user1, user2, user3, user4, user5};

    public static Phase[] phs = {
        new Phase(Phase.ID_SUBMISSION, "submission"),
        new Phase(Phase.ID_SCREENING, "screening"),
        new Phase(Phase.ID_REVIEW, "review"),
        new Phase(Phase.ID_AGGREGATION, "aggregation"),
        new Phase(Phase.ID_FINAL_FIXES, "final fixes"),
        new Phase(Phase.ID_FINAL_REVIEW, "final review")
    };
    public static PhaseInstance[] phases = {
        new PhaseInstance(1, phs[0], new Date(), new Date(), 0),
        new PhaseInstance(2, phs[1], new Date(), new Date(), 0),
        new PhaseInstance(3, phs[2], new Date(), new Date(), 0),
        new PhaseInstance(4, phs[3], new Date(), new Date(), 0),
        new PhaseInstance(5, phs[4], new Date(), new Date(), 0),
        new PhaseInstance(6, phs[5], new Date(), new Date(), 0)
    };
    public static PhaseInstance iphase = phases[1];
    public static ProjectType projtype = new ProjectType(1, "Design");
    public static ProjectStatus projstatus = new ProjectStatus(ProjectStatus.ID_IN_PROGRESS, "in progress");

    public static Role rsubmitter = new Role(Role.ID_DESIGNER_DEVELOPER, "submitter");
    public static Role rscreener = new Role(Role.ID_PRIMARY_SCREENER, "screener");
    public static Role rreviewer = new Role(Role.ID_REVIEWER, "reviewer");
    public static Role raggregator = new Role(Role.ID_AGGREGATOR, "aggregator");
    public static Role rfinalreviewer = new Role(Role.ID_FINAL_REVIEWER, "finalreviewer");
    //public static Role radmin = new Role(Role.ID_ADMIN, "admin");
    public static Role rproductmanager = new Role(Role.ID_PRODUCT_MANAGER, "productmanager");


    public static ReviewerResponsibility rracuracy = new ReviewerResponsibility(1, "Accuracy");
    public static ReviewerResponsibility rrfailure = new ReviewerResponsibility(2, "Failure");
    public static ReviewerResponsibility rrstress = new ReviewerResponsibility(3, "Stress");

    public static PaymentInfo payment = new PaymentInfo(1, 100.0f, new PaymentStatus(1, "not payed"), 0);
    public static UserRole[] p1userroles = {
        new UserRole(2, rproductmanager, admin1, payment, null, 0),
        new UserRole(3, rsubmitter, user3, payment, null, 0),
        new UserRole(4, rscreener, user1, payment, null, 0),
        new UserRole(5, rreviewer, user1, payment, rracuracy, 0),
        new UserRole(6, rreviewer, user4, payment, rrfailure, 0),
        new UserRole(7, rreviewer, user5, payment, rrstress, 0),
        new UserRole(8, raggregator, user1, payment, null, 0),
        new UserRole(9, rfinalreviewer, user1, payment, null, 0),
    };
    public static UserRole[] p2userroles = {
        new UserRole(2, rproductmanager, admin1, payment, null, 0),
    };
    public static UserRole[] pxuserroles = {
        new UserRole(2, rproductmanager, admin2, payment, null, 0),
    };

    public static Project proj1 = new Project(1, 1, 1, 1, "component1", "1.0", admin1, user3, phases, iphase, p1userroles, "", "", projtype, projstatus, false, 0, 0);
    public static Project proj2 = new Project(2, 2, 2, 2, "component2", "1.1", admin1, user3, phases, iphase, p2userroles, "", "", projtype, projstatus, false, 0, 0);
    public static Project proj3 = new Project(3, 3, 3, 3, "component3", "2.0", admin2, user3, phases, iphase, pxuserroles, "", "", projtype, projstatus, false, 0, 0);
    public static Project proj4 = new Project(4, 4, 4, 4, "component4", "3.0", admin2, user2, phases, iphase, pxuserroles, "", "", projtype, projstatus, false, 0, 0);
    public static Project proj5 = new Project(5, 5, 5, 5, "component5", "1.2", admin2, user2, phases, iphase, pxuserroles, "", "", projtype, projstatus, false, 0, 0);
    public static Project[] projects = {proj1, proj2, proj3, proj4, proj5};

    public static UserProjectInfo projinfo1 = new UserProjectInfo(1, "component1", "1.0", p1userroles, iphase, projtype, user3, projstatus);
    public static UserProjectInfo projinfo2 = new UserProjectInfo(2, "component2", "1.0", p2userroles, iphase, projtype, user3, projstatus);
    public static UserProjectInfo projinfo3 = new UserProjectInfo(3, "component3", "1.0", pxuserroles, iphase, projtype, user3, projstatus);
    public static UserProjectInfo projinfo4 = new UserProjectInfo(4, "component4", "1.0", pxuserroles, iphase, projtype, user2, projstatus);
    public static UserProjectInfo projinfo5 = new UserProjectInfo(5, "component5", "1.0", pxuserroles, iphase, projtype, user2, projstatus);
    public static UserProjectInfo[] projinfos = {projinfo1, projinfo2, projinfo3, projinfo4, projinfo5};

    public static URL url = null;

    {
        try {
            url = new File("test_files/test.jar").toURL();
        } catch (MalformedURLException e) {
        }
    }

    public static Evaluation ev1 = new Evaluation(1, "bad", 1);
    public static Evaluation ev2 = new Evaluation(2, "it does", 2);
    public static Evaluation ev3 = new Evaluation(3, "good", 3);
    public static Evaluation ev4 = new Evaluation(4, "very good", 4);
    public static Evaluation ev5 = new Evaluation(5, "yes", 0);
    public static Evaluation ev6 = new Evaluation(6, "no", 0);
    public static ScorecardSectionGroup group = new ScorecardSectionGroup(1, "group", 0);
    public static ScorecardSection section = new ScorecardSection(1, "section", 80, 0, group);
    public static ScorecardSection section2 = new ScorecardSection(2, "section2", 20, 0, group);
    public static ScorecardSection section3 = new ScorecardSection(3, "section3", 20, 0, group);
    public static ScorecardQuestion question1 = new SubjectiveScorecardQuestion(1, ev1, "question1", 30, section, 0, null, 0, 0);
    public static ScorecardQuestion question2 = new SubjectiveScorecardQuestion(2, ev2, "question2", 40, section, 0, null, 0, 0);
    public static ScorecardQuestion question3 = new SubjectiveScorecardQuestion(3, ev3, "question3", 50, section2, 0, null, 0, 0);
    public static ScorecardQuestion question4 = new SubjectiveScorecardQuestion(4, ev4, "question4", 70, section2, 0, null, 0, 0);
    public static ScorecardQuestion question5 = new TestCaseScorecardQuestion(5, ev1, "question5", 30, section3, 0, null, 15, 19, 0, 0);
    public static ScorecardQuestion question6 = new TestCaseScorecardQuestion(6, ev2, "question6", 55, section3, 0, null, 55, 60, 0, 0);
    public static ScorecardQuestion question7 = new ScorecardQuestion(6, ev6, "question6", 55, section3, 0, 0, 0);
    public static ScorecardQuestion[] questions = new ScorecardQuestion[]{question1, question2, question3, question4, question5, question6}; //, question7};

    public static InitialSubmission submission = new InitialSubmission(1, url, "", "", user3, proj1, false, 0, 0);
    public static ScreeningScorecard screening = new ScreeningScorecard(2, true, true, questions, user1, proj1, submission, 95.34, 0, 0);
    public static ReviewScorecard review1 = new ReviewScorecard(3, true, true, questions, user1, proj1, submission, 91.33, 0, 0);
    public static ReviewScorecard review2 = new ReviewScorecard(4, true, true, questions, user4, proj1, submission, 90.12, 0, 0);
    public static ReviewScorecard review3 = new ReviewScorecard(5, !false, true, questions, user5, proj1, submission, 95.44, 0, 0);
    public static TestCaseReview testreview = new TestCaseReview(0, new TestCaseApproval(1, "yes"), proj1, "", user1, user3, true, user1.getId(), 0);
    public static AggregationWorksheet aggregation = new AggregationWorksheet(6, false, true, user1, new AggregationResponse[0], proj1, 0, 0);
    public static AggregationReview aggregationreview = new AggregationReview(7, new AggregationApproval(1, "yes"), "", true, aggregation, false, user1, 0, 0);
    public static FinalFixSubmission finalfix = new FinalFixSubmission(1, url, "", "", user3, proj1, false, 0, 0);
    public static FinalReview finalreview = new FinalReview(1, new FixItem[0], aggregation, false, user1.getId(), 0);

    public static ReviewScorecard[] reviews = {review1, review2, review3};

    public static Object[][] permissions = {
        {admin1, new AdminPermission()},
        {admin2, new AdminPermission()},

        {user1, new ViewProjectPermission(proj1.getId())},
        {user1, new ScreenPermission(proj1.getId())},
        {user1, new ReviewPermission(proj1.getId())},
        {user1, new AggregationPermission(proj1.getId())},
        {user1, new FinalReviewPermission(proj1.getId())},

        {user4, new ViewProjectPermission(proj1.getId())},
        {user4, new ReviewPermission(proj1.getId())},
        {user5, new ViewProjectPermission(proj1.getId())},
        {user5, new ReviewPermission(proj1.getId())},

        {user3, new ViewProjectPermission(proj1.getId())},
        {user3, new SubmitPermission(proj1.getId())},
        {user3, new SubmitFinalFixPermission(proj1.getId())},

        {user1, new ViewProjectPermission(proj2.getId())},
        {user1, new ViewProjectPermission(proj3.getId())},
        {user2, new ViewProjectPermission(proj4.getId())},
        {user2, new ViewProjectPermission(proj5.getId())},

        {admin1, new ViewProjectPermission(proj1.getId())},
        {admin1, new ViewProjectPermission(proj2.getId())},
        {admin2, new ViewProjectPermission(proj3.getId())},
        {admin2, new ViewProjectPermission(proj4.getId())},
        {admin2, new ViewProjectPermission(proj5.getId())},
    };

    public static RolePrincipal[] rolePrincipals = {
        new RolePrincipal("component1 1.0 Design View Project", 1),
        new RolePrincipal("component1 1.0 Design Submit", 2),
        new RolePrincipal("component1 1.0 Design Screen", 3),
        new RolePrincipal("component1 1.0 Design Review", 4),
        new RolePrincipal("component1 1.0 Design Aggregation", 5),
        new RolePrincipal("component1 1.0 Design Submit Final Fix", 6),
        new RolePrincipal("component1 1.0 Design Final Review", 7),
    };

    // methods

    static User login(String user, String pass) {
        if (pass.equals("secret")) {
            for (int i = 0; i < users.length; i++) {
                if (users[i].getHandle().equals(user)) {
                    return users[i];
                }
            }
        }
        return null;
    }

    static boolean checkPermission(TCSubject user, TCPermission perm) {
        for (int i = 0; i < permissions.length; i++) {
            User iuser = (User) permissions[i][0];
            TCPermission iperm = (TCPermission) permissions[i][1];
            if (iuser.getId() == user.getUserId() && iperm.equals(perm)) {
                return true;
            }
        }
        return false;
    }

    static SecurityEnabledUser getUser(long id) {
        for (int i = 0; i < users.length; i++) {
            if (users[i].getId() == id) {
                return users[i];
            }
        }
        return null;
    }

    static SecurityEnabledUser getUser(String handle) {
        for (int i = 0; i < users.length; i++) {
            if (users[i].getHandle().equals(handle)) {
                return users[i];
            }
        }
        return null;
    }

    static SecurityEnabledUser getUser(TCSubject user) {
        return getUser(user.getUserId());
    }

    static boolean isAdmin(TCSubject user) {
        for (int i = 0; i < admins.length; i++) {
            if (user.getUserId() == admins[i].getId()) return true;
        }
        return false;
    }

    static UserProjectInfo[] getProjects(TCSubject user) {
        if (isAdmin(user)) return (UserProjectInfo[]) projinfos.clone();
        UserProjectInfo[] result = new UserProjectInfo[projinfos.length];
        int j = 0;
        for (int i = 0; i < projinfos.length; i++) {
            for (int k = 0; k < permissions.length; k++) {
                User iuser = (User) permissions[k][0];
                TCPermission iperm = (TCPermission) permissions[k][1];
                if (user.getUserId() == iuser.getId() && new ViewProjectPermission(projinfos[i].getId()).equals(iperm)) {
                    result[j++] = projinfos[i];
                    break;
                }
            }
        }
        UserProjectInfo[] finalresult = new UserProjectInfo[j];
        System.arraycopy(result, 0, finalresult, 0, j);
        return finalresult;
    }

    public static Project getProject(long id) {
        for (int i = 0; i < projects.length; i++) {
            if (projects[i].getId() == id) {
                return projects[i];
            }
        }
        return null;
    }

    public static InitialSubmission[] getInitialSubmissions(Project project, TCSubject requestor) {
        if (project == proj1) {
            return new InitialSubmission[]{submission};
        } else {
            return new InitialSubmission[0];
        }
    }

    public static ScreeningScorecard[] getScreeningScorecards(Project project, TCSubject requestor) {
        if (project == proj1) {
            return new ScreeningScorecard[]{screening};
        } else {
            return new ScreeningScorecard[0];
        }
    }

    public static ReviewScorecard[] getReviewScorecards(Project project, TCSubject requestor) {
        if (project == proj1) {
            return new ReviewScorecard[]{review1, review2, review3};
        } else {
            return new ReviewScorecard[0];
        }
    }

    public static ReviewScorecard getReviewScorecard(long submitterId, long projectId, long reviewerId, TCSubject requestor) {
        for (int i = 0; i < reviews.length; i++) {
            if (reviews[i].getSubmission().getSubmitter().getId() == submitterId
                    && reviews[i].getProject().getId() == projectId
                    && reviews[i].getAuthor().getId() == reviewerId) {
                return reviews[i];
            }
        }
        return null;
    }

    public static TestCaseReview[] getTestCaseReviews(Project project, TCSubject requestor) {
        if (project == proj1) {
            return new TestCaseReview[]{testreview};
        } else {
            return new TestCaseReview[0];
        }
    }

    public static AggregationWorksheet getAggregation(Project project, TCSubject requestor) {
        if (project == proj1) {
            return aggregation;
        } else {
            return new AggregationWorksheet(6, false, false, getUser(requestor), null, project, 0, 0);
        }
    }

    public static AggregationReview[] getAggregationReview(Project project, TCSubject requestor) {
        if (project == proj1) {
            return new AggregationReview[]{aggregationreview};
        } else {
            return new AggregationReview[]{new AggregationReview(7, null, "", false, getAggregation(project, requestor), false, getUser(requestor), 0, 0)};
        }
    }

    public static FinalFixSubmission getFinalFixSubmission(Project project, TCSubject requestor) {
        if (project == proj1) {
            return finalfix;
        } else {
            return new FinalFixSubmission(1, url, "", "", getUser(requestor), project, false, 0, 0);
        }
    }

    public static FinalReview getFinalReview(Project project, TCSubject requestor) {
        if (project == proj1) {
            return finalreview;
        } else {
            return new FinalReview(1, null, aggregation, false, user1.getId(), 0);
        }
    }

}

