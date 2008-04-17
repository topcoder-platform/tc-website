/*
 * Copyright (C) 2008 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.studio.controller.request.admin;

import com.topcoder.web.studio.TCHibernateTestCase;
import com.topcoder.web.studio.DatabaseUtil;
import com.topcoder.web.studio.Constants;
import com.topcoder.web.studio.dao.StudioDAOUtil;
import com.topcoder.web.studio.dao.ContestDAO;
import com.topcoder.web.studio.dao.ContestPropertyDAO;
import com.topcoder.web.studio.model.ContestProperty;
import com.topcoder.web.studio.model.Contest;
import com.topcoder.web.studio.model.Medium;
import com.topcoder.web.studio.mock.MockWebAuthentication;
import com.topcoder.web.studio.mock.MockHttpServletRequest;
import com.topcoder.web.studio.mock.MockHttpServletResponse;
import com.topcoder.web.studio.mock.MockHttpSession;
import com.topcoder.web.common.SimpleRequest;
import com.topcoder.web.common.SimpleResponse;
import com.topcoder.web.common.SessionInfo;
import com.topcoder.shared.security.User;
import com.topcoder.shared.security.SimpleUser;
import com.topcoder.db.connectionfactory.DBConnectionFactoryImpl;

import java.util.HashSet;
import java.util.List;
import java.util.ArrayList;
import java.util.Set;
import java.util.Map;
import java.text.SimpleDateFormat;

import junit.framework.Assert;

/**
 * <p>A unit test case for {@link EditContest} class.</p>
 *
 * @author isv
 * @version 1.0
 * @since TopCoder Studio Modifications Assembly v2 (Req# 5.1.1, 5.1.2)
 */
public class EditContestTestCase extends TCHibernateTestCase {

    /**
     * <p>The instance of {@link EditContest} which is tested. This instance is initialized in {@link #setUp()} method
     * and released in {@link #tearDown()} method.</p>
     */
    private EditContest testedInstance = null;

    /**
     * <p>A <code>List</code> containing the IDs of contests which might have been added during the tests and which
     * have to be deleted after test is finished.</p>
     */
    private List<Long> addedContests = null;

    /**
     * <p>Constructs new <code>EditContestTestCase</code> instance with specified test name.</p>
     *
     * @param name a <code>String</code> providing the name of the test.
     */
    public EditContestTestCase(String name) {
        setName(name);
    }

    /**
     * <p>Sets up the fixture. This method is called before a test is executed.</p>
     */
    public void setUp() {
        MockWebAuthentication.releaseState();
        MockHttpServletRequest.releaseState();
        MockHttpServletResponse.releaseState();
        MockHttpSession.releaseState();

        User user = new SimpleUser(1, "dok", "password");
        MockWebAuthentication.setMethodResult("getUser", user);
        MockWebAuthentication.setMethodResult("getActiveUser", user);
        MockWebAuthentication.setMethodResult("isKnownUser", true);

        MockHttpSession.setMethodResult("getId", String.valueOf(System.currentTimeMillis()));

        MockHttpServletRequest.setMethodResult("getServerName", "studiodev.topcoder.com");
        MockHttpServletRequest.setMethodResult("getContextPath", "studio");
        MockHttpServletRequest.setMethodResult("getServletPath", "");
        MockHttpServletRequest.setMethodResult("getQueryString", "");
        MockHttpServletRequest.setMethodResult("getSession", new MockHttpSession());

        SimpleRequest request = new SimpleRequest(new MockHttpServletRequest());

        this.testedInstance = new EditContest();
        this.testedInstance.setResponse(new SimpleResponse(new MockHttpServletResponse()));
        this.testedInstance.setAuthentication(new MockWebAuthentication());
        this.testedInstance.setRequest(request);

        try {
            SessionInfo sessionInfo = new SessionInfo(request, new MockWebAuthentication(), new HashSet());
            MockHttpServletRequest.setMethodResultPerArgs("getAttribute_String", "sessionInfo", sessionInfo);

            DBConnectionFactoryImpl connectionFactory
                = new DBConnectionFactoryImpl("com.topcoder.db.connectionfactory.DBConnectionFactoryImpl");
            DatabaseUtil.clearTables(connectionFactory);
            DatabaseUtil.populateTables(connectionFactory);
        } catch (Exception e) {
            throw new IllegalStateException("The setUp() fails", e);
        }
        this.addedContests = new ArrayList<Long>();
        super.setUp();
    }

