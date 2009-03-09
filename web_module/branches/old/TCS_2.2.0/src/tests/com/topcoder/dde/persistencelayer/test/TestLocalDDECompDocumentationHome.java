/*
 * TestLocalDDECompDocumentationHome.java
 *
 * By John C. Bollinger
 *
 * Copyright (c) 2002
 */

package com.topcoder.dde.persistencelayer.test;

import com.topcoder.dde.persistencelayer.interfaces.*;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Collection;
import java.util.Date;
import javax.ejb.CreateException;
import javax.ejb.ObjectNotFoundException;
import javax.ejb.SessionContext;

/**
 * contains tests for the local home interface of the DDECompDocumentation EJB
 *
 * @author John C. Bollinger
 *
 * @version 1.0
 */
public class TestLocalDDECompDocumentationHome extends PersistenceTestCase {

    /* an instance of the localHome interface implementation to work with */
    private LocalDDECompDocumentationHome localHome;

    /* default field values for entity instances */
    static final private long DEF_DOC_TYPE = 1L;
    static final private String DEF_DOC_NAME = "Dummy Unit Test Document";
    static final private String DEF_URL = "file:/dev/null";
    static final private long INVALID_DOC_TYPE = -1L;

    /**
     * a default constructor for use only by other test cases in this package
     */
    TestLocalDDECompDocumentationHome() {
        this("testCreate");
    }

    /**
     * constructs a new TestLocalDDECompDocumentationHome configured to run the named
     * test
     */
    public TestLocalDDECompDocumentationHome(String testName) {
        this(testName, null);
    }

    /**
     * constructs a new TestLocalDDECategoriesHome configured to run the named
     * test in the specified session context
     */
    public TestLocalDDECompDocumentationHome(String testName, SessionContext sc) {
        super(testName, "COMP_DOCUMENTATION", sc);
        pkFieldName = "DOCUMENT_ID";
    }

    /**
     * sets up the fixture for this test
     */
    public void setUp() throws Exception {
        super.setUp();
        synchronized (contextLock) {
            localHome = (LocalDDECompDocumentationHome) ctx.lookup(
                    LocalDDECompDocumentationHome.EJB_REF_NAME);
        }
    }

    /*
     * creates a LocalDDECompDocumentation entity with default parameters
     */
    LocalDDECompDocumentation createDefault(LocalDDECompVersions version)
            throws Exception {
        return localHome.create(DEF_DOC_TYPE, DEF_DOC_NAME, DEF_URL, version);
    }

    /**
     * tests all entity creation functionality of the bean
     */
    public void testAllCreate() throws Exception {
        /*
         * setting up for a LocalDDECompDocument creation is sufficiently
         * complicated that we do it once (below) and perform all necessary
         * creation tests inside.  The setUp and setUpEJB methods are not
         * sufficient for this because we have to synchronize.
         */
        synchronized (TestLocalDDECompCatalogHome.class) {
            TestLocalDDECompCatalogHome compHome
                    = new TestLocalDDECompCatalogHome();
            LocalDDECompCatalog localComp;

            compHome.setUp();
            localComp = compHome.createDefault();
            assertNotNull(localComp);
            try {
                synchronized (TestLocalDDECompVersionsHome.class) {
                    TestLocalDDECompVersionsHome versionsHome
                            = new TestLocalDDECompVersionsHome();
                    LocalDDECompVersions localVersion;

                    versionsHome.setUp();
                    localVersion = versionsHome.createDefault(localComp);
                    assertNotNull(localVersion);
                    try {
                        synchronized (TestLocalDDECompDocumentationHome.class) {
                            /* test standard creation */
                            LocalDDECompDocumentation local
                                    = createDefault(localVersion);
                            assertNotNull(local);
                            try {
                                assertEquals(DEF_DOC_TYPE,
                                        local.getDocumentTypeId());
                                assertEquals(DEF_DOC_NAME,
                                        local.getDocumentName());
                                assertEquals(DEF_URL, local.getUrl());
                                assertTrue(local.getCompVersions().isIdentical(
                                        localVersion));
                                transactionBoundary();
                                assertMatchesDB(new DDECompDocumentationData(
                                        local.getPrimaryKey(),
                                        (Long) local.getCompVersions().getPrimaryKey(),
                                        new Long(local.getDocumentTypeId()),
                                        local.getDocumentName(),
                                        local.getUrl()
                                ));
                            } finally {
                                local.remove();
                            }
                            /* test null version */
                            local = localHome.create(DEF_DOC_TYPE, DEF_DOC_NAME,
                                    DEF_URL, null);
                            assertNotNull(local);
                            local.remove();
                            /* test blank name */
                            local = localHome.create(DEF_DOC_TYPE, "",
                                    DEF_URL, localVersion);
                            assertNotNull(local);
                            local.remove();
                            /* test blank URL */
                            local = localHome.create(DEF_DOC_TYPE, DEF_DOC_NAME,
                                    "", localVersion);
                            assertNotNull(local);
                            local.remove();
                            /* test null name */
                            try {
                                local = localHome.create(DEF_DOC_TYPE, null,
                                        DEF_URL, localVersion);
                                local.remove();
                                fail("bean creation with null name should have failed");
                            } catch (CreateException ce) {
                                /* expected behavior */
                            }
                            /* test null URL */
                            try {
                                local = localHome.create(DEF_DOC_TYPE, DEF_DOC_NAME,
                                        null, localVersion);
                                local.remove();
                                fail("bean creation with null URL should have failed");
                            } catch (CreateException ce) {
                                /* expected behavior */
                            }
                            /* test invalid type */
                            try {
                                local = localHome.create(INVALID_DOC_TYPE,
                                        DEF_DOC_NAME, DEF_URL, localVersion);
                                local.remove();
                                fail("bean creation with invalid document type ID should have failed");
                            } catch (CreateException ce) {
                                /* expected behavior */
                            }
                        }
                    } finally {
                        localVersion.remove();
                    }
                }
            } finally {
                localComp.remove();
            }
        }
    }

