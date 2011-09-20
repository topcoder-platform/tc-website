/*
 * TestLocalDDECompVersionsHome.java
 *
 * By John C. Bollinger
 *
 * Copyright (c) 2002
 */

package com.topcoder.dde.persistencelayer.test;

import com.topcoder.dde.persistencelayer.interfaces.*;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Collection;
import java.util.Date;
import javax.ejb.CreateException;
import javax.ejb.ObjectNotFoundException;
import javax.ejb.SessionContext;

/**
 * contains tests for the local home interface of the DDECompVersions EJB
 *
 * @author John C. Bollinger
 *
 * @version 1.0
 */
public class TestLocalDDECompVersionsHome extends PersistenceTestCase {

    /* an instance of the localHome interface implementation to work with */
    private LocalDDECompVersionsHome localHome;

    /* default field values for entity instances */
    private static final long DEF_VERSION = 42L;
    private static final Timestamp DEF_CREATE_T =
            new Timestamp(System.currentTimeMillis());
    private static final long DEF_PHASE = 1L;
    private static final Timestamp DEF_PHASE_T = new Timestamp(0L);
    private static final double DEF_PRICE = 1.29;
    private static final String DEF_COMMENTS =
            "This is the really good version.  It's better than the good "
            + "version, but not so good as the really really good version.  "
            + "In any case, avoid the bad version (6.66) like the plague.";
    private static final String DEF_VTEXT = "6.95_07";

    /**
     * a default constructor for use only by other test cases in this package
     */
    TestLocalDDECompVersionsHome() {
        this("testCreate");
    }

    /**
     * constructs a new TestLocalDDECompVersionsHome configured to run the named
     * test
     */
    public TestLocalDDECompVersionsHome(String testName) {
        this(testName, null);
    }

    /**
     * constructs a new TestLocalDDECategoriesHome configured to run the named
     * test in the specified session context
     */
    public TestLocalDDECompVersionsHome(String testName, SessionContext sc) {
        super(testName, "COMP_VERSIONS", sc);
        pkFieldName = "COMP_VERS_ID";
    }

    /**
     * sets up the fixture for this test
     */
    public void setUp() throws Exception {
        super.setUp();
        synchronized (contextLock) {
            localHome = (LocalDDECompVersionsHome) ctx.lookup(
                    LocalDDECompVersionsHome.EJB_REF_NAME);
        }
    }

    /*
     * creates a LocalDDECompVersions entity with default parameters
     */
    LocalDDECompVersions createDefault(LocalDDECompCatalog comp)
            throws Exception {
        return localHome.create(DEF_VERSION, DEF_CREATE_T, DEF_PHASE,
                DEF_PHASE_T, DEF_PRICE, DEF_COMMENTS, comp, DEF_VTEXT);
    }

    /**
     * tests all entity creation functionality of the bean
     */
    public void testAllCreate() throws Exception {
        /*
         * This is messy because we need to obtain a LocalDDECompCatalog object
         * in order to create a LocalDDECompVersions.  Because the setup is so
         * involved, there are several logically different tests bundled
         * together here.
         */
        synchronized (TestLocalDDECompCatalogHome.class) {
            LocalDDECompCatalog localComponent;
            TestLocalDDECompCatalogHome compHome =
                    new TestLocalDDECompCatalogHome();

            compHome.setUp();
            localComponent = compHome.createDefault();
            assertNotNull(localComponent);
            try {
                synchronized (TestLocalDDECompVersionsHome.class) {
                    /* test normal creation */
                    LocalDDECompVersions local = createDefault(localComponent);
                    assertNotNull(local);
                    try {
                        assertEquals(DEF_COMMENTS, local.getComments());
                        assertEquals(DEF_CREATE_T, local.getCreateTime());
                        assertEquals(DEF_PHASE, local.getPhaseId());
                        assertEquals(DEF_PHASE_T, local.getPhaseTime());
                        assertEquals(DEF_PRICE, local.getPrice(), 0.001d);
                        assertEquals(DEF_VERSION, local.getVersion());
                        assertTrue(localComponent.isIdentical(
                                local.getCompCatalog()));
                        assertEquals(DEF_VTEXT, local.getVersionText());
                        transactionBoundary();
                        assertMatchesDB(new DDECompVersionsData(
                                local.getPrimaryKey(),
                                (Long) localComponent.getPrimaryKey(),
                                DEF_VERSION, DEF_VTEXT, DEF_CREATE_T,
                                DEF_PHASE, DEF_PHASE_T, DEF_PRICE, DEF_COMMENTS));
                    } finally {
                        local.remove();
                    }

                    /* test creation with null component */
                    local = createDefault(null);
                    assertNotNull(local);
                    local.remove();
                }
            } finally {
                localComponent.remove();
            }
        }
    }

//    public void testFindByComponentId() {
//        fail("Test not yet implemented");
//    }

//    public void testFindByComponentIdAndVersion() {
//        fail("Test not yet implemented");
//    }

