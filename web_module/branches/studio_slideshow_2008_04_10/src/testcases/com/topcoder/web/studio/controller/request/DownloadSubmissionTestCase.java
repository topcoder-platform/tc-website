/*
 * Copyright (C) 2008 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.studio.controller.request;

import com.topcoder.db.connectionfactory.DBConnectionFactoryImpl;
import com.topcoder.shared.security.SimpleUser;
import com.topcoder.shared.security.User;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.sql.InformixSimpleDataSource;
import com.topcoder.util.config.ConfigManager;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.SessionInfo;
import com.topcoder.web.common.SimpleRequest;
import com.topcoder.web.common.SimpleResponse;
import com.topcoder.web.studio.Constants;
import com.topcoder.web.studio.DatabaseUtil;
import com.topcoder.web.studio.ServletOutputStreamImpl;
import com.topcoder.web.studio.TCHibernateTestCase;
import com.topcoder.web.studio.mock.MockHttpServletRequest;
import com.topcoder.web.studio.mock.MockHttpServletResponse;
import com.topcoder.web.studio.mock.MockHttpSession;
import com.topcoder.web.studio.mock.MockWebAuthentication;
import junit.framework.Assert;
import org.mockejb.jndi.MockContextFactory;

import javax.naming.InitialContext;
import javax.sql.DataSource;
import java.io.ByteArrayOutputStream;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Map;

/**
 * <p>A unit test case for {@link DownloadSubmission} class.</p>
 *
 * @author isv
 * @version 1.0
 * @since TopCoder Studio Modifications Assembly (Req# 5.8)
 */
public class DownloadSubmissionTestCase extends TCHibernateTestCase {

    /**
     * <p>The instance of {@link DownloadSubmission} which is tested. This instance is initialized in {@link #setUp()}
     * method and released in {@link #tearDown()} method.</p>
     */
    private DownloadSubmission testedInstance = null;

    /**
     * <p>Constructs new <code>DownloadSubmissionTestCase</code> instance with specified test name.</p>
     *
     * @param name a <code>String</code> providing the name of the test.
     */
    public DownloadSubmissionTestCase(String name) {
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

        this.testedInstance = new DownloadSubmission();
        this.testedInstance.setResponse(new SimpleResponse(new MockHttpServletResponse()));
        this.testedInstance.setAuthentication(new MockWebAuthentication());
        this.testedInstance.setRequest(request);

        try {
            SessionInfo sessionInfo = new SessionInfo(request, new MockWebAuthentication(), new HashSet());
            MockHttpServletRequest.setMethodResultPerArgs("getAttribute_String", "sessionInfo", sessionInfo);

            String dbNamespace = "com.topcoder.db.connectionfactory.DBConnectionFactoryImpl";
            DBConnectionFactoryImpl connectionFactory = new DBConnectionFactoryImpl(dbNamespace);
            DatabaseUtil.clearTables(connectionFactory);
            DatabaseUtil.populateTables(connectionFactory);

            ConfigManager cm = ConfigManager.getInstance();
            String jdbcUrl = cm.getString(dbNamespace, "connections.TestingConnection.parameters.jdbc_url");
            String jdbcUser = cm.getString(dbNamespace, "connections.TestingConnection.parameters.user");
            String jdbcPassword = cm.getString(dbNamespace, "connections.TestingConnection.parameters.password");

            DataSource ds = new InformixSimpleDataSource(jdbcUrl, jdbcUser, jdbcPassword);
            MockContextFactory.setAsInitial();
            new InitialContext().bind(DBMS.STUDIO_DATASOURCE_NAME, ds);
        } catch (Exception e) {
            throw new IllegalStateException("The setUp() fails", e);
        }

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
        MockContextFactory.revertSetAsInitial();
        try {
            DBConnectionFactoryImpl connectionFactory
                    = new DBConnectionFactoryImpl("com.topcoder.db.connectionfactory.DBConnectionFactoryImpl");
            DatabaseUtil.clearTables(connectionFactory);
        } catch (Exception e) {
            throw new IllegalArgumentException("The tearDown() fails", e);
        }
    }

    /**
     * <p>Accuracy test. Tests the {@link DownloadSubmission#dbProcessing()} method for accurate behavior.</p>
     * <p/>
     * <p>Passes a request for downloading the submission for a closed contest which originated from <code>Studio
     * Administrator V1</code> channel and verifies that the method returns the appropriate content and sets the
     * response content type correctly when submission owner is requesting a download.</p>
     *
     * @throws Exception if an unexpected error occurs.
     */
    public void testDbProcessing_OldContest_Over_Owner() throws Exception {
        // Test setup
        long contestId = 6;
        long submissionId = 3;
        long userId = 1;
        String handle = "dok_test";

        ByteArrayOutputStream baos = new ByteArrayOutputStream();

        MockHttpServletRequest.setMethodResultPerArgs("getParameter_String", "sbmid", String.valueOf(submissionId));

        MockHttpServletResponse.setMethodResult("getOutputStream", new ServletOutputStreamImpl(baos));

        // Execution
        this.testedInstance.process();
        super.tearDown();
        super.setUp();

        // Test verification
        Assert.assertTrue("The response content type is not set",
                MockHttpServletResponse.wasMethodCalled("setContentType_String"));
        List args = MockHttpServletResponse.getMethodArguments("setContentType_String");
        Map callArgs = (Map) args.get(0);
        String contentType = (String) callArgs.get("1");
        Assert.assertTrue("Wrong response content type set", "application/zip".equals(contentType)
                || "application/x-zip".equals(contentType)
                || "application/x-zip-compressed".equals(contentType));

        byte[] expectedContent = readSubmissionFile(contestId, handle, userId, "tcs_submission.zip");
        byte[] actualContent = baos.toByteArray();
        Assert.assertTrue("Wrong content is returned", Arrays.equals(expectedContent, actualContent));
    }

