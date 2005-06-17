/*
 * AbstractAccuracyTest.java
 *
 * Created on July 6, 2003, 6:19 PM
 */

package com.topcoder.apps.review.accuracytests;

import com.topcoder.apps.review.accuracytests.ejb.*;
import com.topcoder.apps.review.*;
import com.topcoder.apps.review.security.*;
import junit.framework.TestCase;

import javax.naming.*;
import java.lang.reflect.*;

import com.topcoder.security.TCSubject;
import com.topcoder.security.login.*;
import com.topcoder.security.policy.*;
import com.topcoder.apps.review.document.*;
import com.topcoder.apps.review.document.TestCaseReview;
import com.topcoder.apps.review.document.FinalReview;
import com.topcoder.apps.review.projecttracker.*;

import java.sql.Date;


/**
 *
 * @author  valeriy
 */
public abstract class AbstractAccuracyTest extends TestCase {

    public static final long PROJECT_ID = 1;
    public static final long COMP_ID = 2;
    public static final long COMPVER_ID = 1;

    protected Context context = new TestingContext();
    protected SecurityEnabledUser pm;
    protected SecurityEnabledUser previewer;
    protected SecurityEnabledUser reviewer;
    protected SecurityEnabledUser submitter;
    protected SecurityEnabledUser winner;
    protected SecurityEnabledUser unkn;
    protected Project project;
    protected UserProjectInfo info;
    protected Phase[] phases = new Phase[]{new Phase(Phase.ID_SUBMISSION, "submit"),
                                           new Phase(Phase.ID_SCREENING, "screening"),
                                           new Phase(Phase.ID_REVIEW, "review"),
                                           new Phase(Phase.ID_REVIEW, "testcase"),
                                           new Phase(Phase.ID_AGGREGATION, "aggr"),
                                           new Phase(Phase.ID_AGGREGATION_REVIEW, "aggrRev"),
                                           new Phase(Phase.ID_FINAL_FIXES, "finalFix"),
                                           new Phase(Phase.ID_FINAL_REVIEW, "finalRev"),
                                           new Phase(Phase.ID_COMPONENT_PREPARATION, "complete")};
    protected PhaseInstance[] phi = new PhaseInstance[]{
        new PhaseInstance(0, phases[0], new Date(0), new Date(0), 0),
        new PhaseInstance(1, phases[1], new Date(0), new Date(0), 0),
        new PhaseInstance(2, phases[2], new Date(0), new Date(0), 0),
        new PhaseInstance(3, phases[3], new Date(0), new Date(0), 0),
        new PhaseInstance(4, phases[4], new Date(0), new Date(0), 0),
        new PhaseInstance(5, phases[5], new Date(0), new Date(0), 0),
        new PhaseInstance(6, phases[6], new Date(0), new Date(0), 0),
        new PhaseInstance(7, phases[7], new Date(0), new Date(0), 0),
        new PhaseInstance(8, phases[8], new Date(0), new Date(0), 0),
    };
    protected UserRole[] roles;
    protected java.net.URL submURL;
    InitialSubmission[] initialSubmission = new InitialSubmission[2];
    ScreeningScorecard[] screeningScorecards = new ScreeningScorecard[2];
    ReviewScorecard[] reviewScorecards = new ReviewScorecard[4];
    TestCaseReview[] testCaseReview = new TestCaseReview[2];
    AggregationWorksheet aggregationWorksheet;
    FinalFixSubmission finalFixSubmission;
    AggregationReview aggregationReview;
    FinalReview finalReview;

    /** Creates a new instance of AbstractAccuracyTest */
    public AbstractAccuracyTest(String name) {
        super(name);
    }

    public void setUp() throws Exception {
        ActionDataFactory.setTestMode(true);
        ActionDataFactory.setMockupClasses(new String[]{
            "com.topcoder.apps.review.accuracytests.ejb.LoginLocalTester",
            "com.topcoder.apps.review.accuracytests.ejb.PolicyLocalTester",
            "com.topcoder.apps.review.accuracytests.ejb.PolicyMgrLocalTester",
            "com.topcoder.apps.review.mockup.PrincipalManagerMockup",
            "com.topcoder.apps.review.accuracytests.ejb.DocumentManagerTester",
            "com.topcoder.apps.review.accuracytests.ejb.ProjectTrackerTester",
            "com.topcoder.apps.review.accuracytests.ejb.UserManagerTester"
        });
    }

