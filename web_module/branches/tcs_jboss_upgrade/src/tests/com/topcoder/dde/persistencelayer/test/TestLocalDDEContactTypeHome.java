/*
 * TestLocalDDEContactTypeHome.java
 *
 * A JUnit Test Case for LocalDDEContactTypeHome
 *
 * By John C. Bollinger
 *
 * Copyright (c) 2002
 */
package com.topcoder.dde.persistencelayer.test;

import com.topcoder.dde.persistencelayer.interfaces.LocalDDEContactTypeHome;
import com.topcoder.dde.persistencelayer.interfaces.LocalDDEContactType;

import java.sql.ResultSet;
import java.sql.SQLException;
import javax.ejb.CreateException;
import javax.ejb.ObjectNotFoundException;
import javax.ejb.SessionContext;

/**
 * a JUnit test case that exercises the DDEContactType EJB's local home
 * interface
 *
 * @author John C. Bollinger
 * @version 1.0
 */
public class TestLocalDDEContactTypeHome extends PersistenceTestCase {

    /* descriptions used for testing the create method */
    private static final String DEF_DESC = "Test Description";
    private static final long DEF_STATUS = 1L;
    private static final long INVALID_STATUS = -1L;

    /* an instance of the a local home implementation to test with */
    private LocalDDEContactTypeHome localHome;

    /**
     * a default constructor for use only by other test cases in this package
     */
    TestLocalDDEContactTypeHome() {
        this("testCreate");
    }

    /**
     * constructs an instance that will execute the specified test
     *
     * @param  testName a <code>String</code> containing the name of the test
     *         that should be run
     */
    public TestLocalDDEContactTypeHome(String testName) {
        this(testName, null);
    }

    /**
     * constructs a new TestLocalDDECategoriesHome configured to run the named
     * test in the specified session context
     */
    public TestLocalDDEContactTypeHome(String testName, SessionContext sc) {
        super(testName, "CONTACT_TYPE", sc);
    }

    /**
     * sets up the fixture for this test
     */
    public void setUp() throws Exception {
        super.setUp();
        synchronized (contextLock) {
            localHome = (LocalDDEContactTypeHome) ctx.lookup(
                    LocalDDEContactTypeHome.EJB_REF_NAME);
        }
        assertNotNull("Obtained null local home implementation", localHome);
    }

    /*
     * creates a LocalDDEContactType entity with default parameters
     */
    LocalDDEContactType createDefault() throws Exception {
        return localHome.create(DEF_DESC, DEF_STATUS);
    }

    /**
     * tests the basic operation of the create method
     */
    public void testCreate() throws Exception {
        synchronized (TestLocalDDEContactTypeHome.class) {
            LocalDDEContactType local = createDefault();
            assertNotNull(local);
            try {
                assertEquals(DEF_DESC, local.getDescription());
                assertEquals(DEF_STATUS, local.getStatusId());
                transactionBoundary();
                assertMatchesDB(new DDEContactTypeData(
                        local.getPrimaryKey(), DEF_DESC, DEF_STATUS));
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
            LocalDDEContactType local = localHome.create(null, DEF_STATUS);

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
        synchronized (TestLocalDDEContactTypeHome.class) {
            LocalDDEContactType local = localHome.create("", DEF_STATUS);
            assertNotNull(local);
            try {
                assertEquals("", local.getDescription());
                transactionBoundary();
                assertMatchesDB(new DDEContactTypeData(
                        local.getPrimaryKey(), "", DEF_STATUS));
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
        synchronized (TestLocalDDEContactTypeHome.class) {
            try {
                LocalDDEContactType local
                        = localHome.create(DEF_DESC, INVALID_STATUS);
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
        DDEContactTypeData rowData =
                new DDEContactTypeData(nextId(), DEF_DESC, DEF_STATUS);

        synchronized (TestLocalDDEContactTypeHome.class) {
            ensureInDB(rowData);
            try {
                LocalDDEContactType local =
                        localHome.findByPrimaryKey(
                                (Long) rowData.getPrimaryKey());
                assertNotNull("findByPrimaryKey lookup failed", local);
                assertEquals(rowData, new DDEContactTypeData(
                        (Long) local.getPrimaryKey(), local.getDescription(),
                        local.getStatusId()));
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
        DDEContactTypeData rowData =
                new DDEContactTypeData(nextId(), DEF_DESC, DEF_STATUS);
        synchronized (TestLocalDDEContactTypeHome.class) {
            deleteRow(rowData); // does nothing if the row doesn't exist
            try {
                LocalDDEContactType local =
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
    class DDEContactTypeData implements RowData {
        long contactTypeId;
        String description;
        long statusId;

        DDEContactTypeData(Object id, String desc, long status) {
            this(keyToLong(id), desc, status);
        }

        DDEContactTypeData(long id, String desc, long status) {
            contactTypeId = id;
            description = desc;
            statusId = status;
        }

        DDEContactTypeData(ResultSet rs) throws SQLException {
            readRowData(rs);
        }

        public Object getPrimaryKey() {
            return new Long(contactTypeId);
        }

        public void storeRowData(ResultSet rs) throws SQLException {
            updateResultSet(rs);
            rs.updateRow();
        }

        public void insertRowData(ResultSet rs) throws SQLException {
            rs.moveToInsertRow();
            rs.updateLong("CONTACT_TYPE_ID", contactTypeId);
            updateResultSet(rs);
            rs.insertRow();
        }

        private void updateResultSet(ResultSet rs) throws SQLException {
            rs.updateString("DESCRIPTION", description);
            rs.updateLong("STATUS_ID", statusId);
        }

        public void readRowData(ResultSet rs) throws SQLException {
            contactTypeId = rs.getLong("CONTACT_TYPE_ID");
            description = rs.getString("DESCRIPTION");
            statusId = rs.getLong("STATUS_ID");
        }

        public boolean matchesResultSet(ResultSet rs) throws SQLException {
            return equals(new DDEContactTypeData(rs));
        }

        public boolean equals(Object o) {
            if (o instanceof DDEContactTypeData) {
                DDEContactTypeData d = (DDEContactTypeData) o;
                return (d.contactTypeId == contactTypeId)
                        && objectsMatch(description, d.description)
                        && (statusId == d.statusId);
            }
            return false;
        }
    }

}