    /**
     * <p>Accuracy test. Tests the {@link DownloadSubmission#dbProcessing()} method for accurate behavior.</p>
     * <p/>
     * <p>Passes a request for downloading the submission of various alternate form for a closed contest which
     * originated from <code>Studio Administrator V1</code> channel and verifies that the method returns the
     * appropriate content and sets the response content type correctly when submission owner is requesting a download.
     * </p>
     *
     * @throws Exception if an unexpected error occurs.
     */
    public void testDbProcessing_OldContest_Over_Owner_Alternate() throws Exception {
        // Test setup
        String[] types = {"tiny", "small", "medium", "full", "original"};

        long contestId = 6;
        long submissionId = 3;
        long userId = 1;
        String handle = "dok_test";

        for (int i = 0; i < types.length; i++) {
            String type = types[i];
            ByteArrayOutputStream baos = new ByteArrayOutputStream();

            MockHttpServletRequest.setMethodResultPerArgs("getParameter_String", "sbmid", String.valueOf(submissionId));
            MockHttpServletRequest.setMethodResultPerArgs("getParameter_String", "sbt", type);

            MockHttpServletResponse.setMethodResult("getOutputStream", new ServletOutputStreamImpl(baos));

            // Execution
            this.testedInstance.process();
            super.tearDown();
            super.setUp();

            // Test verification
            Assert.assertTrue("The response content type is not set",
                    MockHttpServletResponse.wasMethodCalled("setContentType_String"));
            List args = MockHttpServletResponse.getMethodArguments("setContentType_String");
            Map callArgs = (Map) args.get(0);
            String contentType = (String) callArgs.get("1");
            Assert.assertTrue("Wrong response content type set", "application/zip".equals(contentType)
                    || "application/x-zip".equals(contentType)
                    || "application/x-zip-compressed".equals(contentType));

            byte[] expectedContent = readSubmissionFile(contestId, handle, userId, "tcs_submission.zip");
            byte[] actualContent = baos.toByteArray();
            Assert.assertTrue("Wrong content is returned", Arrays.equals(expectedContent, actualContent));
        }
    }

    /**
     * <p>Accuracy test. Tests the {@link DownloadSubmission#dbProcessing()} method for accurate behavior.</p>
     * <p/>
     * <p>Passes a request for downloading the submission for a closed contest which originated from <code>TC Direct
     * </code> channel and verifies that the method returns the appropriate content and sets the response content type
     * correctly when submission owner is requesting a download.</p>
     *
     * @throws Exception if an unexpected error occurs.
     */
    public void testDbProcessing_TCDirect_Over_Owner() throws Exception {
        // Test setup
        long contestId = 8;
        long submissionId = 5;
        long userId = 1;
        String handle = "dok_test";

        ByteArrayOutputStream baos = new ByteArrayOutputStream();

        MockHttpServletRequest.setMethodResultPerArgs("getParameter_String", "sbmid", String.valueOf(submissionId));

        MockHttpServletResponse.setMethodResult("getOutputStream", new ServletOutputStreamImpl(baos));

        // Execution
        this.testedInstance.process();
        super.tearDown();
        super.setUp();

        // Test verification
        Assert.assertTrue("The response content type is not set",
                MockHttpServletResponse.wasMethodCalled("setContentType_String"));
        List args = MockHttpServletResponse.getMethodArguments("setContentType_String");
        Map callArgs = (Map) args.get(0);
        String contentType = (String) callArgs.get("1");
        Assert.assertTrue("Wrong response content type set", "application/zip".equals(contentType)
                || "application/x-zip".equals(contentType)
                || "application/x-zip-compressed".equals(contentType));

        byte[] expectedContent = readSubmissionFile(contestId, handle, userId, submissionId + "_preview.zip");
        byte[] actualContent = baos.toByteArray();
        Assert.assertTrue("Wrong content is returned", Arrays.equals(expectedContent, actualContent));
    }

    /**
     * <p>Accuracy test. Tests the {@link DownloadSubmission#dbProcessing()} method for accurate behavior.</p>
     * <p/>
     * <p>Passes a request for downloading the submission of various alternate forms for a closed contest which
     * originated from <code>Studio Administrator V1</code> channel and verifies that the method returns the appropriate
     * content and sets the response content type correctly when submission owner is requesting a download.</p>
     *
     * @throws Exception if an unexpected error occurs.
     */
    public void testDbProcessing_TCDirect_Over_Owner_Alternate() throws Exception {
        // Test setup
        long contestId = 8;
        long submissionId = 5;
        long userId = 1;
        String handle = "dok_test";
        String[] types = {"tiny", "small", "medium", null, "original", "full"};
        String[] files = {submissionId + "_25_1.jpg", submissionId + "_29_1.png", submissionId + "_30_1.png",
                submissionId + "_preview.zip", "tcs_submission.zip", submissionId + "_31_1.png"};

        for (int i = 0; i < types.length; i++) {
            String type = types[i];
            ByteArrayOutputStream baos = new ByteArrayOutputStream();

            MockHttpServletRequest.setMethodResultPerArgs("getParameter_String", "sbmid", String.valueOf(submissionId));
            MockHttpServletRequest.setMethodResultPerArgs("getParameter_String", "sbt", type);

            MockHttpServletResponse.setMethodResult("getOutputStream", new ServletOutputStreamImpl(baos));

            // Execution
            this.testedInstance.process();
            super.tearDown();
            super.setUp();

            // Test verification
            Assert.assertTrue("The response content type is not set",
                    MockHttpServletResponse.wasMethodCalled("setContentType_String"));
            byte[] expectedContent = readSubmissionFile(contestId, handle, userId, files[i]);
            byte[] actualContent = baos.toByteArray();
            Assert.assertTrue("Wrong content is returned " + files[i], Arrays.equals(expectedContent, actualContent));
        }
    }

