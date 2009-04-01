/*
 * TestLocalDDEDocTypesHome.java
 *
 * A JUnit Test Case for LocalDDEDocTypesHome
 *
 * By John C. Bollinger
 *
 * Copyright (c) 2002
 */
package com.topcoder.dde.persistencelayer.test;

import com.topcoder.dde.persistencelayer.interfaces.LocalDDEDocTypesHome;
import com.topcoder.dde.persistencelayer.interfaces.LocalDDEDocTypes;

import java.sql.ResultSet;
import java.sql.SQLException;
import javax.ejb.CreateException;
import javax.ejb.ObjectNotFoundException;
import javax.ejb.SessionContext;

/**
 * a JUnit test case that exercises the DDEDocTypes EJB's local home
 * interface
 *
 * @author John C. Bollinger
 * @version 1.0
 */
public class TestLocalDDEDocTypesHome extends PersistenceTestCase {

    /* descriptions used for testing the create method */
    private static final long DEF_KEY = -17L;
    private static final String DEF_DESC = "Test Description";
    private static final long DEF_STATUS = 1L;
    private static final long INVALID_STATUS = -1L;

    /* an instance of the a local home implementation to test with */
    private LocalDDEDocTypesHome localHome;

    /**
     * a default constructor for use only by other test cases in this package
     */
    TestLocalDDEDocTypesHome() {
        this("testCreate");
    }

    /**
     * constructs an instance that will execute the specified test
     *
     * @param  testName a <code>String</code> containing the name of the test
     *         that should be run
     */
    public TestLocalDDEDocTypesHome(String testName) {
        this(testName, null);
    }

    /**
     * constructs a new TestLocalDDECategoriesHome configured to run the named
     * test in the specified session context
     */
    public TestLocalDDEDocTypesHome(String testName, SessionContext sc) {
        super(testName, "DOC_TYPES", sc);
        pkFieldName = "DOCUMENT_TYPE_ID";
    }

    /**
     * sets up the fixture for this test
     */
    public void setUp() throws Exception {
        super.setUp();
        synchronized (contextLock) {
            localHome = (LocalDDEDocTypesHome) ctx.lookup(
                    LocalDDEDocTypesHome.EJB_REF_NAME);
        }
        assertNotNull("Obtained null local home implementation", localHome);
    }

    /*
     * creates a LocalDDEDocTypes entity with default parameters
     */
    LocalDDEDocTypes createDefault() throws Exception {
        return localHome.create(DEF_KEY, DEF_DESC, DEF_STATUS);
    }

    /**
     * tests the basic operation of the create method
     */
    public void testCreate() throws Exception {
        synchronized (TestLocalDDEDocTypesHome.class) {
            LocalDDEDocTypes local = createDefault();
            assertNotNull(local);
            try {
                assertEquals(DEF_DESC, local.getDescription());
                assertEquals(DEF_STATUS, local.getStatusId());
                transactionBoundary();
                assertMatchesDB(new DDEDocTypesData(
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
            LocalDDEDocTypes local = localHome.create(DEF_KEY, null, DEF_STATUS);

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
        synchronized (TestLocalDDEDocTypesHome.class) {
            LocalDDEDocTypes local = localHome.create(DEF_KEY, "", DEF_STATUS);
            assertNotNull(local);
            try {
                assertEquals("", local.getDescription());
                transactionBoundary();
                assertMatchesDB(new DDEDocTypesData(
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
        synchronized (TestLocalDDEDocTypesHome.class) {
            try {
                LocalDDEDocTypes local
                        = localHome.create(DEF_KEY, DEF_DESC, INVALID_STATUS);
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
        DDEDocTypesData rowData =
                new DDEDocTypesData(nextId(), DEF_DESC, DEF_STATUS);

        synchronized (TestLocalDDEDocTypesHome.class) {
            ensureInDB(rowData);
            try {
                LocalDDEDocTypes local =
                        localHome.findByPrimaryKey(
                                (Long) rowData.getPrimaryKey());
                assertNotNull("findByPrimaryKey lookup failed", local);
                transactionBoundary();
                assertEquals(rowData, new DDEDocTypesData(
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
        DDEDocTypesData rowData =
                new DDEDocTypesData(nextId(), DEF_DESC, DEF_STATUS);
        synchronized (TestLocalDDEDocTypesHome.class) {
            deleteRow(rowData); // does nothing if the row doesn't exist
            try {
                LocalDDEDocTypes local =
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
    class DDEDocTypesData implements RowData {
        long documentTypeId;
        String description;
        long statusId;

        DDEDocTypesData(Object id, String desc, long status) {
            this(keyToLong(id), desc, status);
        }

        DDEDocTypesData(long id, String desc, long status) {
            documentTypeId = id;
            description = desc;
            statusId = status;
        }

        DDEDocTypesData(ResultSet rs) throws SQLException {
            readRowData(rs);
        }

        public Object getPrimaryKey() {
            return new Long(documentTypeId);
        }

        public void storeRowData(ResultSet rs) throws SQLException {
            updateResultSet(rs);
            rs.updateRow();
        }

        public void insertRowData(ResultSet rs) throws SQLException {
            rs.moveToInsertRow();
            rs.updateLong("DOCUMENT_TYPE_ID", documentTypeId);
            updateResultSet(rs);
            rs.insertRow();
        }

        private void updateResultSet(ResultSet rs) throws SQLException {
            rs.updateString("DESCRIPTION", description);
            rs.updateLong("STATUS_ID", statusId);
        }

        public void readRowData(ResultSet rs) throws SQLException {
            documentTypeId = rs.getLong("DOCUMENT_TYPE_ID");
            description = rs.getString("DESCRIPTION");
            statusId = rs.getLong("STATUS_ID");
        }

        public boolean matchesResultSet(ResultSet rs) throws SQLException {
            return equals(new DDEDocTypesData(rs));
        }

        public boolean equals(Object o) {
            if (o instanceof DDEDocTypesData) {
                DDEDocTypesData d = (DDEDocTypesData) o;
                return (documentTypeId == d.documentTypeId)
                        && objectsMatch(description, d.description)
                        && (statusId == d.statusId);
            }
            return false;
        }
    }

}