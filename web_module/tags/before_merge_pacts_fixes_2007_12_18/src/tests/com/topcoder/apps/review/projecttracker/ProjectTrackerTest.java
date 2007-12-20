/*
 * DocumentManagerTest.java
 *
 * Copyright � 2002, TopCoder, Inc. All rights reserved
 *
 */
package com.topcoder.apps.review.projecttracker;

import com.topcoder.apps.review.ConcurrentModificationException;
import com.topcoder.apps.review.IncorrectProjectStateException;
import com.topcoder.apps.review.document.DocumentManagerTest;
import com.topcoder.apps.review.document.InitialSubmission;
import com.topcoder.apps.review.document.InvalidEditException;
import com.topcoder.security.GeneralSecurityException;
import com.topcoder.security.NoSuchUserException;
import com.topcoder.security.TCSubject;
import com.topcoder.security.UserPrincipal;
import com.topcoder.security.admin.PolicyMgrRemote;
import com.topcoder.security.admin.PolicyMgrRemoteHome;
import com.topcoder.security.admin.PrincipalMgrRemote;
import com.topcoder.security.admin.PrincipalMgrRemoteHome;

import junit.framework.Test;
import junit.framework.TestSuite;

import org.apache.cactus.ServletTestCase;

import java.net.URL;
import java.rmi.RemoteException;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.ejb.CreateException;
import javax.ejb.EJBException;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;

import javax.rmi.PortableRemoteObject;

import javax.sql.DataSource;


/**
 * DOCUMENT ME!
 *
 * @author TCSDeveloper
 */
public class ProjectTrackerTest extends ServletTestCase {
    /** doc */
    public static final long USER_ID1 = 2059064;
    public static final String USER_HANDLE1 = "asdfsadkj2";
    public static final String USER_FIRST_NAME1 = "adf";
    public static final String USER_LAST_NAME1 = "adsf";
    public static final String USER_EMAIL1 = "foo@fooonyou.com";

    /** doc */
    public static final long USER_ID2 = 296745;
    public static final String USER_HANDLE2 = "pzhao";
    public static final String USER_FIRST_NAME2 = "first foo";
    public static final String USER_LAST_NAME2 = "last foo";
    public static final String USER_EMAIL2 = "foo@fooonyou.com";

    /** doc */
    public static final long USER_ID3 = 296466;
    public static final String USER_HANDLE3 = "FatClimber";
    public static final String USER_FIRST_NAME3 = "first foo";
    public static final String USER_LAST_NAME3 = "last foo";
    public static final String USER_EMAIL3 = "foo@fooonyou.com";

    /** doc */
    public static final long PROJECT_ID1 = 1;
    public static final long COMP_VERS_ID1 = 2809382;
    public static final String PROJECT_NAME1 = "HTTP Tunneling";
    public static final String PROJECT_VERSION1 = "1.0";

    /** doc */
    public static final long PROJECT_ID2 = 2;
    public static final long COMP_VERS_ID2 = 7263832;
    public static final String PROJECT_NAME2 = "DNS Query";
    public static final String PROJECT_VERSION2 = "1.0";


    private ProjectTrackerLocal projectTracker;
    private DataSource dataSource;
    private UserProjectInfo _UPI;

    // ProjectTracker objects for testing
    private Role _role1;
    private Role _role2;
    private Role _role3;
    private Role _role4;
    private Role _role5;
    private Role _role6;
    private Role _role7;
    private Phase _phase1;
    private Phase _phase2;
    private Phase _phase3;
    private Phase _phase4;
    private Phase _phase5;
    private Phase _phase6;
    private Phase _phase7;
    private ReviewerResponsibility _revResp1;
    private ReviewerResponsibility _revResp2;
    private ReviewerResponsibility _revResp3;
    private PaymentStatus _paymentStatus1;
    private PaymentStatus _paymentStatus2;
    private ProjectType _projectType1;
    private ProjectType _projectType2;
    private ProjectStatus _projectStatus1;
    private ProjectStatus _projectStatus2;
    private ProjectStatus _projectStatus3;
    private User _user1;
    private TCSubject _tcuser1;
    private User _user2;
    private TCSubject _tcuser2;
    private User _user3;
    private TCSubject _tcuser3;
    private PaymentInfo _paymentInfo1;
    private PaymentInfo _paymentInfo2;
    private PhaseInstance _pi1;
    private PhaseInstance _pi2;
    private PhaseInstance[] _piArr;
    private UserRole _ur1;
    private UserRole _ur2;
    private UserRole _ur3;
    private UserRole[] _userRoleArr;
    private Project _project;