    public void setUpUsers() throws Exception {
        pm = getUserTester().getUser(new TCSubject(0));
        previewer = getUserTester().getUser(new TCSubject(1));
        reviewer = getUserTester().getUser(new TCSubject(2));
        submitter = getUserTester().getUser(new TCSubject(3));
        winner = getUserTester().getUser(new TCSubject(4));
        unkn = getUserTester().getUser(new TCSubject(5));
    }

    public void setUpPolicy() throws Exception {
        PolicyLocalTester tester = getPolicyTester();
        PermissionCollection pc = new PermissionCollection();
        pc.addPermission(new AdminPermission());
        tester.addUser(new TCSubject(pm.getId()), pc);

        pc = new PermissionCollection();
        pc.addPermission(new AggregationPermission(PROJECT_ID));
        pc.addPermission(new FinalReviewPermission(PROJECT_ID));
        pc.addPermission(new ReviewPermission(PROJECT_ID));
        pc.addPermission(new ScreenPermission(PROJECT_ID));
        pc.addPermission(new ViewProjectPermission(PROJECT_ID));
        tester.addUser(new TCSubject(previewer.getId()), pc);

        pc = new PermissionCollection();
        pc.addPermission(new ReviewPermission(PROJECT_ID));
        pc.addPermission(new ViewProjectPermission(PROJECT_ID));
        tester.addUser(new TCSubject(reviewer.getId()), pc);

        pc = new PermissionCollection();
        pc.addPermission(new SubmitPermission(PROJECT_ID));
        pc.addPermission(new ViewProjectPermission(PROJECT_ID));
        tester.addUser(new TCSubject(submitter.getId()), pc);

        pc = new PermissionCollection();
        pc.addPermission(new SubmitPermission(PROJECT_ID));
        pc.addPermission(new SubmitFinalFixPermission(PROJECT_ID));
        pc.addPermission(new ViewProjectPermission(PROJECT_ID));
        tester.addUser(new TCSubject(winner.getId()), pc);
    }

    public void setUpProjects() throws Exception {
        PolicyLocalTester policy = getPolicyTester();
        ProjectTrackerTester tester = getProjectTester();
        submURL = new java.io.File("test_files/test.jar").toURL();
        roles = new UserRole[8];
        roles[0] = new UserRole(0, new Role(Role.ID_PRODUCT_MANAGER, "pm"), pm, null, null, 0);
        roles[1] = new UserRole(1, new Role(Role.ID_PRIMARY_SCREENER, "reviewer"), previewer, null, null, 0);
        roles[2] = new UserRole(2, new Role(Role.ID_REVIEWER, "reviewer"), previewer, null, null, 0);
        roles[3] = new UserRole(3, new Role(Role.ID_AGGREGATOR, "reviewer"), previewer, null, null, 0);
        roles[4] = new UserRole(4, new Role(Role.ID_FINAL_REVIEWER, "reviewer"), previewer, null, null, 0);
        roles[5] = new UserRole(5, new Role(Role.ID_REVIEWER, "reviewer"), reviewer, null, null, 0);
        roles[6] = new UserRole(6, new Role(Role.ID_DESIGNER_DEVELOPER, "submitter"), submitter, null, null, 0);
        roles[7] = new UserRole(7, new Role(Role.ID_DESIGNER_DEVELOPER, "submitter"), winner, null, null, 0);
        project = new Project(PROJECT_ID, COMP_ID, COMPVER_ID, "name", "vers", pm, winner, phi, phi[0],
                roles, "notes", "over", new ProjectType(0, "test"), new ProjectStatus(ProjectStatus.ID_IN_PROGRESS, "started"), false, 0, 0);
        project.setProjectInformationURL(new java.net.URL("http://www.topcoder.com"));

        tester.setProject(project);
        info = new UserProjectInfo(PROJECT_ID, "name", "vers", roles, phi[0],
                new ProjectType(0, "test"), winner, new ProjectStatus(ProjectStatus.ID_IN_PROGRESS, "started"));
        tester.setUserProjectInfos(new UserProjectInfo[]{info});
    }

