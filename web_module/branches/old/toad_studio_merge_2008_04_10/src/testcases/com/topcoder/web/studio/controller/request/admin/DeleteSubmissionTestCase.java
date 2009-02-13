/*
 * Copyright (C) 2008 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.studio.controller.request.admin;

import com.topcoder.web.studio.TCHibernateTestCase;
import com.topcoder.web.studio.DatabaseUtil;
import com.topcoder.web.studio.ServletOutputStreamImpl;
import com.topcoder.web.studio.Constants;
import com.topcoder.web.studio.model.Submission;
import com.topcoder.web.studio.model.SubmissionStatus;
import com.topcoder.web.studio.dao.StudioDAOUtil;
import com.topcoder.web.studio.dao.SubmissionDAO;
import com.topcoder.web.studio.mock.MockWebAuthentication;
import com.topcoder.web.studio.mock.MockHttpServletRequest;
import com.topcoder.web.studio.mock.MockHttpServletResponse;
import com.topcoder.web.studio.mock.MockHttpSession;
import com.topcoder.web.common.SimpleRequest;
import com.topcoder.web.common.SimpleResponse;
import com.topcoder.web.common.SessionInfo;
import com.topcoder.web.common.NavigationException;
import com.topcoder.shared.security.User;
import com.topcoder.shared.security.SimpleUser;
import com.topcoder.shared.util.sql.InformixSimpleDataSource;
import com.topcoder.shared.util.DBMS;
import com.topcoder.db.connectionfactory.DBConnectionFactoryImpl;
import com.topcoder.util.config.ConfigManager;

import java.util.List;
import java.util.HashSet;
import java.util.ArrayList;
import java.io.ByteArrayOutputStream;

import junit.framework.Assert;

import javax.sql.DataSource;
import javax.naming.InitialContext;

import org.mockejb.jndi.MockContextFactory;

/**
 * <p>A unit test case for {@link DeleteSubmission} class.</p>
 *
 * @author isv
 * @version 1.0
 * @since TopCoder Studio Modifications Assembly v2 (Req# 5.2)
 */
public class DeleteSubmissionTestCase extends TCHibernateTestCase {

    /**
     * <p>The instance of {@link DeleteSubmission} which is tested. This instance is initialized in {@link #setUp()}
     * method and released in {@link #tearDown()} method.</p>
     */
    private DeleteSubmission testedInstance = null;

    /**
     * <p>A <code>List</code> containing the IDs of contests which might have been added during the tests and which
     * have to be deleted after test is finished.</p>
     */
    private List<Long> addedContests = null;

    /**
     * <p>Constructs new <code>DeleteSubmissionTestCase</code> instance with specified test name.</p>
     *
     * @param name a <code>String</code> providing the name of the test.
     */
    public DeleteSubmissionTestCase(String name) {
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

        this.testedInstance = new DeleteSubmission();
        this.testedInstance.setResponse(new SimpleResponse(new MockHttpServletResponse()));
        this.testedInstance.setAuthentication(new MockWebAuthentication());
        this.testedInstance.setRequest(request);

        try {
            SessionInfo sessionInfo = new SessionInfo(request, new MockWebAuthentication(), new HashSet());
            MockHttpServletRequest.setMethodResultPerArgs("getAttribute_String", "sessionInfo", sessionInfo);

            String dbNamespcae = "com.topcoder.db.connectionfactory.DBConnectionFactoryImpl";
            DBConnectionFactoryImpl connectionFactory = new DBConnectionFactoryImpl(dbNamespcae);
            DatabaseUtil.clearTables(connectionFactory);
            DatabaseUtil.populateTables(connectionFactory);

            ConfigManager cm = ConfigManager.getInstance();
            String jdbcUrl = cm.getString(dbNamespcae, "connections.TestingConnection.parameters.jdbc_url");
            String jdbcUser = cm.getString(dbNamespcae, "connections.TestingConnection.parameters.user");
            String jdbcPassword = cm.getString(dbNamespcae, "connections.TestingConnection.parameters.password");

            DataSource ds = new InformixSimpleDataSource(jdbcUrl, jdbcUser, jdbcPassword);
            MockContextFactory.setAsInitial();
            new InitialContext().bind(DBMS.STUDIO_DATASOURCE_NAME, ds);
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
            MockContextFactory.revertSetAsInitial();
        } catch (Exception e) {
            throw new IllegalArgumentException("The tearDown() fails", e);
        }
        this.addedContests = null;
    }

