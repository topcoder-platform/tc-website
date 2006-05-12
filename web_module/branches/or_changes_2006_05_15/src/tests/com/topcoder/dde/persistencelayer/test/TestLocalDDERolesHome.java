/*
 * TestLocalDDERolesHome.java
 *
 * A JUnit Test Case for LocalDDERolesHome
 *
 * By John C. Bollinger
 *
 * Copyright (c) 2002
 */
package com.topcoder.dde.persistencelayer.test;

import com.topcoder.dde.persistencelayer.interfaces.LocalDDERolesHome;
import com.topcoder.dde.persistencelayer.interfaces.LocalDDERoles;

import java.sql.ResultSet;
import java.sql.SQLException;
import javax.ejb.CreateException;
import javax.ejb.ObjectNotFoundException;
import javax.ejb.SessionContext;

/**
 * a JUnit test case that exercises the DDERoles EJB's local home
 * interface
 *
 * @author John C. Bollinger
 * @version 1.0
 */
public class TestLocalDDERolesHome extends PersistenceTestCase {

    /* descriptions used for testing the create method */
    private static final String DEF_NAME = "Kibitzer";
    private static final String DEF_DESC =
            "A person involved only by providing semi-informed commentary";
    private static final long DEF_STATUS = 1L;
    private static final long INVALID_STATUS = -1L;

    /* an instance of the a local home implementation to test with */
    private LocalDDERolesHome localHome;

    /**
     * a default constructor for use only by other test cases in this package
     */
    TestLocalDDERolesHome() {
        this("testCreate");
    }

    /**
     * constructs an instance that will execute the specified test
     *
     * @param  testName a <code>String</code> containing the name of the test
     *         that should be run
     */
    public TestLocalDDERolesHome(String testName) {
        this(testName, null);
    }

    /**
     * constructs a new TestLocalDDECategoriesHome configured to run the named
     * test in the specified session context
     */
    public TestLocalDDERolesHome(String testName, SessionContext sc) {
        super(testName, "ROLES", sc);
        pkFieldName = "ROLE_ID";
    }

    /**
     * sets up the fixture for this test
     */
    public void setUp() throws Exception {
        super.setUp();
        synchronized (contextLock) {
            localHome = (LocalDDERolesHome) ctx.lookup(
                    LocalDDERolesHome.EJB_REF_NAME);
        }
        assertNotNull("Obtained null local home implementation", localHome);
    }

    /*
     * creates a LocalDDERoles entity with default parameters
     */
    LocalDDERoles createDefault() throws Exception {
        return localHome.create(DEF_NAME, DEF_DESC, DEF_STATUS);
    }

    /**
     * tests the basic operation of the create method
     */
    public void testCreate() throws Exception {
        synchronized (TestLocalDDERolesHome.class) {
            LocalDDERoles local = createDefault();
            assertNotNull(local);
            try {
                assertEquals(DEF_NAME, local.getName());
                assertEquals(DEF_DESC, local.getDescription());
                assertEquals(DEF_STATUS, local.getStatusId());
                transactionBoundary();
                assertMatchesDB(new DDERolesData(
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
            LocalDDERoles local
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
        synchronized (TestLocalDDERolesHome.class) {
            LocalDDERoles local
                    = localHome.create("", DEF_DESC, DEF_STATUS);
            assertNotNull(local);
            try {
                assertEquals("", local.getName());
                assertEquals(DEF_DESC, local.getDescription());
                transactionBoundary();
                assertMatchesDB(new DDERolesData(
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
            LocalDDERoles local
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
        synchronized (TestLocalDDERolesHome.class) {
            LocalDDERoles local
                    = localHome.create(DEF_NAME, "", DEF_STATUS);
            assertNotNull(local);
            try {
                assertEquals(DEF_NAME, local.getName());
                assertEquals("", local.getDescription());
                transactionBoundary();
                assertMatchesDB(new DDERolesData(
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
        synchronized (TestLocalDDERolesHome.class) {
            try {
                LocalDDERoles local
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
        DDERolesData rowData =
                new DDERolesData(nextId(), DEF_NAME, DEF_DESC, DEF_STATUS);

        synchronized (TestLocalDDERolesHome.class) {
            ensureInDB(rowData);
            try {
                LocalDDERoles local =
                        localHome.findByPrimaryKey(
                                (Long) rowData.getPrimaryKey());
                assertNotNull("findByPrimaryKey lookup failed", local);
                assertEquals(rowData, new DDERolesData(
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
        DDERolesData rowData =
                new DDERolesData(nextId(), DEF_NAME, DEF_DESC, DEF_STATUS);
        synchronized (TestLocalDDERolesHome.class) {
            deleteRow(rowData); // does nothing if the row doesn't exist
            try {
                LocalDDERoles local =
                        localHome.findByPrimaryKey(
                                (Long) rowData.getPrimaryKey());
                fail("Expected an ObjectNotFoundException");
            } catch (ObjectNotFoundException onfe) {
                /* the expected case */
            }
        }
    }

    /*
     * the findAllActive method cannot be reliably tested on a production system
     * (no way to predict the correct return value)
     */

    /**
     * a <code>RowData</code> implementation for the CONTACT_TYPE table
     */
    class DDERolesData implements RowData {
        long roleId;
        String roleName;
        String description;
        long statusId;

        DDERolesData(Object id, String name, String desc, long status) {
            this(keyToLong(id), name, desc, status);
        }

        DDERolesData(long id, String name, String desc, long status) {
            roleId = id;
            roleName = name;
            description = desc;
            statusId = status;
        }

        DDERolesData(ResultSet rs) throws SQLException {
            readRowData(rs);
        }

        public Object getPrimaryKey() {
            return new Long(roleId);
        }

        public void storeRowData(ResultSet rs) throws SQLException {
            updateResultSet(rs);
            rs.updateRow();
        }

        public void insertRowData(ResultSet rs) throws SQLException {
            rs.moveToInsertRow();
            rs.updateLong("ROLE_ID", roleId);
            updateResultSet(rs);
            rs.insertRow();
        }

        private void updateResultSet(ResultSet rs) throws SQLException {
            rs.updateString("ROLE_NAME", roleName);
            rs.updateString("DESCRIPTION", description);
            rs.updateLong("STATUS_ID", statusId);
        }

        public void readRowData(ResultSet rs) throws SQLException {
            roleId = rs.getLong("ROLE_ID");
            roleName = rs.getString("ROLE_NAME");
            description = rs.getString("DESCRIPTION");
            statusId = rs.getLong("STATUS_ID");
        }

        public boolean matchesResultSet(ResultSet rs) throws SQLException {
            return equals(new DDERolesData(rs));
        }

        public boolean equals(Object o) {
            if (o instanceof DDERolesData) {
                DDERolesData d = (DDERolesData) o;
                return (d.roleId == roleId)
                        && objectsMatch(roleName, d.roleName)
                        && objectsMatch(description, d.description)
                        && (statusId == d.statusId);
            }
            return false;
        }
    }

}