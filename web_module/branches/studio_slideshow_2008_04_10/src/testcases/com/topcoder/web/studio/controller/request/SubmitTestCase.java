/*
 * Copyright (C) 2008 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.studio.controller.request;

import com.topcoder.db.connectionfactory.DBConnectionFactoryImpl;
import com.topcoder.shared.security.SimpleUser;
import com.topcoder.shared.security.User;
import com.topcoder.web.common.MultipartRequest;
import com.topcoder.web.common.SessionInfo;
import com.topcoder.web.common.SimpleResponse;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.dao.UserDAO;
import com.topcoder.web.studio.DatabaseUtil;
import com.topcoder.web.studio.ServletInputStreamImpl;
import com.topcoder.web.studio.TCHibernateTestCase;
import com.topcoder.web.studio.dao.ContestDAO;
import com.topcoder.web.studio.dao.StudioDAOUtil;
import com.topcoder.web.studio.dao.SubmissionDAO;
import com.topcoder.web.studio.mock.MockHttpServletRequest;
import com.topcoder.web.studio.mock.MockHttpServletResponse;
import com.topcoder.web.studio.mock.MockHttpSession;
import com.topcoder.web.studio.mock.MockWebAuthentication;
import com.topcoder.web.studio.model.Contest;
import com.topcoder.web.studio.model.Submission;
import com.topcoder.web.studio.model.SubmissionReview;
import com.topcoder.web.studio.model.SubmissionType;
import com.topcoder.web.studio.model.SubmissionImage;
import junit.framework.Assert;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * <p>A unit test case for {@link Submit} class.</p>
 *
 * @author isv
 * @version 1.1
 * @since TopCoder Studio Modifications Assembly (Req# 5.12)
 */
public class SubmitTestCase extends TCHibernateTestCase {

    /**
     * <p>The instance of {@link Submit} which is tested. This instance is initialized in {@link #setUp()} method and
     * released in {@link #tearDown()} method.</p>
     */
    private Submit testedInstance = null;

    /**
     * <p>A <code>List</code> containing the IDs of submissions which might have been added during the tests and which
     * have to be deleted after test is finished.</p>
     */
    private List<Long> addedSubmissions = null;

    /**
     * <p>Constructs new <code>SubmitTestCase</code> instance with specified test name.</p>
     *
     * @param name a <code>String</code> providing the name of the test.
     */
    public SubmitTestCase(String name) {
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

        MockHttpServletRequest.setMethodResult("getContentType", "multipart/form-data, boundary=AaB03x");
        MockHttpServletRequest.setMethodResult("getServerName", "studiodev.topcoder.com");
        MockHttpServletRequest.setMethodResult("getContextPath", "studio");
        MockHttpServletRequest.setMethodResult("getServletPath", "");
        MockHttpServletRequest.setMethodResult("getQueryString", "");
        MockHttpServletRequest.setMethodResult("getSession", new MockHttpSession());

        try {
            DBConnectionFactoryImpl connectionFactory
                = new DBConnectionFactoryImpl("com.topcoder.db.connectionfactory.DBConnectionFactoryImpl");
            DatabaseUtil.clearTables(connectionFactory);
            DatabaseUtil.populateTables(connectionFactory);
        } catch (Exception e) {
            throw new IllegalStateException("The setUp() fails", e);
        }

        this.testedInstance = new Submit();
        this.testedInstance.setResponse(new SimpleResponse(new MockHttpServletResponse()));
        this.testedInstance.setAuthentication(new MockWebAuthentication());

        this.addedSubmissions = new ArrayList<Long>();
        super.setUp();
    }

