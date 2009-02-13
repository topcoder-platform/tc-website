/*
 * TestLocalDDECompExamplesHome.java
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
 * contains tests for the local home interface of the DDECompExamples EJB
 *
 * @author John C. Bollinger
 *
 * @version 1.0
 */
public class TestLocalDDECompExamplesHome extends PersistenceTestCase {

    /* an instance of the localHome interface implementation to work with */
    private LocalDDECompExamplesHome localHome;

    /* default field values for entity instances */
    static final private String DEF_DESCRIPTION = "Dummy Unit Test Example";
    static final private String DEF_URL = "file:/dev/null";

    /**
     * a default constructor for use only by other test cases in this package
     */
    TestLocalDDECompExamplesHome() {
        this("testCreate");
    }

    /**
     * constructs a new TestLocalDDECompExamplesHome configured to run the named
     * test
     */
    public TestLocalDDECompExamplesHome(String testName) {
        this(testName, null);
    }

    /**
     * constructs a new TestLocalDDECategoriesHome configured to run the named
     * test in the specified session context
     */
    public TestLocalDDECompExamplesHome(String testName, SessionContext sc) {
        super(testName, "COMP_EXAMPLES", sc);
        pkFieldName = "EXAMPLE_ID";
    }

    /**
     * sets up the fixture for this test
     */
    public void setUp() throws Exception {
        super.setUp();
        synchronized (contextLock) {
            localHome = (LocalDDECompExamplesHome) ctx.lookup(
                    LocalDDECompExamplesHome.EJB_REF_NAME);
        }
    }

    /*
     * creates a LocalDDECompExamples entity with default parameters
     */
    LocalDDECompExamples createDefault(LocalDDECompVersions version)
            throws Exception {
        return localHome.create(DEF_URL, DEF_DESCRIPTION, version);
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
                        synchronized (TestLocalDDECompExamplesHome.class) {
                            /* test standard creation */
                            LocalDDECompExamples local
                                    = createDefault(localVersion);
                            assertNotNull(local);
                            try {
                                assertEquals(DEF_URL, local.getUrl());
                                assertEquals(DEF_DESCRIPTION,
                                        local.getDescription());
                                assertTrue(local.getCompVersions().isIdentical(
                                        localVersion));
                                transactionBoundary();
                                assertMatchesDB(new DDECompExamplesData(
                                        local.getPrimaryKey(),
                                        (Long) local.getCompVersions().getPrimaryKey(),
                                        local.getUrl(),
                                        local.getDescription()
                                ));
                            } finally {
                                local.remove();
                            }
                            /* test null version */
                            local = localHome.create(DEF_URL, DEF_DESCRIPTION,
                                    null);
                            assertNotNull(local);
                            local.remove();
                            /* test blank URL */
                            local = localHome.create("", DEF_DESCRIPTION,
                                    localVersion);
                            assertNotNull(local);
                            local.remove();
                            /* test blank description */
                            local = localHome.create(DEF_URL, "", localVersion);
                            assertNotNull(local);
                            local.remove();
                            /* test null URL */
                            try {
                                local = localHome.create(null, DEF_DESCRIPTION,
                                        localVersion);
                                local.remove();
                                fail("bean creation with null name should have failed");
                            } catch (CreateException ce) {
                                /* expected behavior */
                            }
                            /* test null Description */
                            try {
                                local = localHome.create(DEF_URL, null, localVersion);
                                local.remove();
                                fail("bean creation with null URL should have failed");
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

    class DDECompExamplesData implements RowData {
        long exampleId;
        Long compVersId;
        String url;
        String description;

        DDECompExamplesData(Object id, Long version, String _url, String desc) {
            this(((Long) id).longValue(), version, _url, desc);
        }

        DDECompExamplesData(long id, Long version, String _url, String desc) {
            exampleId = id;
            compVersId = version;
            url = _url;
            description = desc;
        }

        DDECompExamplesData(ResultSet rs) throws SQLException {
            readRowData(rs);
        }

        public Object getPrimaryKey() {
            return new Long(exampleId);
        }

        private void updateResultSet(ResultSet rs) throws SQLException {
            if (compVersId == null) {
                rs.updateNull("COMP_VERS_ID");
            } else {
                rs.updateLong("COMP_VERS_ID", compVersId.longValue());
            }
            rs.updateString("URL", url);
            rs.updateString("DESCRIPTION", description);
        }

        public void storeRowData(ResultSet rs) throws SQLException {
            updateResultSet(rs);
            rs.updateRow();
        }

        public void insertRowData(ResultSet rs) throws SQLException {
            rs.moveToInsertRow();
            rs.updateLong("EXAMPLE_ID", exampleId);
            updateResultSet(rs);
            rs.insertRow();
        }

        public void readRowData(ResultSet rs) throws SQLException {
            exampleId = rs.getLong("EXAMPLE_ID");
            compVersId = new Long(rs.getLong("COMP_VERS_ID"));
            if (rs.wasNull()) {
                compVersId = null;
            }
            url = rs.getString("URL");
            description = rs.getString("DESCRIPTION");
        }

        public boolean matchesResultSet(ResultSet rs) throws SQLException {
            return equals(new DDECompExamplesData(rs));
        }

        public boolean equals(Object o) {
            if (!(o instanceof DDECompExamplesData)) {
                return false;
            }
            DDECompExamplesData d = (DDECompExamplesData) o;
            return (
                    (exampleId == d.exampleId)
                    && objectsMatch(compVersId, d.compVersId)
                    && objectsMatch(url, d.url)
                    && objectsMatch(description, d.description));
        }
    }

}