    /**
     * <p>Accuracy test. Tests the {@link DownloadSubmission#dbProcessing()} method for accurate behavior.</p>
     * <p/>
     * <p>Passes a request for downloading the submission for a closed contest which originated from <code>Studio
     * Administrator</code> channel and verifies that the method returns the appropriate content and sets the response
     * content type correctly when submission owner is requesting a download.</p>
     *
     * @throws Exception if an unexpected error occurs.
     */
    public void testDbProcessing_Studio_Over_Owner() throws Exception {
        // Test setup
        long contestId = 10;
        long submissionId = 7;
        long userId = 1;
        String handle = "dok_test";

        ByteArrayOutputStream baos = new ByteArrayOutputStream();

        MockHttpServletRequest.setMethodResultPerArgs("getParameter_String", "sbmid", String.valueOf(submissionId));

        MockHttpServletResponse.setMethodResult("getOutputStream", new ServletOutputStreamImpl(baos));

        // Execution
        this.testedInstance.process();
        super.tearDown();
        super.setUp();

        // Test verification
        Assert.assertTrue("The response content type is not set",
                MockHttpServletResponse.wasMethodCalled("setContentType_String"));
        List args = MockHttpServletResponse.getMethodArguments("setContentType_String");
        Map callArgs = (Map) args.get(0);
        String contentType = (String) callArgs.get("1");
        Assert.assertTrue("Wrong response content type set", "application/zip".equals(contentType)
                || "application/x-zip".equals(contentType)
                || "application/x-zip-compressed".equals(contentType));

        byte[] expectedContent = readSubmissionFile(contestId, handle, userId, submissionId + "_preview.zip");
        byte[] actualContent = baos.toByteArray();
        Assert.assertTrue("Wrong content is returned", Arrays.equals(expectedContent, actualContent));
    }

    /**
     * <p>Accuracy test. Tests the {@link DownloadSubmission#dbProcessing()} method for accurate behavior.</p>
     * <p/>
     * <p>Passes a request for downloading the submission of various alternate forms for a closed contest which
     * originated from <code>Studio Administrator</code> channel and verifies that the method returns the appropriate
     * content and sets the response content type correctly when submission owner is requesting a download.</p>
     *
     * @throws Exception if an unexpected error occurs.
     */
    public void testDbProcessing_Studio_Over_Owner_Alternate() throws Exception {
        // Test setup
        long contestId = 10;
        long submissionId = 7;
        long userId = 1;
        String handle = "dok_test";

        String[] types = {"tiny", "small", "medium", null, "original", "full"};
        String[] files = {submissionId + "_18_1.jpg", submissionId + "_22_1.png", submissionId + "_23_1.png",
                submissionId + "_preview.zip", "tcs_submission.zip", submissionId + "_24_1.png"};

        for (int i = 0; i < types.length; i++) {
            String type = types[i];
            ByteArrayOutputStream baos = new ByteArrayOutputStream();

            MockHttpServletRequest.setMethodResultPerArgs("getParameter_String", "sbmid", String.valueOf(submissionId));
            MockHttpServletRequest.setMethodResultPerArgs("getParameter_String", "sbt", type);

            MockHttpServletResponse.setMethodResult("getOutputStream", new ServletOutputStreamImpl(baos));

            // Execution
            this.testedInstance.process();
            super.tearDown();
            super.setUp();

            // Test verification
            Assert.assertTrue("The response content type is not set",
                    MockHttpServletResponse.wasMethodCalled("setContentType_String"));
            byte[] expectedContent = readSubmissionFile(contestId, handle, userId, files[i]);
            byte[] actualContent = baos.toByteArray();
            Assert.assertTrue("Wrong content is returned " + files[i], Arrays.equals(expectedContent, actualContent));
        }
    }

    /**
     * <p>Accuracy test. Tests the {@link DownloadSubmission#dbProcessing()} method for accurate behavior.</p>
     * <p/>
     * <p>Passes a request for downloading the submission for a running contest which originated from <code>Studio
     * Administrator V1</code> channel and verifies that the method returns the appropriate content and sets the
     * response content type correctly when submission owner is requesting a download.</p>
     *
     * @throws Exception if an unexpected error occurs.
     */
    public void testDbProcessing_OldContest_Running_Owner() throws Exception {
        // Test setup
        long contestId = 7;
        long submissionId = 4;
        long userId = 1;
        String handle = "dok_test";

        ByteArrayOutputStream baos = new ByteArrayOutputStream();

        MockHttpServletRequest.setMethodResultPerArgs("getParameter_String", "sbmid", String.valueOf(submissionId));

        MockHttpServletResponse.setMethodResult("getOutputStream", new ServletOutputStreamImpl(baos));

        // Execution
        this.testedInstance.process();
        super.tearDown();
        super.setUp();

        // Test verification
        Assert.assertTrue("The response content type is not set",
                MockHttpServletResponse.wasMethodCalled("setContentType_String"));
        List args = MockHttpServletResponse.getMethodArguments("setContentType_String");
        Map callArgs = (Map) args.get(0);
        String contentType = (String) callArgs.get("1");
        Assert.assertTrue("Wrong response content type set", "application/zip".equals(contentType)
                || "application/x-zip".equals(contentType)
                || "application/x-zip-compressed".equals(contentType));

        byte[] expectedContent = readSubmissionFile(contestId, handle, userId, "4_preview.zip");
        byte[] actualContent = baos.toByteArray();
        Assert.assertTrue("Wrong content is returned", Arrays.equals(expectedContent, actualContent));
    }

