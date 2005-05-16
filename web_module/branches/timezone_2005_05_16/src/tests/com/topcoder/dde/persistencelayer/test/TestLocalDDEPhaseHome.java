/*
 * TestLocalDDEPhaseHome.java
 *
 * A JUnit Test Case for LocalDDEPhaseHome
 *
 * By John C. Bollinger
 *
 * Copyright (c) 2002
 */
package com.topcoder.dde.persistencelayer.test;

import com.topcoder.dde.persistencelayer.interfaces.LocalDDEPhaseHome;
import com.topcoder.dde.persistencelayer.interfaces.LocalDDEPhase;

import java.sql.ResultSet;
import java.sql.SQLException;
import javax.ejb.CreateException;
import javax.ejb.ObjectNotFoundException;
import javax.ejb.SessionContext;

/**
 * a JUnit test case that exercises the DDEPhase EJB's local home
 * interface
 *
 * @author John C. Bollinger
 * @version 1.0
 */
public class TestLocalDDEPhaseHome extends PersistenceTestCase {

    /* descriptions used for testing the create method */
    private static final long DEF_KEY = -17L;
    private static final String DEF_DESC = "Gibbous waxing";

    /* an instance of the a local home implementation to test with */
    private LocalDDEPhaseHome localHome;

    /**
     * a default constructor for use only by other test cases in this package
     */
    TestLocalDDEPhaseHome() {
        this("testCreate");
    }

    /**
     * constructs an instance that will execute the specified test
     *
     * @param  testName a <code>String</code> containing the name of the test
     *         that should be run
     */
    public TestLocalDDEPhaseHome(String testName) {
        this(testName, null);
    }

    /**
     * constructs a new TestLocalDDECategoriesHome configured to run the named
     * test in the specified session context
     */
    public TestLocalDDEPhaseHome(String testName, SessionContext sc) {
        super(testName, "PHASE", sc);
    }

    /**
     * sets up the fixture for this test
     */
    public void setUp() throws Exception {
        super.setUp();
        synchronized (contextLock) {
            localHome = (LocalDDEPhaseHome) ctx.lookup(
                    LocalDDEPhaseHome.EJB_REF_NAME);
        }
        assertNotNull("Obtained null local home implementation", localHome);
    }

    /*
     * creates a LocalDDEPhase entity with default parameters
     */
    LocalDDEPhase createDefault() throws Exception {
        return localHome.create(DEF_KEY, DEF_DESC);
    }

    /**
     * tests the basic operation of the create method
     */
    public void testCreate() throws Exception {
        synchronized (TestLocalDDEPhaseHome.class) {
            LocalDDEPhase local = createDefault();
            assertNotNull(local);
            try {
                assertEquals(DEF_KEY, keyToLong(local.getPrimaryKey()));
                assertEquals(DEF_DESC, local.getDescription());
                transactionBoundary();
                assertMatchesDB(new DDEPhaseData(
                        local.getPrimaryKey(), DEF_DESC));
            } finally {
                local.remove();
            }
        }
    }

    /**
     * tests the operation of the create method when invoked with a
     * <code>null</code> description argument
     */
    public void testCreateNullDescription() throws Exception {
        try {
            LocalDDEPhase local = localHome.create(DEF_KEY, null);

            /* a CreateException should have been thrown */
            local.remove();
            fail("Expected a CreateException");
        } catch (CreateException ce) {
            /* The expected behavior */
        }
    }

    /**
     * tests the operation of the create method when invoked with an empty
     * description argument
     */
    public void testCreateEmptyDescription() throws Exception {
        synchronized (TestLocalDDEPhaseHome.class) {
            LocalDDEPhase local = localHome.create(DEF_KEY, "");
            assertNotNull(local);
            try {
                assertEquals("", local.getDescription());
                transactionBoundary();
                assertMatchesDB(new DDEPhaseData(local.getPrimaryKey(), ""));
            } finally {
                local.remove();
            }
        }
    }

    /**
     * tests that findByPrimaryKey correctly returns an object known to be in
     * the database
     */
    public void testFindByPrimaryKeyNormal() throws Exception {
        DDEPhaseData rowData =
                new DDEPhaseData(nextId(), DEF_DESC);

        synchronized (TestLocalDDEPhaseHome.class) {
            ensureInDB(rowData);
            try {
                LocalDDEPhase local =
                        localHome.findByPrimaryKey(
                                (Long) rowData.getPrimaryKey());
                assertNotNull("findByPrimaryKey lookup failed", local);
                assertEquals(rowData, new DDEPhaseData(
                        local.getPrimaryKey(), local.getDescription()));
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
        DDEPhaseData rowData = new DDEPhaseData(nextId(), DEF_DESC);
        synchronized (TestLocalDDEPhaseHome.class) {
            deleteRow(rowData); // does nothing if the row doesn't exist
            try {
                LocalDDEPhase local =
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
    class DDEPhaseData implements RowData {
        long phaseId;
        String description;

        DDEPhaseData(Object id, String desc) {
            this(keyToLong(id), desc);
        }

        DDEPhaseData(long id, String desc) {
            phaseId = id;
            description = desc;
        }

        DDEPhaseData(ResultSet rs) throws SQLException {
            readRowData(rs);
        }

        public Object getPrimaryKey() {
            return new Long(phaseId);
        }

        public void storeRowData(ResultSet rs) throws SQLException {
            updateResultSet(rs);
            rs.updateRow();
        }

        public void insertRowData(ResultSet rs) throws SQLException {
            rs.moveToInsertRow();
            rs.updateLong("PHASE_ID", phaseId);
            updateResultSet(rs);
            rs.insertRow();
        }

        private void updateResultSet(ResultSet rs) throws SQLException {
            rs.updateString("DESCRIPTION", description);
        }

        public void readRowData(ResultSet rs) throws SQLException {
            phaseId = rs.getLong("PHASE_ID");
            description = rs.getString("DESCRIPTION");
        }

        public boolean matchesResultSet(ResultSet rs) throws SQLException {
            return equals(new DDEPhaseData(rs));
        }

        public boolean equals(Object o) {
            if (o instanceof DDEPhaseData) {
                DDEPhaseData d = (DDEPhaseData) o;
                return (phaseId == d.phaseId)
                        && objectsMatch(description, d.description);
            }
            return false;
        }
    }

}