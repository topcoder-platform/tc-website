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
import com.topcoder.web.studio.TCHibernateTestCase;
import com.topcoder.web.studio.mock.MockHttpServletRequest;
import com.topcoder.web.studio.mock.MockHttpServletResponse;
import com.topcoder.web.studio.mock.MockHttpSession;
import com.topcoder.web.studio.mock.MockWebAuthentication;
import junit.framework.Assert;
import org.mockejb.jndi.MockContextFactory;

import javax.naming.InitialContext;
import javax.sql.DataSource;
import java.util.HashSet;

/**
 * <p>A unit test case for {@link ViewSubmissions} class.</p>
 *
 * @author isv
 * @version 1.0
 * @since TopCoder Studio Modifications v2 Assembly (Req# 5.9)
 */
public class ViewSubmissionsTestCase extends TCHibernateTestCase {

    /**
     * <p>The instance of {@link ViewSubmissions} which is tested. This instance is initialized in {@link #setUp()}
     * method and released in {@link #tearDown()} method.</p>
     */
    private ViewSubmissions testedInstance = null;

    /**
     * <p>Constructs new <code>ViewSubmissionsTestCase</code> instance with specified test name.</p>
     *
     * @param name a <code>String</code> providing the name of the test.
     */
    public ViewSubmissionsTestCase(String name) {
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

        this.testedInstance = new ViewSubmissions();
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
     * <p>Accuracy test. Tests the {@link ViewSubmissions#dbProcessing()} method for accurate behavior.</p>
     * <p/>
     * <p>Passes a request for viewing submissions for a running <code>TopCoder Direct</code> contest and expects the
     * method to disallow viewing the submissions for contest.</p>
     *
     * @throws Exception if an unexpected error occurs.
     */
    public void testDbProcessing_Running_TCDirect() throws Exception {
        // Test setup
        long contestId = 1;

        MockHttpServletRequest.setMethodResultPerArgs("getParameter_String",
                Constants.CONTEST_ID, String.valueOf(contestId));

        // Execution
        try {
            this.testedInstance.process();
            Assert.fail("Viewing submissions is not prohibited for running contest");
        } catch (NavigationException e) {
            // Expected behavior
            Assert.assertEquals("Wrong exception message is returned",
                    "Submissions are not available until the contest is over.", e.getMessage());
        } finally {
            super.tearDown();
            super.setUp();
        }
    }


    /**
     * <p>Accuracy test. Tests the {@link ViewSubmissions#dbProcessing()} method for accurate behavior.</p>
     * <p/>
     * <p>Passes a request for viewing submissions for a running <code>Studio Admin</code> contest and expects the
     * method to deny viewing the submissions for contest.</p>
     *
     * @throws Exception if an unexpected error occurs.
     */
    public void testDbProcessing_Running_Studio() throws Exception {
        // Test setup
        long contestId = 2;

        MockHttpServletRequest.setMethodResultPerArgs("getParameter_String",
                Constants.CONTEST_ID, String.valueOf(contestId));

        // Execution
        try {
            this.testedInstance.process();
            Assert.fail("Viewing submissions is not prohibited for running contest");
        } catch (NavigationException e) {
            // Expected behavior
            Assert.assertEquals("Wrong exception message is returned",
                    "Submissions are not available until the contest is over.", e.getMessage());
        } finally {
            super.tearDown();
            super.setUp();
        }
    }

    /**
     * <p>Accuracy test. Tests the {@link ViewSubmissions#dbProcessing()} method for accurate behavior.</p>
     * <p/>
     * <p>Passes a request for viewing submissions for a running <code>Studio Admin V1</code> contest and expects the
     * method to deny viewing the submissions for contest.</p>
     *
     * @throws Exception if an unexpected error occurs.
     */
    public void testDbProcessing_Running_StudioV1() throws Exception {
        // Test setup
        long contestId = 7;

        MockHttpServletRequest.setMethodResultPerArgs("getParameter_String",
                Constants.CONTEST_ID, String.valueOf(contestId));

        // Execution
        try {
            this.testedInstance.process();
            Assert.fail("Viewing submissions is not prohibited for running contest");
        } catch (NavigationException e) {
            // Expected behavior
            Assert.assertEquals("Wrong exception message is returned",
                    "Submissions are not available until the contest is over.", e.getMessage());
        } finally {
            super.tearDown();
            super.setUp();
        }
    }
}
