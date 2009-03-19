/*
 * TestLocalDDETechnologyTypesHome.java
 *
 * A JUnit Test Case for LocalDDETechnologyTypesHome
 *
 * By John C. Bollinger
 *
 * Copyright (c) 2002
 */
package com.topcoder.dde.persistencelayer.test;

import com.topcoder.dde.persistencelayer.interfaces.LocalDDETechnologyTypesHome;
import com.topcoder.dde.persistencelayer.interfaces.LocalDDETechnologyTypes;

import java.sql.ResultSet;
import java.sql.SQLException;
import javax.ejb.CreateException;
import javax.ejb.ObjectNotFoundException;
import javax.ejb.SessionContext;

/**
 * a JUnit test case that exercises the DDETechnologyTypes EJB's local home
 * interface
 *
 * @author John C. Bollinger
 * @version 1.0
 */
public class TestLocalDDETechnologyTypesHome extends PersistenceTestCase {

    /* descriptions used for testing the create method */
    private static final String DEF_NAME = "stone age";
    private static final String DEF_DESC =
            "using only wood, stone, and animal parts and worked by hand";
    private static final long DEF_STATUS = 1L;
    private static final long INVALID_STATUS = -1L;

    /* an instance of the a local home implementation to test with */
    private LocalDDETechnologyTypesHome localHome;

    /**
     * a default constructor for use only by other test cases in this package
     */
    TestLocalDDETechnologyTypesHome() {
        this("testCreate");
    }

    /**
     * constructs an instance that will execute the specified test
     *
     * @param  testName a <code>String</code> containing the name of the test
     *         that should be run
     */
    public TestLocalDDETechnologyTypesHome(String testName) {
        this(testName, null);
    }

    /**
     * constructs a new TestLocalDDECategoriesHome configured to run the named
     * test in the specified session context
     */
    public TestLocalDDETechnologyTypesHome(String testName, SessionContext sc) {
        super(testName, "TECHNOLOGY_TYPES", sc);
        pkFieldName = "TECHNOLOGY_TYPE_ID";
    }

    /**
     * sets up the fixture for this test
     */
    public void setUp() throws Exception {
        super.setUp();
        synchronized (contextLock) {
            localHome = (LocalDDETechnologyTypesHome) ctx.lookup(
                    LocalDDETechnologyTypesHome.EJB_REF_NAME);
        }
        assertNotNull("Obtained null local home implementation", localHome);
    }

    /*
     * creates a LocalDDETechnologyTypes entity with default parameters
     */
    LocalDDETechnologyTypes createDefault() throws Exception {
        return localHome.create(DEF_NAME, DEF_DESC, DEF_STATUS);
    }

    /**
     * tests the basic operation of the create method
     */
    public void testCreate() throws Exception {
        synchronized (TestLocalDDETechnologyTypesHome.class) {
            LocalDDETechnologyTypes local = createDefault();
            assertNotNull(local);
            try {
                assertEquals(DEF_NAME, local.getName());
                assertEquals(DEF_DESC, local.getDescription());
                assertEquals(DEF_STATUS, local.getStatusId());
                transactionBoundary();
                assertMatchesDB(new DDETechnologyTypesData(
                        local.getPrimaryKey(), DEF_NAME, DEF_DESC, DEF_STATUS));
            } finally {
                local.remove();
            }
        }
    }

    /**
     * tests the operation of the create method when invoked with a
     * <code>null</code> name argument
     */
    public void testCreateNullName() throws Exception {
        try {
            LocalDDETechnologyTypes local
                    = localHome.create(null, DEF_DESC, DEF_STATUS);

            /* a CreateException should have been thrown */
            local.remove();
            fail("Expected a CreateException");
        } catch (CreateException ce) {
            /* The expected behavior */
        }
    }

