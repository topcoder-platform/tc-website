/*
 * TestLocalDDECompDependenciesHome.java
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
 * contains tests for the local home interface of the DDECompDependencies EJB
 *
 * @author John C. Bollinger
 *
 * @version 1.0
 */
public class TestLocalDDECompDependenciesHome extends PersistenceTestCase {

    /* an instance of the localHome interface implementation to work with */
    private LocalDDECompDependenciesHome localHome;

    /**
     * a default constructor for use only by other test cases in this package
     */
    TestLocalDDECompDependenciesHome() {
        this("testCreate");
    }

    /**
     * constructs a new TestLocalDDECompDependenciesHome configured to run the named
     * test
     */
    public TestLocalDDECompDependenciesHome(String testName) {
        this(testName, null);
    }

    /**
     * constructs a new TestLocalDDECategoriesHome configured to run the named
     * test in the specified session context
     */
    public TestLocalDDECompDependenciesHome(String testName, SessionContext sc) {
        super(testName, "COMP_DEPENDENCIES", sc);
        pkFieldName = "COMP_DEPENDENCY_ID";
    }

    /**
     * sets up the fixture for this test
     */
    public void setUp() throws Exception {
        super.setUp();
        synchronized (contextLock) {
            localHome = (LocalDDECompDependenciesHome) ctx.lookup(
                    LocalDDECompDependenciesHome.EJB_REF_NAME);
        }
    }

    /*
     * creates a LocalDDECompDependencies entity with default parameters
     */
    LocalDDECompDependencies createDefault(LocalDDECompVersions version,
                                           LocalDDECompVersions childVersion) throws Exception {
        return localHome.create(version, childVersion);
    }

    /**
     * tests all entity creation functionality of the bean
     */
    public void testAllCreate() throws Exception {
        /*
         * This is messy because we need to obtain a LocalDDECompCatalog object
         * in order to create a LocalDDECompDependencies.  Because the setup is so
         * involved, there are several logically different tests bundled
         * together here.
         */
        synchronized (TestLocalDDECompCatalogHome.class) {
            LocalDDECompCatalog localComponent1 = null;
            LocalDDECompCatalog localComponent2 = null;
            TestLocalDDECompCatalogHome compHome =
                    new TestLocalDDECompCatalogHome();

            compHome.setUp();
            localComponent1 = compHome.createDefault();
            assertNotNull(localComponent1);
            try {
                localComponent2 = compHome.createDefault();
                assertNotNull(localComponent2);
                try {
                    assertTrue("Components have identical ID",
                            !localComponent1.getPrimaryKey().equals(
                                    localComponent2.getPrimaryKey()));
                    synchronized (TestLocalDDECompVersionsHome.class) {
                        LocalDDECompVersions localVersion1 = null;
                        LocalDDECompVersions localVersion2 = null;
                        TestLocalDDECompVersionsHome versionsHome =
                                new TestLocalDDECompVersionsHome();
                        versionsHome.setUp();
                        localVersion1 = versionsHome.createDefault(localComponent1);
                        assertNotNull(localVersion1);
                        try {
                            localVersion2 =
                                    versionsHome.createDefault(localComponent2);
                            assertNotNull(localVersion2);
                            try {
                                synchronized (TestLocalDDECompDependenciesHome.class) {
                                    /* test normal creation */
                                    LocalDDECompDependencies local =
                                            createDefault(localVersion1,
                                                    localVersion2);
                                    assertNotNull(local);
                                    try {
                                        assertTrue(localVersion1.isIdentical(
                                                local.getCompVersions()));
                                        assertTrue(localVersion2.isIdentical(
                                                local.getChildCompVersions()));
                                        try {
                                            LocalDDECompDependencies local2 =
                                                    createDefault(localVersion1,
                                                            localVersion2);
                                            local2.remove();
                                            fail("Expected a CreateException");
                                        } catch (CreateException ce) {
                                            /* the expected behavior */
                                        }
                                    } finally {
                                        local.remove();
                                    }

                                    /* test creation with null child component */
                                    local = createDefault(null, localVersion2);
                                    assertNotNull(local);
                                    local.remove();
                                    /* test creation with null parent component */
                                    local = createDefault(localVersion1, null);
                                    assertNotNull(local);
                                    local.remove();
                                    /* test creation with two null components */
                                    local = createDefault(null, null);
                                    assertNotNull(local);
                                    local.remove();
                                }
                            } finally {
                                localVersion2.remove();
                            }
                        } finally {
                            localVersion1.remove();
                        }
                        versionsHome.tearDown();
                    }
                } finally {
                    localComponent2.remove();
                }
            } finally {
                localComponent1.remove();
            }
            compHome.tearDown();
        }
    }

//    public void testFindByCompVersId() {
//        fail("Test not yet implemented");
//    }

//    public void testFindByChildCompVersId() {
//        fail("Test not yet implemented");
//    }

//    public void findByCompVersIdAndChildId() {
//        fail("Test not yet implemented");
//    }

    public void testFindByPrimaryKey() {
        fail("Test not yet implemented");
    }

    class DDECompDependenciesData implements RowData {
        long compDependencyId;
        Long compVersId;
        Long childCompVersId;

        DDECompDependenciesData(Object id, Long version, Long childVersion) {
            this(((Long) id).longValue(), version, childVersion);
        }

        DDECompDependenciesData(long id, Long version, Long childVersion) {
            compDependencyId = id;
            compVersId = version;
            childCompVersId = childVersion;
        }

        DDECompDependenciesData(ResultSet rs) throws SQLException {
            readRowData(rs);
        }

        public Object getPrimaryKey() {
            return new Long(compDependencyId);
        }

        private void updateResultSet(ResultSet rs) throws SQLException {
            if (compVersId == null) {
                rs.updateNull("COMP_VERS_ID");
            } else {
                rs.updateLong("COMP_VERS_ID", compVersId.longValue());
            }
            if (childCompVersId == null) {
                rs.updateNull("CHILD_COMP_VERS_ID");
            } else {
                rs.updateLong("CHILD_COMP_VERS_ID", childCompVersId.longValue());
            }
        }

        public void storeRowData(ResultSet rs) throws SQLException {
            updateResultSet(rs);
            rs.updateRow();
        }

        public void insertRowData(ResultSet rs) throws SQLException {
            rs.moveToInsertRow();
            rs.updateLong("COMP_DEPENDENCY_ID", compDependencyId);
            updateResultSet(rs);
            rs.insertRow();
        }

        public void readRowData(ResultSet rs) throws SQLException {
            long l;

            compDependencyId = rs.getLong("COMP_DEPENDENCY_ID");
            l = rs.getLong("COMP_VERS_ID");
            if (rs.wasNull()) {
                compVersId = null;
            } else {
                compVersId = new Long(l);
            }
            l = rs.getLong("CHILD_COMP_VERS_ID");
            if (rs.wasNull()) {
                childCompVersId = null;
            } else {
                childCompVersId = new Long(l);
            }
        }

        public boolean matchesResultSet(ResultSet rs) throws SQLException {
            return equals(new DDECompDependenciesData(rs));
        }

        public boolean equals(Object o) {
            if (!(o instanceof DDECompDependenciesData)) {
                return false;
            }
            DDECompDependenciesData d = (DDECompDependenciesData) o;
            return (
                    (compDependencyId == d.compDependencyId)
                    && objectsMatch(compVersId, d.compVersId)
                    && objectsMatch(childCompVersId, d.childCompVersId));
        }


    }

}