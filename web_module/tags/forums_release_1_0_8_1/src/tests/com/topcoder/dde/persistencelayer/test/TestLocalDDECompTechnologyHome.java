/*
 * TestLocalDDECompTechnologyHome.java
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
 * contains tests for the local home interface of the DDECompTechnology EJB
 *
 * @author John C. Bollinger
 *
 * @version 1.0
 */
public class TestLocalDDECompTechnologyHome extends PersistenceTestCase {

    /* an instance of the localHome interface implementation to work with */
    private LocalDDECompTechnologyHome localHome;

    /**
     * a default constructor for use only by other test cases in this package
     */
    TestLocalDDECompTechnologyHome() {
        this("testCreate");
    }

    /**
     * constructs a new TestLocalDDECompTechnologyHome configured to run the named
     * test
     */
    public TestLocalDDECompTechnologyHome(String testName) {
        this(testName, null);
    }

    /**
     * constructs a new TestLocalDDECategoriesHome configured to run the named
     * test in the specified session context
     */
    public TestLocalDDECompTechnologyHome(String testName, SessionContext sc) {
        super(testName, "COMP_TECHNOLOGY", sc);
        pkFieldName = "COMP_TECH_ID";
    }

    /**
     * sets up the fixture for this test
     */
    public void setUp() throws Exception {
        super.setUp();
        synchronized (contextLock) {
            localHome = (LocalDDECompTechnologyHome) ctx.lookup(
                    LocalDDECompTechnologyHome.EJB_REF_NAME);
        }
    }

    /*
     * creates a LocalDDECompTechnology entity with default parameters
     */
    LocalDDECompTechnology createDefault(LocalDDECompVersions version,
                                         LocalDDETechnologyTypes tech) throws Exception {
        return localHome.create(version, tech);
    }

    /**
     * tests all entity creation functionality of the bean
     */
    public void testAllCreate() throws Exception {
        /*
         * This is messy because we need to obtain a LocalDDECompVersions object
         * and a LocalDDEUserMaster object in order to create a
         * LocalDDECompTechnology.  Because the setup is so involved, there are
         * several logically different tests bundled together here.
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
                    LocalDDECompVersions localVersion;
                    TestLocalDDECompVersionsHome versionsHome =
                            new TestLocalDDECompVersionsHome();
                    versionsHome.setUp();
                    localVersion = versionsHome.createDefault(localComponent);
                    assertNotNull(localVersion);
                    try {
                        synchronized (TestLocalDDETechnologyTypesHome.class) {
                            LocalDDETechnologyTypes localTech;
                            TestLocalDDETechnologyTypesHome techHome
                                    = new TestLocalDDETechnologyTypesHome();
                            techHome.setUp();
                            localTech = techHome.createDefault();
                            try {
                                synchronized (TestLocalDDECompTechnologyHome.class) {
                                    /* test normal creation */
                                    LocalDDECompTechnology local =
                                            createDefault(localVersion,
                                                    localTech);
                                    assertNotNull(local);
                                    try {
                                        assertTrue(localVersion.isIdentical(
                                                local.getCompVersions()));
                                        assertTrue(localTech.isIdentical(
                                                local.getTechnologyTypes()));
                                        try {
                                            LocalDDECompTechnology local2 =
                                                    createDefault(localVersion,
                                                            localTech);
                                            local2.remove();
                                            fail("Expected a CreateException");
                                        } catch (CreateException ce) {
                                            /* the expected behavior */
                                        }
                                    } finally {
                                        local.remove();
                                    }

                                    /* test creation with null component version */
                                    local = localHome.create(null, localTech);
                                    assertNotNull(local);
                                    local.remove();
                                    /* test creation with null user */
                                    local = localHome.create(localVersion, null);
                                    assertNotNull(local);
                                    local.remove();
                                    /* test creation with null version and user */
                                    local = localHome.create(null, null);
                                    assertNotNull(local);
                                    local.remove();
                                }
                            } finally {
                                localTech.remove();
                            }
                        }
                    } finally {
                        localVersion.remove();
                    }
                }
            } finally {
                localComponent.remove();
            }
        }
    }

    public void testFindByPrimaryKey() {
        fail("Test not yet implemented");
    }

//    public void testFindByCompVersId() {
//        fail("Test not yet implemented");
//    }

//    public void testFindByCompVersIdAndTechnologyId()  {
//        fail("Test not yet implemented");
//    }

    class DDECompTechnologyData implements RowData {
        long compTechId;
        Long compVersId;
        Long technologyTypeId;

        DDECompTechnologyData(Object id, Long version, Long tech) {
            this(keyToLong(id), version, tech);
        }

        DDECompTechnologyData(long id, Long version, Long tech) {
            compTechId = id;
            compVersId = version;
            technologyTypeId = tech;
        }

        DDECompTechnologyData(ResultSet rs) throws SQLException {
            readRowData(rs);
        }

        public Object getPrimaryKey() {
            return new Long(compTechId);
        }

        private void updateResultSet(ResultSet rs) throws SQLException {
            if (compVersId == null) {
                rs.updateNull("COMP_VERS_ID");
            } else {
                rs.updateLong("COMP_VERS_ID", compVersId.longValue());
            }
            if (technologyTypeId == null) {
                rs.updateNull("TECHNOLOGY_TYPE_ID");
            } else {
                rs.updateLong("TECHNOLOGY_TYPE_ID", technologyTypeId.longValue());
            }
        }

        public void storeRowData(ResultSet rs) throws SQLException {
            updateResultSet(rs);
            rs.updateRow();
        }

        public void insertRowData(ResultSet rs) throws SQLException {
            rs.moveToInsertRow();
            rs.updateLong("COMP_TECH_ID", compTechId);
            updateResultSet(rs);
            rs.insertRow();
        }

        public void readRowData(ResultSet rs) throws SQLException {
            long l;

            compTechId = rs.getLong("COMP_TECH_ID");
            l = rs.getLong("COMP_VERS_ID");
            if (rs.wasNull()) {
                compVersId = null;
            } else {
                compVersId = new Long(l);
            }
            l = rs.getLong("TECHNOLOGY_TYPE_ID");
            if (rs.wasNull()) {
                technologyTypeId = null;
            } else {
                technologyTypeId = new Long(l);
            }
        }

        public boolean matchesResultSet(ResultSet rs) throws SQLException {
            return equals(new DDECompTechnologyData(rs));
        }

        public boolean equals(Object o) {
            if (!(o instanceof DDECompTechnologyData)) {
                return false;
            }
            DDECompTechnologyData d = (DDECompTechnologyData) o;
            return (
                    (technologyTypeId == d.technologyTypeId)
                    && objectsMatch(compVersId, d.compVersId)
                    && objectsMatch(technologyTypeId, d.technologyTypeId));
        }

    }

}