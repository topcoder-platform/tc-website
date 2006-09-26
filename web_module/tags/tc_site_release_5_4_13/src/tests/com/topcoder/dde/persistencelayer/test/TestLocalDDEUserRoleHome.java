/*
 * TestLocalDDEUserRoleHome.java
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
 * contains tests for the local home interface of the DDEUserRole EJB
 *
 * @author John C. Bollinger
 *
 * @version 1.0
 */
public class TestLocalDDEUserRoleHome extends PersistenceTestCase {

    /* an instance of the localHome interface implementation to work with */
    private LocalDDEUserRoleHome localHome;

    /* default field values for entity instances */
    static final int DEF_RATING = 1000;

    /**
     * a default constructor for use only by other test cases in this package
     */
    TestLocalDDEUserRoleHome() {
        this("testCreate");
    }

    /**
     * constructs a new TestLocalDDEUserRoleHome configured to run the named
     * test
     */
    public TestLocalDDEUserRoleHome(String testName) {
        this(testName, null);
    }

    /**
     * constructs a new TestLocalDDECategoriesHome configured to run the named
     * test in the specified session context
     */
    public TestLocalDDEUserRoleHome(String testName, SessionContext sc) {
        super(testName, "USER_ROLE", sc);
    }

    /**
     * sets up the fixture for this test
     */
    public void setUp() throws Exception {
        super.setUp();
        synchronized (contextLock) {
            localHome = (LocalDDEUserRoleHome) ctx.lookup(
                    LocalDDEUserRoleHome.EJB_REF_NAME);
        }
    }

    /*
     * creates a LocalDDEUserRole entity with default parameters
     */
    LocalDDEUserRole createDefault(LocalDDEUserMaster master,
                                   LocalDDECompVersions version, LocalDDERoles roles) throws Exception {
        return localHome.create(DEF_RATING, master, version, roles);
    }

    /**
     * tests all entity creation functionality of the bean
     */
    public void testAllCreate() throws Exception {
        /*
         * This is messy because we need to obtain a LocalDDECompVersions object
         * and a LocalDDEUserMaster object in order to create a
         * LocalDDEUserRole.  Because the setup is so involved, there are
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
                        synchronized (TestLocalDDEUserMasterHome.class) {
                            LocalDDEUserMaster localMaster;
                            TestLocalDDEUserMasterHome masterHome
                                    = new TestLocalDDEUserMasterHome();
                            masterHome.setUp();
                            localMaster = masterHome.createDefault();
                            assertNotNull(localMaster);
                            try {
                                synchronized (TestLocalDDERolesHome.class) {
                                    LocalDDERoles localRoles;
                                    TestLocalDDERolesHome rolesHome
                                            = new TestLocalDDERolesHome();
                                    rolesHome.setUp();
                                    localRoles = rolesHome.createDefault();
                                    assertNotNull(localRoles);
                                    try {
                                        synchronized (TestLocalDDEUserRoleHome.class) {
                                            /* test normal creation */
                                            LocalDDEUserRole local =
                                                    createDefault(localMaster,
                                                            localVersion,
                                                            localRoles);
                                            assertNotNull(local);
                                            try {
                                                assertEquals(DEF_RATING,
                                                        local.getTcsRating());
                                                assertTrue(localVersion.isIdentical(
                                                        local.getCompVersions()));
                                                assertTrue(localMaster.isIdentical(
                                                        local.getUserMaster()));
                                                assertTrue(localRoles.isIdentical(
                                                        local.getRoles()));
                                            } finally {
                                                local.remove();
                                            }
                                        }
                                    } finally {
                                        localRoles.remove();
                                        rolesHome.tearDown();
                                    }
                                }
                            } finally {
                                localMaster.remove();
                                masterHome.tearDown();
                            }
                        }
                    } finally {
                        localVersion.remove();
                        versionsHome.tearDown();
                    }
                }
            } finally {
                localComponent.remove();
                compHome.tearDown();
            }
        }
    }

    public void testFindByPrimaryKey() {
        fail("Test not yet implemented");
    }

//    public void testFindByCompVersId() {
//        fail("Test not yet implemented");
//    }

//    public void testFindByLoginId() {
//        fail("Test not yet implemented");
//    }

//    public void testFindByRoleId() {
//        fail("Test not yet implemented");
//    }

    class DDEUserRoleData implements RowData {
        long userRoleId;
        Long compVersId;
        Long roleId;
        Long loginId;
        int tcsRating;

        DDEUserRoleData(Object id, Long version, Long role, Long login, int rate) {
            this(keyToLong(id), version, role, login, rate);
        }

        DDEUserRoleData(long id, Long version, Long role, Long login, int rate) {
            userRoleId = id;
            compVersId = version;
            roleId = role;
            loginId = login;
            tcsRating = rate;
        }

        DDEUserRoleData(ResultSet rs) throws SQLException {
            readRowData(rs);
        }

        public Object getPrimaryKey() {
            return new Long(userRoleId);
        }

        private void updateResultSet(ResultSet rs) throws SQLException {
            if (compVersId == null) {
                rs.updateNull("COMP_VERS_ID");
            } else {
                rs.updateLong("COMP_VERS_ID", compVersId.longValue());
            }
            if (roleId == null) {
                rs.updateNull("ROLE_ID");
            } else {
                rs.updateLong("ROLE_ID", roleId.longValue());
            }
            if (loginId == null) {
                rs.updateNull("LOGIN_ID");
            } else {
                rs.updateLong("LOGIN_ID", loginId.longValue());
            }
            rs.updateInt("TCS_RATING", tcsRating);
        }

        public void storeRowData(ResultSet rs) throws SQLException {
            updateResultSet(rs);
            rs.updateRow();
        }

        public void insertRowData(ResultSet rs) throws SQLException {
            rs.moveToInsertRow();
            rs.updateLong("USER_ROLE_ID", userRoleId);
            updateResultSet(rs);
            rs.insertRow();
        }

        public void readRowData(ResultSet rs) throws SQLException {
            long l;

            userRoleId = rs.getLong("USER_ROLE_ID");
            l = rs.getLong("COMP_VERS_ID");
            if (rs.wasNull()) {
                compVersId = null;
            } else {
                compVersId = new Long(l);
            }
            l = rs.getLong("ROLE_ID");
            if (rs.wasNull()) {
                roleId = null;
            } else {
                roleId = new Long(l);
            }
            l = rs.getLong("LOGIN_ID");
            if (rs.wasNull()) {
                loginId = null;
            } else {
                loginId = new Long(l);
            }
            tcsRating = rs.getInt("TCS_RATING");
        }

        public boolean matchesResultSet(ResultSet rs) throws SQLException {
            return equals(new DDEUserRoleData(rs));
        }

        public boolean equals(Object o) {
            if (!(o instanceof DDEUserRoleData)) {
                return false;
            }
            DDEUserRoleData d = (DDEUserRoleData) o;
            return (
                    (userRoleId == d.userRoleId)
                    && objectsMatch(compVersId, d.compVersId)
                    && objectsMatch(roleId, d.roleId)
                    && objectsMatch(loginId, d.loginId)
                    && (tcsRating == d.tcsRating));
        }

    }

}