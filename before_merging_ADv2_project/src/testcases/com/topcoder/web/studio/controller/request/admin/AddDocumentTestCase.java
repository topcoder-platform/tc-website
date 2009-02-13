/*
 * Copyright (C) 2008 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.studio.controller.request.admin;

import com.topcoder.web.studio.TCHibernateTestCase;
import com.topcoder.web.studio.DatabaseUtil;
import com.topcoder.web.studio.ServletInputStreamImpl;
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
import com.topcoder.web.common.MultipartRequest;
import com.topcoder.web.common.SessionInfo;
import com.topcoder.shared.security.User;
import com.topcoder.shared.security.SimpleUser;
import com.topcoder.db.connectionfactory.DBConnectionFactoryImpl;

import java.util.List;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Set;
import java.util.Arrays;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.FileInputStream;
import java.io.ByteArrayOutputStream;

import junit.framework.Assert;

/**
 * <p>A unit test case for {@link AddDocument} class.</p>
 *
 * @author isv
 * @version 1.0
 * @since TopCoder Studio Modifications Assembly v2 (Req# 5.7)
 */
public class AddDocumentTestCase extends TCHibernateTestCase {

    /**
     * <p>The instance of {@link AddDocument} which is tested. This instance is initialized in {@link #setUp()} method
     * and released in {@link #tearDown()} method.</p>
     */
    private AddDocument testedInstance = null;

    /**
     * <p>A <code>List</code> containing the IDs of documents which might have been added during the tests and which
     * have to be deleted after test is finished.</p>
     */
    private List<Long> addedDocuments = null;

    /**
     * <p>Constructs new <code>AddDocumentTestCase</code> instance with specified test name.</p>
     *
     * @param name a <code>String</code> providing the name of the test.
     */
    public AddDocumentTestCase(String name) {
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

        this.testedInstance = new AddDocument();
        this.testedInstance.setResponse(new SimpleResponse(new MockHttpServletResponse()));
        this.testedInstance.setAuthentication(new MockWebAuthentication());

        this.addedDocuments = new ArrayList<Long>();
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
            DatabaseUtil.deleteTableRecords(connectionFactory, "contest_document_xref", "document_id",
                                            this.addedDocuments);
            DatabaseUtil.deleteTableRecords(connectionFactory, "contest_document_xref", "document_id",
                                            this.addedDocuments);
            DatabaseUtil.deleteTableRecords(connectionFactory, "document", "document_id", this.addedDocuments);
            DatabaseUtil.clearTables(connectionFactory);
        } catch (Exception e) {
            throw new IllegalArgumentException("The tearDown() fails", e);
        }
        this.addedDocuments = null;
    }

    /**
     * <p>Accuracy test. Tests the {@link AddDocument} request processor for accurate processing of the incoming request
     * and meeting the <code>Req# 5.7</code> from the <code>TopCoder Studio Modifications</code> requirements
     * specification document.</p>
     *
     * <p>Passes the request with document and verifies that all document attributes and content are stored
     * successfully.</p>
     *
     * @throws Exception if an unexpected error occurs.
     */
    public void testProcess_() throws Exception {
        // Test setup
        long contestId = 1;
        long docTypeId = 1;
        String description = "This is a contest document description";

        //file upload looks to have a bug, when parsing the request without an \r, it'll go out of bounds
        //String newLine = System.getProperties().getProperty("line.separator");
        String newLine = "\r\n";
        String newLine2 = newLine + newLine;

        byte[] submitted = readSubmissionFile("submission.zip");
        String content1 = "--AaB03x" + newLine
                         + "content-disposition: form-data; name=\"ct\"" + newLine2 + contestId + newLine
                         + "--AaB03x" + newLine
                         + "content-disposition: form-data; name=\"doctid\"" + newLine2 + docTypeId + newLine
                         + "--AaB03x" + newLine
                         + "content-disposition: form-data; name=\"docdesc\"" + newLine2 + description + newLine
                         + "--AaB03x" + newLine
                         + "content-disposition: form-data; name=\"doc\"; filename=\"submission.zip\"" + newLine
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
        super.tearDown();
        super.setUp();

        // Test verification
        ContestDAO contestDAO = StudioDAOUtil.getFactory().getContestDAO();
        Contest contest = contestDAO.find(contestId);

        Set<Document> documents = contest.getDocuments();
        for (Document document : documents) {
            this.addedDocuments.add(document.getId());
        }

        Assert.assertFalse("The document is not added to database", documents.isEmpty());
        Assert.assertEquals("Incorrect number of documents added", 1, documents.size());

        Document document = documents.iterator().next();
        Assert.assertEquals("The document description is not saved to DB correctly",
                            description, document.getDescription());
        Assert.assertEquals("The document description is not saved to DB correctly",
                            String.valueOf(docTypeId), String.valueOf(document.getType().getId()));
        byte[] actualContent = readDocumentFile(contestId, document.getSystemFileName());
        byte[] expectedContent = readSubmissionFile("submission.zip");
        Assert.assertEquals("Wrong content is returned", expectedContent.length, actualContent.length);
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
     * <p>Gets the content of the sample document file to be used for testing from the disk.</p>
     *
     * @param contestId a <code>long</code> providing the ID of a contest.
     * @param file a <code>String</code> providing the name of the file.
     * @return a <code>byte</code> array providing the content of the sample document file.
     * @throws IOException if an I/O error occurs while reading the image file content.
     */
    private byte[] readDocumentFile(long contestId, String file) throws IOException {
        InputStream content = new FileInputStream(Constants.ROOT_STORAGE_PATH + "/" + Constants.DOCUMENTS_DIRECTORY_NAME
                                                  + "/" + contestId + "/" + file);
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