    /**
     * <p>Accuracy test. Tests the {@link DownloadSubmission#dbProcessing()} method for accurate behavior.</p>
     * <p/>
     * <p>Passes a request for downloading the submission of various alternate forms for a running contest which
     * originated from <code>Studio Administrator V1</code> channel and verifies that the method returns the appropriate
     * content and sets the response content type correctly when submission owner is requesting a download.</p>
     *
     * @throws Exception if an unexpected error occurs.
     */
    public void testDbProcessing_OldContest_Running_Owner_Alternate() throws Exception {
        // Test setup
        String[] types = {"tiny", "small", "medium", "full", "original"};

        long contestId = 7;
        long submissionId = 4;
        long userId = 1;
        String handle = "dok_test";

        for (int i = 0; i < types.length; i++) {
            String type = types[i];
            ByteArrayOutputStream baos = new ByteArrayOutputStream();

            MockHttpServletRequest.setMethodResultPerArgs("getParameter_String", "sbmid", String.valueOf(submissionId));
            MockHttpServletRequest.setMethodResultPerArgs("getParameter_String", "sbt", type);

            MockHttpServletResponse.setMethodResult("getOutputStream", new ServletOutputStreamImpl(baos));

            // Execution
            this.testedInstance.process();
            super.tearDown();
            super.setUp();

            // Test verification
            Assert.assertTrue("The response content type is not set",
                    MockHttpServletResponse.wasMethodCalled("setContentType_String"));
            List args = MockHttpServletResponse.getMethodArguments("setContentType_String");
            Map callArgs = (Map) args.get(0);
            String contentType = (String) callArgs.get("1");
            Assert.assertTrue("Wrong response content type set", "application/zip".equals(contentType)
                    || "application/x-zip".equals(contentType)
                    || "application/x-zip-compressed".equals(contentType));

            byte[] expectedContent = readSubmissionFile(contestId, handle, userId, submissionId + "_preview.zip");
            byte[] actualContent = baos.toByteArray();
            Assert.assertTrue("Wrong content is returned", Arrays.equals(expectedContent, actualContent));
        }
    }

    /**
     * <p>Accuracy test. Tests the {@link DownloadSubmission#dbProcessing()} method for accurate behavior.</p>
     * <p/>
     * <p>Passes a request for downloading the submission for a running contest which originated from <code>TopCoder
     * Direct</code> channel and verifies that the method returns the appropriate content and sets the response content
     * type correctly when submission owner is requesting a download.</p>
     *
     * @throws Exception if an unexpected error occurs.
     */
    public void testDbProcessing_TCDirect_Running_Owner() throws Exception {
        // Test setup
        long contestId = 9;
        long submissionId = 6;
        long userId = 1;
        String handle = "dok_test";

        ByteArrayOutputStream baos = new ByteArrayOutputStream();

        MockHttpServletRequest.setMethodResultPerArgs("getParameter_String", "sbmid", String.valueOf(submissionId));

        MockHttpServletResponse.setMethodResult("getOutputStream", new ServletOutputStreamImpl(baos));

        // Execution
        this.testedInstance.process();
        super.tearDown();
        super.setUp();

        // Test verification
        Assert.assertTrue("The response content type is not set",
                MockHttpServletResponse.wasMethodCalled("setContentType_String"));
        List args = MockHttpServletResponse.getMethodArguments("setContentType_String");
        Map callArgs = (Map) args.get(0);
        String contentType = (String) callArgs.get("1");
        Assert.assertTrue("Wrong response content type set", "application/zip".equals(contentType)
                || "application/x-zip".equals(contentType)
                || "application/x-zip-compressed".equals(contentType));

        byte[] expectedContent = readSubmissionFile(contestId, handle, userId, submissionId + "_preview.zip");
        byte[] actualContent = baos.toByteArray();
        Assert.assertTrue("Wrong content is returned", Arrays.equals(expectedContent, actualContent));
    }

    /**
     * <p>Accuracy test. Tests the {@link DownloadSubmission#dbProcessing()} method for accurate behavior.</p>
     * <p/>
     * <p>Passes a request for downloading the submission of various alternate forms for a running contest which
     * originated from <code>TopCoder Direct</code> channel and verifies that the method returns the appropriate
     * content and sets the response content type correctly when submission owner is requesting a download.</p>
     *
     * @throws Exception if an unexpected error occurs.
     */
    public void testDbProcessing_TCDirect_Running_Owner_Alternate() throws Exception {
        // Test setup
        long contestId = 9;
        long submissionId = 6;
        long userId = 1;
        String handle = "dok_test";

        String[] types = {"tiny", "small", "medium", null, "original", "full"};
        String[] files = {submissionId + "_25_1.jpg", submissionId + "_29_1.png", submissionId + "_30_1.png",
                submissionId + "_preview.zip", "tcs_submission.zip", submissionId + "_31_1.png"};

        for (int i = 0; i < types.length; i++) {
            String type = types[i];
            ByteArrayOutputStream baos = new ByteArrayOutputStream();

            MockHttpServletRequest.setMethodResultPerArgs("getParameter_String", "sbmid", String.valueOf(submissionId));
            MockHttpServletRequest.setMethodResultPerArgs("getParameter_String", "sbt", type);

            MockHttpServletResponse.setMethodResult("getOutputStream", new ServletOutputStreamImpl(baos));

            // Execution
            this.testedInstance.process();
            super.tearDown();
            super.setUp();

            // Test verification
            Assert.assertTrue("The response content type is not set",
                    MockHttpServletResponse.wasMethodCalled("setContentType_String"));
            byte[] expectedContent = readSubmissionFile(contestId, handle, userId, files[i]);
            byte[] actualContent = baos.toByteArray();
            Assert.assertTrue("Wrong content is returned " + files[i], Arrays.equals(expectedContent, actualContent));
        }
    }

