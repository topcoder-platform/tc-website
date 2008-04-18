/*
 * Copyright (C) 2008 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.studio.controller.request.admin;

import com.topcoder.web.studio.TCHibernateTestCase;
import com.topcoder.web.studio.DatabaseUtil;
import com.topcoder.web.studio.Constants;
import com.topcoder.web.studio.model.Contest;
import com.topcoder.web.studio.dao.StudioDAOFactory;
import com.topcoder.web.studio.dao.StudioDAOUtil;
import com.topcoder.web.studio.dao.ContestDAO;
import com.topcoder.web.studio.mock.MockWebAuthentication;
import com.topcoder.web.studio.mock.MockHttpServletRequest;
import com.topcoder.web.studio.mock.MockHttpServletResponse;
import com.topcoder.web.studio.mock.MockHttpSession;
import com.topcoder.web.common.SimpleRequest;
import com.topcoder.web.common.SimpleResponse;
import com.topcoder.web.common.SessionInfo;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.dao.UserDAO;
import com.topcoder.shared.security.User;
import com.topcoder.shared.security.SimpleUser;
import com.topcoder.db.connectionfactory.DBConnectionFactoryImpl;

import java.util.HashSet;
import java.util.List;
import java.util.Map;

import junit.framework.Assert;

/**
 * <p>A unit test case for {@link ViewContest} class.</p>
 *
 * @author isv
 * @version 1.0
 * @since TopCoder Studio Modifications Assembly v2 (Req# 5.13)
 */
public class ViewContestTestCase extends TCHibernateTestCase {

    /**
     * <p>The instance of {@link ViewContest} which is tested. This instance is initialized in {@link #setUp()} method
     * and released in {@link #tearDown()} method.</p>
     */
    private ViewContest testedInstance = null;

    /**
     * <p>Constructs new <code>ViewContestTestCase</code> instance with specified test name.</p>
     *
     * @param name a <code>String</code> providing the name of the test.
     */
    public ViewContestTestCase(String name) {
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

        User user = new SimpleUser(1, "dok_test", "password");
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

        this.testedInstance = new ViewContest();
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
     * <p>Accuracy test. Tests the {@link ViewContest#dbProcessing()} method for accurate behavior.</p>
     *
     * <p>Passes a request for viewing existing contests and verifies that the method binds the appropriate contest
     * creator handle to request.</p> 
     *
     * @throws Exception if an unexpected error occurs.
     */
    public void testDbProcessing_ExistingContests() throws Exception {
        String[] contestIds = new String[] {"1", "2", "3", "4", "5", "6", "7"};

        for (int i = 0; i < contestIds.length; i++) {
            String contestId = contestIds[i];
            MockHttpServletRequest.releaseState();
            SimpleRequest request = new SimpleRequest(new MockHttpServletRequest());
            SessionInfo sessionInfo = new SessionInfo(request, new MockWebAuthentication(), new HashSet());
            MockHttpServletRequest.setMethodResultPerArgs("getAttribute_String", "sessionInfo", sessionInfo);
            MockHttpServletRequest.setMethodResult("getServerName", "studiodev.topcoder.com");
            MockHttpServletRequest.setMethodResult("getContextPath", "studio");
            MockHttpServletRequest.setMethodResult("getServletPath", "");
            MockHttpServletRequest.setMethodResult("getQueryString", "");
            MockHttpServletRequest.setMethodResult("getSession", new MockHttpSession());

            MockHttpServletRequest.setMethodResultPerArgs("getParameter_String", Constants.CONTEST_ID, contestId);

            // Execution
            this.testedInstance.process();
            super.tearDown();
            super.setUp();

            // Test verification
            ContestDAO contestDAO = StudioDAOUtil.getFactory().getContestDAO();
            Contest contest = contestDAO.find(new Long(contestId));
            UserDAO userDAO = DAOUtil.getFactory().getUserDAO();
            com.topcoder.web.common.model.User creator = userDAO.find(contest.getCreateUserId());
            boolean creatorHandleSet = false;
            String nextPage = this.testedInstance.getNextPage();
            Assert.assertEquals("The valid contest is not created", "/admin/editContest.jsp", nextPage);
            List args = MockHttpServletRequest.getMethodArguments("setAttribute_String_Object");
            for (int j = 0; j < args.size(); j++) {
                Map callArgs = (Map) args.get(j);
                String attrName = (String) callArgs.get("1");
                if ("contestCreatorHandle".equals(attrName)) {
                    creatorHandleSet = true;
                    Object attrValue = callArgs.get("2");
                    Assert.assertNotNull("NULL creator handle set", attrValue);
                    Assert.assertEquals("Wrong contest creator handle bound to request",
                                        creator.getHandle(), attrValue);

                }
            }
            Assert.assertTrue("The contest creator handle is not bound to request", creatorHandleSet);
        }
    }

    /**
     * <p>Accuracy test. Tests the {@link ViewContest#dbProcessing()} method for accurate behavior.</p>
     *
     * <p>Passes a request for viewing new contest and verifies that the method binds the handle for currently logged
     * user as contest creator handle to request.</p>
     *
     * @throws Exception if an unexpected error occurs.
     */
    public void testDbProcessing_NewContest() throws Exception {
        String contestId = "";
        MockHttpServletRequest.setMethodResultPerArgs("getParameter_String", Constants.CONTEST_ID, contestId);

        // Execution
        this.testedInstance.process();
        super.tearDown();
        super.setUp();

        // Test verification
        UserDAO userDAO = DAOUtil.getFactory().getUserDAO();
        com.topcoder.web.common.model.User creator = userDAO.find(1L);
        boolean creatorHandleSet = false;
        String nextPage = this.testedInstance.getNextPage();
        Assert.assertEquals("The valid contest is not created", "/admin/editContest.jsp", nextPage);
        List args = MockHttpServletRequest.getMethodArguments("setAttribute_String_Object");
        for (int j = 0; j < args.size(); j++) {
            Map callArgs = (Map) args.get(j);
            String attrName = (String) callArgs.get("1");
            if ("contestCreatorHandle".equals(attrName)) {
                creatorHandleSet = true;
                Object attrValue = callArgs.get("2");
                Assert.assertNotNull("NULL creator handle set", attrValue);
                Assert.assertEquals("Wrong contest creator handle bound to request",
                                    creator.getHandle(), attrValue);

            }
        }
        Assert.assertTrue("The contest creator handle is not bound to request", creatorHandleSet);
    }
}
