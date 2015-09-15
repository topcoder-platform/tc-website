/*
 * TestLocalDDEDocForumXrefHome.java
 *
 * By John C. Bollinger
 *
 * Copyright (c) 2002
 */

package com.topcoder.dde.persistencelayer.test;

import com.topcoder.dde.persistencelayer.interfaces.*;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.Collection;
import javax.ejb.CreateException;
import javax.ejb.ObjectNotFoundException;
import javax.ejb.SessionContext;

/**
 * contains tests for the local home interface of the DDEDocForumXref EJB
 *
 * @author John C. Bollinger
 *
 * @version 1.0
 */
public class TestLocalDDEDocForumXrefHome extends PersistenceTestCase {

    /* an instance of the localHome interface implementation to work with */
    private LocalDDEDocForumXrefHome localHome;
    private long forumId;

    /* default field values for entity instances */
    static private long DEF_TOPIC_ID = 1L;

    /**
     * a default constructor for use only by other test cases in this package
     */
    TestLocalDDEDocForumXrefHome() {
        this("testCreate");
    }

    /**
     * constructs a new TestLocalDDEDocForumXrefHome configured to run the named
     * test
     */
    public TestLocalDDEDocForumXrefHome(String testName) {
        this(testName, null);
    }

    /**
     * constructs a new TestLocalDDECategoriesHome configured to run the named
     * test in the specified session context
     */
    public TestLocalDDEDocForumXrefHome(String testName, SessionContext sc) {
        super(testName, "DOC_FORUM_XREF", sc);
        pkFieldName = "DOC_FORUM_ID";
    }

    /**
     * sets up the fixture for this test
     */
    public void setUp() throws Exception {
        super.setUp();
        synchronized (contextLock) {
            localHome = (LocalDDEDocForumXrefHome) ctx.lookup(
                    LocalDDEDocForumXrefHome.EJB_REF_NAME);
        }
        Connection con = dataSource.getConnection();
        Statement stmt = con.createStatement(
                ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
        ResultSet rs = stmt.executeQuery(
                "SELECT * FROM FORUM_MASTER WHERE 1=0;");

        forumId = nextId();
        rs.moveToInsertRow();
        rs.updateLong("FORUM_ID", forumId);
        rs.updateLong("STATUS_ID", 1L);
        rs.updateTimestamp("CREATE_TIME",
                new Timestamp(System.currentTimeMillis()));
        rs.updateNull("CLOSED_TIME");
        rs.insertRow();

        DEF_TOPIC_ID = nextId();
        rs = stmt.executeQuery(
                "SELECT * FROM FORUM_TOPICS WHERE 1=0;");
        rs.moveToInsertRow();
        rs.updateLong("TOPIC_ID", DEF_TOPIC_ID);
        rs.updateLong("FORUM_ID", forumId);
        rs.updateNull("PARENT_TOPIC_ID");
        rs.updateLong("STATUS_ID", 1L);
        rs.updateString("TOPIC_NAME", "Antidisestablishmentarianism");
        rs.updateString("TOPIC_TEXT", "[Test] Extremely long words");
        rs.insertRow();

        con.close();
    }

    public void tearDown() throws Exception {
        Connection con = dataSource.getConnection();
        con.createStatement().executeUpdate(
                "DELETE FROM FORUM_TOPICS WHERE TOPIC_ID=" + DEF_TOPIC_ID + ";");
        con.createStatement().executeUpdate(
                "DELETE FROM FORUM_MASTER WHERE FORUM_ID=" + forumId + ";");
        con.close();
        super.tearDown();
    }

    /*
     * creates a LocalDDEDocForumXref entity with default parameters
     */
    LocalDDEDocForumXref createDefault(LocalDDECompDocumentation doc)
            throws Exception {
        return localHome.create(DEF_TOPIC_ID, doc);
    }

    /**
     * tests all entity creation functionality of the bean
     */
    public void testAllCreate() throws Exception {
        /*
         * setting up for a LocalDDECompDocumentation creation is sufficiently
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
                            TestLocalDDECompDocumentationHome docHome
                                    = new TestLocalDDECompDocumentationHome();
                            LocalDDECompDocumentation localDoc;

                            docHome.setUp();
                            localDoc = docHome.createDefault(localVersion);
                            assertNotNull(localDoc);
                            try {

                                synchronized (TestLocalDDEDocForumXrefHome.class) {
                                    /* test standard creation */
                                    LocalDDEDocForumXref local
                                            = createDefault(localDoc);
                                    assertNotNull(local);
                                    try {
                                        assertEquals(DEF_TOPIC_ID,
                                                local.getTopicId());
                                        assertTrue(local.getCompDocumentation().isIdentical(
                                                localDoc));
                                        transactionBoundary();
                                        assertMatchesDB(new DDEDocForumXrefData(
                                                local.getPrimaryKey(),
                                                (Long) local.getCompDocumentation().getPrimaryKey(),
                                                new Long(local.getTopicId())
                                        ));
                                    } finally {
                                        local.remove();
                                    }
                                    /* test null documentation */
                                    local = localHome.create(DEF_TOPIC_ID, null);
                                    assertNotNull(local);
                                    local.remove();
                                }

                            } finally {
                                localDoc.remove();
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
//    public void testFindByDocumentId() throws Exception {
//        fail("Test not yet implemented");
//    }

    class DDEDocForumXrefData implements RowData {
        long docForumId;
        Long documentId;
        Long topicId;

        DDEDocForumXrefData(Object id, Long doc, Long topic) {
            this(keyToLong(id), doc, topic);
        }

        DDEDocForumXrefData(long id, Long doc, Long topic) {
            docForumId = id;
            documentId = doc;
            topicId = topic;
        }

        DDEDocForumXrefData(ResultSet rs) throws SQLException {
            readRowData(rs);
        }

        public Object getPrimaryKey() {
            return new Long(docForumId);
        }

        private void updateResultSet(ResultSet rs) throws SQLException {
            if (documentId == null) {
                rs.updateNull("DOCUMENT_ID");
            } else {
                rs.updateLong("DOCUMENT_ID", documentId.longValue());
            }
            if (topicId == null) {
                rs.updateNull("TOPIC_ID");
            } else {
                rs.updateLong("TOPIC_ID", topicId.longValue());
            }
        }

        public void storeRowData(ResultSet rs) throws SQLException {
            updateResultSet(rs);
            rs.updateRow();
        }

        public void insertRowData(ResultSet rs) throws SQLException {
            rs.moveToInsertRow();
            rs.updateLong("DOC_FORUM_ID", docForumId);
            updateResultSet(rs);
            rs.insertRow();
        }

        public void readRowData(ResultSet rs) throws SQLException {
            docForumId = rs.getLong("DOC_FORUM_ID");
            documentId = new Long(rs.getLong("DOCUMENT_ID"));
            if (rs.wasNull()) {
                documentId = null;
            }
            topicId = new Long(rs.getLong("TOPIC_ID"));
            if (rs.wasNull()) {
                topicId = null;
            }
        }

        public boolean matchesResultSet(ResultSet rs) throws SQLException {
            return equals(new DDEDocForumXrefData(rs));
        }

        public boolean equals(Object o) {
            if (!(o instanceof DDEDocForumXrefData)) {
                return false;
            }
            DDEDocForumXrefData d = (DDEDocForumXrefData) o;
            return (
                    (docForumId == d.docForumId)
                    && objectsMatch(documentId, d.documentId)
                    && objectsMatch(topicId, d.topicId));
        }
    }

}