    public void setUpDocuments() throws Exception {
        DocumentManagerTester tester = getDocumentTester();
        tester.setProjectId(PROJECT_ID);

        initialSubmission[0] = new InitialSubmission(0, submURL, "mes", "mes", submitter, project, false, 0, 0);
        initialSubmission[1] = new InitialSubmission(1, submURL, "mes", "mes", winner, project, false, 0, 0);

        screeningScorecards[0] = new ScreeningScorecard(0, false, false, new ScorecardQuestion[0], previewer, project, initialSubmission[0], 0, 0, 0);
        screeningScorecards[1] = new ScreeningScorecard(1, false, false, new ScorecardQuestion[0], previewer, project, initialSubmission[1], 0, 0, 0);

        reviewScorecards[0] = new ReviewScorecard(0, false, false, new ScorecardQuestion[0], previewer, project, initialSubmission[0], 0, 0, 0);
        reviewScorecards[1] = new ReviewScorecard(1, false, false, new ScorecardQuestion[0], previewer, project, initialSubmission[1], 0, 0, 0);
        reviewScorecards[2] = new ReviewScorecard(2, false, false, new ScorecardQuestion[0], reviewer, project, initialSubmission[0], 0, 0, 0);
        reviewScorecards[3] = new ReviewScorecard(3, false, false, new ScorecardQuestion[0], reviewer, project, initialSubmission[1], 0, 0, 0);

        testCaseReview[0] = new TestCaseReview(0, null, project, "mes", previewer, reviewer, false, 0, 0);
        testCaseReview[1] = new TestCaseReview(1, null, project, "mes", reviewer, previewer, false, 0, 0);

        aggregationWorksheet = new AggregationWorksheet(0, false, false, previewer, new AggregationResponse[0], project, 0, 0);
        finalFixSubmission = new FinalFixSubmission(0, submURL, "mes", "mes", winner, project, false, 0, 0);
        aggregationReview = new AggregationReview(0, null, "mes", false, aggregationWorksheet, false, previewer, 0, 0);
        finalReview = new FinalReview(0, new FixItem[0], aggregationWorksheet, false, 0, 0);

        tester.setScreeningScorecards(screeningScorecards);
        tester.setReviewScorecards(reviewScorecards);
        tester.setInitialSubmission(initialSubmission);
        tester.setTestCaseReview(testCaseReview);
        tester.setAggregationWorksheet(aggregationWorksheet);
        tester.setFinalFixSubmission(finalFixSubmission);
        tester.setAggregationReview(new AggregationReview[]{aggregationReview});
        tester.setFinalReview(finalReview);
    }

    public LoginLocalTester getLoginTester() throws Exception {
        return ActionDataFactory.getLoginTester();
        //(LoginLocalTester)((LoginLocalHomeTester)context.lookup(LoginLocalHome.EJB_REF_NAME)).create();
    }

    public PolicyLocalTester getPolicyTester() throws Exception {
        return ActionDataFactory.getPolicyTester();
        //return (PolicyLocalTester)((PolicyLocalHomeTester)context.lookup(PolicyLocalHome.EJB_REF_NAME)).create();
    }

    public UserManagerTester getUserTester() throws Exception {
        return ActionDataFactory.getUserTester();
        //return (UserManagerTester)((UserManagerLocalHomeTester)context.lookup(UserManagerLocalHome.EJB_REF_NAME)).create();
    }

    public ProjectTrackerTester getProjectTester() throws Exception {
        return ActionDataFactory.getProjectTester();
        //return (ProjectTrackerTester)((ProjectTrackerLocalHomeTester)context.lookup(ProjectTrackerLocalHome.EJB_REF_NAME)).create();
    }

    public DocumentManagerTester getDocumentTester() throws Exception {
        return ActionDataFactory.getDocumentTester();
        //return (DocumentManagerTester)((DocumentManagerLocalHomeTester)context.lookup(DocumentManagerLocalHome.EJB_REF_NAME)).create();
    }

    public void setUpContext(Model model) throws Exception {
        /*try {
            //veredox
            Method m = model.getClass().getMethod("setContext", new Class[] {Context.class});
            m.invoke(model, new Object[] {context});
            return;
        } catch (NoSuchMethodException e) {}
        //adic
        Class helper = Class.forName("com.topcoder.apps.review.EJBHelper");
        Method m = helper.getMethod("setContext", new Class[] {Context.class});
        m.invoke(null, new Object[] {context});*/
    }

    public void fail(String mes, ResultData data) {
        if (data instanceof FailureResult) {
            FailureResult failure = (FailureResult) data;
            Throwable th = failure.getCause();
            mes += "FailureResult[" + failure.getMessage() + ", " + th + "]";
            if (th != null) {
                th.printStackTrace();
            }
        } else {
            mes += data;
        }

        super.fail(mes);
    }

}