    /**
     * <p>Accuracy test. Tests the {@link DownloadSubmission#dbProcessing()} method for accurate behavior.</p>
     * <p/>
     * <p>Passes a request for downloading the submission for a running contest which originated from <code>Studio
     * Administrator</code> channel and verifies that the method returns the appropriate content and sets the response
     * content type correctly when submission owner is requesting a download.</p>
     *
     * @throws Exception if an unexpected error occurs.
     */
    public void testDbProcessing_Studio_Running_Owner() throws Exception {
        // Test setup
        long contestId = 11;
        long submissionId = 8;
        long userId = 1;
        String handle = "dok_test";

        ByteArrayOutputStream baos = new ByteArrayOutputStream();

        MockHttpServletRequest.setMethodResultPerArgs("getParameter_String", "sbmid", String.valueOf(submissionId));

        MockHttpServletResponse.setMethodResult("getOutputStream", new ServletOutputStreamImpl(baos));

        // Execution
        this.testedInstance.process();
        super.tearDown();
        super.setUp();

        // Test verification
        Assert.assertTrue("The response content type is not set",
                MockHttpServletResponse.wasMethodCalled("setContentType_String"));
        List args = MockHttpServletResponse.getMethodArguments("setContentType_String");
        Map callArgs = (Map) args.get(0);
        String contentType = (String) callArgs.get("1");
        Assert.assertTrue("Wrong response content type set", "application/zip".equals(contentType)
                || "application/x-zip".equals(contentType)
                || "application/x-zip-compressed".equals(contentType));

        byte[] expectedContent = readSubmissionFile(contestId, handle, userId, submissionId + "_preview.zip");
        byte[] actualContent = baos.toByteArray();
        Assert.assertTrue("Wrong content is returned", Arrays.equals(expectedContent, actualContent));
    }

    /**
     * <p>Accuracy test. Tests the {@link DownloadSubmission#dbProcessing()} method for accurate behavior.</p>
     * <p/>
     * <p>Passes a request for downloading the submission of various alternate forms for a running contest which
     * originated from <code>Studio Administrator</code> channel and verifies that the method returns the appropriate
     * content and sets the response content type correctly when submission owner is requesting a download.</p>
     *
     * @throws Exception if an unexpected error occurs.
     */
    public void testDbProcessing_Studio_Running_Owner_Alternate() throws Exception {
        // Test setup
        long contestId = 11;
        long submissionId = 8;
        long userId = 1;
        String handle = "dok_test";

        String[] types = {"tiny", "small", "medium", null, "original", "full"};
        String[] files = {submissionId + "_18_1.jpg", submissionId + "_22_1.png", submissionId + "_23_1.png",
                submissionId + "_preview.zip", "tcs_submission.zip", submissionId + "_24_1.png"};

        for (int i = 0; i < types.length; i++) {
            String type = types[i];
            ByteArrayOutputStream baos = new ByteArrayOutputStream();

            MockHttpServletRequest.setMethodResultPerArgs("getParameter_String", "sbmid", String.valueOf(submissionId));
            MockHttpServletRequest.setMethodResultPerArgs("getParameter_String", "sbt", type);

            MockHttpServletResponse.setMethodResult("getOutputStream", new ServletOutputStreamImpl(baos));

            // Execution
            this.testedInstance.process();
            super.tearDown();
            super.setUp();

            // Test verification
            Assert.assertTrue("The response content type is not set",
                    MockHttpServletResponse.wasMethodCalled("setContentType_String"));
            byte[] expectedContent = readSubmissionFile(contestId, handle, userId, files[i]);
            byte[] actualContent = baos.toByteArray();
            Assert.assertTrue("Wrong content is returned " + files[i], Arrays.equals(expectedContent, actualContent));
        }
    }

    /**
     * <p>Accuracy test. Tests the {@link DownloadSubmission#dbProcessing()} method for accurate behavior.</p>
     * <p/>
     * <p>Passes a request for downloading the submission for a closed contest which originated from <code>Studio
     * Administrator V1</code> channel and verifies that the method returns the appropriate content and sets the
     * response content type correctly when not submission owner is requesting a download.</p>
     *
     * @throws Exception if an unexpected error occurs.
     */
    public void testDbProcessing_OldContest_Over_Alien() throws Exception {
        // Test setup
        User user = new SimpleUser(-1, "anonymous", "password");
        MockWebAuthentication.setMethodResult("getUser", user);
        MockWebAuthentication.setMethodResult("getActiveUser", user);
        MockWebAuthentication.setMethodResult("isKnownUser", true);

        long contestId = 6;
        long submissionId = 3;
        long userId = 1;
        String handle = "dok_test";

        ByteArrayOutputStream baos = new ByteArrayOutputStream();

        MockHttpServletRequest.setMethodResultPerArgs("getParameter_String", "sbmid", String.valueOf(submissionId));

        MockHttpServletResponse.setMethodResult("getOutputStream", new ServletOutputStreamImpl(baos));

        // Execution
        this.testedInstance.process();
        super.tearDown();
        super.setUp();

        // Test verification
        Assert.assertTrue("The response content type is not set",
                MockHttpServletResponse.wasMethodCalled("setContentType_String"));
        List args = MockHttpServletResponse.getMethodArguments("setContentType_String");
        Map callArgs = (Map) args.get(0);
        String contentType = (String) callArgs.get("1");
        Assert.assertTrue("Wrong response content type set", "application/zip".equals(contentType)
                || "application/x-zip".equals(contentType)
                || "application/x-zip-compressed".equals(contentType));

        byte[] expectedContent = readSubmissionFile(contestId, handle, userId, "tcs_submission.zip");
        byte[] actualContent = baos.toByteArray();
        Assert.assertTrue("Wrong content is returned", Arrays.equals(expectedContent, actualContent));
    }

