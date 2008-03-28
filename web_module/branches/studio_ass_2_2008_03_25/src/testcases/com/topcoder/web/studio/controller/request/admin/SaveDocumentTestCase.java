/*
 * Copyright (C) 2008 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.studio.controller.request.admin;

import com.topcoder.web.studio.TCHibernateTestCase;
import com.topcoder.web.studio.DatabaseUtil;
import com.topcoder.web.studio.Constants;
import com.topcoder.web.studio.model.Contest;
import com.topcoder.web.studio.model.Document;
import com.topcoder.web.studio.dao.ContestDAO;
import com.topcoder.web.studio.dao.StudioDAOUtil;
import com.topcoder.web.studio.mock.MockWebAuthentication;
import com.topcoder.web.studio.mock.MockHttpServletRequest;
import com.topcoder.web.studio.mock.MockHttpServletResponse;
import com.topcoder.web.studio.mock.MockHttpSession;
import com.topcoder.web.common.SimpleResponse;
import com.topcoder.web.common.SessionInfo;
import com.topcoder.web.common.SimpleRequest;
import com.topcoder.web.common.NavigationException;
import com.topcoder.shared.security.User;
import com.topcoder.shared.security.SimpleUser;
import com.topcoder.shared.util.StringUtil;
import com.topcoder.db.connectionfactory.DBConnectionFactoryImpl;

import java.util.HashSet;
import java.util.Set;
import java.util.Map;
import java.util.LinkedHashMap;

import junit.framework.Assert;

/**
 * <p>A unit test case for {@link SaveDocument} class.</p>
 *
 * @author isv
 * @version 1.0
 * @since TopCoder Studio Modifications Assembly v2 (Req# 5.7)
 */
public class SaveDocumentTestCase extends TCHibernateTestCase {

    /**
     * <p>The instance of {@link SaveDocument} which is tested. This instance is initialized in {@link #setUp()} method
     * and released in {@link #tearDown()} method.</p>
     */
    private SaveDocument testedInstance = null;

