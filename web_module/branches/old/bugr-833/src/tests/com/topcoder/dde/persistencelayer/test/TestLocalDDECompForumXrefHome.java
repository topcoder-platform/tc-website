/*
 * TestLocalDDECompForumXrefHome.java
 *
 * By John C. Bollinger
 *
 * Copyright (c) 2002
 */

package com.topcoder.dde.persistencelayer.test;

import com.topcoder.dde.persistencelayer.interfaces.*;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Collection;
import java.util.Date;
import javax.ejb.CreateException;
import javax.ejb.ObjectNotFoundException;
import javax.ejb.SessionContext;

/**
 * contains tests for the local home interface of the DDECompForumXref EJB
 *
 * @author John C. Bollinger
 *
 * @version 1.0
 */
public class TestLocalDDECompForumXrefHome extends PersistenceTestCase {

    /* an instance of the localHome interface implementation to work with */
    private LocalDDECompForumXrefHome localHome;

    /* default field values for entity instances */
    static private long DEF_FORUM_ID;
    static final private int DEF_FORUM_TYPE = 1;

    /**
     * a default constructor for use only by other test cases in this package
     */
    TestLocalDDECompForumXrefHome() {
        this("testCreate");
    }

    /**
     * constructs a new TestLocalDDECompForumXrefHome configured to run the named
     * test
     */
    public TestLocalDDECompForumXrefHome(String testName) {
        this(testName, null);
    }

    /**
     * constructs a new TestLocalDDECategoriesHome configured to run the named
     * test in the specified session context
     */
    public TestLocalDDECompForumXrefHome(String testName, SessionContext sc) {
        super(testName, "COMP_FORUM_XREF", sc);
        pkFieldName = "COMP_FORUM_ID";
    }

    /**
     * sets up the fixture for this test
     */
    public void setUp() throws Exception {
        super.setUp();
        synchronized (contextLock) {
            localHome = (LocalDDECompForumXrefHome) ctx.lookup(
                    LocalDDECompForumXrefHome.EJB_REF_NAME);
        }
        DEF_FORUM_ID = nextId();
        Connection con = dataSource.getConnection();
        Statement stmt = con.createStatement(
                ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
        ResultSet rs = stmt.executeQuery(
                "SELECT * FROM FORUM_MASTER WHERE 1=0;");
        rs.moveToInsertRow();
        rs.updateLong("FORUM_ID", DEF_FORUM_ID);
        rs.updateLong("STATUS_ID", 1L);
        rs.updateTimestamp("CREATE_TIME",
                new Timestamp(System.currentTimeMillis()));
        rs.updateNull("CLOSED_TIME");
        rs.insertRow();
        con.close();
    }

    public void tearDown() throws Exception {
        Connection con = dataSource.getConnection();
        con.createStatement().executeUpdate(
                "DELETE FROM FORUM_MASTER WHERE FORUM_ID=" + DEF_FORUM_ID + ";");
        con.close();
        super.tearDown();
    }

    /*
     * creates a LocalDDECompForumXref entity with default parameters
     */
    LocalDDECompForumXref createDefault(LocalDDECompVersions version)
            throws Exception {
        return localHome.create(DEF_FORUM_ID, DEF_FORUM_TYPE, version);
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
                        synchronized (TestLocalDDECompForumXrefHome.class) {
                            /* test standard creation */
                            LocalDDECompForumXref local
                                    = createDefault(localVersion);
                            assertNotNull(local);
                            try {
                                assertEquals(DEF_FORUM_ID,
                                        local.getForumId());
                                assertEquals(DEF_FORUM_TYPE,
                                        local.getForumType());
                                assertTrue(local.getCompVersions().isIdentical(
                                        localVersion));
                                transactionBoundary();
                                assertMatchesDB(new DDECompForumXrefData(
                                        local.getPrimaryKey(),
                                        (Long) local.getCompVersions().getPrimaryKey(),
                                        new Long(local.getForumId()),
                                        local.getForumType()
                                ));
                            } finally {
                                local.remove();
                            }
                            /* test null version */
                            local = localHome.create(DEF_FORUM_ID,
                                    DEF_FORUM_TYPE, null);
                            assertNotNull(local);
                            local.remove();
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

    /**
     * tests the findByForumId finder method
     */
//    public void testFindByForumId() throws Exception {
//        fail("Test not yet implemented");
//    }

    /**
     * tests the findByCompVersIdAndForumId finder method
     */
//    public void testFindByCompVersIdAndForumId() throws Exception {
//        fail("Test not yet implemented");
//    }

    /**
     * tests the findByCompVersIdAndType finder method
     */
//    public void testFindByCompVersIdAndType() {
//        fail("Test not yet implemented");
//    }

    class DDECompForumXrefData implements RowData {
        long compForumId;
        Long compVersId;
        Long forumId;
        int forumType;

        DDECompForumXrefData(Object id, Long version, Long forum, int type) {
            this(keyToLong(id), version, forum, type);
        }

        DDECompForumXrefData(long id, Long version, Long forum, int type) {
            compForumId = id;
            compVersId = version;
            forumId = forum;
            forumType = type;
        }

        DDECompForumXrefData(ResultSet rs) throws SQLException {
            readRowData(rs);
        }

        public Object getPrimaryKey() {
            return new Long(compForumId);
        }

        private void updateResultSet(ResultSet rs) throws SQLException {
            if (compVersId == null) {
                rs.updateNull("COMP_VERS_ID");
            } else {
                rs.updateLong("COMP_VERS_ID", compVersId.longValue());
            }
            if (forumId == null) {
                rs.updateNull("FORUM_ID");
            } else {
                rs.updateLong("FORUM_ID", forumId.longValue());
            }
            rs.updateInt("FORUM_TYPE", forumType);
        }

        public void storeRowData(ResultSet rs) throws SQLException {
            updateResultSet(rs);
            rs.updateRow();
        }

        public void insertRowData(ResultSet rs) throws SQLException {
            rs.moveToInsertRow();
            rs.updateLong("COMP_FORUM_ID", compForumId);
            updateResultSet(rs);
            rs.insertRow();
        }

        public void readRowData(ResultSet rs) throws SQLException {
            compForumId = rs.getLong("COMP_FORUM_ID");
            compVersId = new Long(rs.getLong("COMP_VERS_ID"));
            if (rs.wasNull()) {
                compVersId = null;
            }
            forumId = new Long(rs.getLong("FORUM_ID"));
            if (rs.wasNull()) {
                forumId = null;
            }
            forumType = rs.getInt("FORUM_TYPE");
        }

        public boolean matchesResultSet(ResultSet rs) throws SQLException {
            return equals(new DDECompForumXrefData(rs));
        }

        public boolean equals(Object o) {
            if (!(o instanceof DDECompForumXrefData)) {
                return false;
            }
            DDECompForumXrefData d = (DDECompForumXrefData) o;
            return (
                    (compForumId == d.compForumId)
                    && objectsMatch(compVersId, d.compVersId)
                    && objectsMatch(forumId, d.forumId)
                    && (forumType == d.forumType));
        }
    }

}