    /**
     * <p>Tears down the fixture. This method is called after a test is executed.</p>
     */
    public void tearDown() {
        joinThreads();

        super.tearDown();
        this.testedInstance = null;
        MockWebAuthentication.releaseState();
        MockHttpServletRequest.releaseState();
        MockHttpServletResponse.releaseState();
        MockHttpSession.releaseState();
        try {
            DBConnectionFactoryImpl connectionFactory
                    = new DBConnectionFactoryImpl("com.topcoder.db.connectionfactory.DBConnectionFactoryImpl");
            DatabaseUtil.deleteTableRecords(connectionFactory, "submission_review", "submission_id",
                                            this.addedSubmissions);
            DatabaseUtil.deleteTableRecords(connectionFactory, "contest_result", "submission_id",
                                            this.addedSubmissions);
            DatabaseUtil.deleteTableRecords(connectionFactory, "submission_prize_xref", "submission_id",
                                            this.addedSubmissions);
            DatabaseUtil.deleteTableRecords(connectionFactory, "submission_image", "submission_id",
                                            this.addedSubmissions);
            DatabaseUtil.deleteTableRecords(connectionFactory, "submission", "submission_id", this.addedSubmissions);
            DatabaseUtil.clearTables(connectionFactory);
        } catch (Exception e) {
            throw new IllegalArgumentException("The tearDown() fails", e);
        }
        this.addedSubmissions = null;
    }

    /**
     * <p>Accuracy test. Tests the {@link Submit} request processor for accurate processing of the incoming request and
     * meeting the <code>Req# 5.12</code> from the <code>TopCoder Studio Modifications</code> requirements specification
     * document.</p>
     *
     * <p>Passes the request with submission for a contest originated from <code>TopCoder Direct</code> contest channel
     * and verifies that the submission is stored to database successfully and the screening review is auto-generated.
     * </p>
     *
     * @throws Exception if an unexpected error occurs.
     */
    public void testProcess_TopCoderDirectContest() throws Exception {
        // Test setup
        long contestId = 1;
        long userId = 1;
        //file upload looks to have a bug, when parsing the request without an \r, it'll go out of bounds
        //String newLine = System.getProperties().getProperty("line.separator");
        String newLine = "\r\n";
        String newLine2 = newLine + newLine;

        byte[] submitted = readSubmissionFile("submission.zip");
        String content1 = "--AaB03x" + newLine
                          + "content-disposition: form-data; name=\"ct\"" + newLine2 + contestId + newLine
                          + "--AaB03x" + newLine
                          + "content-disposition: form-data; name=\"srank\"" + newLine2 + "999" + newLine
                          + "--AaB03x" + newLine
                          + "content-disposition: form-data; name=\"sbm\"; filename=\"submission.zip\"" + newLine
                          + "Content-Type: application/zip" + newLine + "Content-Transfer-Encoding: binary" + newLine2;
        String content2 = newLine + "--AaB03x--" + newLine;
        byte[] b1 = content1.getBytes();
        byte[] b2 = content2.getBytes();

        byte[] B = new byte[b1.length + b2.length + submitted.length];
        System.arraycopy(b1, 0, B, 0, b1.length);
        System.arraycopy(submitted, 0, B, b1.length, submitted.length);
        System.arraycopy(b2, 0, B, b1.length + submitted.length, b2.length);


        ByteArrayInputStream bais = new ByteArrayInputStream(B);
        MockHttpServletRequest.setMethodResult("getInputStream", new ServletInputStreamImpl(bais));

        MultipartRequest request = new MultipartRequest(new MockHttpServletRequest());
        this.testedInstance.setRequest(request);

        SessionInfo sessionInfo = new SessionInfo(request, new MockWebAuthentication(), new HashSet());
        MockHttpServletRequest.setMethodResultPerArgs("getAttribute_String", "sessionInfo", sessionInfo);

        // Execution
        this.testedInstance.process();
        joinThreads();
        super.tearDown();
        super.setUp();

        // Test verification
        ContestDAO contestDAO = StudioDAOUtil.getFactory().getContestDAO();
        SubmissionDAO submissionDAO = StudioDAOUtil.getFactory().getSubmissionDAO();
        UserDAO userDAO = DAOUtil.getFactory().getUserDAO();

        Contest contest = contestDAO.find(contestId);
        List<Submission> submissions = submissionDAO.getSubmissions(contest.getId(), userId,
                                                                    SubmissionType.INITIAL_CONTEST_SUBMISSION_TYPE);
        Assert.assertFalse("The submission is not added to database", submissions.isEmpty());
        Assert.assertEquals("Incorrect number of submissions added", 1, submissions.size());

        Submission submission = submissions.get(0);
        this.addedSubmissions.add(submission.getId());
        SubmissionReview review = submission.getReview();
        Assert.assertNotNull("The automatic screening review is not added", review);
        Assert.assertEquals("Incorrect text of automatic submission review",
                            "TopCoder Direct, Automatic pass", review.getText());
        Assert.assertEquals("Incorrect reviewer",
                            userDAO.find(contest.getCreateUserId()).getId(), review.getReviewer().getId());
        Assert.assertTrue("The submission is not marked as having the preview image provided",
                           submission.getHasPreviewImage());
    }