    /**
     * <p>Tears down the fixture. This method is called after a test is executed.</p>
     */
    public void tearDown() {
        super.tearDown();
        this.testedInstance = null;
        MockWebAuthentication.releaseState();
        MockHttpServletRequest.releaseState();
        MockHttpServletResponse.releaseState();
        MockHttpSession.releaseState();
        try {
            DBConnectionFactoryImpl connectionFactory
                = new DBConnectionFactoryImpl("com.topcoder.db.connectionfactory.DBConnectionFactoryImpl");
            DatabaseUtil.deleteTableRecords(connectionFactory, "contest_medium_xref", "contest_id", this.addedContests);
            DatabaseUtil.deleteTableRecords(connectionFactory, "contest_config", "contest_id", this.addedContests);
            DatabaseUtil.deleteTableRecords(connectionFactory, "contest", "contest_id", this.addedContests);
            DatabaseUtil.clearTables(connectionFactory);
        } catch (Exception e) {
            throw new IllegalArgumentException("The tearDown() fails", e);
        }
        this.addedContests = null;
    }

    /**
     * <p>Accuracy test. Tests the {@link EditContest#dbProcessing()} method for accurate behavior.</p>
     *
     * <p>Passes a request for adding new valid contest and verifies that the contest is saved to underlying data store
     * correctly.</p>
     *
     * @throws Exception if an unexpected error occurs.
     */
    public void testDbProcessing_NewContest() throws Exception {
        // Test setup
        SimpleDateFormat dateFormatter = new SimpleDateFormat(Constants.JAVA_DATE_FORMAT);
        String contestId = "";
        String contestStatusId = "2";
        String contestName = "Contest For Test";
        String startTime = "2008.03.03 12:18";
        String endTime = "2009.03.3 12:18";
        String winnerAnnouncementTime = "2010.03.03 12:18";
        String forumId = "";
        String eventId = "";
        String projectId = "";
        String overview = "Overview";
        String prizeDesc = "The prize is huge";
        String minWidth = "120";
        String maxWidth = "555";
        String minHeight = "100";
        String maxHeight = "600";
        String viewableSubms = "true";
        String viewableSubmt = "false";
        String maxSubms = "10";
        String clientName = "TopCoder Software";
        String[] mediums = {"1", "3", "7"};
        String fullDesc = "Full Description";
        String colorReqs = "Color Requirements";
        String fontReqs = "Font Requirements";
        String sizeReqs = "Size Requirements";
        String contentReqs = "Content Requirements";
        String otherReqs = "Other Requirements";
        String submissionFileFormat = "Submission File Format";
        String winnerAnnounce = "Winner Announcement";
        String eligibility = "Eligiibility";
        String otherFileTypes = "Other file types";
        String contestType = "1";
        String contestChannel = "3";
        String reqPreviewImage = "true";
        String reqPreviewFile = "false";

        MockHttpServletRequest.setMethodResultPerArgs("getParameter_String", Constants.CONTEST_ID, contestId);
        MockHttpServletRequest.setMethodResultPerArgs(
                "getParameter_String", Constants.CONTEST_STATUS_ID, contestStatusId);
        MockHttpServletRequest.setMethodResultPerArgs("getParameter_String", Constants.CONTEST_NAME, contestName);
        MockHttpServletRequest.setMethodResultPerArgs("getParameter_String", Constants.CONTEST_TYPE, contestType);
        MockHttpServletRequest.setMethodResultPerArgs("getParameter_String", Constants.CONTEST_CHANNEL, contestChannel);
        MockHttpServletRequest.setMethodResultPerArgs("getParameter_String", Constants.START_TIME, startTime);
        MockHttpServletRequest.setMethodResultPerArgs("getParameter_String", Constants.END_TIME, endTime);
        MockHttpServletRequest.setMethodResultPerArgs("getParameter_String", Constants.FORUM_ID, forumId);
        MockHttpServletRequest.setMethodResultPerArgs("getParameter_String", Constants.EVENT_ID, eventId);
        MockHttpServletRequest.setMethodResultPerArgs("getParameter_String", Constants.PROJECT_ID_KEY, projectId);
        StringBuilder b = new StringBuilder();
        for (int i = 0; i < mediums.length; i++) {
            String medium = mediums[i];
            MockHttpServletRequest.setMethodResultPerArgs("getParameter_String", Constants.MEDIUM + medium, "on");
            b.append(" ");
            b.append(Constants.MEDIUM);
            b.append(medium);
        }
        MockHttpServletRequest.setMethodResult("getParameterNames", b.toString());
        MockHttpServletRequest.setMethodResultPerArgs(
                "getParameter_String", Constants.WINNER_ANNOUNCEMENT_TIME, winnerAnnouncementTime);
        MockHttpServletRequest.setMethodResultPerArgs(
                "getParameter_String", Constants.CONTEST_PROPERTY + ContestProperty.CONTEST_OVERVIEW_TEXT, overview);
        MockHttpServletRequest.setMethodResultPerArgs(
                "getParameter_String", Constants.CONTEST_PROPERTY + ContestProperty.PRIZE_DESCRIPTION, prizeDesc);
        MockHttpServletRequest.setMethodResultPerArgs(
                "getParameter_String", Constants.CONTEST_PROPERTY + ContestProperty.MIN_WIDTH, minWidth);
        MockHttpServletRequest.setMethodResultPerArgs(
                "getParameter_String", Constants.CONTEST_PROPERTY + ContestProperty.MAX_WIDTH, maxWidth);
        MockHttpServletRequest.setMethodResultPerArgs(
                "getParameter_String", Constants.CONTEST_PROPERTY + ContestProperty.MIN_HEIGHT, minHeight);
        MockHttpServletRequest.setMethodResultPerArgs(
                "getParameter_String", Constants.CONTEST_PROPERTY + ContestProperty.MAX_HEIGHT, maxHeight);
        MockHttpServletRequest.setMethodResultPerArgs(
                "getParameter_String", Constants.CONTEST_PROPERTY + ContestProperty.VIEWABLE_SUBMISSIONS, viewableSubms);
        MockHttpServletRequest.setMethodResultPerArgs(
                "getParameter_String", Constants.CONTEST_PROPERTY + ContestProperty.VIEWABLE_SUBMITTERS, viewableSubmt);
        MockHttpServletRequest.setMethodResultPerArgs(
                "getParameter_String", Constants.CONTEST_PROPERTY + ContestProperty.MAX_SUBMISSIONS, maxSubms);
        MockHttpServletRequest.setMethodResultPerArgs(
                "getParameter_String", Constants.CONTEST_PROPERTY + ContestProperty.CLIENT, clientName);
        MockHttpServletRequest.setMethodResultPerArgs(
                "getParameter_String", Constants.CONTEST_PROPERTY + ContestProperty.FULL_DESCRIPTION, fullDesc);
        MockHttpServletRequest.setMethodResultPerArgs(
                "getParameter_String", Constants.CONTEST_PROPERTY + ContestProperty.COLOR_REQUIREMENTS, colorReqs);
        MockHttpServletRequest.setMethodResultPerArgs(
                "getParameter_String", Constants.CONTEST_PROPERTY + ContestProperty.FONT_REQUIREMENTS, fontReqs);
        MockHttpServletRequest.setMethodResultPerArgs(
                "getParameter_String", Constants.CONTEST_PROPERTY + ContestProperty.SIZE_REQUIREMENTS, sizeReqs);
        MockHttpServletRequest.setMethodResultPerArgs(
                "getParameter_String", Constants.CONTEST_PROPERTY + ContestProperty.CONTENT_REQUIREMENTS, contentReqs);
        MockHttpServletRequest.setMethodResultPerArgs(
                "getParameter_String", Constants.CONTEST_PROPERTY + ContestProperty.OTHER_REQUIREMENTS, otherReqs);
        MockHttpServletRequest.setMethodResultPerArgs(
                "getParameter_String", Constants.CONTEST_PROPERTY + ContestProperty.SUBMISSION_FILE_FORMAT,
                submissionFileFormat);
        MockHttpServletRequest.setMethodResultPerArgs(
                "getParameter_String", Constants.CONTEST_PROPERTY + ContestProperty.WINNER_SELECTION, winnerAnnounce);
        MockHttpServletRequest.setMethodResultPerArgs(
                "getParameter_String", Constants.CONTEST_PROPERTY + ContestProperty.ELIGIBILITY, eligibility);
        MockHttpServletRequest.setMethodResultPerArgs(
                "getParameter_String", Constants.CONTEST_PROPERTY + ContestProperty.OTHER_FILE_TYPES, otherFileTypes);
        MockHttpServletRequest.setMethodResultPerArgs(
                "getParameter_String", Constants.CONTEST_PROPERTY + ContestProperty.REQUIRE_PREVIEW_IMAGE,
                reqPreviewImage);
        MockHttpServletRequest.setMethodResultPerArgs(
                "getParameter_String", Constants.CONTEST_PROPERTY + ContestProperty.REQUIRE_PREVIEW_FILE,
                reqPreviewFile);

        // Execution
        this.testedInstance.process();
        super.tearDown();
        super.setUp();

        // Test verification
        String nextPage = this.testedInstance.getNextPage();
        Assert.assertFalse("The valid contest is not created", "/admin/editContest.jsp".equals(nextPage));
        
        // Get the ID of a new contest
        int pos = nextPage.lastIndexOf('=');
        String newContestId = nextPage.substring(pos + 1);
        this.addedContests.add(new Long(newContestId));

        // Read the contest data from DB and verify it
        ContestDAO contestDAO = StudioDAOUtil.getFactory().getContestDAO();
        Contest contest = contestDAO.find(new Long(newContestId));
        Assert.assertNotNull("The valid contest is not saved to DB", contest);
        Assert.assertEquals("The client name is not saved in DB correctly",
                            clientName, contest.getConfigMap().get(ContestProperty.CLIENT));
        Assert.assertEquals("The winner announcement time is not saved in DB correctly",
                            winnerAnnouncementTime, dateFormatter.format(contest.getWinnerAnnouncementTime()));
        assertMediums(mediums, contest.getMediums());
        ContestPropertyDAO dao = StudioDAOUtil.getFactory().getContestPropertyDAO();
        assertContestProperty(contest, dao.find(ContestProperty.FULL_DESCRIPTION), fullDesc);
        assertContestProperty(contest, dao.find(ContestProperty.COLOR_REQUIREMENTS), colorReqs);
        assertContestProperty(contest, dao.find(ContestProperty.FONT_REQUIREMENTS), fontReqs);
        assertContestProperty(contest, dao.find(ContestProperty.SIZE_REQUIREMENTS), sizeReqs);
        assertContestProperty(contest, dao.find(ContestProperty.CONTENT_REQUIREMENTS), contentReqs);
        assertContestProperty(contest, dao.find(ContestProperty.OTHER_REQUIREMENTS), otherReqs);
        assertContestProperty(contest, dao.find(ContestProperty.SUBMISSION_FILE_FORMAT), submissionFileFormat);
        assertContestProperty(contest, dao.find(ContestProperty.WINNER_SELECTION), winnerAnnounce);
        assertContestProperty(contest, dao.find(ContestProperty.ELIGIBILITY), eligibility);
        assertContestProperty(contest, dao.find(ContestProperty.OTHER_FILE_TYPES), otherFileTypes);
        assertContestProperty(contest, dao.find(ContestProperty.REQUIRE_PREVIEW_IMAGE), reqPreviewImage);
        assertContestProperty(contest, dao.find(ContestProperty.REQUIRE_PREVIEW_FILE), reqPreviewFile);
        assertEquals("The contest type is not saved in DB correctly",
                     contestType, contest.getType().getId().toString());
        assertEquals("The contest channel is not saved in DB correctly",
                     contestChannel, contest.getChannel().getId().toString());
    }

