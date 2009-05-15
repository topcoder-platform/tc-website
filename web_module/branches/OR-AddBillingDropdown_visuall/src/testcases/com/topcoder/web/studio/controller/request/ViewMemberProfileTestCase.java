/*
 * Copyright (C) 2008 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.studio.controller.request;

import com.topcoder.web.studio.mock.MockWebAuthentication;
import com.topcoder.web.studio.mock.MockHttpServletRequest;
import com.topcoder.web.studio.mock.MockHttpServletResponse;
import com.topcoder.web.studio.mock.MockHttpSession;
import com.topcoder.web.studio.Constants;
import com.topcoder.web.studio.DatabaseUtil;
import com.topcoder.web.studio.model.ContestType;
import com.topcoder.web.studio.dto.MemberProfile;
import com.topcoder.web.studio.dto.ContestStatistics;
import com.topcoder.web.common.SimpleRequest;
import com.topcoder.web.common.SimpleResponse;
import com.topcoder.web.common.SessionInfo;
import com.topcoder.web.common.BaseProcessor;
import com.topcoder.shared.security.SimpleUser;
import com.topcoder.shared.security.User;
import com.topcoder.shared.util.sql.InformixSimpleDataSource;
import com.topcoder.shared.util.DBMS;
import com.topcoder.util.config.ConfigManager;

import org.mockejb.jndi.MockContextFactory;

import javax.sql.DataSource;
import javax.naming.InitialContext;
import java.util.HashSet;
import java.util.List;
import java.util.Map;

import junit.framework.Assert;
import junit.framework.TestCase;

/**
 * <p>A unit test for {@link ViewMemberProfile} class.</p>
 *
 * @author TCSDEVELOPER
 * @version 1.0
 * @since TopCoder Studio Member Profile Assembly
 */
public class ViewMemberProfileTestCase extends TestCase {

    /**
     * <p>The instance of {@link ViewMemberProfile} which is tested. This instance is initialized in {@link #setUp()}
     * method and released in {@link #tearDown()} method.</p>
     */
    private ViewMemberProfile testedInstance = null;

    /**
     * <p>A <code>DataSource</code> to be used for obtaining connections to target <code>Studio</code> database.</p>
     */
    private DataSource studioDataSoruce = null;

    /**
     * <p>Constructs new <code>ViewMemberProfileTestCase</code> instance with specified test name.</p>
     *
     * @param name a <code>String</code> providing the name of the test.
     */
    public ViewMemberProfileTestCase(String name) {
        setName(name);
    }