    public void testFindByPrimaryKey() {
        fail("Test not yet implemented");
    }

    class DDECompVersionsData implements RowData {
        long compVersId;
        Long componentId;
        long version;
        String versionText;
        Timestamp createTime;
        long phaseId;
        Timestamp phaseTime;
        double price;
        String comments;

        DDECompVersionsData(Object id, Long component, long vers, String vtext,
                            Timestamp create, long phase, Timestamp phaseT, double p,
                            String com) {
            this(keyToLong(id), component, vers, vtext, create, phase, phaseT, p,
                    com);
        }

        DDECompVersionsData(long id, Long component, long vers, String vtext,
                            Timestamp create, long phase, Timestamp phaseT, double p,
                            String com) {
            compVersId = id;
            componentId = component;
            version = vers;
            versionText = vtext;
            createTime = (Timestamp) create.clone();
            phaseId = phase;
            phaseTime = (Timestamp) phaseT.clone();
            price = p;
            comments = com;
        }

        DDECompVersionsData(ResultSet rs) throws SQLException {
            readRowData(rs);
        }

        public Object getPrimaryKey() {
            return new Long(compVersId);
        }

        private void updateResultSet(ResultSet rs) throws SQLException {
            if (componentId == null) {
                rs.updateNull("COMPONENT_ID");
            } else {
                rs.updateLong("COMPONENT_ID", componentId.longValue());
            }
            rs.updateLong("VERSION", version);
            rs.updateString("VERSION_TEXT", versionText);
            rs.updateTimestamp("CREATE_TIME", createTime);
            rs.updateLong("PHASE_ID", phaseId);
            rs.updateTimestamp("PHASE_TIME", phaseTime);
            rs.updateDouble("PRICE", price);
            rs.updateString("COMMENTS", comments);
        }

        public void storeRowData(ResultSet rs) throws SQLException {
            updateResultSet(rs);
            rs.updateRow();
        }

        public void insertRowData(ResultSet rs) throws SQLException {
            rs.moveToInsertRow();
            rs.updateLong("COMP_VERS_ID", compVersId);
            updateResultSet(rs);
            rs.insertRow();
        }

        public void readRowData(ResultSet rs) throws SQLException {
            long l;

            compVersId = rs.getLong("COMP_VERS_ID");
            l = rs.getLong("COMPONENT_ID");
            if (rs.wasNull()) {
                componentId = null;
            } else {
                componentId = new Long(l);
            }
            version = rs.getLong("VERSION");
            versionText = rs.getString("VERSION_TEXT");
            createTime = rs.getTimestamp("CREATE_TIME");
            phaseId = rs.getLong("PHASE_ID");
            phaseTime = rs.getTimestamp("PHASE_TIME");
            price = rs.getDouble("PRICE");
            comments = rs.getString("COMMENTS");
        }

        public boolean matchesResultSet(ResultSet rs) throws SQLException {
            return equals(new DDECompVersionsData(rs));
        }

        public boolean equals(Object o) {
            if (!(o instanceof DDECompVersionsData)) {
                return false;
            }
            DDECompVersionsData d = (DDECompVersionsData) o;
            return (
                    (compVersId == d.compVersId)
                    && objectsMatch(componentId, d.componentId)
                    && (version == d.version)
                    && objectsMatch(versionText, d.versionText)
                    && objectsMatch(createTime, d.createTime)
                    && (phaseId == d.phaseId)
                    && objectsMatch(phaseTime, d.phaseTime)
                    && (price == d.price)
                    && objectsMatch(comments, d.comments));
        }


    }

}