    /**
     * <p>Accuracy test. Tests the {@link EditContest#dbProcessing()} method for accurate behavior.</p>
     *
     * <p>Passes a request for updating existing valid contest and verifies that the contest is saved to underlying
     * data store correctly.</p>
     *
     * @throws Exception if an unexpected error occurs.
     */
    public void testDbProcessing_ExistingContest() throws Exception {
        // Test setup
        SimpleDateFormat dateFormatter = new SimpleDateFormat(Constants.JAVA_DATE_FORMAT);
        String contestId = "4";
        String contestStatusId = "2";
        String contestName = "Contest For Test";
        String startTime = "2008.03.03 12:18";
        String endTime = "2009.03.3 12:18";
        String winnerAnnouncementTime = "2010.03.03 12:18";
        String forumId = "";
        String eventId = "";
        String projectId = "";
        String overview = "Overview";
        String prizeDesc = "The prize is huge";
        String minWidth = "120";
        String maxWidth = "555";
        String minHeight = "100";
        String maxHeight = "600";
        String viewableSubms = "true";
        String viewableSubmt = "false";
        String maxSubms = "10";
        String clientName = "TopCoder Software";
        String[] mediums = {"2", "4", "8"};
        String fullDesc = "Full Description";
        String colorReqs = "";
        String fontReqs = null;
        String sizeReqs = "    ";
        String contentReqs = "\t\n";
        String otherReqs = null;
        String submissionFileFormat = "Submission File Format";
        String winnerAnnounce = "Winner Announcement";
        String eligibility = "Eligiibility";
        String otherFileTypes = "  \t \n    ";
        String contestType = "2";
        String contestChannel = "1";
        String reqPreviewImage = "false";
        String reqPreviewFile = "true";

        MockHttpServletRequest.setMethodResultPerArgs("getParameter_String", Constants.CONTEST_ID, contestId);
        MockHttpServletRequest.setMethodResultPerArgs(
                "getParameter_String", Constants.CONTEST_STATUS_ID, contestStatusId);
        MockHttpServletRequest.setMethodResultPerArgs("getParameter_String", Constants.CONTEST_TYPE, contestType);
        MockHttpServletRequest.setMethodResultPerArgs("getParameter_String", Constants.CONTEST_CHANNEL, contestChannel);
        MockHttpServletRequest.setMethodResultPerArgs("getParameter_String", Constants.CONTEST_NAME, contestName);
        MockHttpServletRequest.setMethodResultPerArgs("getParameter_String", Constants.START_TIME, startTime);
        MockHttpServletRequest.setMethodResultPerArgs("getParameter_String", Constants.END_TIME, endTime);
        MockHttpServletRequest.setMethodResultPerArgs("getParameter_String", Constants.FORUM_ID, forumId);
        MockHttpServletRequest.setMethodResultPerArgs("getParameter_String", Constants.EVENT_ID, eventId);
        MockHttpServletRequest.setMethodResultPerArgs("getParameter_String", Constants.PROJECT_ID_KEY, projectId);
        StringBuilder b = new StringBuilder();
        for (int i = 0; i < mediums.length; i++) {
            String medium = mediums[i];
            MockHttpServletRequest.setMethodResultPerArgs("getParameter_String", Constants.MEDIUM + medium, "on");
            b.append(" ");
            b.append(Constants.MEDIUM);
            b.append(medium);
        }
        MockHttpServletRequest.setMethodResult("getParameterNames", b.toString());
        MockHttpServletRequest.setMethodResultPerArgs(
                "getParameter_String", Constants.WINNER_ANNOUNCEMENT_TIME, winnerAnnouncementTime);
        MockHttpServletRequest.setMethodResultPerArgs(
                "getParameter_String", Constants.CONTEST_PROPERTY + ContestProperty.CONTEST_OVERVIEW_TEXT, overview);
        MockHttpServletRequest.setMethodResultPerArgs(
                "getParameter_String", Constants.CONTEST_PROPERTY + ContestProperty.PRIZE_DESCRIPTION, prizeDesc);
        MockHttpServletRequest.setMethodResultPerArgs(
                "getParameter_String", Constants.CONTEST_PROPERTY + ContestProperty.MIN_WIDTH, minWidth);
        MockHttpServletRequest.setMethodResultPerArgs(
                "getParameter_String", Constants.CONTEST_PROPERTY + ContestProperty.MAX_WIDTH, maxWidth);
        MockHttpServletRequest.setMethodResultPerArgs(
                "getParameter_String", Constants.CONTEST_PROPERTY + ContestProperty.MIN_HEIGHT, minHeight);
        MockHttpServletRequest.setMethodResultPerArgs(
                "getParameter_String", Constants.CONTEST_PROPERTY + ContestProperty.MAX_HEIGHT, maxHeight);
        MockHttpServletRequest.setMethodResultPerArgs(
                "getParameter_String", Constants.CONTEST_PROPERTY + ContestProperty.VIEWABLE_SUBMISSIONS, viewableSubms);
        MockHttpServletRequest.setMethodResultPerArgs(
                "getParameter_String", Constants.CONTEST_PROPERTY + ContestProperty.VIEWABLE_SUBMITTERS, viewableSubmt);
        MockHttpServletRequest.setMethodResultPerArgs(
                "getParameter_String", Constants.CONTEST_PROPERTY + ContestProperty.MAX_SUBMISSIONS, maxSubms);
        MockHttpServletRequest.setMethodResultPerArgs(
                "getParameter_String", Constants.CONTEST_PROPERTY + ContestProperty.CLIENT, clientName);
        MockHttpServletRequest.setMethodResultPerArgs(
                "getParameter_String", Constants.CONTEST_PROPERTY + ContestProperty.FULL_DESCRIPTION, fullDesc);
        MockHttpServletRequest.setMethodResultPerArgs(
                "getParameter_String", Constants.CONTEST_PROPERTY + ContestProperty.COLOR_REQUIREMENTS, colorReqs);
        MockHttpServletRequest.setMethodResultPerArgs(
                "getParameter_String", Constants.CONTEST_PROPERTY + ContestProperty.FONT_REQUIREMENTS, fontReqs);
        MockHttpServletRequest.setMethodResultPerArgs(
                "getParameter_String", Constants.CONTEST_PROPERTY + ContestProperty.SIZE_REQUIREMENTS, sizeReqs);
        MockHttpServletRequest.setMethodResultPerArgs(
                "getParameter_String", Constants.CONTEST_PROPERTY + ContestProperty.CONTENT_REQUIREMENTS, contentReqs);
        MockHttpServletRequest.setMethodResultPerArgs(
                "getParameter_String", Constants.CONTEST_PROPERTY + ContestProperty.OTHER_REQUIREMENTS, otherReqs);
        MockHttpServletRequest.setMethodResultPerArgs(
                "getParameter_String", Constants.CONTEST_PROPERTY + ContestProperty.SUBMISSION_FILE_FORMAT,
                submissionFileFormat);
        MockHttpServletRequest.setMethodResultPerArgs(
                "getParameter_String", Constants.CONTEST_PROPERTY + ContestProperty.WINNER_SELECTION, winnerAnnounce);
        MockHttpServletRequest.setMethodResultPerArgs(
                "getParameter_String", Constants.CONTEST_PROPERTY + ContestProperty.ELIGIBILITY, eligibility);
        MockHttpServletRequest.setMethodResultPerArgs(
                "getParameter_String", Constants.CONTEST_PROPERTY + ContestProperty.OTHER_FILE_TYPES, otherFileTypes);
        MockHttpServletRequest.setMethodResultPerArgs(
                "getParameter_String", Constants.CONTEST_PROPERTY + ContestProperty.REQUIRE_PREVIEW_IMAGE,
                reqPreviewImage);
        MockHttpServletRequest.setMethodResultPerArgs(
                "getParameter_String", Constants.CONTEST_PROPERTY + ContestProperty.REQUIRE_PREVIEW_FILE,
                reqPreviewFile);

        // Execution
        this.testedInstance.process();
        super.tearDown();
        super.setUp();

        // Test verification
        String nextPage = this.testedInstance.getNextPage();
        Assert.assertFalse("The valid contest is not created", "/admin/editContest.jsp".equals(nextPage));

        // Read the contest data from DB and verify it
        ContestDAO contestDAO = StudioDAOUtil.getFactory().getContestDAO();
        Contest contest = contestDAO.find(new Long(contestId));
        Assert.assertNotNull("The valid contest is not saved to DB", contest);
        Assert.assertEquals("The client name is not saved in DB correctly",
                            clientName, contest.getConfigMap().get(ContestProperty.CLIENT));
        Assert.assertEquals("The winner announcement time is not saved in DB correctly",
                            winnerAnnouncementTime, dateFormatter.format(contest.getWinnerAnnouncementTime()));
        assertMediums(mediums, contest.getMediums());
        ContestPropertyDAO dao = StudioDAOUtil.getFactory().getContestPropertyDAO();
        assertContestProperty(contest, dao.find(ContestProperty.FULL_DESCRIPTION), fullDesc);
        assertContestProperty(contest, dao.find(ContestProperty.COLOR_REQUIREMENTS), null);
        assertContestProperty(contest, dao.find(ContestProperty.FONT_REQUIREMENTS), null);
        assertContestProperty(contest, dao.find(ContestProperty.SIZE_REQUIREMENTS), null);
        assertContestProperty(contest, dao.find(ContestProperty.CONTENT_REQUIREMENTS), null);
        assertContestProperty(contest, dao.find(ContestProperty.OTHER_REQUIREMENTS), null);
        assertContestProperty(contest, dao.find(ContestProperty.SUBMISSION_FILE_FORMAT), submissionFileFormat);
        assertContestProperty(contest, dao.find(ContestProperty.WINNER_SELECTION), winnerAnnounce);
        assertContestProperty(contest, dao.find(ContestProperty.ELIGIBILITY), eligibility);
        assertContestProperty(contest, dao.find(ContestProperty.OTHER_FILE_TYPES), null);
        assertContestProperty(contest, dao.find(ContestProperty.REQUIRE_PREVIEW_IMAGE), reqPreviewImage);
        assertContestProperty(contest, dao.find(ContestProperty.REQUIRE_PREVIEW_FILE), reqPreviewFile);
        assertEquals("The contest type is not saved in DB correctly",
                     contestType, contest.getType().getId().toString());
        assertEquals("The contest channel is not saved in DB correctly",
                     contestChannel, contest.getChannel().getId().toString());
    }