    /**
     * <p>Sets up the fixture. This method is called before a test is executed.</p>
     * 
     * @throws Exception if an unexpected error occurs.
     */
    public void setUp() throws Exception {
        super.setUp();
        
        MockWebAuthentication.releaseState();
        MockHttpServletRequest.releaseState();
        MockHttpServletResponse.releaseState();
        MockHttpSession.releaseState();

        User user = new SimpleUser(132456, "heffan", "password");
        MockWebAuthentication.setMethodResult("getUser", user);
        MockWebAuthentication.setMethodResult("getActiveUser", user);
        MockWebAuthentication.setMethodResult("isKnownUser", true);

        MockHttpSession.setMethodResult("getId", String.valueOf(System.currentTimeMillis()));

        MockHttpServletRequest.setMethodResult("getServerName", "studio.cloud.topcoder.com");
        MockHttpServletRequest.setMethodResult("getContextPath", "");
        MockHttpServletRequest.setMethodResult("getServletPath", "");
        MockHttpServletRequest.setMethodResult("getQueryString", "");
        MockHttpServletRequest.setMethodResult("getSession", new MockHttpSession());

        SimpleRequest request = new SimpleRequest(new MockHttpServletRequest());

        this.testedInstance = new ViewMemberProfile();
        this.testedInstance.setResponse(new SimpleResponse(new MockHttpServletResponse()));
        this.testedInstance.setAuthentication(new MockWebAuthentication());
        this.testedInstance.setRequest(request);

        try {
            SessionInfo sessionInfo = new SessionInfo(request, new MockWebAuthentication(), new HashSet());
            MockHttpServletRequest.setMethodResultPerArgs("getAttribute_String", "sessionInfo", sessionInfo);

            String dbNamespace = "com.topcoder.db.connectionfactory.DBConnectionFactoryImpl";
            ConfigManager cm = ConfigManager.getInstance();
            String jdbcUrl = cm.getString(dbNamespace, "connections.TestingConnection.parameters.jdbc_url");
            String jdbcUser = cm.getString(dbNamespace, "connections.TestingConnection.parameters.user");
            String jdbcPassword = cm.getString(dbNamespace, "connections.TestingConnection.parameters.password");

            this.studioDataSoruce = new InformixSimpleDataSource(jdbcUrl, jdbcUser, jdbcPassword);
            MockContextFactory.setAsInitial();
            InitialContext context = new InitialContext();
            context.bind(DBMS.STUDIO_DATASOURCE_NAME, this.studioDataSoruce);
            context.bind(DBMS.OLTP_DATASOURCE_NAME,
                         new InformixSimpleDataSource(jdbcUrl.replaceAll("studio_oltp", "informixoltp"),
                                                      jdbcUser, jdbcPassword));
            context.bind(DBMS.COMMON_OLTP_DATASOURCE_NAME,
                         new InformixSimpleDataSource(jdbcUrl.replaceAll("studio_oltp", "common_oltp"),
                                                      jdbcUser, jdbcPassword));
        } catch (Exception e) {
            throw new IllegalStateException("The setUp() fails", e);
        }
    }

    /**
     * <p>Tears down the fixture. This method is called after a test is executed.</p>
     *
     * @throws Exception if an unexpected error occurs.
     */
    public void tearDown() throws Exception {
        super.tearDown();
        this.studioDataSoruce = null;
        this.testedInstance = null;
        MockWebAuthentication.releaseState();
        MockHttpServletRequest.releaseState();
        MockHttpServletResponse.releaseState();
        MockHttpSession.releaseState();
        MockContextFactory.revertSetAsInitial();
    }

    /**
     * <p>Accuracy test. Tests the {@link ViewMemberProfile#businessProcessing()} method for accurate behavior.</p>
     * <p/>
     *
     * <p>Passes a request for viewing member profile for existing user who has member photo uploaded and displayable
     * and expects the method to find the desired profile, fill it with valid data and forward request to appropriate
     * view.</p>
     *
     * @throws Exception if an unexpected error occurs.
     */
    public void testBusinessProcessing_ExistingUser_PublicPhoto() throws Exception {
        runTestForExistingUser("heffan");
    }

    /**
     * <p>Accuracy test. Tests the {@link ViewMemberProfile#businessProcessing()} method for accurate behavior.</p>
     * <p/>
     *
     * <p>Passes a request for viewing member profile for existing user who has member photo uploaded but it is marked
     * non-displayable and expects the method to find the desired profile, fill it with valid data and forward request
     * to appropriate view.</p>
     *
     * @throws Exception if an unexpected error occurs.
     */
    public void testBusinessProcessing_ExistingUser_PrivatePhoto() throws Exception {
        runTestForExistingUser("Yoshi");
    }

    /**
     * <p>Accuracy test. Tests the {@link ViewMemberProfile#businessProcessing()} method for accurate behavior.</p>
     * <p/>
     *
     * <p>Passes a request for viewing member profile for existing user who does not have member photo uploaded and
     * expects the method to find the desired profile, fill it with valid data and forward request to appropriate view.
     * </p>
     *
     * @throws Exception if an unexpected error occurs.
     */
    public void testBusinessProcessing_ExistingUser_NoPhoto() throws Exception {
        runTestForExistingUser("super");
    }

