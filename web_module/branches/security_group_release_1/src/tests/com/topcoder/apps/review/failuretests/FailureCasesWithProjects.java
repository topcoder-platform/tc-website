package com.topcoder.apps.review.failuretests;

import com.topcoder.apps.review.document.*;
import com.topcoder.apps.review.projecttracker.*;
import com.topcoder.security.TCSubject;

import junit.framework.Test;
import junit.framework.TestCase;
import junit.framework.TestSuite;

import org.apache.cactus.ServletTestCase;

import java.rmi.*;

import java.sql.*;
import java.net.*;
import java.util.*;

import javax.naming.*;

import javax.rmi.PortableRemoteObject;

import javax.sql.*;

public class FailureCasesWithProjects extends FailureCasesWithData {
    AggregationApproval[] arrAggregationApproval;
    AggregationResponseStatus[] arrAggregationResponseStatus;
    Evaluation[] arrObjEvaluation, arrSubjEvaluation;
    FinalFixStatus[] arrFinalFixStatus;
    ResponseType[] arrResponseType;
    ScorecardSection[] arrScorecardSection;
    TestCaseApproval[] arrTestCaseApproval;


    public FailureCasesWithProjects(String name) {
        super(name);
    }

    public void setUp() throws Exception {
        super.setUp();
        log("Setting up Failure Cases With All Projects Saved");

        AggregationApprovalManager mgrAggregationApproval = new AggregationApprovalManager();
        mgrAggregationApproval.refresh();
        arrAggregationApproval = mgrAggregationApproval.getAggregationApprovals();

        AggregationResponseStatusManager mgrAggregationResponseStatus = new AggregationResponseStatusManager();
        mgrAggregationResponseStatus.refresh();
        arrAggregationResponseStatus = mgrAggregationResponseStatus.getAggregationResponseStatuses();

        EvaluationManager mgrEvaluation = new EvaluationManager();
        mgrEvaluation.refresh();
        arrObjEvaluation = mgrEvaluation.getObjectiveEvaluations();
        arrSubjEvaluation = mgrEvaluation.getSubjectiveEvaluations();

        FinalFixStatusManager mgrFinalFixStatus = new FinalFixStatusManager();
        mgrFinalFixStatus.refresh();
        arrFinalFixStatus = mgrFinalFixStatus.getFinalFixStatuses();

        ResponseTypeManager mgrResponseType = new ResponseTypeManager();
        mgrResponseType.refresh();
        arrResponseType = mgrResponseType.getResponseTypes();

        ScorecardSectionManager mgrScorecardSection = new ScorecardSectionManager();
        mgrScorecardSection.refresh();
        arrScorecardSection = mgrScorecardSection.getScorecardSections();

        TestCaseApprovalManager mgrTestCaseApproval = new TestCaseApprovalManager();
        mgrTestCaseApproval.refresh();
        arrTestCaseApproval = mgrTestCaseApproval.getTestCaseApprovals();

        deleteRows();

        for (int i = 0; i < projects.length; i++) {
            UserRole[] arr = projects[i].getParticipants();
            for (int j = 0; j < arr.length; j++) saveUserRole(arr[j], projects[i]);
            pt.saveProject(projects[i], "Save test", new TCSubject(1));
        }
    }

    final static String url = "gopher://somelocation/fred";
    final static String messagePMReview = "message pm review";
    final static String messagePMScreening = "message pm review";
    final int idxPHASE = 0;
    final int idxROLE = 1;
    final String[] reasons = {
        "The project was in the wrong phase",
        "The acting user did not have the right role",
    };
    List errors = new ArrayList();
    int willfail = (1 << idxPHASE) | (1 << idxROLE);
    long currentRole = -1;

    /**
     *
     *	Run all the test cases together and accumulate the errors
     *
     */
    public void testDocumentManager()
            throws Exception {
        int max = projects.length * users.length;
        for (int i = 0; i < projects.length; i++) {
            for (int j = 0; j < users.length; j++) {
                addInitialSubmission(projects[i], users[j]);
                addFinalFixSubmission(projects[i], users[j]);
                addAggregation(projects[i], users[j]);
                addAggregationReview(projects[i], users[j]);
                addFinalReview(projects[i], users[j]);
                addTestCaseReview(projects[i], users[j]);
                addScreeningScorecard(projects[i], users[j]);
                addReviewScorecard(projects[i], users[j]);
                addFinalReview(projects[i], users[j]);
                log("\ntestDocumentManager: [" + (i * users.length + j + 1) + " / " + max + "]\n");
            }
        }
        if (errors.size() > 0) {
            StringBuffer sb = new StringBuffer();
            for (Iterator it = errors.iterator(); it.hasNext();)
                sb.append(it.next()).append("\n");
            fail(sb.toString());
        }
    }


    void addInitialSubmission(Project project, User submitter)
            throws Exception {
        willfail = requireRole(willfail, project, submitter, 1);
        if (project.getCurrentPhase().getId() == 1) willfail &= ~(1 << idxPHASE);
        try {
            dm.saveInitialSubmission(new InitialSubmission(ident(), new URL(url), messagePMReview,
                    messagePMScreening, submitter, project, false, submitter.getId(), ident()),
                    new TCSubject(submitter.getId()));
        } catch (Exception e) {
            if (willfail != 0) return;
        }
        myfail(willfail, "add initial submission", project);
    }


    void addFinalFixSubmission(Project project, User submitter)
            throws Exception {
        willfail = requireRole(willfail, project, submitter, 1);
        if (project.getCurrentPhase().getId() == 6) willfail &= ~(1 << idxPHASE);
        try {
            dm.saveFinalFixSubmission(new FinalFixSubmission(ident(), new URL(url), messagePMReview,
                    messagePMScreening, submitter, project, false, submitter.getId(), 1),
                    new TCSubject(submitter.getId()));
        } catch (Exception e) {
            if (willfail != 0) return;
        }
        myfail(willfail, "add final fix submission", project);
    }