    /**
     * tests the findByPrimaryKey finder method
     */
    public void testFindByPrimaryKey() throws Exception {
        fail("Test not yet implemented");
    }

    /**
     * tests the findByCompVersId finder method
     */
//    public void testFindByCompVersId() throws Exception {
//        fail("Test not yet implemented");
//    }

    class DDECompDocumentationData implements RowData {
        long documentId;
        Long compVersId;
        Long documentTypeId;
        String documentName;
        String url;

        DDECompDocumentationData(Object id, Long version, Long docType,
                                 String docName, String _url) {
            this(((Long) id).longValue(), version, docType, docName, _url);
        }

        DDECompDocumentationData(long id, Long version, Long docType,
                                 String docName, String _url) {
            documentId = id;
            compVersId = version;
            documentTypeId = docType;
            documentName = docName;
            url = _url;
        }

        DDECompDocumentationData(ResultSet rs) throws SQLException {
            readRowData(rs);
        }

        public Object getPrimaryKey() {
            return new Long(documentId);
        }

        private void updateResultSet(ResultSet rs) throws SQLException {
            if (compVersId == null) {
                rs.updateNull("COMP_VERS_ID");
            } else {
                rs.updateLong("COMP_VERS_ID", compVersId.longValue());
            }
            if (documentTypeId == null) {
                rs.updateNull("DOCUMENT_TYPE_ID");
            } else {
                rs.updateLong("DOCUMENT_TYPE_ID", documentTypeId.longValue());
            }
            rs.updateString("DOCUMENT_NAME", documentName);
            rs.updateString("URL", url);
        }

        public void storeRowData(ResultSet rs) throws SQLException {
            updateResultSet(rs);
            rs.updateRow();
        }

        public void insertRowData(ResultSet rs) throws SQLException {
            rs.moveToInsertRow();
            rs.updateLong("DOCUMENT_ID", documentId);
            updateResultSet(rs);
            rs.insertRow();
        }

        public void readRowData(ResultSet rs) throws SQLException {
            documentId = rs.getLong("DOCUMENT_ID");
            compVersId = new Long(rs.getLong("COMP_VERS_ID"));
            if (rs.wasNull()) {
                compVersId = null;
            }
            documentTypeId = new Long(rs.getLong("DOCUMENT_TYPE_ID"));
            if (rs.wasNull()) {
                documentTypeId = null;
            }
            documentName = rs.getString("DOCUMENT_NAME");
            url = rs.getString("URL");
        }

        public boolean matchesResultSet(ResultSet rs) throws SQLException {
            return equals(new DDECompDocumentationData(rs));
        }

        public boolean equals(Object o) {
            if (!(o instanceof DDECompDocumentationData)) {
                return false;
            }
            DDECompDocumentationData d = (DDECompDocumentationData) o;
            return (
                    (documentId == d.documentId)
                    && objectsMatch(compVersId, d.compVersId)
                    && objectsMatch(documentTypeId, d.documentTypeId)
                    && objectsMatch(documentName, d.documentName)
                    && objectsMatch(url, d.url));
        }
    }

}