    /**
     * <p>Accuracy test. Tests the {@link Submit} request processor for accurate processing of the incoming request and
     * meeting the <code>Req# 5.12</code> from the <code>TopCoder Studio Modifications</code> requirements specification
     * document.</p>
     *
     * <p>Passes the request with submission for a contest originated from <code>Studio Administrator</code> contest
     * channel and verifies that the submission is stored to database successfully and no screening review is
     * auto-generated.</p>
     *
     * @throws Exception if an unexpected error occurs.
     */
    public void testProcess_StudioAdminContest() throws Exception {
        // Test setup
        long contestId = 2;
        long userId = 1;
        //file upload looks to have a bug, when parsing the request without an \r, it'll go out of bounds
        //String newLine = System.getProperties().getProperty("line.separator");
        String newLine = "\r\n";
        String newLine2 = newLine + newLine;

        byte[] submitted = readSubmissionFile("submission.zip");
        String content1 = "--AaB03x" + newLine
                          + "content-disposition: form-data; name=\"ct\"" + newLine2 + contestId + newLine
                          + "--AaB03x" + newLine
                          + "content-disposition: form-data; name=\"srank\"" + newLine2 + "999" + newLine
                          + "--AaB03x" + newLine
                          + "content-disposition: form-data; name=\"sbm\"; filename=\"submission.zip\"" + newLine
                          + "Content-Type: application/zip" + newLine + "Content-Transfer-Encoding: binary" + newLine2;
        String content2 = newLine + "--AaB03x--" + newLine;
        byte[] b1 = content1.getBytes();
        byte[] b2 = content2.getBytes();

        byte[] B = new byte[b1.length + b2.length + submitted.length];
        System.arraycopy(b1, 0, B, 0, b1.length);
        System.arraycopy(submitted, 0, B, b1.length, submitted.length);
        System.arraycopy(b2, 0, B, b1.length + submitted.length, b2.length);

        ByteArrayInputStream bais = new ByteArrayInputStream(B);
        MockHttpServletRequest.setMethodResult("getInputStream", new ServletInputStreamImpl(bais));

        MultipartRequest request = new MultipartRequest(new MockHttpServletRequest());
        this.testedInstance.setRequest(request);

        SessionInfo sessionInfo = new SessionInfo(request, new MockWebAuthentication(), new HashSet());
        MockHttpServletRequest.setMethodResultPerArgs("getAttribute_String", "sessionInfo", sessionInfo);

        // Execution
        this.testedInstance.process();
        joinThreads();
        super.tearDown();
        super.setUp();

        // Test verification
        ContestDAO contestDAO = StudioDAOUtil.getFactory().getContestDAO();
        SubmissionDAO submissionDAO = StudioDAOUtil.getFactory().getSubmissionDAO();

        Contest contest = contestDAO.find(contestId);
        List<Submission> submissions = submissionDAO.getSubmissions(contest.getId(), userId,
                                                                    SubmissionType.INITIAL_CONTEST_SUBMISSION_TYPE);
        Assert.assertFalse("The submission is not added to database", submissions.isEmpty());
        Assert.assertEquals("Incorrect number of submissions added", 1, submissions.size());

        Submission submission = submissions.get(0);
        this.addedSubmissions.add(submission.getId());
        SubmissionReview review = submission.getReview();
        Assert.assertNull("The automatic screening review is added by mistake", review);
        Assert.assertFalse("The submission is marked as having the preview image provided",
                           submission.getHasPreviewImage());
    }