    private InitialSubmission _sub1;

    /**
     * Constructor for DocumentManagerTest.
     *
     * @param name
     */
    public ProjectTrackerTest(String name) {
        super(name);
    }

    /**
     * DOCUMENT ME!
     *
     * @return DOCUMENT ME!
     */
    public static Test suite() {
        final TestSuite suite = new TestSuite();

        //suite.addTest(XXX.suite());
        //suite.addTest(new TestSuite(ProjectTrackerTest.class));
        suite.addTest(new ProjectTrackerTest("testGetProjectById"));
        //suite.addTest(new ProjectTrackerTest("testSaveProject"));
        //suite.addTest(new ProjectTrackerTest("testSecurity"));

        return suite;
    }

    /**
     * DOCUMENT ME!
     *
     * @throws Exception DOCUMENT ME!
     * @throws RuntimeException DOCUMENT ME!
     */
    protected void setUp() throws Exception {
        Context ctx = new InitialContext();
        ProjectTrackerLocalHome home = (ProjectTrackerLocalHome) PortableRemoteObject.narrow(ctx.lookup(
                "com.topcoder.apps.review.projecttracker.ProjectTrackerLocalHome"), ProjectTrackerLocalHome.class);
        this.projectTracker = home.create();

        try {
            dataSource = (DataSource) ctx.lookup("java:/InformixDS");
        } catch (NamingException e) {
            throw new RuntimeException(e);
        }

        Connection conn = dataSource.getConnection();

        PreparedStatement ps = conn.prepareStatement("DELETE FROM payment_info");
        ps.executeUpdate();
        ps = conn.prepareStatement("DELETE FROM phase_instance");
        ps.executeUpdate();
        ps = conn.prepareStatement("DELETE FROM r_user_role");
        ps.executeUpdate();
        ps = conn.prepareStatement("DELETE FROM project");
        ps.executeUpdate();
        ps = conn.prepareStatement("DELETE FROM submission");
        ps.executeUpdate();

        ps = conn.prepareStatement("DELETE FROM scorecard");
        ps.executeUpdate();
        ps = conn.prepareStatement("DELETE FROM scorecard_question");
        ps.executeUpdate();

        //
        // Create ProjectTracker-objects for testing
        //
        // CREATE CONSTANTS
        _role1 = new Role(1, "Designer/Developer");
        _role2 = new Role(2, "Primary Screener");
        _role3 = new Role(3, "Reviewer");
        _role4 = new Role(4, "Aggregator");
        _role5 = new Role(5, "Final Reviewer");
        _role6 = new Role(6, "Product Manager");
        _role7 = new Role(7, "Removed");
        _phase1 = new Phase(1, "Submission");
        _phase2 = new Phase(2, "Screening");
        _phase3 = new Phase(3, "Review");
        _phase4 = new Phase(4, "Aggregation");
        _phase5 = new Phase(5, "Aggregation Review");
        _phase6 = new Phase(6, "Final Fixes");
        _phase7 = new Phase(7, "Final Review");
        _paymentStatus1 = new PaymentStatus(1, "Not Paid");
        _paymentStatus2 = new PaymentStatus(2, "Payment Sent");
        _revResp1 = new ReviewerResponsibility(1, "Stress Test Cases");
        _revResp2 = new ReviewerResponsibility(2, "Failure Test Cases");
        _revResp3 = new ReviewerResponsibility(3, "Accuracy");
        _projectType1 = new ProjectType(1, "Design");
        _projectType2 = new ProjectType(2, "Development");
        _projectStatus1 = new ProjectStatus(1, "In Progress");
        _projectStatus2 = new ProjectStatus(2, "Terminated");
        _projectStatus3 = new ProjectStatus(3, "Pending Start");

        // CREATE USERS
        _user1 = new User(ProjectTrackerTest.USER_ID1, ProjectTrackerTest.USER_HANDLE1,
                ProjectTrackerTest.USER_FIRST_NAME1, ProjectTrackerTest.USER_LAST_NAME1, ProjectTrackerTest.USER_EMAIL1);
        _tcuser1 = new TCSubject(_user1.getId());
        _user2 = new User(ProjectTrackerTest.USER_ID2, ProjectTrackerTest.USER_HANDLE2,
                ProjectTrackerTest.USER_FIRST_NAME2, ProjectTrackerTest.USER_LAST_NAME2, ProjectTrackerTest.USER_EMAIL2);
        _tcuser2 = new TCSubject(_user2.getId());
        _user3 = new User(ProjectTrackerTest.USER_ID3, ProjectTrackerTest.USER_HANDLE3,
                ProjectTrackerTest.USER_FIRST_NAME3, ProjectTrackerTest.USER_LAST_NAME3, ProjectTrackerTest.USER_EMAIL3);
        _tcuser3 = new TCSubject(_user3.getId());

        // CREATE PAYMENT_INFOS
        System.err.println("Create payment_infos");

        insertPaymentInfo(conn, 1, 1, 10, 1, ProjectTrackerTest.USER_ID1, true);
        _paymentInfo1 = new PaymentInfo(1, 10, _paymentStatus1, 1);

        insertPaymentInfo(conn, 2, 2, 20, 2, ProjectTrackerTest.USER_ID1, true);
        _paymentInfo2 = new PaymentInfo(2, 20, _paymentStatus2, 2);

        /*
           Calendar c = Calendar.getInstance();
           c.set(2003, 6, 16, 0, 0, 0);
           Date startDate = c.getTime();
           c.set(2003, 6, 23);
           Date endDate = c.getTime();
           Date startDate2 = endDate;
           c.set(2003, 6, 30);
           Date endDate2 = c.getTime();
         */
        // CREATE PHASE_INSTANCES
        System.err.println("Create phase_instances");

        java.sql.Date _startDate1 = new java.sql.Date(103, 5, 16);
        java.sql.Date _endDate1 = new java.sql.Date(103, 5, 23);
        java.sql.Date _startDate2 = _endDate1;
        java.sql.Date _endDate2 = new java.sql.Date(103, 5, 30);
        insertPhaseInstance(conn, 1, 1, _startDate1, _endDate1,
                1, ProjectTrackerTest.PROJECT_ID1,
                ProjectTrackerTest.USER_ID1, true);
        _pi1 = new PhaseInstance(1, _phase1, _startDate1, _endDate1, 1);

        insertPhaseInstance(conn, 2, 2, _startDate2, _endDate2,
                2, ProjectTrackerTest.PROJECT_ID1,
                ProjectTrackerTest.USER_ID1, true);
        _pi2 = new PhaseInstance(2, _phase2, _startDate2, _endDate2, 2);

        _piArr = new PhaseInstance[]{_pi1, _pi2};

        // CREATE USER_ROLES
        System.err.println("Create user_roles");
/*
INSERT INTO R_USER_ROLE VALUES (
    1, 1, 1, 1, 2059064, 1, NULL,
    CURRENT, 2059064, 1);
INSERT INTO R_USER_ROLE VALUES (
    2, 2, 2, 1, 296745, 2, NULL,
    CURRENT, 2059064, 1);
INSERT INTO R_USER_ROLE VALUES (
    3, 3, 3, 1, 296745, 3, 2,
    CURRENT, 2059064, 1);
INSERT INTO R_USER_ROLE VALUES (
    4, 4, 3, 1, 278342, 4, 1,
    CURRENT, 2059064, 1);
INSERT INTO R_USER_ROLE VALUES (
    5, 5, 3, 1, 279471, 5, 3,
    CURRENT, 2059064, 1);
INSERT INTO R_USER_ROLE VALUES (
    6, 6, 4, 1, 296745, 6, NULL,
    CURRENT, 2059064, 1);
INSERT INTO R_USER_ROLE VALUES (
    7, 7, 5, 1, 296745, 7, NULL,
    CURRENT, 2059064, 1);
INSERT INTO R_USER_ROLE VALUES (
    8, 8, 6, 1, 296466, 8, NULL,
    CURRENT, 2059064, 1);
INSERT INTO R_USER_ROLE VALUES (
    9, 9, 7, 1, 154322, 9, NULL,
    CURRENT, 2059064, 1);
*/
        insertUserRole(conn, 1, 1, _role1.getId(),
                ProjectTrackerTest.PROJECT_ID1,
                ProjectTrackerTest.USER_ID1, 1, 0,
                ProjectTrackerTest.USER_ID1, true);
        _ur1 = new UserRole(1, _role1, _user1, _paymentInfo1, null, 1);

        insertUserRole(conn, 2, 2, _role2.getId(),
                ProjectTrackerTest.PROJECT_ID1,
                ProjectTrackerTest.USER_ID1, 2, 3,
                ProjectTrackerTest.USER_ID1, true);
        _ur2 = new UserRole(2, _role2, _user1, _paymentInfo2, _revResp3, 2);

        insertUserRole(conn, 3, 3, _role6.getId(),
                ProjectTrackerTest.PROJECT_ID1,
                ProjectTrackerTest.USER_ID3, 2, 0,
                ProjectTrackerTest.USER_ID3, true);
        _ur3 = new UserRole(3, _role6, _user3, _paymentInfo2, null, 3);

        _userRoleArr = new UserRole[]{_ur1, _ur2, _ur3};

        // CREATE PROJECTS
        System.err.println("Create projects");

        User pm = _user3;
        User winner = _user1;
        User requestor = _user1;

        _project = new Project(ProjectTrackerTest.PROJECT_ID1,
                ProjectTrackerTest.COMP_VERS_ID1,
                ProjectTrackerTest.PROJECT_NAME1,
                ProjectTrackerTest.PROJECT_VERSION1,
                pm,
                winner,
                _piArr,
                _piArr[0],
                _userRoleArr,
                "notes",
                "overview",
                _projectType1,
                _projectStatus1,
                false,
                requestor.getId(),
                1);
        insertProject(conn,
                _project.getId(),
                1,
                ProjectTrackerTest.COMP_VERS_ID1,
                _pi1.getId(),
                ProjectTrackerTest.USER_ID1,
                "overview",
                "notes",
                _projectType1.getId(),
                _projectStatus1.getId(),
                false,
                ProjectTrackerTest.USER_ID1,
                "created",
                true);

        _UPI = new UserProjectInfo(ProjectTrackerTest.PROJECT_ID1,
                ProjectTrackerTest.PROJECT_NAME1,
                ProjectTrackerTest.PROJECT_VERSION1, _userRoleArr, _piArr[0], _projectType1, winner,
                _projectStatus1);

        // CREATE SUBMISSIONS
        DocumentManagerTest.insertSubmission(conn, 1, 1, 1,
                "file://test.jar", "Review message", "Screening message",
                ProjectTrackerTest.USER_ID1,
                ProjectTrackerTest.PROJECT_ID1,
                false, ProjectTrackerTest.USER_ID1, true);
        _sub1 = new InitialSubmission(1, new URL("file://test.jar"), "Review message", "Screening message", _user1, _project,
                false, ProjectTrackerTest.USER_ID1, 2);

        conn.close();
    }