    /**
     * <p>Verifies that the contest mediums are matching the expected values.</p>
     *
     * @param expectedMediums a <code>String</code> array listing the IDs of mediums which are expected to be provided
     *        with contest.
     * @param actualMediums a <code>Set</code> containing the actual mediums for the contest.
     */
    private void assertMediums(String[] expectedMediums, Set<Medium> actualMediums) {
        Assert.assertEquals("The medium types are not saved in DB correctly",
                            expectedMediums.length, actualMediums.size());
        for (int i = 0; i < expectedMediums.length; i++) {
            String medium = expectedMediums[i];
            boolean found = false;
            for (Medium contestMedium : actualMediums) {
                if (medium.equals(String.valueOf(contestMedium.getId()))) {
                    found = true;
                }
            }
            Assert.assertTrue("The medium types are not saved in DB correctly", found);
        }
    }

    /**
     * <p>Verifies that the specified contest has the specified property set.</p>
     *
     * @param contest a <code>Contest</code> to verify.
     * @param expectedProperty a <code>ContestType</code> providing the expected data for the contest type.
     * @param expectedValue a <code>String</code> providing the expected value of specified property.
     * @since TopCoder Studio Modifications Assembly
     */
    private void assertContestProperty(Contest contest, ContestProperty expectedProperty, String expectedValue) {
        Map<Integer,String> config = contest.getConfigMap();
        Assert.assertTrue("The [" + expectedProperty.getDescription() + "] property is not set",
                          config.containsKey(expectedProperty.getId()));
        Assert.assertEquals("The [" + expectedProperty.getDescription() + "] property is not set correctly",
                            expectedValue, config.get(expectedProperty.getId()));
    }
}
