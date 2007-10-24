/*
 * TestLocalDDEUserMasterHome.java
 *
 * A JUnit Test Case for LocalDDEUserMasterHome
 *
 * By John C. Bollinger
 *
 * Copyright (c) 2002
 */
package com.topcoder.dde.persistencelayer.test;

import com.topcoder.dde.persistencelayer.interfaces.LocalDDEUserMasterHome;
import com.topcoder.dde.persistencelayer.interfaces.LocalDDEUserMaster;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import javax.ejb.CreateException;
import javax.ejb.ObjectNotFoundException;
import javax.ejb.SessionContext;

/**
 * a JUnit test case that exercises the DDEUserMaster EJB's local home
 * interface
 *
 * @author John C. Bollinger
 * @version 1.0
 */
public class TestLocalDDEUserMasterHome extends PersistenceTestCase {

    /* descriptions used for testing the create method */
    private static final long DEF_LOGIN_ID = -17L;
    private static final Timestamp DEF_LAST_LOGIN
            = new Timestamp(System.currentTimeMillis());
    private static final int DEF_NUM_LOGINS = 21;
    private static final long DEF_STATUS = 1L;
    private static final long INVALID_STATUS = -1L;

    /* an instance of the a local home implementation to test with */
    private LocalDDEUserMasterHome localHome;

    /**
     * a default constructor for use only by other test cases in this package
     */
    TestLocalDDEUserMasterHome() {
        this("testCreate");
    }

    /**
     * constructs an instance that will execute the specified test
     *
     * @param  testName a <code>String</code> containing the name of the test
     *         that should be run
     */
    public TestLocalDDEUserMasterHome(String testName) {
        this(testName, null);
    }

    /**
     * constructs a new TestLocalDDECategoriesHome configured to run the named
     * test in the specified session context
     */
    public TestLocalDDEUserMasterHome(String testName, SessionContext sc) {
        super(testName, "USER_MASTER", sc);
        pkFieldName = "LOGIN_ID";
    }

    /**
     * sets up the fixture for this test
     */
    public void setUp() throws Exception {
        super.setUp();
        synchronized (contextLock) {
            localHome = (LocalDDEUserMasterHome) ctx.lookup(
                    LocalDDEUserMasterHome.EJB_REF_NAME);
        }
        assertNotNull("Obtained null local home implementation", localHome);
    }

    /*
     * creates a LocalDDEUserMaster entity with default parameters
     */
    LocalDDEUserMaster createDefault() throws Exception {
        return localHome.create(DEF_LOGIN_ID, DEF_LAST_LOGIN, DEF_NUM_LOGINS,
                DEF_STATUS);
    }

    /**
     * tests the basic operation of the create method
     */
    public void testCreate() throws Exception {
        synchronized (TestLocalDDEUserMasterHome.class) {
            LocalDDEUserMaster local = createDefault();
            assertNotNull(local);
            try {
                assertEquals(DEF_LOGIN_ID, keyToLong(local.getPrimaryKey()));
                assertEquals(DEF_LAST_LOGIN, local.getLastLoginTime());
                assertEquals(DEF_NUM_LOGINS, local.getNumLogins());
                assertEquals(DEF_STATUS, local.getStatusId());
                transactionBoundary();
                assertMatchesDB(new DDEUserMasterData(
                        DEF_LOGIN_ID, DEF_LAST_LOGIN, DEF_NUM_LOGINS, DEF_STATUS));
            } finally {
                local.remove();
            }
        }
    }

    /**
     * tests the operation of the create method when invoked with an invalid
     * status argument
     */
    public void testCreateInvalidStatus() throws Exception {
        synchronized (TestLocalDDEUserMasterHome.class) {
            try {
                LocalDDEUserMaster local
                        = localHome.create(nextId(), DEF_LAST_LOGIN,
                                DEF_NUM_LOGINS, INVALID_STATUS);
                local.remove();
                fail("Expected a CreateException");
            } catch (CreateException ce) {
                /* The expected behavior */
            }
        }
    }

