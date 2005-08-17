/*
 * TestLocalDDEUserMemberHome.java
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
 * contains tests for the local home interface of the DDEUserMember EJB
 *
 * @author John C. Bollinger
 *
 * @version 1.0
 */
public class TestLocalDDEUserMemberHome extends PersistenceTestCase {

    /* an instance of the localHome interface implementation to work with */
    private LocalDDEUserMemberHome localHome;

    /* default field values for entity instances */
    private static final int DEF_TC_RATING = 3000;
    private static final int DEF_TCS_RATING = 2000;

    /**
     * a default constructor for use only by other test cases in this package
     */
    TestLocalDDEUserMemberHome() {
        this("testCreate");
    }

    /**
     * constructs a new TestLocalDDEUserMemberHome configured to run the named
     * test
     */
    public TestLocalDDEUserMemberHome(String testName) {
        this(testName, null);
    }

    /**
     * constructs a new TestLocalDDECategoriesHome configured to run the named
     * test in the specified session context
     */
    public TestLocalDDEUserMemberHome(String testName, SessionContext sc) {
        super(testName, "USER_MEMBER", sc);
    }

    /**
     * sets up the fixture for this test
     */
    public void setUp() throws Exception {
        super.setUp();
        synchronized (contextLock) {
            localHome = (LocalDDEUserMemberHome) ctx.lookup(
                    LocalDDEUserMemberHome.EJB_REF_NAME);
        }
    }

    /*
     * creates a LocalDDEUserMember entity with default parameters
     */
    LocalDDEUserMember createDefault(LocalDDEUserMaster master)
            throws Exception {
        return localHome.create(DEF_TC_RATING, DEF_TCS_RATING, master);
    }

    /**
     * tests all entity creation functionality of the bean
     */
    public void testAllCreate() throws Exception {
        synchronized (TestLocalDDEUserMasterHome.class) {
            LocalDDEUserMaster localMaster;
            TestLocalDDEUserMasterHome masterHome =
                    new TestLocalDDEUserMasterHome();

            masterHome.setUp();
            localMaster = masterHome.createDefault();
            assertNotNull(localMaster);
            try {
                synchronized (TestLocalDDEUserMemberHome.class) {
                    /* test normal creation */
                    LocalDDEUserMember local = createDefault(localMaster);
                    assertNotNull(local);
                    try {
                        assertEquals(DEF_TC_RATING, local.getTcRating());
                        assertEquals(DEF_TCS_RATING, local.getTcsRating());
                        assertTrue(localMaster.isIdentical(
                                local.getUserMaster()));
                    } finally {
                        local.remove();
                    }

                    /* test creation with null component */
                    local = createDefault(null);
                    assertNotNull(local);
                    local.remove();
                }
            } finally {
                localMaster.remove();
            }
            masterHome.tearDown();
        }
    }

    public void testFindByPrimaryKey() {
        fail("Test not yet implemented");
    }

    class DDEUserMemberData implements RowData {
        long userMemberId;
        Long loginId;
        int tcRating;
        int tcsRating;

        DDEUserMemberData(Object id, Long login, int tc, int tcs) {
            this(keyToLong(id), login, tc, tcs);
        }

        DDEUserMemberData(long id, Long login, int tc, int tcs) {
            userMemberId = id;
            loginId = login;
            tcRating = tc;
            tcsRating = tcs;
        }

        DDEUserMemberData(ResultSet rs) throws SQLException {
            readRowData(rs);
        }

        public Object getPrimaryKey() {
            return new Long(userMemberId);
        }

        private void updateResultSet(ResultSet rs) throws SQLException {
            if (loginId == null) {
                rs.updateNull("LOGIN_ID");
            } else {
                rs.updateLong("LOGIN_ID", loginId.longValue());
            }
            rs.updateInt("TC_RATING", tcRating);
            rs.updateInt("TCS_RATING", tcsRating);
        }

        public void storeRowData(ResultSet rs) throws SQLException {
            updateResultSet(rs);
            rs.updateRow();
        }

        public void insertRowData(ResultSet rs) throws SQLException {
            rs.moveToInsertRow();
            rs.updateLong("USER_MEMBER_ID", userMemberId);
            updateResultSet(rs);
            rs.insertRow();
        }

        public void readRowData(ResultSet rs) throws SQLException {
            long l;

            userMemberId = rs.getLong("USER_MEMBER_ID");
            l = rs.getLong("LOGIN_ID");
            if (rs.wasNull()) {
                loginId = null;
            } else {
                loginId = new Long(l);
            }
            tcRating = rs.getInt("TC_RATING");
            tcsRating = rs.getInt("TCS_RATING");
        }

        public boolean matchesResultSet(ResultSet rs) throws SQLException {
            return equals(new DDEUserMemberData(rs));
        }

        public boolean equals(Object o) {
            if (!(o instanceof DDEUserMemberData)) {
                return false;
            }
            DDEUserMemberData d = (DDEUserMemberData) o;
            return (
                    (userMemberId == d.userMemberId)
                    && objectsMatch(loginId, d.loginId)
                    && (tcRating == d.tcRating)
                    && (tcsRating == d.tcsRating));
        }

    }

}