    /**
     * <p>Accuracy test. Tests the {@link DownloadSubmission#dbProcessing()} method for accurate behavior.</p>
     * <p/>
     * <p>Passes a request for downloading the submission for a closed contest which originated from <code>TopCoder
     * Direct</code> channel and verifies that the method returns the appropriate content and sets the
     * response content type correctly when not submission owner is requesting a download.</p>
     *
     * @throws Exception if an unexpected error occurs.
     */
    public void testDbProcessing_TCDirect_Over_Alien() throws Exception {
        // Test setup
        User user = new SimpleUser(-1, "anonymous", "password");
        MockWebAuthentication.setMethodResult("getUser", user);
        MockWebAuthentication.setMethodResult("getActiveUser", user);
        MockWebAuthentication.setMethodResult("isKnownUser", true);

        long contestId = 8;
        long submissionId = 5;
        long userId = 1;
        String handle = "dok_test";

        ByteArrayOutputStream baos = new ByteArrayOutputStream();

        MockHttpServletRequest.setMethodResultPerArgs("getParameter_String", "sbmid", String.valueOf(submissionId));

        MockHttpServletResponse.setMethodResult("getOutputStream", new ServletOutputStreamImpl(baos));

        // Execution
        this.testedInstance.process();
        super.tearDown();
        super.setUp();

        // Test verification
        Assert.assertTrue("The response content type is not set",
                MockHttpServletResponse.wasMethodCalled("setContentType_String"));
        List args = MockHttpServletResponse.getMethodArguments("setContentType_String");
        Map callArgs = (Map) args.get(0);
        String contentType = (String) callArgs.get("1");
        Assert.assertTrue("Wrong response content type set", "application/zip".equals(contentType)
                || "application/x-zip".equals(contentType)
                || "application/x-zip-compressed".equals(contentType));

        byte[] expectedContent = readSubmissionFile(contestId, handle, userId, submissionId + "_preview.zip");
        byte[] actualContent = baos.toByteArray();
        Assert.assertTrue("Wrong content is returned", Arrays.equals(expectedContent, actualContent));
    }

    /**
     * <p>Accuracy test. Tests the {@link DownloadSubmission#dbProcessing()} method for accurate behavior.</p>
     * <p/>
     * <p>Passes a request for downloading the submission of various alternate forms for a closed contest which
     * originated from <code>TopCoder Direct</code> channel and verifies that the method returns the appropriate content
     * and sets the response content type correctly when not submission owner is requesting a download.</p>
     *
     * @throws Exception if an unexpected error occurs.
     */
    public void testDbProcessing_TCDirect_Over_Alien_Alternate() throws Exception {
        // Test setup
        User user = new SimpleUser(-1, "anonymous", "password");
        MockWebAuthentication.setMethodResult("getUser", user);
        MockWebAuthentication.setMethodResult("getActiveUser", user);
        MockWebAuthentication.setMethodResult("isKnownUser", true);

        long contestId = 8;
        long submissionId = 5;
        long userId = 1;
        String handle = "dok_test";

        String[] types = {"tiny", "small", "medium", null, "full"};
        String[] files = {submissionId + "_25_1.jpg", submissionId + "_29_1.png", submissionId + "_30_1.png",
                submissionId + "_preview.zip", submissionId + "_31_1.png"};

        for (int i = 0; i < types.length; i++) {
            String type = types[i];
            ByteArrayOutputStream baos = new ByteArrayOutputStream();

            MockHttpServletRequest.setMethodResultPerArgs("getParameter_String", "sbmid", String.valueOf(submissionId));
            MockHttpServletRequest.setMethodResultPerArgs("getParameter_String", "sbt", type);

            MockHttpServletResponse.setMethodResult("getOutputStream", new ServletOutputStreamImpl(baos));

            // Execution
            this.testedInstance.process();
            super.tearDown();
            super.setUp();

            // Test verification
            Assert.assertTrue("The response content type is not set",
                    MockHttpServletResponse.wasMethodCalled("setContentType_String"));
            byte[] expectedContent = readSubmissionFile(contestId, handle, userId, files[i]);
            byte[] actualContent = baos.toByteArray();
            Assert.assertTrue("Wrong content is returned " + files[i], Arrays.equals(expectedContent, actualContent));
        }
    }

    /**
     * <p>Accuracy test. Tests the {@link DownloadSubmission#dbProcessing()} method for accurate behavior.</p>
     * <p/>
     * <p>Passes a request for downloading the submission for a closed contest which originated from <code>Studio
     * Administrator</code> channel and verifies that the method returns the appropriate content and sets the
     * response content type correctly when not submission owner is requesting a download.</p>
     *
     * @throws Exception if an unexpected error occurs.
     */
    public void testDbProcessing_Studio_Over_Alien() throws Exception {
        // Test setup
        User user = new SimpleUser(-1, "anonymous", "password");
        MockWebAuthentication.setMethodResult("getUser", user);
        MockWebAuthentication.setMethodResult("getActiveUser", user);
        MockWebAuthentication.setMethodResult("isKnownUser", true);

        long contestId = 10;
        long submissionId = 7;
        long userId = 1;
        String handle = "dok_test";

        ByteArrayOutputStream baos = new ByteArrayOutputStream();

        MockHttpServletRequest.setMethodResultPerArgs("getParameter_String", "sbmid", String.valueOf(submissionId));

        MockHttpServletResponse.setMethodResult("getOutputStream", new ServletOutputStreamImpl(baos));

        // Execution
        this.testedInstance.process();
        super.tearDown();
        super.setUp();

        // Test verification
        Assert.assertTrue("The response content type is not set",
                MockHttpServletResponse.wasMethodCalled("setContentType_String"));
        List args = MockHttpServletResponse.getMethodArguments("setContentType_String");
        Map callArgs = (Map) args.get(0);
        String contentType = (String) callArgs.get("1");
        Assert.assertTrue("Wrong response content type set", "application/zip".equals(contentType)
                || "application/x-zip".equals(contentType)
                || "application/x-zip-compressed".equals(contentType));

        byte[] expectedContent = readSubmissionFile(contestId, handle, userId, submissionId + "_preview.zip");
        byte[] actualContent = baos.toByteArray();
        Assert.assertTrue("Wrong content is returned", Arrays.equals(expectedContent, actualContent));
    }

