/*
 * Copyright (C) 2008 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.studio.controller.request.admin;

import com.topcoder.db.connectionfactory.DBConnectionFactoryImpl;
import com.topcoder.shared.security.SimpleUser;
import com.topcoder.shared.security.User;
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
 * @version 1.1
 * @since TopCoder Studio Modifications Assembly (Req# 5.11)
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
            
            DBConnectionFactoryImpl connectionFactory
                = new DBConnectionFactoryImpl("com.topcoder.db.connectionfactory.DBConnectionFactoryImpl");
            DatabaseUtil.clearTables(connectionFactory);
            DatabaseUtil.populateTables(connectionFactory);
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
     *
     * <p>Passes a request for downloading the <code>original</code> submission for a contest and verifies that the
     * method returns the appropriate content and sets the response content type correctly.</p>
     *
     * @throws Exception if an unexpected error occurs.
     */
    public void testDbProcessing_Original() throws Exception {
        // Test setup
        long contestId = 4;
        long submissionId = 1;
        long userId = 1;
        String handle = "dok_test";

        ByteArrayOutputStream baos = new ByteArrayOutputStream();

        MockHttpServletRequest.setMethodResultPerArgs("getParameter_String", "sbmid", String.valueOf(submissionId));
        MockHttpServletRequest.setMethodResultPerArgs("getParameter_String", "sbt", "original");

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
     *
     * <p>Passes a request for downloading the <code>tiny</code> submission for a contest and verifies that the
     * method returns the appropriate content and sets the response content type correctly.</p>
     *
     * @throws Exception if an unexpected error occurs.
     */
    public void testDbProcessing_Tiny() throws Exception {
        // Test setup
        long contestId = 4;
        long submissionId = 1;
        long userId = 1;
        String handle = "dok_test";

        ByteArrayOutputStream baos = new ByteArrayOutputStream();

        MockHttpServletRequest.setMethodResultPerArgs("getParameter_String", "sbmid", String.valueOf(submissionId));
        MockHttpServletRequest.setMethodResultPerArgs("getParameter_String", "sbt", "tiny");

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
        Assert.assertTrue("Wrong response content type set", "image/jpeg".equals(contentType)
                                                             || "image/pjpeg".equals(contentType));

        byte[] expectedContent = readSubmissionFile(contestId, handle, userId, submissionId + "_18_1.jpg");
        byte[] actualContent = baos.toByteArray();
        Assert.assertTrue("Wrong content is returned", Arrays.equals(expectedContent, actualContent));
    }

    /**
     * <p>Accuracy test. Tests the {@link DownloadSubmission#dbProcessing()} method for accurate behavior.</p>
     *
     * <p>Passes a request for downloading the <code>small</code> submission for a contest and verifies that the
     * method returns the appropriate content and sets the response content type correctly.</p>
     *
     * @throws Exception if an unexpected error occurs.
     */
    public void testDbProcessing_Small() throws Exception {
        // Test setup
        long contestId = 4;
        long submissionId = 1;
        long userId = 1;
        String handle = "dok_test";

        ByteArrayOutputStream baos = new ByteArrayOutputStream();

        MockHttpServletRequest.setMethodResultPerArgs("getParameter_String", "sbmid", String.valueOf(submissionId));
        MockHttpServletRequest.setMethodResultPerArgs("getParameter_String", "sbt", "small");

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
        Assert.assertTrue("Wrong response content type set", "image/png".equals(contentType)
                                                             || "image/x-png".equals(contentType));

        byte[] expectedContent = readSubmissionFile(contestId, handle, userId, submissionId + "_19_1.png");
        byte[] actualContent = baos.toByteArray();
        Assert.assertTrue("Wrong content is returned", Arrays.equals(expectedContent, actualContent));
    }

    /**
     * <p>Accuracy test. Tests the {@link DownloadSubmission#dbProcessing()} method for accurate behavior.</p>
     *
     * <p>Passes a request for downloading the <code>medium</code> submission for a contest and verifies that the
     * method returns the appropriate content and sets the response content type correctly.</p>
     *
     * @throws Exception if an unexpected error occurs.
     */
    public void testDbProcessing_Medium() throws Exception {
        // Test setup
        long contestId = 4;
        long submissionId = 1;
        long userId = 1;
        String handle = "dok_test";

        ByteArrayOutputStream baos = new ByteArrayOutputStream();

        MockHttpServletRequest.setMethodResultPerArgs("getParameter_String", "sbmid", String.valueOf(submissionId));
        MockHttpServletRequest.setMethodResultPerArgs("getParameter_String", "sbt", "medium");

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
        Assert.assertTrue("Wrong response content type set", "image/png".equals(contentType)
                                                             || "image/x-png".equals(contentType));

        byte[] expectedContent = readSubmissionFile(contestId, handle, userId, submissionId + "_20_1.png");
        byte[] actualContent = baos.toByteArray();
        Assert.assertTrue("Wrong content is returned", Arrays.equals(expectedContent, actualContent));
    }

    /**
     * <p>Accuracy test. Tests the {@link DownloadSubmission#dbProcessing()} method for accurate behavior.</p>
     *
     * <p>Passes a request for downloading the <code>full</code> submission for a contest which does not require the
     * preview file to be provided and verifies that the method returns the appropriate content of image and sets the
     * response content type correctly.</p>
     *
     * @throws Exception if an unexpected error occurs.
     */
    public void testDbProcessing_Full_Image() throws Exception {
        // Test setup
        long contestId = 4;
        long submissionId = 1;
        long userId = 1;
        String handle = "dok_test";

        ByteArrayOutputStream baos = new ByteArrayOutputStream();

        MockHttpServletRequest.setMethodResultPerArgs("getParameter_String", "sbmid", String.valueOf(submissionId));
        MockHttpServletRequest.setMethodResultPerArgs("getParameter_String", "sbt", "full");

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
        Assert.assertTrue("Wrong response content type set", "image/jpeg".equals(contentType)
                                                             || "image/pjpeg".equals(contentType));

        byte[] expectedContent = readSubmissionFile(contestId, handle, userId, submissionId + "_21_1.jpg");
        byte[] actualContent = baos.toByteArray();
        Assert.assertTrue("Wrong content is returned", Arrays.equals(expectedContent, actualContent));
    }

    /**
     * <p>Accuracy test. Tests the {@link DownloadSubmission#dbProcessing()} method for accurate behavior.</p>
     *
     * <p>Passes a request for downloading the default submission presentation for a contest which does not require the
     * preview file to be provided and verifies that the method returns the appropriate content of image and sets the
     * response content type correctly.</p>
     *
     * @throws Exception if an unexpected error occurs.
     */
    public void testDbProcessing_Default_Image() throws Exception {
        // Test setup
        long contestId = 4;
        long submissionId = 1;
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
        Assert.assertTrue("Wrong response content type set " + contentType,
                          "application/x-zip-compressed".equals(contentType)
                          || "application/zip".equals(contentType) || "application/x-zip".equals(contentType));

        byte[] expectedContent = readSubmissionFile(contestId, handle, userId, submissionId + "_preview.zip");
        byte[] actualContent = baos.toByteArray();
        Assert.assertTrue("Wrong content is returned", Arrays.equals(expectedContent, actualContent));
    }

    /**
     * <p>Accuracy test. Tests the {@link DownloadSubmission#dbProcessing()} method for accurate behavior.</p>
     *
     * <p>Passes a request for downloading the <code>full</code> submission for a contest which does requires the
     * preview file to be provided and verifies that the method returns the appropriate content of file and sets the
     * response content type correctly.</p>
     *
     * @throws Exception if an unexpected error occurs.
     */
    public void testDbProcessing_Full_File() throws Exception {
        // Test setup
        long contestId = 5;
        long submissionId = 2;
        long userId = 1;
        String handle = "dok_test";

        ByteArrayOutputStream baos = new ByteArrayOutputStream();

        MockHttpServletRequest.setMethodResultPerArgs("getParameter_String", "sbmid", String.valueOf(submissionId));
        MockHttpServletRequest.setMethodResultPerArgs("getParameter_String", "sbt", "full");

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
        Assert.assertTrue("Wrong response content type set", "image/jpeg".equals(contentType)
                                                             || "image/pjpeg".equals(contentType));

        byte[] expectedContent = readSubmissionFile(contestId, handle, userId, submissionId + "_21_1.jpg");
        byte[] actualContent = baos.toByteArray();
        Assert.assertTrue("Wrong content is returned", Arrays.equals(expectedContent, actualContent));
    }

    /**
     * <p>Accuracy test. Tests the {@link DownloadSubmission#dbProcessing()} method for accurate behavior.</p>
     *
     * <p>Passes a request for downloading the default submission presentation for a contest which does requires the
     * preview file to be provided and verifies that the method returns the appropriate content of file and sets the
     * response content type correctly.</p>
     *
     * @throws Exception if an unexpected error occurs.
     */
    public void testDbProcessing_Default_File() throws Exception {
        // Test setup
        long contestId = 5;
        long submissionId = 2;
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
     * <p>Failure test. Tests the {@link DownloadSubmission#dbProcessing()} method for proper handling the invalid
     * usage.</p>
     *
     * <p>Passes a request for downloading the <code>image</code> submission for a contest and expects the
     * <code>NavigationException</code> to be thrown.</p> 
     *
     * @throws Exception if an unexpected error occurs.
     */
    public void testDbProcessing_Image() throws Exception {
        // Test setup
        long submissionId = 1;

        ByteArrayOutputStream baos = new ByteArrayOutputStream();

        MockHttpServletRequest.setMethodResultPerArgs("getParameter_String", "sbmid", String.valueOf(submissionId));
        MockHttpServletRequest.setMethodResultPerArgs("getParameter_String", "sbt", "image");

        MockHttpServletResponse.setMethodResult("getOutputStream", new ServletOutputStreamImpl(baos));

        // Execution
        try {
            this.testedInstance.process();
            Assert.fail("NavigationException should have been thrown as original image can not be requested directly");
        } catch (NavigationException e) {
            // expected behavior
        }
    }

    /**
     * <p>Gets the content of the sample submissions file to be used for testing from the disk.</p>
     *
     * @param contestId a <code>long</code> providing the ID of a contest.
     * @param handle a <code>String</code> providing the submitter handle.
     * @param userId a <code>long</code> providing the user ID.
     * @param file a <code>String</code> providing the name of the file.
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