    /**
     * DOCUMENT ME!
     *
     * @throws Exception DOCUMENT ME!
     */
    protected void tearDown() throws Exception {
        projectTracker.remove();
    }

    /**
     * DOCUMENT ME!
     */
    final public void testGetProject() {
        Project project = projectTracker.getProject(_UPI, _tcuser1);
        checkProject("testGetProject():", _project, project);
    }

    /**
     * DOCUMENT ME!
     */
    final public void testGetProjectInfo() {
        // TODO Important, set up correct permissions in TCSubject
        UserProjectInfo[] projectInfo = projectTracker.getProjectInfo(new TCSubject(_user1.getId()));

        assertEquals(projectInfo.length, 1);
        checkUserProjectInfo("testGetProjectInfo():", _UPI, projectInfo[0]);
    }

    /**
     * DOCUMENT ME!
     */
    final public void testGetProjectById() {
        Project project = projectTracker.getProjectById(PROJECT_ID1, _tcuser1);
        checkProject("testGetProjectById():", _project, project);
    }

    final public void testSecurity() {
        Context ctx;
        try {
            ctx = new InitialContext();
            PrincipalMgrRemoteHome home = (PrincipalMgrRemoteHome) PortableRemoteObject.narrow(ctx.lookup(
                    "java:comp/env/security/PrincipalMgr"), PrincipalMgrRemoteHome.class);
            PrincipalMgrRemote principalMgr = home.create();
            PolicyMgrRemoteHome home2 = (PolicyMgrRemoteHome) PortableRemoteObject.narrow(ctx.lookup(
                    "java:comp/env/security/PolicyMgr"), PolicyMgrRemoteHome.class);
            PolicyMgrRemote policyMgr = home2.create();
            try {
                UserPrincipal userPrincipal = principalMgr.getUser(2059064);
                System.err.println("id: " + userPrincipal.getId());
                System.err.println("name: " + userPrincipal.getName());
                //policyMgr.getPermissions(userPrincipal, new TCSubject(2059064));
            } catch (NoSuchUserException e1) {
                // TODO Auto-generated catch block
                e1.printStackTrace();
            } catch (com.topcoder.security.GeneralSecurityException e1) {
                // TODO Auto-generated catch block
                e1.printStackTrace();
            }
        } catch (NamingException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (CreateException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (RemoteException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (EJBException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

    /**
     * DOCUMENT ME!
     */
    final public void testSaveProject() {
        try {
            Project project = projectTracker.getProjectById(COMP_VERS_ID1, _tcuser1);
            checkProject("testSaveProject():", _project, project);

            project.setNotes("new notes");
            _project.setNotes("new notes");
            project.setWinner(_user2);
            _project.setWinner(_user2);
            projectTracker.saveProject(project, "test reason", _tcuser1);

            project = projectTracker.getProjectById(COMP_VERS_ID1, _tcuser1);
            checkProject("testSaveProject().save1:", _project, project);

            /*
            UserRole[] userRoleArr = project.getParticipants();
            UserRole[] _userRoleArr = _project.getParticipants();
            userRoleArr[0].setRole(_role3);
            _userRoleArr[0].setRole(_role3);
            userRoleArr[0].setReviewerResponsibility(_revResp3);
            _userRoleArr[0].setReviewerResponsibility(_revResp3);
            userRoleArr[1].setReviewerResponsibility(_revResp1);
            _userRoleArr[1].setReviewerResponsibility(_revResp1);
            projectTracker.saveProject(project, "test reason2");
            project = projectTracker.getProjectById(PROJECT_ID1, _user2);
            checkProject("testSaveProject().save2:", _project, project);
            */

            // Change phase to generate scorecards
            PhaseInstance[] pi = project.getTimeline();
            Phase newPhase = null;
            System.err.println("pi:length IS: " + pi.length);
            for (int i = 0; i < pi.length; i++) {
                System.err.println("pi[" + i + "].phase.id IS: " + pi[i].getPhase().getId());
                if (pi[i].getPhase().getId() == 2) {
                    newPhase = pi[i].getPhase();
                    break;
                }
            }
            project.setCurrentPhase(newPhase);
            _project.setCurrentPhase(_phase2);
            projectTracker.saveProject(project, "test reason3", _tcuser1);
            project = projectTracker.getProjectById(COMP_VERS_ID1, _tcuser1);
            checkProject("testSaveProject().save3:", _project, project);

        } catch (InvalidEditException e) {
            fail("IvalidEditException");
            e.printStackTrace();
        } catch (IncorrectProjectStateException e) {
            fail("IncorrectProjectStateException");
            e.printStackTrace();
        } catch (ConcurrentModificationException e) {
            fail("ConcurrentModificationException");
            e.printStackTrace();
        } catch (com.topcoder.apps.review.GeneralSecurityException e) {
            fail("GeneralSecurityException");
            e.printStackTrace();
        }
    }

    /**
     * DOCUMENT ME!
     *
     * @param s DOCUMENT ME!
     * @param u1 DOCUMENT ME!
     * @param u2 DOCUMENT ME!
     */
    public static void checkUser(String s, User u1, User u2) {
        assertNotNull(s + "user(setup)", u1);
        assertNotNull(s + "user", u2);
        assertEquals(s + "user.id", u1.getId(), u2.getId());
        assertEquals(s + "user.handle", u1.getHandle(), u2.getHandle());
        assertEquals(s + "user.firstname", u1.getFirstName(), u2.getFirstName());
        assertEquals(s + "user.lastname", u1.getLastName(), u2.getLastName());
        assertEquals(s + "user.email", u1.getEmail(), u2.getEmail());
    }

    /**
     * DOCUMENT ME!
     *
     * @param s DOCUMENT ME!
     * @param p1 DOCUMENT ME!
     * @param p2 DOCUMENT ME!
     */
    public static void checkProject(String s, Project p1, Project p2) {
        assertNotNull(s + "project(setup)", p1);
        assertNotNull(s + "project", p2);
        assertEquals(s + "project.id", p1.getId(), p2.getId());

        assertNotNull(s + "project(setup).timeline", p1.getTimeline());
        assertNotNull(s + "project.timeline", p2.getTimeline());
        assertEquals(s + "project.timeline.length", p1.getTimeline().length, p2.getTimeline().length);

        for (int i = 0; i < p1.getTimeline().length; i++) {
            checkPhaseInstance(s + "projectc.timeline[" + i + "]:", p1.getTimeline()[i], p2.getTimeline()[i]);
        }

        checkUser(s + "project.projectmanager:", p1.getProjectManager(), p2.getProjectManager());
        assertEquals(s + "project.name", p1.getName(), p2.getName());
        assertEquals(s + "project.version", p1.getVersion(), p2.getVersion());
        checkPhase(s + "project.currentphase:", p1.getCurrentPhase(), p2.getCurrentPhase());
        checkUser(s + "project.winner:", p1.getWinner(), p2.getWinner());
        assertEquals(s + "project.projectinformationurl", p1.getProjectInformationURL(), p2.getProjectInformationURL());

        assertNotNull(s + "project(setup).participants", p1.getParticipants());
        assertNotNull(s + "project.participants", p2.getParticipants());
        assertEquals(s + "project.participants.length", p1.getParticipants().length, p2.getParticipants().length);

        for (int i = 0; i < p1.getParticipants().length; i++) {
            checkUserRole(s + "project.participants[" + i + "]:", p1.getParticipants()[i], p2.getParticipants()[i]);
        }

        assertEquals(s + "project.overview", p1.getOverview(), p2.getOverview());
        assertEquals(s + "project.notes", p1.getNotes(), p2.getNotes());
        checkProjectType(s + "project.projecttype:", p1.getProjectType(), p2.getProjectType());
    }

    /**
     * DOCUMENT ME!
     *
     * @param s DOCUMENT ME!
     * @param p1 DOCUMENT ME!
     * @param p2 DOCUMENT ME!
     */
    public static void checkUserProjectInfo(String s, UserProjectInfo p1, UserProjectInfo p2) {
        assertNotNull(s + "userprojectinfo(setup)!null", p1);
        assertNotNull(s + "userprojectinfo!null", p2);
        assertEquals(s + "userprojectinfo.id", p1.getId(), p2.getId());
        assertEquals(s + "userprojectinfo.projectname", p1.getProjectName(), p2.getProjectName());
        assertEquals(s + "userprojectinfo.projectversion", p1.getProjectVersion(), p2.getProjectVersion());

        assertNotNull(s + "userprojectinfo(setup).userroles", p1.getUserRoles());
        assertNotNull(s + "userprojectinfo.userroles", p2.getUserRoles());
        assertEquals(s + "userprojectinfo.userroles.length", p1.getUserRoles().length, p2.getUserRoles().length);

        for (int i = 0; i < p1.getUserRoles().length; i++) {
            checkUserRole(s + "userprojectinfo.userroles[" + i + "]:", p1.getUserRoles()[i], p2.getUserRoles()[i]);
        }

        checkPhaseInstance(s + "userprojectinfo.phase:", p1.getCurrentPhaseInstance(), p2.getCurrentPhaseInstance());
        checkProjectType(s + "userprojectinfo.projecttype:", p1.getProjectType(), p2.getProjectType());
    }

    /**
     * DOCUMENT ME!
     *
     * @param s DOCUMENT ME!
     * @param p1 DOCUMENT ME!
     * @param p2 DOCUMENT ME!
     */
    public static void checkPhaseInstance(String s, PhaseInstance p1, PhaseInstance p2) {
        assertNotNull(s + "phaseinstance(setup)", p1);
        assertNotNull(s + "phaseinstance", p2);
        assertEquals(s + "phaseinstance.id", p1.getId(), p2.getId());
        checkPhase(s + "phaseinstance.phase:", p1.getPhase(), p2.getPhase());
        assertEquals(s + "phaseinstance.startdate", p1.getStartDate(), p2.getStartDate());
        assertEquals(s + "phaseinstance.enddate", p1.getEndDate(), p2.getEndDate());
    }

    /**
     * DOCUMENT ME!
     *
     * @param s DOCUMENT ME!
     * @param u1 DOCUMENT ME!
     * @param u2 DOCUMENT ME!
     */
    public static void checkUserRole(String s, UserRole u1, UserRole u2) {
        assertNotNull(s + "userrole(setup)", u1);
        assertNotNull(s + "userrole", u2);
        assertEquals(s + "userrole.id", u1.getId(), u2.getId());
        checkRole(s + "userrole.role:", u1.getRole(), u2.getRole());
        checkUser(s + "userrole.user:", u1.getUser(), u2.getUser());
        checkPaymentInfo(s + "userrole.paymentinfo:", u1.getPaymentInfo(), u2.getPaymentInfo());

        if (u1.getReviewerResponsibility() == null) {
            assertNull(s + "userrole.reviewerresponsibility", u2.getReviewerResponsibility());
        } else {
            checkReviewerResponsibility(s + "userrole.reviewerresponsibility:", u1.getReviewerResponsibility(),
                    u2.getReviewerResponsibility());
        }
    }

    /**
     * DOCUMENT ME!
     *
     * @param s DOCUMENT ME!
     * @param p1 DOCUMENT ME!
     * @param p2 DOCUMENT ME!
     */
    public static void checkPaymentInfo(String s, PaymentInfo p1, PaymentInfo p2) {
        assertNotNull(s + "paymentinfo(setup)", p1);
        assertNotNull(s + "paymentinfo", p2);
        assertEquals(s + "paymentinfo.id", p1.getId(), p2.getId());
        assertEquals(s + "paymentinfo.payment", p1.getPayment(), p2.getPayment(), 0.00001);
        checkPaymentStatus(s + "paymentinfo.payment:", p1.getPaymentStatus(), p2.getPaymentStatus());
    }

    /**
     * DOCUMENT ME!
     *
     * @param s DOCUMENT ME!
     * @param p1 DOCUMENT ME!
     * @param p2 DOCUMENT ME!
     */
    public static void checkPaymentStatus(String s, PaymentStatus p1, PaymentStatus p2) {
        assertNotNull(s + "paymentstatus(setup)", p1);
        assertNotNull(s + "paymentstatus", p2);
        assertEquals(s + "paymentstatus.id", p1.getId(), p2.getId());
        assertEquals(s + "paymentstatus.name", p1.getName(), p2.getName());
    }

    /**
     * DOCUMENT ME!
     *
     * @param s DOCUMENT ME!
     * @param p1 DOCUMENT ME!
     * @param p2 DOCUMENT ME!
     */
    public static void checkProjectType(String s, ProjectType p1, ProjectType p2) {
        assertNotNull(s + "projecttype(setup)", p1);
        assertNotNull(s + "projecttype", p2);
        assertEquals(s + "projecttype.id", p1.getId(), p2.getId());
        assertEquals(s + "projecttype.name", p1.getName(), p2.getName());
    }

    /**
     * DOCUMENT ME!
     *
     * @param s DOCUMENT ME!
     * @param p1 DOCUMENT ME!
     * @param p2 DOCUMENT ME!
     */
    public static void checkPhase(String s, Phase p1, Phase p2) {
        assertNotNull(s + "phase(setup)", p1);
        assertNotNull(s + "phase", p2);
        assertEquals(s + "phase.id", p1.getId(), p2.getId());
        assertEquals(s + "phase.name", p1.getName(), p2.getName());
    }

    /**
     * DOCUMENT ME!
     *
     * @param s DOCUMENT ME!
     * @param r1 DOCUMENT ME!
     * @param r2 DOCUMENT ME!
     */
    public static void checkRole(String s, Role r1, Role r2) {
        assertNotNull(s + "role(setup)", r1);
        assertNotNull(s + "role", r2);
        assertEquals(s + "role.id", r1.getId(), r2.getId());
        assertEquals(s + "role.name", r1.getName(), r2.getName());
    }

    /**
     * DOCUMENT ME!
     *
     * @param s DOCUMENT ME!
     * @param r1 DOCUMENT ME!
     * @param r2 DOCUMENT ME!
     */
    public static void checkReviewerResponsibility(String s, ReviewerResponsibility r1, ReviewerResponsibility r2) {
        assertNotNull(s + "reviewerresponsibility(setup)", r1);
        assertNotNull(s + "reviewerresponsibility", r2);
        assertEquals(s + "reviewerresponsibility.id", r1.getId(), r2.getId());
        assertEquals(s + "reviewerresponsibility.name", r1.getName(), r2.getName());
    }

    /**
     * DOCUMENT ME!
     *
     * @param conn DOCUMENT ME!
     * @param project_v_id DOCUMENT ME!
     * @param project_id DOCUMENT ME!
     * @param phaseInstanceId DOCUMENT ME!
     * @param winnerId DOCUMENT ME!
     * @param pmId DOCUMENT ME!
     * @param overview DOCUMENT ME!
     * @param notes DOCUMENT ME!
     * @param projectTypeId DOCUMENT ME!
     * @param modUserId DOCUMENT ME!
     * @param modReason DOCUMENT ME!
     * @param curVersion DOCUMENT ME!
     */
    public static void insertProject(Connection conn, long project_v_id, long project_id, long compVersId, long phaseInstanceId,
                                     long winnerId, String overview, String notes, long projectTypeId, long projectStatId, boolean notificationSent,
                                     long modUserId, String modReason, boolean curVersion) {
        try {
            PreparedStatement ps = conn.prepareStatement("INSERT INTO project VALUES (" +
                    "?,?,?,?,?,?,?,?,?,?,current year to fraction(3),?,?,?)");
            ps.setLong(1, project_v_id);
            ps.setLong(2, project_id);
            ps.setLong(3, compVersId);
            ps.setLong(4, phaseInstanceId);
            ps.setLong(5, winnerId);
            ps.setString(6, overview);
            ps.setString(7, notes);
            ps.setLong(8, projectTypeId);
            ps.setLong(9, projectStatId);
            ps.setBoolean(10, notificationSent);
            ps.setLong(11, modUserId);
            ps.setString(12, modReason);
            ps.setBoolean(13, curVersion);

            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    /**
     * DOCUMENT ME!
     *
     * @param conn DOCUMENT ME!
     * @param phase_inst_v_id DOCUMENT ME!
     * @param phase_instance_id DOCUMENT ME!
     * @param startDate DOCUMENT ME!
     * @param endDate DOCUMENT ME!
     * @param phaseId DOCUMENT ME!
     * @param projectId DOCUMENT ME!
     * @param modUserId DOCUMENT ME!
     * @param curVersion DOCUMENT ME!
     */
    public static void insertPhaseInstance(Connection conn, long phase_inst_v_id, long phase_instance_id,
                                           java.sql.Date startDate, java.sql.Date endDate, long phaseId, long projectId, long modUserId, boolean curVersion) {
        try {
            PreparedStatement ps = conn.prepareStatement("INSERT INTO phase_instance VALUES (" +
                    "?,?,?,?,?,?,current year to fraction(3),?,?)");
            ps.setLong(1, phase_inst_v_id);
            ps.setLong(2, phase_instance_id);
            ps.setDate(3, startDate);
            ps.setDate(4, endDate);
            ps.setLong(5, phaseId);
            ps.setLong(6, projectId);
            ps.setLong(7, modUserId);
            ps.setBoolean(8, curVersion);

            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    /**
     * DOCUMENT ME!
     *
     * @param conn DOCUMENT ME!
     * @param r_user_role_v_id DOCUMENT ME!
     * @param r_user_role_id DOCUMENT ME!
     * @param rRoleId DOCUMENT ME!
     * @param projectId DOCUMENT ME!
     * @param loginId DOCUMENT ME!
     * @param paymentInfoId DOCUMENT ME!
     * @param rRespId DOCUMENT ME!
     * @param modUserId DOCUMENT ME!
     * @param curVersion DOCUMENT ME!
     */
    public static void insertUserRole(Connection conn, long r_user_role_v_id, long r_user_role_id, long rRoleId,
                                      long projectId, long loginId, long paymentInfoId, long rRespId, long modUserId, boolean curVersion) {
        try {
            PreparedStatement ps = conn.prepareStatement("INSERT INTO r_user_role VALUES (" +
                    "?,?,?,?,?,?,?,current year to fraction(3),?,?)");
            ps.setLong(1, r_user_role_v_id);
            ps.setLong(2, r_user_role_id);
            ps.setLong(3, rRoleId);
            ps.setLong(4, projectId);
            ps.setLong(5, loginId);
            ps.setLong(6, paymentInfoId);
            if (rRespId == 0) {
                ps.setNull(7, java.sql.Types.DECIMAL);
            } else {
                ps.setLong(7, rRespId);
            }
            ps.setLong(8, modUserId);
            ps.setBoolean(9, curVersion);

            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    /**
     * DOCUMENT ME!
     *
     * @param conn DOCUMENT ME!
     * @param payment_info_v_id DOCUMENT ME!
     * @param payment_info_id DOCUMENT ME!
     * @param payment DOCUMENT ME!
     * @param paymentStatId DOCUMENT ME!
     * @param modUserId DOCUMENT ME!
     * @param curVersion DOCUMENT ME!
     */
    public static void insertPaymentInfo(Connection conn, long payment_info_v_id, long payment_info_id, float payment,
                                         long paymentStatId, long modUserId, boolean curVersion) {
        try {
            PreparedStatement ps = conn.prepareStatement("INSERT INTO payment_info VALUES (" +
                    "?,?,?,?,current year to fraction(3),?,?)");
            ps.setLong(1, payment_info_v_id);
            ps.setLong(2, payment_info_id);
            ps.setFloat(3, payment);
            ps.setLong(4, paymentStatId);
            ps.setLong(5, modUserId);
            ps.setBoolean(6, curVersion);

            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