    /**
     * <p>Accuracy test. Tests the {@link DownloadSubmission#dbProcessing()} method for accurate behavior.</p>
     * <p/>
     * <p>Passes a request for downloading the submission of various alternate forms for a closed contest which
     * originated from <code>Studio Administrator</code> channel and verifies that the method returns the appropriate
     * content and sets the response content type correctly when not submission owner is requesting a download.</p>
     *
     * @throws Exception if an unexpected error occurs.
     */
    public void testDbProcessing_Studio_Over_Alien_Alternate() throws Exception {
        // Test setup
        User user = new SimpleUser(-1, "anonymous", "password");
        MockWebAuthentication.setMethodResult("getUser", user);
        MockWebAuthentication.setMethodResult("getActiveUser", user);
        MockWebAuthentication.setMethodResult("isKnownUser", true);

        long contestId = 10;
        long submissionId = 7;
        long userId = 1;
        String handle = "dok_test";

        String[] types = {"tiny", "small", "medium", null, "full"};
        String[] files = {submissionId + "_18_1.jpg", submissionId + "_22_1.png", submissionId + "_23_1.png",
                submissionId + "_preview.zip", submissionId + "_24_1.png"};

        for (int i = 0; i < types.length; i++) {
            String type = types[i];
            ByteArrayOutputStream baos = new ByteArrayOutputStream();

            MockHttpServletRequest.setMethodResultPerArgs("getParameter_String", "sbmid", String.valueOf(submissionId));
            MockHttpServletRequest.setMethodResultPerArgs("getParameter_String", "sbt", type);

            MockHttpServletResponse.setMethodResult("getOutputStream", new ServletOutputStreamImpl(baos));

            // Execution
            this.testedInstance.process();
            super.tearDown();
            super.setUp();

            // Test verification
            Assert.assertTrue("The response content type is not set",
                    MockHttpServletResponse.wasMethodCalled("setContentType_String"));
            byte[] expectedContent = readSubmissionFile(contestId, handle, userId, files[i]);
            byte[] actualContent = baos.toByteArray();
            Assert.assertTrue("Wrong content is returned " + files[i], Arrays.equals(expectedContent, actualContent));
        }
    }

    /**
     * <p>Failure test. Tests the {@link DownloadSubmission#dbProcessing()} method for proper handling invalid usage.
     * </p>
     * <p/>
     * <p>Passes a request for downloading the submission for a running contest which originated from <code>Studio
     * Administrator V1</code> channel and verifies that the method raises <code>NavigationException</code>.</p>
     *
     * @throws Exception if an unexpected error occurs.
     */
    public void testDbProcessing_OldContest_Running_Alien() throws Exception {
        // Test setup
        User user = new SimpleUser(-1, "anonymous", "password");
        MockWebAuthentication.setMethodResult("getUser", user);
        MockWebAuthentication.setMethodResult("getActiveUser", user);
        MockWebAuthentication.setMethodResult("isKnownUser", true);

        long submissionId = 4;

        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        MockHttpServletRequest.setMethodResultPerArgs("getParameter_String", "sbmid", String.valueOf(submissionId));
        MockHttpServletResponse.setMethodResult("getOutputStream", new ServletOutputStreamImpl(baos));

        // Execution
        try {
            this.testedInstance.process();
            Assert.fail("NavigationException should have been thrown as non-owner can not request submission while" +
                    "contest is running");
        } catch (NavigationException e) {
            // expected behavior
        }
    }

    /**
     * <p>Failure test. Tests the {@link DownloadSubmission#dbProcessing()} method for proper handling invalid usage.
     * </p>
     * <p/>
     * <p>Passes a request for downloading the submission of various alternate forms for a running contest which
     * originated from <code>Studio Administrator V1</code> channel and verifies that the method throws
     * <code>NavigationException</code> when non submission owner is requesting a download.</p>
     *
     * @throws Exception if an unexpected error occurs.
     */
    public void testDbProcessing_OldContest_Running_Alien_Alternate() throws Exception {
        // Test setup
        User user = new SimpleUser(-1, "anonymous", "password");
        MockWebAuthentication.setMethodResult("getUser", user);
        MockWebAuthentication.setMethodResult("getActiveUser", user);
        MockWebAuthentication.setMethodResult("isKnownUser", true);

        long submissionId = 4;
        String[] types = {"tiny", "small", "medium", "full", "original"};

        for (int i = 0; i < types.length; i++) {
            String type = types[i];

            ByteArrayOutputStream baos = new ByteArrayOutputStream();
            MockHttpServletRequest.setMethodResultPerArgs("getParameter_String", "sbmid", String.valueOf(submissionId));
            MockHttpServletRequest.setMethodResultPerArgs("getParameter_String", "sbt", type);
            MockHttpServletResponse.setMethodResult("getOutputStream", new ServletOutputStreamImpl(baos));

            // Execution
            try {
                this.testedInstance.process();
                Assert.fail("NavigationException should have been thrown as non-owner can not request submission while" +
                        "contest is running");
            } catch (NavigationException e) {
                // expected behavior
            }
        }
    }

    /**
     * <p>Accuracy test. Tests the {@link DownloadSubmission#dbProcessing()} method for accurate behavior.</p>
     * <p/>
     * <p>Passes a request for downloading the submission for a closed contest which originated from <code>TopCoder
     * Direct</code> channel and verifies that the method returns the appropriate content and sets the
     * response content type correctly when not submission owner is requesting a download.</p>
     *
     * @throws Exception if an unexpected error occurs.
     */
    public void testDbProcessing_TCDirect_Running_Alien() throws Exception {
        // Test setup
        User user = new SimpleUser(-1, "anonymous", "password");
        MockWebAuthentication.setMethodResult("getUser", user);
        MockWebAuthentication.setMethodResult("getActiveUser", user);
        MockWebAuthentication.setMethodResult("isKnownUser", true);

        long submissionId = 6;

        ByteArrayOutputStream baos = new ByteArrayOutputStream();

        MockHttpServletRequest.setMethodResultPerArgs("getParameter_String", "sbmid", String.valueOf(submissionId));

        MockHttpServletResponse.setMethodResult("getOutputStream", new ServletOutputStreamImpl(baos));

        // Execution
        try {
            this.testedInstance.process();
            Assert.fail("NavigationException should have been thrown as non-owner can not request submission while" +
                    "contest is running");
        } catch (NavigationException e) {
            // expected behavior
        }
    }