    /**
     * <p>Accuracy test. Tests the {@link Submit} request processor for accurate processing of the incoming request and
     * meeting the <code>Req# 5.12</code> from the <code>TopCoder Studio Modifications</code> requirements specification
     * document.</p>
     *
     * <p>Passes the request with submission for a contest originated from <code>Studio Administrator</code> contest
     * channel and verifies that the submission is stored to database successfully and no screening review is
     * auto-generated.</p>
     *
     * @throws Exception if an unexpected error occurs.
     */
    public void testProcess_StudioAdminContest_Gallery() throws Exception {
        // Test setup
        long contestId = 2;
        long userId = 1;
        //file upload looks to have a bug, when parsing the request without an \r, it'll go out of bounds
        //String newLine = System.getProperties().getProperty("line.separator");
        String newLine = "\r\n";
        String newLine2 = newLine + newLine;

        byte[] submitted = readSubmissionFile("slideshow/gallery.zip");
        String content1 = "--AaB03x" + newLine
                         + "content-disposition: form-data; name=\"ct\"" + newLine2 + contestId + newLine
                         + "--AaB03x" + newLine
                         + "content-disposition: form-data; name=\"srank\"" + newLine2 + "999" + newLine
                         + "--AaB03x" + newLine
                         + "content-disposition: form-data; name=\"sbm\"; filename=\"submission.zip\"" + newLine
                         + "Content-Type: application/zip" + newLine + "Content-Transfer-Encoding: binary" + newLine2;
        String content2 = newLine + "--AaB03x--" + newLine;
        byte[] b1 = content1.getBytes();
        byte[] b2 = content2.getBytes();

        byte[] B = new byte[b1.length + b2.length + submitted.length];
        System.arraycopy(b1, 0, B, 0, b1.length);
        System.arraycopy(submitted, 0, B, b1.length, submitted.length);
        System.arraycopy(b2, 0, B, b1.length + submitted.length, b2.length);

        ByteArrayInputStream bais = new ByteArrayInputStream(B);
        MockHttpServletRequest.setMethodResult("getInputStream", new ServletInputStreamImpl(bais));

        MultipartRequest request = new MultipartRequest(new MockHttpServletRequest());
        this.testedInstance.setRequest(request);

        SessionInfo sessionInfo = new SessionInfo(request, new MockWebAuthentication(), new HashSet());
        MockHttpServletRequest.setMethodResultPerArgs("getAttribute_String", "sessionInfo", sessionInfo);

        // Execution
        this.testedInstance.process();
        joinThreads();
        super.tearDown();
        super.setUp();

        // Test verification
        ContestDAO contestDAO = StudioDAOUtil.getFactory().getContestDAO();
        SubmissionDAO submissionDAO = StudioDAOUtil.getFactory().getSubmissionDAO();

        Contest contest = contestDAO.find(contestId);
        List<Submission> submissions = submissionDAO.getSubmissions(contest.getId(), userId,
                                                                    SubmissionType.INITIAL_CONTEST_SUBMISSION_TYPE);
        Assert.assertFalse("The submission is not added to database", submissions.isEmpty());
        Assert.assertEquals("Incorrect number of submissions added", 1, submissions.size());

        Submission submission = submissions.get(0);
        this.addedSubmissions.add(submission.getId());
        SubmissionReview review = submission.getReview();
        Assert.assertNull("The automatic screening review is added by mistake", review);
        Assert.assertTrue("The submission is not marked as having the preview image provided",
                           submission.getHasPreviewImage());

        Set<SubmissionImage> images = submission.getImages();
        Assert.assertEquals("Wrong number of images assigned to submission", 4 * 7, images.size());
    }

    /**
     * <p>Gets the content of the sample submissions file to be used for testing from the disk.</p>
     *
     * @param fileName a <code>String</code> providing the name of the file to load.
     * @return a <code>byte</code> array providing the content of the sample submission file.
     * @throws IOException if an I/O error occurs while reading the image file content.
     */
    private byte[] readSubmissionFile(String fileName) throws IOException {
        InputStream content = new FileInputStream("./test_files/studio/" + fileName);
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

    /**
     * <p>Waits for all threads launched by the tested instance to finish.</p>
     */
    private void joinThreads() {
        List<Thread> threads = this.testedInstance.getGeneratorThreads();
        for (Thread thread : threads) {
            try {
                thread.join();
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }
    }
}