    void addAggregation(Project project, User aggregator)
            throws Exception {
        AggregationResponse[] aggResponse = new AggregationResponse[0];
        willfail = requireRole(willfail, project, aggregator, 4);
        if (project.getCurrentPhase().getId() == 4 || project.getCurrentPhase().getId() == 5) willfail &= ~(1 << idxPHASE);
        try {
            dm.saveAggregation(
                    new AggregationWorksheet(ident(), false, true, aggregator, aggResponse, project, aggregator.getId(), 1),
                    new TCSubject(aggregator.getId()));
        } catch (Exception e) {
            if (willfail != 0) return;
        }
        myfail(willfail, "add aggregation", project);
    }

    void addAggregationReview(Project project, User reviewer)
            throws Exception {
        AggregationResponse[] aggResponse = new AggregationResponse[0];
        willfail = requireRole(willfail, project, reviewer, 3);
        if (project.getCurrentPhase().getId() == 5) willfail &= ~(1 << idxPHASE);
        try {
            dm.saveAggregationReview(new AggregationReview(ident(),
                    arrAggregationApproval[0],
                    "Aggregation review text",
                    true,
                    new AggregationWorksheet(ident(), false, true, reviewer, aggResponse, project, users[1].getId(), 1),
                    false,
                    reviewer,
                    reviewer.getId(),
                    1),
                    new TCSubject(reviewer.getId()));
        } catch (Exception e) {
            if (willfail != 0) return;
        }
        myfail(willfail, "add aggregation review", project);
    }

    void addFinalReview(Project p, User u)
            throws Exception {
        willfail = requireRole(willfail, p, u, 5);
        if (p.getCurrentPhase().getId() == 7) willfail &= ~(1 << idxPHASE);
        try {
            dm.saveFinalReview(
                    new FinalReview(ident(),
                            new FixItem[0],
                            new AggregationWorksheet(ident(), false, true, u, new AggregationResponse[0], p, users[1].getId(), 1),
                            false,
                            users[1].getId(),
                            ident()),
                    new TCSubject(u.getId()));
        } catch (Exception e) {
            if (willfail != 0) return;
        }
        myfail(willfail, "add save final review", p);
    }

    void addReviewScorecard(Project p, User u)
            throws Exception {
        willfail = requireRole(willfail, p, u, 3);
        if (p.getCurrentPhase().getId() == 3) willfail &= ~(1 << idxPHASE);
        try {
            dm.saveReviewScorecard(
                    new ReviewScorecard(ident(), false, false, new ScorecardQuestion[0], u,
                            p,
                            new InitialSubmission(ident(), new URL(url), messagePMReview,
                                    messagePMScreening, u, p, false, u.getId(), ident()),
                            96.5,
                            u.getId(),
                            ident()),
                    new TCSubject(u.getId()));
        } catch (Exception e) {
            if (willfail != 0) return;
        }
        myfail(willfail, "add save review", p);
    }

    void addScreeningScorecard(Project p, User u)
            throws Exception {
        willfail = requireRole(willfail, p, u, 2);
        if (p.getCurrentPhase().getId() == 2) willfail &= ~(1 << idxPHASE);
        try {
            dm.saveScreeningScorecard(
                    /*
                    ScreeningScorecard(long id, boolean isCompleted, boolean isPMReviewed,
                        ScorecardQuestion[] scorecardQuestion, User author,  Project project,
                        InitialSubmission submission,
                        double score,
                        long requestorId,
                        long versionId)
                    */
                    new ScreeningScorecard(ident(), false, false,
                            new ScorecardQuestion[0], u, p,
                            new InitialSubmission(ident(), new URL(url), messagePMReview,
                                    messagePMScreening, u, p, false, u.getId(), ident()),
                            96.5,
                            u.getId(),
                            ident()),
                    new TCSubject(u.getId()));
        } catch (Exception e) {
            if (willfail != 0) return;
        }
        myfail(willfail, "add screening review", p);
    }


    void addTestCaseReview(Project p, User u)
            throws Exception {
        willfail = requireRole(willfail, p, u, 2);
        if (p.getCurrentPhase().getId() == 2) willfail &= ~(1 << idxPHASE);
        try {
            dm.saveTestCaseReview(
                    new TestCaseReview(ident(), arrTestCaseApproval[1], p,
                            "review text", u, u, true, u.getId(), ident()), new TCSubject(u.getId()));
        } catch (Exception e) {
            if (willfail != 0) return;
        }
        myfail(willfail, "add test case review", p);
    }


    int requireRole(int willfail, Project project, User u, long role_id) {
        UserRole[] ur = project.getParticipants();
        for (int i = 0; i < ur.length; i++) {
            if (ur[i].getUser().getId() == u.getId()) {
                currentRole = ur[i].getRole().getId();
                if (currentRole == role_id) {
                    willfail &= ~(1 << idxROLE);
                    break;
                }
            }
        }
        return willfail;
    }

    void myfail(int mask, String action, Project p) {
        if (mask == 0) return;
        StringBuffer sb = new StringBuffer("Expected an exception for the action ");
        sb.append(action);
        sb.append(" because ");
        for (int i = 0; i < reasons.length; i++) {
            if ((mask & (1 << i)) != 0) sb.append(reasons[i]).append(", ");
        }
        sb.append("Current phase: " + p.getCurrentPhase().getId() + " and current user's role (-1 means none): " + currentRole);
        errors.add(sb.toString());
    }

}