    /**
     * <p>Accuracy test. Tests the {@link DownloadSubmission#dbProcessing()} method for accurate behavior.</p>
     * <p/>
     * <p>Passes a request for downloading the submission of various alternate forms for a runng contest which
     * originated from <code>TopCoder Direct</code> channel and verifies that the method returns the appropriate content
     * and sets the response content type correctly when not submission owner is requesting a download.</p>
     *
     * @throws Exception if an unexpected error occurs.
     */
    public void testDbProcessing_TCDirect_Running_Alien_Alternate() throws Exception {
        // Test setup
        User user = new SimpleUser(-1, "anonymous", "password");
        MockWebAuthentication.setMethodResult("getUser", user);
        MockWebAuthentication.setMethodResult("getActiveUser", user);
        MockWebAuthentication.setMethodResult("isKnownUser", true);

        long submissionId = 6;

        String[] types = {"tiny", "small", "medium", "full"};

        for (int i = 0; i < types.length; i++) {
            String type = types[i];
            ByteArrayOutputStream baos = new ByteArrayOutputStream();

            MockHttpServletRequest.setMethodResultPerArgs("getParameter_String", "sbmid", String.valueOf(submissionId));
            MockHttpServletRequest.setMethodResultPerArgs("getParameter_String", "sbt", type);

            MockHttpServletResponse.setMethodResult("getOutputStream", new ServletOutputStreamImpl(baos));

            // Execution
            try {
                this.testedInstance.process();
                Assert.fail("NavigationException should have been thrown as non-owner can not request submission while"
                            + "contest is running");
            } catch (NavigationException e) {
                // expected behavior
            }
        }
    }

    /**
     * <p>Failure test. Tests the {@link DownloadSubmission#dbProcessing()} method for proper handling invalid usage.
     * </p>
     * <p/>
     * <p>Passes a request for downloading the submission for a running contest which originated from <code>Studio
     * Administrator</code> channel and verifies that the method raises <code>NavigationException</code>.</p>
     *
     * @throws Exception if an unexpected error occurs.
     */
    public void testDbProcessing_Studio_Running_Alien() throws Exception {
        // Test setup
        User user = new SimpleUser(-1, "anonymous", "password");
        MockWebAuthentication.setMethodResult("getUser", user);
        MockWebAuthentication.setMethodResult("getActiveUser", user);
        MockWebAuthentication.setMethodResult("isKnownUser", true);

        long submissionId = 8;

        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        MockHttpServletRequest.setMethodResultPerArgs("getParameter_String", "sbmid", String.valueOf(submissionId));
        MockHttpServletResponse.setMethodResult("getOutputStream", new ServletOutputStreamImpl(baos));

        // Execution
        try {
            this.testedInstance.process();
            Assert.fail("NavigationException should have been thrown as non-owner can not request submission while" +
                    "contest is running");
        } catch (NavigationException e) {
            // expected behavior
        }
    }

    /**
     * <p>Failure test. Tests the {@link DownloadSubmission#dbProcessing()} method for proper handling invalid usage.
     * </p>
     * <p/>
     * <p>Passes a request for downloading the submission of various alternate forms for a running contest which
     * originated from <code>Studio Administrator</code> channel and verifies that the method throws
     * <code>NavigationException</code> when non submission owner is requesting a download.</p>
     *
     * @throws Exception if an unexpected error occurs.
     */
    public void testDbProcessing_Studio_Running_Alien_Alternate() throws Exception {
        // Test setup
        User user = new SimpleUser(-1, "anonymous", "password");
        MockWebAuthentication.setMethodResult("getUser", user);
        MockWebAuthentication.setMethodResult("getActiveUser", user);
        MockWebAuthentication.setMethodResult("isKnownUser", true);

        long submissionId = 8;

        String[] types = {"tiny", "small", "medium", "full"};

        for (int i = 0; i < types.length; i++) {
            String type = types[i];

            ByteArrayOutputStream baos = new ByteArrayOutputStream();
            MockHttpServletRequest.setMethodResultPerArgs("getParameter_String", "sbmid", String.valueOf(submissionId));
            MockHttpServletRequest.setMethodResultPerArgs("getParameter_String", "sbt", type);
            MockHttpServletResponse.setMethodResult("getOutputStream", new ServletOutputStreamImpl(baos));

            // Execution
            try {
                this.testedInstance.process();
                Assert.fail("NavigationException should have been thrown as non-owner can not request submission while" +
                        "contest is running");
            } catch (NavigationException e) {
                // expected behavior
            }
        }
    }

    /**
     * <p>Gets the content of the sample submissions file to be used for testing from the disk.</p>
     *
     * @param contestId a <code>long</code> providing the ID of a contest.
     * @param handle    a <code>String</code> providing the submitter handle.
     * @param userId    a <code>long</code> providing the user ID.
     * @param file      a <code>String</code> providing the name of the file.
     * @return a <code>byte</code> array providing the content of the sample submission file.
     * @throws IOException if an I/O error occurs while reading the image file content.
     */
    private byte[] readSubmissionFile(long contestId, String handle, long userId, String file) throws IOException {
        InputStream content = new FileInputStream(Constants.ROOT_STORAGE_PATH + "/submissions/" + contestId + "/"
                + handle + "_" + userId + "/" + file);
        ByteArrayOutputStream baos;
        try {
            baos = new ByteArrayOutputStream();
            byte[] buf = new byte[4096];
            int count = -1;
            while ((count = content.read(buf)) != -1) {
                baos.write(buf, 0, count);
            }
        } finally {
            content.close();
        }
        return baos.toByteArray();
    }
}