    /**
     * <p>Accuracy test. Tests the {@link DeleteSubmission#dbProcessing()} method for accurate behavior.</p>
     *
     * <p>Passes a request for deleting the submission which has a payment status set to <code>Paid</code> and verifies
     * that the method denies to delete the submission.</p>
     *
     * @throws Exception if an unexpected error occurs.
     */
    public void testDbProcessing_Paid() throws Exception {
        // Test setup
        long submissionId = 3;

        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        MockHttpServletRequest.setMethodResultPerArgs("getParameter_String",
                                                      Constants.SUBMISSION_ID, String.valueOf(submissionId));
        MockHttpServletResponse.setMethodResult("getOutputStream", new ServletOutputStreamImpl(baos));

        // Execution
        try {
            this.testedInstance.process();
            Assert.fail("Attempted to delete purchased submission");
        } catch (NavigationException e) {
            // Expected behavior
        } finally {
            super.tearDown();
            super.setUp();
        }

        // Test verification
        SubmissionDAO submissionDAO = StudioDAOUtil.getFactory().getSubmissionDAO();
        Submission submission = submissionDAO.find(submissionId);
        Assert.assertNotNull("The submission was phisycally deleted from data store", submission);
        Assert.assertEquals("The submission status has been changed",
                            SubmissionStatus.ACTIVE, submission.getStatus().getId());
    }

    /**
     * <p>Accuracy test. Tests the {@link DeleteSubmission#dbProcessing()} method for accurate behavior.</p>
     *
     * <p>Passes a request for deleting the submission which has a payment status set to <code>Unpaid</code> and
     * verifies that the method deletes the submission.</p>
     *
     * @throws Exception if an unexpected error occurs.
     */
    public void testDbProcessing_UnPaid() throws Exception {
        // Test setup
        long submissionId = 5;

        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        MockHttpServletRequest.setMethodResultPerArgs("getParameter_String",
                                                      Constants.SUBMISSION_ID, String.valueOf(submissionId));
        MockHttpServletResponse.setMethodResult("getOutputStream", new ServletOutputStreamImpl(baos));

        // Execution
        this.testedInstance.process();
        super.tearDown();
        super.setUp();

        // Test verification
        SubmissionDAO submissionDAO = StudioDAOUtil.getFactory().getSubmissionDAO();
        Submission submission = submissionDAO.find(submissionId);
        Assert.assertNotNull("The submission was phisycally deleted from data store", submission);
        Assert.assertEquals("The submission status has not been changed",
                            SubmissionStatus.DELETED, submission.getStatus().getId());
    }

    /**
     * <p>Accuracy test. Tests the {@link DeleteSubmission#dbProcessing()} method for accurate behavior.</p>
     *
     * <p>Passes a request for deleting the submission which has a payment status set to <code>MarkedForPurchase</code>
     * and verifies that the method deletes the submission.</p>
     *
     * @throws Exception if an unexpected error occurs.
     */
    public void testDbProcessing_MarkedForPurchase() throws Exception {
        // Test setup
        long submissionId = 7;

        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        MockHttpServletRequest.setMethodResultPerArgs("getParameter_String",
                                                      Constants.SUBMISSION_ID, String.valueOf(submissionId));
        MockHttpServletResponse.setMethodResult("getOutputStream", new ServletOutputStreamImpl(baos));

        // Execution
        this.testedInstance.process();
        super.tearDown();
        super.setUp();

        // Test verification
        SubmissionDAO submissionDAO = StudioDAOUtil.getFactory().getSubmissionDAO();
        Submission submission = submissionDAO.find(submissionId);
        Assert.assertNotNull("The submission was phisycally deleted from data store", submission);
        Assert.assertEquals("The submission status has not been changed",
                            SubmissionStatus.DELETED, submission.getStatus().getId());
    }

    /**
     * <p>Accuracy test. Tests the {@link DeleteSubmission#dbProcessing()} method for accurate behavior.</p>
     *
     * <p>Passes a request for deleting the submission which does not have a payment associated with it and verifies
     * that the method deletes the submission.</p>
     *
     * @throws Exception if an unexpected error occurs.
     */
    public void testDbProcessing_NoPayment() throws Exception {
        // Test setup
        long submissionId = 1;

        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        MockHttpServletRequest.setMethodResultPerArgs("getParameter_String",
                                                      Constants.SUBMISSION_ID, String.valueOf(submissionId));
        MockHttpServletResponse.setMethodResult("getOutputStream", new ServletOutputStreamImpl(baos));

        // Execution
        this.testedInstance.process();
        super.tearDown();
        super.setUp();

        // Test verification
        SubmissionDAO submissionDAO = StudioDAOUtil.getFactory().getSubmissionDAO();
        Submission submission = submissionDAO.find(submissionId);
        Assert.assertNotNull("The submission was phisycally deleted from data store", submission);
        Assert.assertEquals("The submission status has not been changed",
                            SubmissionStatus.DELETED, submission.getStatus().getId());
    }
}