    /**
     * tests the operation of the create method when invoked with an empty
     * name argument
     */
    public void testCreateEmptyName() throws Exception {
        synchronized (TestLocalDDETechnologyTypesHome.class) {
            LocalDDETechnologyTypes local
                    = localHome.create("", DEF_DESC, DEF_STATUS);
            assertNotNull(local);
            try {
                assertEquals("", local.getName());
                assertEquals(DEF_DESC, local.getDescription());
                transactionBoundary();
                assertMatchesDB(new DDETechnologyTypesData(
                        local.getPrimaryKey(), "", DEF_DESC, DEF_STATUS));
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
            LocalDDETechnologyTypes local
                    = localHome.create(DEF_NAME, null, DEF_STATUS);

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
        synchronized (TestLocalDDETechnologyTypesHome.class) {
            LocalDDETechnologyTypes local
                    = localHome.create(DEF_NAME, "", DEF_STATUS);
            assertNotNull(local);
            try {
                assertEquals(DEF_NAME, local.getName());
                assertEquals("", local.getDescription());
                assertMatchesDB(new DDETechnologyTypesData(
                        local.getPrimaryKey(), DEF_NAME, "", DEF_STATUS));
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
        synchronized (TestLocalDDETechnologyTypesHome.class) {
            try {
                LocalDDETechnologyTypes local
                        = localHome.create(DEF_NAME, DEF_DESC, INVALID_STATUS);
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
        DDETechnologyTypesData rowData =
                new DDETechnologyTypesData(nextId(), DEF_NAME, DEF_DESC, DEF_STATUS);

        synchronized (TestLocalDDETechnologyTypesHome.class) {
            ensureInDB(rowData);
            try {
                LocalDDETechnologyTypes local =
                        localHome.findByPrimaryKey(
                                (Long) rowData.getPrimaryKey());
                assertNotNull("findByPrimaryKey lookup failed", local);
                assertEquals(rowData, new DDETechnologyTypesData(
                        local.getPrimaryKey(), local.getName(),
                        local.getDescription(), local.getStatusId()));
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
        DDETechnologyTypesData rowData =
                new DDETechnologyTypesData(nextId(), DEF_NAME, DEF_DESC, DEF_STATUS);
        synchronized (TestLocalDDETechnologyTypesHome.class) {
            deleteRow(rowData); // does nothing if the row doesn't exist
            try {
                LocalDDETechnologyTypes local =
                        localHome.findByPrimaryKey(
                                (Long) rowData.getPrimaryKey());
                fail("Expected an ObjectNotFoundException");
            } catch (ObjectNotFoundException onfe) {
                /* the expected case */
            }
        }
    }

    /**
     * tests that findAllActive functions correctly
     */
//    public void testFindAllActive() throws Exception {
//        fail("Test not yet implemented");
//    }

    /**
     * a <code>RowData</code> implementation for the CONTACT_TYPE table
     */
    class DDETechnologyTypesData implements RowData {
        long technologyTypeId;
        String technologyName;
        String description;
        long statusId;

        DDETechnologyTypesData(Object id, String name, String desc, long status) {
            this(keyToLong(id), name, desc, status);
        }

        DDETechnologyTypesData(long id, String name, String desc, long status) {
            technologyTypeId = id;
            technologyName = name;
            description = desc;
            statusId = status;
        }

        DDETechnologyTypesData(ResultSet rs) throws SQLException {
            readRowData(rs);
        }

        public Object getPrimaryKey() {
            return new Long(technologyTypeId);
        }

        public void storeRowData(ResultSet rs) throws SQLException {
            updateResultSet(rs);
            rs.updateRow();
        }

        public void insertRowData(ResultSet rs) throws SQLException {
            rs.moveToInsertRow();
            rs.updateLong("TECHNOLOGY_TYPE_ID", technologyTypeId);
            updateResultSet(rs);
            rs.insertRow();
        }

        private void updateResultSet(ResultSet rs) throws SQLException {
            rs.updateString("TECHNOLOGY_NAME", technologyName);
            rs.updateString("DESCRIPTION", description);
            rs.updateLong("STATUS_ID", statusId);
        }

        public void readRowData(ResultSet rs) throws SQLException {
            technologyTypeId = rs.getLong("TECHNOLOGY_TYPE_ID");
            technologyName = rs.getString("TECHNOLOGY_NAME");
            description = rs.getString("DESCRIPTION");
            statusId = rs.getLong("STATUS_ID");
        }

        public boolean matchesResultSet(ResultSet rs) throws SQLException {
            return equals(new DDETechnologyTypesData(rs));
        }

        public boolean equals(Object o) {
            if (o instanceof DDETechnologyTypesData) {
                DDETechnologyTypesData d = (DDETechnologyTypesData) o;
                return (d.technologyTypeId == technologyTypeId)
                        && objectsMatch(technologyName, d.technologyName)
                        && objectsMatch(description, d.description)
                        && (statusId == d.statusId);
            }
            return false;
        }
    }

}