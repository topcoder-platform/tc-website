/*
 * TestLocalDDEUserTechnologiesHome.java
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
 * contains tests for the local home interface of the DDEUserTechnologies EJB
 *
 * @author John C. Bollinger
 *
 * @version 1.0
 */
public class TestLocalDDEUserTechnologiesHome extends PersistenceTestCase {

    /* an instance of the localHome interface implementation to work with */
    private LocalDDEUserTechnologiesHome localHome;

    /* default field values for entity instances */
    private static final int DEF_RATING = 5;
    private static final int DEF_MONTHS = 12;

    /**
     * a default constructor for use only by other test cases in this package
     */
    TestLocalDDEUserTechnologiesHome() {
        this("testCreate");
    }

    /**
     * constructs a new TestLocalDDEUserTechnologiesHome configured to run the named
     * test
     */
    public TestLocalDDEUserTechnologiesHome(String testName) {
        this(testName, null);
    }

    /**
     * constructs a new TestLocalDDECategoriesHome configured to run the named
     * test in the specified session context
     */
    public TestLocalDDEUserTechnologiesHome(String testName, SessionContext sc) {
        super(testName, "USER_TECHNOLOGIES", sc);
        pkFieldName = "USER_TECH_ID";
    }

    /**
     * sets up the fixture for this test
     */
    public void setUp() throws Exception {
        super.setUp();
        synchronized (contextLock) {
            localHome = (LocalDDEUserTechnologiesHome) ctx.lookup(
                    LocalDDEUserTechnologiesHome.EJB_REF_NAME);
        }
    }

    /*
     * creates a LocalDDEUserTechnologies entity with default parameters
     */
    LocalDDEUserTechnologies createDefault(LocalDDEUserMaster master,
                                           LocalDDETechnologyTypes type) throws Exception {
        return localHome.create(DEF_RATING, DEF_MONTHS, master, type);
    }

    /**
     * tests all entity creation functionality of the bean
     */
    public void testAllCreate() throws Exception {
        /*
         * This is messy because we need to obtain a LocalDDECompCatalog object
         * in order to create a LocalDDEUserTechnologies.  Because the setup is so
         * involved, there are several logically different tests bundled
         * together here.
         */
        synchronized (TestLocalDDEUserMasterHome.class) {
            LocalDDEUserMaster localMaster;
            TestLocalDDEUserMasterHome masterHome =
                    new TestLocalDDEUserMasterHome();

            masterHome.setUp();
            localMaster = masterHome.createDefault();
            assertNotNull(localMaster);
            try {
                synchronized (TestLocalDDETechnologyTypesHome.class) {
                    LocalDDETechnologyTypes localType;
                    TestLocalDDETechnologyTypesHome typeHome =
                            new TestLocalDDETechnologyTypesHome();

                    typeHome.setUp();
                    localType = typeHome.createDefault();
                    assertNotNull(localType);
                    try {
                        synchronized (TestLocalDDEUserTechnologiesHome.class) {
                            /* test normal creation */
                            LocalDDEUserTechnologies local = createDefault(localMaster,
                                    localType);
                            assertNotNull(local);
                            try {
                                assertEquals(DEF_RATING, local.getRating());
                                assertEquals(DEF_MONTHS, local.getMonths());
                                assertTrue(localMaster.isIdentical(
                                        local.getUserMaster()));
                                assertTrue(localType.isIdentical(
                                        local.getTechnologyTypes()));
                            } finally {
                                local.remove();
                            }

                            /* test creation with null user */
                            local = createDefault(null, localType);
                            assertNotNull(local);
                            local.remove();
                            /* test creation with null type */
                            local = createDefault(localMaster, null);
                            assertNotNull(local);
                            local.remove();
                        }
                    } finally {
                        localType.remove();
                        typeHome.tearDown();
                    }
                }
            } finally {
                localMaster.remove();
                masterHome.tearDown();
            }
        }
    }

    public void testFindByPrimaryKey() {
        fail("Test not yet implemented");
    }
/*
    public void testFindByLoginId() {
        fail("Test not yet implemented");
    }
*/
    class DDEUserTechnologiesData implements RowData {
        long userTechId;
        Long technologyTypeId;
        Long loginId;
        int rating;
        int months;

        DDEUserTechnologiesData(Object id, Long type, Long login, int rate,
                                int time) {
            this(keyToLong(id), type, login, rate, time);
        }

        DDEUserTechnologiesData(long id, Long type, Long login, int rate,
                                int time) {
            userTechId = id;
            technologyTypeId = type;
            loginId = login;
            rating = rate;
            months = time;
        }

        DDEUserTechnologiesData(ResultSet rs) throws SQLException {
            readRowData(rs);
        }

        public Object getPrimaryKey() {
            return new Long(userTechId);
        }

        private void updateResultSet(ResultSet rs) throws SQLException {
            if (technologyTypeId == null) {
                rs.updateNull("TECHNOLOGY_TYPE_ID");
            } else {
                rs.updateLong("TECHNOLOGY_TYPE_ID", technologyTypeId.longValue());
            }
            if (loginId == null) {
                rs.updateNull("LOGIN_ID");
            } else {
                rs.updateLong("LOGIN_ID", loginId.longValue());
            }
            rs.updateInt("RATING", rating);
            rs.updateInt("MONTHS", months);
        }

        public void storeRowData(ResultSet rs) throws SQLException {
            updateResultSet(rs);
            rs.updateRow();
        }

        public void insertRowData(ResultSet rs) throws SQLException {
            rs.moveToInsertRow();
            rs.updateLong("USER_TECH_ID", userTechId);
            updateResultSet(rs);
            rs.insertRow();
        }

        public void readRowData(ResultSet rs) throws SQLException {
            long l;

            userTechId = rs.getLong("USER_TECH_ID");
            l = rs.getLong("TECHNOLOGY_TYPE_ID");
            if (rs.wasNull()) {
                technologyTypeId = null;
            } else {
                technologyTypeId = new Long(l);
            }
            l = rs.getLong("LOGIN_ID");
            if (rs.wasNull()) {
                loginId = null;
            } else {
                loginId = new Long(l);
            }
            rating = rs.getInt("RATING");
            months = rs.getInt("MONTHS");
        }

        public boolean matchesResultSet(ResultSet rs) throws SQLException {
            return equals(new DDEUserTechnologiesData(rs));
        }

        public boolean equals(Object o) {
            if (!(o instanceof DDEUserTechnologiesData)) {
                return false;
            }
            DDEUserTechnologiesData d = (DDEUserTechnologiesData) o;
            return (
                    (userTechId == d.userTechId)
                    && objectsMatch(technologyTypeId, d.technologyTypeId)
                    && objectsMatch(loginId, d.loginId)
                    && (rating == d.rating)
                    && (months == d.months));
        }


    }

}