    /**
     * tests that findByPrimaryKey correctly returns an object known to be in
     * the database
     */
    public void testFindByPrimaryKeyNormal() throws Exception {
        DDEUserMasterData rowData =
                new DDEUserMasterData(nextId(), DEF_LAST_LOGIN, DEF_NUM_LOGINS,
                        DEF_STATUS);

        synchronized (TestLocalDDEUserMasterHome.class) {
            ensureInDB(rowData);
            try {
                LocalDDEUserMaster local =
                        localHome.findByPrimaryKey(
                                (Long) rowData.getPrimaryKey());
                assertNotNull("findByPrimaryKey lookup failed", local);
                assertEquals(rowData, new DDEUserMasterData(
                        local.getPrimaryKey(), local.getLastLoginTime(),
                        local.getNumLogins(), local.getStatusId()));
            } finally {
                deleteRow(rowData);
            }
        }
    }

    /**
     * tests that findByPrimaryKey throws the correct exception if the requested
     * object is not in the database
     */
    public void testFindByPrimaryKeyMissing() throws Exception {
        DDEUserMasterData rowData =
                new DDEUserMasterData(nextId(), DEF_LAST_LOGIN, DEF_NUM_LOGINS,
                        DEF_STATUS);

        synchronized (TestLocalDDEUserMasterHome.class) {
            deleteRow(rowData); // does nothing if the row doesn't exist
            try {
                LocalDDEUserMaster local =
                        localHome.findByPrimaryKey(
                                (Long) rowData.getPrimaryKey());
                fail("Expected an ObjectNotFoundException");
            } catch (ObjectNotFoundException onfe) {
                /* the expected case */
            }
        }
    }

    /**
     * a <code>RowData</code> implementation for the CONTACT_TYPE table
     */
    class DDEUserMasterData implements RowData {
        long loginId;
        Timestamp lastLoginTime;
        int numLogins;
        long statusId;

        DDEUserMasterData(Object id, Timestamp last, int num, long status) {
            this(keyToLong(id), last, num, status);
        }

        DDEUserMasterData(long id, Timestamp last, int num, long status) {
            loginId = id;
            lastLoginTime = (Timestamp) last.clone();
            numLogins = num;
            statusId = status;
        }

        DDEUserMasterData(ResultSet rs) throws SQLException {
            readRowData(rs);
        }

        public Object getPrimaryKey() {
            return new Long(loginId);
        }

        public void storeRowData(ResultSet rs) throws SQLException {
            updateResultSet(rs);
            rs.updateRow();
        }

        public void insertRowData(ResultSet rs) throws SQLException {
            rs.moveToInsertRow();
            rs.updateLong("LOGIN_ID", loginId);
            updateResultSet(rs);
            rs.insertRow();
        }

        private void updateResultSet(ResultSet rs) throws SQLException {
            rs.updateTimestamp("LAST_LOGIN_TIME", lastLoginTime);
            rs.updateInt("NUM_LOGINS", numLogins);
            rs.updateLong("STATUS_ID", statusId);
        }

        public void readRowData(ResultSet rs) throws SQLException {
            loginId = rs.getLong("LOGIN_ID");
            lastLoginTime = rs.getTimestamp("LAST_LOGIN_TIME");
            numLogins = rs.getInt("NUM_LOGINS");
            statusId = rs.getLong("STATUS_ID");
        }

        public boolean matchesResultSet(ResultSet rs) throws SQLException {
            return equals(new DDEUserMasterData(rs));
        }

        public boolean equals(Object o) {
            if (o instanceof DDEUserMasterData) {
                DDEUserMasterData d = (DDEUserMasterData) o;
                return (loginId == d.loginId)
                        && objectsMatch(lastLoginTime, d.lastLoginTime)
                        && (numLogins == d.numLogins)
                        && (statusId == d.statusId);
            }
            return false;
        }
    }

}