    /**
     * <p>Constructs new <code>SaveDocumentTestCase</code> instance with specified test name.</p>
     *
     * @param name a <code>String</code> providing the name of the test.
     */
    public SaveDocumentTestCase(String name) {
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

        User user = new SimpleUser(132456, "dok", "password");
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

        this.testedInstance = new SaveDocument();
        this.testedInstance.setResponse(new SimpleResponse(new MockHttpServletResponse()));
        this.testedInstance.setAuthentication(new MockWebAuthentication());

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
     * <p>Accuracy test. Tests the {@link SaveDocument} request processor for accurate processing of the incoming
     * request and meeting the <code>Req# 5.7</code> from the <code>TopCoder Studio Modifications</code> requirements
     * specification document.</p>
     *
     * <p>Passes the valid request for updating the document details and epxects the method to update the document
     * details successfully.</p>
     *
     * @throws Exception if an unexpected error occurs.
     */
    public void testProcess_ValidRequest() throws Exception {
        // Test setup
        long contestId = 12;
        long documentId = 1;
        long newDocTypeId = 1;
        String newDescription = "This is a contest document description";

        SimpleRequest request = new SimpleRequest(new MockHttpServletRequest());
        this.testedInstance.setRequest(request);

        SessionInfo sessionInfo = new SessionInfo(request, new MockWebAuthentication(), new HashSet());
        MockHttpServletRequest.setMethodResultPerArgs("getAttribute_String", "sessionInfo", sessionInfo);
        MockHttpServletRequest.setMethodResultPerArgs("getParameter_String",
                                                      Constants.CONTEST_ID, String.valueOf(contestId));
        MockHttpServletRequest.setMethodResultPerArgs("getParameter_String",
                                                      Constants.DOCUMENT_ID, String.valueOf(documentId));
        MockHttpServletRequest.setMethodResultPerArgs("getParameter_String",
                                                      Constants.DOCUMENT_TYPE_ID + '_' + documentId,
                                                      String.valueOf(newDocTypeId));
        MockHttpServletRequest.setMethodResultPerArgs("getParameter_String",
                                                      Constants.DOC_DESC + '_' + documentId,
                                                      String.valueOf(newDescription));

        // Execution
        this.testedInstance.process();
        super.tearDown();
        super.setUp();

        // Test verification
        ContestDAO contestDAO = StudioDAOUtil.getFactory().getContestDAO();
        Contest contest = contestDAO.find(contestId);

        Set<Document> documents = contest.getDocuments();
        Assert.assertEquals("Incorrect number of documents in DB", 1, documents.size());

        Document document = documents.iterator().next();
        Assert.assertEquals("The document description is not saved to DB correctly",
                            newDescription, document.getDescription());
        Assert.assertEquals("The document type is not saved to DB correctly",
                            String.valueOf(newDocTypeId), String.valueOf(document.getType().getId()));
    }

    /**
     * <p>Accuracy test. Tests the {@link SaveDocument} request processor for accurate processing of the incoming
     * request and meeting the <code>Req# 5.7</code> from the <code>TopCoder Studio Modifications</code> requirements
     * specification document.</p>
     *
     * <p>Passes the request with invalid parametrs for updating the document details and epxects the method to update
     * the document details successfully.</p>
     *
     * @throws Exception if an unexpected error occurs.
     */
    public void testProcess_InValidRequests() throws Exception {
        // Test setup
        long contestId = 12;
        long documentId = 1;
        long newDocTypeId = 1;
        String newDescription = "This is a contest document description";

        Map<String, String[]> invalidArgs = new LinkedHashMap<String, String[]>();
        invalidArgs.put(Constants.CONTEST_ID, new String[] {"", "true"});
        invalidArgs.put(Constants.CONTEST_ID, new String[] {"121212121", "true"});
        invalidArgs.put(Constants.CONTEST_ID, new String[] {"xxxxx", "true"});
        invalidArgs.put(Constants.CONTEST_ID, new String[] {null, "true"});
        invalidArgs.put(Constants.DOCUMENT_ID, new String[] {"", "true"});
        invalidArgs.put(Constants.DOCUMENT_ID, new String[] {"121212121", "true"});
        invalidArgs.put(Constants.DOCUMENT_ID, new String[] {"xxxxx", "true"});
        invalidArgs.put(Constants.DOCUMENT_ID, new String[] {null, "true"});
        invalidArgs.put(Constants.DOCUMENT_TYPE_ID, new String[] {"xxxxx", "true"});
        invalidArgs.put(Constants.DOCUMENT_TYPE_ID, new String[] {"-1", "false"});
        invalidArgs.put(Constants.DOCUMENT_TYPE_ID, new String[] {"", "false"});
        invalidArgs.put(Constants.DOCUMENT_TYPE_ID, new String[] {null, "false"});
        invalidArgs.put(Constants.DOC_DESC,
                        new String[] {StringUtil.padLeft("Desc", Constants.MAX_DOCUMENT_DESC_VALUE_LENGTH + 10, '?'),
                                      "false"});

        for (Map.Entry<String, String[]> args : invalidArgs.entrySet()) {
            MockHttpServletRequest.releaseState();
            MockHttpServletRequest.setMethodResult("getContentType", "multipart/form-data, boundary=AaB03x");
            MockHttpServletRequest.setMethodResult("getServerName", "studiodev.topcoder.com");
            MockHttpServletRequest.setMethodResult("getContextPath", "studio");
            MockHttpServletRequest.setMethodResult("getServletPath", "");
            MockHttpServletRequest.setMethodResult("getQueryString", "");
            MockHttpServletRequest.setMethodResult("getSession", new MockHttpSession());

            SimpleRequest request = new SimpleRequest(new MockHttpServletRequest());
            this.testedInstance.setRequest(request);

            SessionInfo sessionInfo = new SessionInfo(request, new MockWebAuthentication(), new HashSet());
            MockHttpServletRequest.setMethodResultPerArgs("getAttribute_String", "sessionInfo", sessionInfo);
            MockHttpServletRequest.setMethodResultPerArgs("getParameter_String",
                                                      Constants.CONTEST_ID, String.valueOf(contestId));
            MockHttpServletRequest.setMethodResultPerArgs("getParameter_String",
                                                      Constants.DOCUMENT_ID, String.valueOf(documentId));
            MockHttpServletRequest.setMethodResultPerArgs("getParameter_String",
                                                      Constants.DOCUMENT_TYPE_ID, String.valueOf(newDocTypeId));
            MockHttpServletRequest.setMethodResultPerArgs("getParameter_String",
                                                      Constants.DOC_DESC, String.valueOf(newDescription));

            // Set the invalid parameter value
            String paramName = args.getKey();
            String paramValue = args.getValue()[0];
            String paramType = args.getValue()[1];
            MockHttpServletRequest.setMethodResultPerArgs("getParameter_String", paramName, paramValue);

            if ("true".equalsIgnoreCase(paramType)) {
                // Execution
                try {
                    this.testedInstance.process();
                    Assert.fail("Should have thrown NavigationException for invalid argument [" + paramName
                                + "] with value [" + paramValue + "]");
                } catch (NavigationException e) {
                    // Expected behavior
                } finally {
                    super.tearDown();
                    super.setUp();
                }
            } else {
                this.testedInstance.process();
                String nextPage = this.testedInstance.getNextPage();
                Assert.assertEquals("Should have return error message for invalid argument [" + paramName
                                    + "] with value [" + paramValue + "]", "/admin/editContest.jsp", nextPage);
            }
        }
    }
}