    /**
     * <p>Accuracy test. Tests the {@link ViewMemberProfile#businessProcessing()} method for accurate behavior.</p>
     * <p/>
     *
     * <p>Passes a request for viewing member profile for non-existing user and expects the method not to find the
     * desired profile and forward request to appropriate view.</p>
     *
     * @throws Exception if an unexpected error occurs.
     */
    public void testBusinessProcessing_NonExistingUser() throws Exception {
        // Test setup
        MockHttpServletRequest.setMethodResultPerArgs("getParameter_String", Constants.HANDLE, "NonExistingUser1212");

        // Execution
        this.testedInstance.process();

        // Validation
        boolean processorDefaultsSet = false;
        String nextPage = this.testedInstance.getNextPage();
        Assert.assertEquals("The request is forwarded to wrong page", "/memberProfile.jsp", nextPage);
        List args = MockHttpServletRequest.getMethodArguments("setAttribute_String_Object");
        for (int j = 0; j < args.size(); j++) {
            Map callArgs = (Map) args.get(j);
            String attrName = (String) callArgs.get("1");
            if (BaseProcessor.DEFAULTS_KEY.equals(attrName)) {
                processorDefaultsSet = true;
                Object attrValue = callArgs.get("2");
                Assert.assertNotNull("NULL processor defaults set", attrValue);
                Assert.assertTrue("Wrong processor defaults bound to request", attrValue instanceof Map);
                Map processorDefaults = (Map) attrValue;
                Assert.assertTrue("The NULL profile for non-found user is not bound to request",
                                  processorDefaults.containsKey(Constants.MEMBER_PROFILE));
                Object profileObject = processorDefaults.get(Constants.MEMBER_PROFILE);
                Assert.assertNull("The profile for non-found user is not NULL", profileObject);
            }
        }
        Assert.assertTrue("The processor defaults are not bound to request", processorDefaultsSet);
    }

    /**
     * <p>Runs the test for viewing the member profile for the specified existing user.</p>
     *
     * @param handle a <code>String</code> providing the handle for the user to run the test for.
     * @throws Exception if an unexpected error occurs.
     */
    private void runTestForExistingUser(String handle) throws Exception {
        // Test setup
        MockHttpServletRequest.setMethodResultPerArgs("getParameter_String", Constants.HANDLE, handle);

        // Execution
        this.testedInstance.process();

        // Validation
        boolean processorDefaultsSet = false;
        String nextPage = this.testedInstance.getNextPage();
        Assert.assertEquals("The request is forwarded to wrong page", "/memberProfile.jsp", nextPage);
        List args = MockHttpServletRequest.getMethodArguments("setAttribute_String_Object");
        for (int j = 0; j < args.size(); j++) {
            Map callArgs = (Map) args.get(j);
            String attrName = (String) callArgs.get("1");
            if (BaseProcessor.DEFAULTS_KEY.equals(attrName)) {
                processorDefaultsSet = true;
                Object attrValue = callArgs.get("2");
                Assert.assertNotNull("NULL processor defaults set", attrValue);
                Assert.assertTrue("Wrong processor defaults bound to request", attrValue instanceof Map);
                Map processorDefaults = (Map) attrValue;
                Assert.assertTrue("The profile for found user is not bound to request",
                                  processorDefaults.containsKey(Constants.MEMBER_PROFILE));
                Object profileObject = processorDefaults.get(Constants.MEMBER_PROFILE);
                Assert.assertNotNull("The profile for found user is not bound to request", profileObject);
                Assert.assertNotNull("The profile bound to request is of wrong type",
                                     profileObject instanceof MemberProfile);

                MemberProfile profile = (MemberProfile) profileObject;
                MemberProfile expectedProfile = DatabaseUtil.getMemberProfile(this.studioDataSoruce, handle);

                assertProfiles(expectedProfile, profile);
            }
        }
        Assert.assertTrue("The processor defaults are not bound to request", processorDefaultsSet);
    }

    /**
     * <p>Compares the specified profile. Verifies that all profile properties are equal. In case any property differs
     * then an assertion error is raised and the overall test fails.</p>
     *
     * @param expectedProfile a <code>MemberProfile</code> representing the expected profile.
     * @param actualProfile a <code>MemberProfile</code> representing the actual profile.
     */
    private void assertProfiles(MemberProfile expectedProfile, MemberProfile actualProfile) {
        Assert.assertEquals("Wrong profile handle", expectedProfile.getHandle(), actualProfile.getHandle());
        Assert.assertNull("The country is populated by mistake", actualProfile.getCountry());
        Assert.assertNull("The school is populated by mistake", actualProfile.getSchool());
        Assert.assertEquals("Wrong profile registration date",
                            expectedProfile.getMemberSince(), actualProfile.getMemberSince());
        Assert.assertEquals("Wrong profile quote", expectedProfile.getQuote(), actualProfile.getQuote());
        Assert.assertEquals("Wrong profile image URL", expectedProfile.getImageUrl(), actualProfile.getImageUrl());

        Map<Integer, ContestStatistics> expectedStats = expectedProfile.getStatistics();
        Map<Integer, ContestStatistics> actualStats = actualProfile.getStatistics();

        Assert.assertEquals("Wrong number of statistics", expectedStats.size(), actualStats.size());
        for (Integer contestTypeId : expectedStats.keySet()) {
            ContestStatistics expectedTypeStats = expectedStats.get(contestTypeId);
            if (actualStats.containsKey(contestTypeId)) {
                ContestStatistics actualTypeStats = actualStats.get(contestTypeId);
                Assert.assertEquals("Wrong number of contests registered for contest type: " + contestTypeId,
                                    expectedTypeStats.getContestsRegistered(), actualTypeStats.getContestsRegistered());
                Assert.assertEquals("Wrong number of submissions for contest type: " + contestTypeId,
                                    expectedTypeStats.getNumberOfSubmissions(),
                                    actualTypeStats.getNumberOfSubmissions());
                Assert.assertEquals("Wrong number of wins for contest type: " + contestTypeId,
                                    expectedTypeStats.getNumberOfWins(), actualTypeStats.getNumberOfWins());
                Assert.assertEquals("Wrong passed screening percentage for contest type: " + contestTypeId,
                                    expectedTypeStats.getPassedScreeningPercentage(),
                                    actualTypeStats.getPassedScreeningPercentage());
                Assert.assertEquals("Wrong number of submissions passed screening for contest type: " + contestTypeId,
                                    expectedTypeStats.getSubmissionPassedScreening(),
                                    actualTypeStats.getSubmissionPassedScreening());
                Assert.assertEquals("Wrong submission percentage for contest type: " + contestTypeId,
                                    expectedTypeStats.getSubmissionPercentage(),
                                    actualTypeStats.getSubmissionPercentage());
                Assert.assertEquals("Wrong win percentage for contest type: " + contestTypeId,
                                    expectedTypeStats.getWinPercentage(), actualTypeStats.getWinPercentage());
                ContestType expectedContestType = expectedTypeStats.getContestType();
                ContestType actualContestType = actualTypeStats.getContestType();
                Assert.assertEquals("Wrong contest type ID for contest type: " + contestTypeId,
                                    expectedContestType.getId(), actualContestType.getId());
                Assert.assertEquals("Wrong contest type description for contest type: " + contestTypeId,
                                    expectedContestType.getDescription(), actualContestType.getDescription());
                Assert.assertEquals("Wrong contest type include gallery flag for contest type: " + contestTypeId,
                                    expectedContestType.getIncludeGallery(), actualContestType.getIncludeGallery());
                Assert.assertEquals("Wrong contest type preview file required flag for contest type: " + contestTypeId,
                                    expectedContestType.getPreviewFileRequired(),
                                    actualContestType.getPreviewFileRequired());
                Assert.assertEquals("Wrong contest type preview image required flag for contest type: " + contestTypeId,
                                    expectedContestType.getPreviewImageRequired(),
                                    actualContestType.getPreviewImageRequired());
            } else {
                Assert.fail("Missing statistics for contest type: " + contestTypeId);
            }
        }
    }
}
