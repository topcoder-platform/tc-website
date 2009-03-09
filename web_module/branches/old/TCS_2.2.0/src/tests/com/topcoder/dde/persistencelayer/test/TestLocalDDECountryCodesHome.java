/*
 * TestLocalDDECountryCodesHome.java
 *
 * A JUnit Test Case for LocalDDECountryCodesHome
 *
 * By John C. Bollinger
 *
 * Copyright (c) 2002
 */
package com.topcoder.dde.persistencelayer.test;

import com.topcoder.dde.persistencelayer.interfaces.LocalDDECountryCodesHome;
import com.topcoder.dde.persistencelayer.interfaces.LocalDDECountryCodes;

import java.sql.ResultSet;
import java.sql.SQLException;
import javax.ejb.CreateException;
import javax.ejb.ObjectNotFoundException;
import javax.ejb.SessionContext;

/**
 * a JUnit test case that exercises the DDECountryCodes EJB's local home
 * interface
 *
 * @author John C. Bollinger
 * @version 1.0
 */
public class TestLocalDDECountryCodesHome extends PersistenceTestCase {

    /* descriptions used for testing the create method */
    private static final String DEF_DESC =
            "A very interesting, but ephemeral, virtual country";

    /* an instance of the a local home implementation to test with */
    private LocalDDECountryCodesHome localHome;

    /**
     * a default constructor for use only by other test cases in this package
     */
    TestLocalDDECountryCodesHome() {
        this("testCreate");
    }

    /**
     * constructs an instance that will execute the specified test
     *
     * @param  testName a <code>String</code> containing the name of the test
     *         that should be run
     */
    public TestLocalDDECountryCodesHome(String testName) {
        this(testName, null);
    }

    /**
     * constructs a new TestLocalDDECategoriesHome configured to run the named
     * test in the specified session context
     */
    public TestLocalDDECountryCodesHome(String testName, SessionContext sc) {
        super(testName, "COUNTRY_CODES", sc);
        pkFieldName = "COUNTRY_CODE";
    }

    /**
     * sets up the fixture for this test
     */
    public void setUp() throws Exception {
        super.setUp();
        synchronized (contextLock) {
            localHome = (LocalDDECountryCodesHome) ctx.lookup(
                    LocalDDECountryCodesHome.EJB_REF_NAME);
        }
        assertNotNull("Obtained null local home implementation", localHome);
    }

    /*
     * creates a LocalDDECountryCodes entity with default parameters
     */
    LocalDDECountryCodes createDefault() throws Exception {
        return localHome.create(DEF_DESC);
    }

    /**
     * tests the basic operation of the create method
     */
    public void testCreate() throws Exception {
        synchronized (TestLocalDDECountryCodesHome.class) {
            LocalDDECountryCodes local = createDefault();
            assertNotNull(local);
            try {
                assertEquals(DEF_DESC, local.getDescription());
                transactionBoundary();
                assertMatchesDB(new DDECountryCodesData(
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
            LocalDDECountryCodes local = localHome.create(null);

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
        synchronized (TestLocalDDECountryCodesHome.class) {
            LocalDDECountryCodes local = localHome.create("");
            assertNotNull(local);
            try {
                assertEquals("", local.getDescription());
                transactionBoundary();
                assertMatchesDB(new DDECountryCodesData(
                        local.getPrimaryKey(), ""));
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
        DDECountryCodesData rowData =
                new DDECountryCodesData(nextId(), DEF_DESC);

        synchronized (TestLocalDDECountryCodesHome.class) {
            ensureInDB(rowData);
            try {
                LocalDDECountryCodes local =
                        localHome.findByPrimaryKey(
                                (Long) rowData.getPrimaryKey());
                assertNotNull("findByPrimaryKey lookup failed", local);
                assertEquals(rowData, new DDECountryCodesData(
                        (Long) local.getPrimaryKey(), local.getDescription()));
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
        DDECountryCodesData rowData =
                new DDECountryCodesData(nextId(), DEF_DESC);
        synchronized (TestLocalDDECountryCodesHome.class) {
            deleteRow(rowData); // does nothing if the row doesn't exist
            try {
                LocalDDECountryCodes local =
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
    class DDECountryCodesData implements RowData {
        long countryCode;
        String description;

        DDECountryCodesData(Object id, String desc) {
            this(keyToLong(id), desc);
        }

        DDECountryCodesData(long id, String desc) {
            countryCode = id;
            description = desc;
        }

        DDECountryCodesData(ResultSet rs) throws SQLException {
            readRowData(rs);
        }

        public Object getPrimaryKey() {
            return new Long(countryCode);
        }

        public void storeRowData(ResultSet rs) throws SQLException {
            updateResultSet(rs);
            rs.updateRow();
        }

        public void insertRowData(ResultSet rs) throws SQLException {
            rs.moveToInsertRow();
            rs.updateLong("COUNTRY_CODE", countryCode);
            updateResultSet(rs);
            rs.insertRow();
        }

        private void updateResultSet(ResultSet rs) throws SQLException {
            rs.updateString("DESCRIPTION", description);
        }

        public void readRowData(ResultSet rs) throws SQLException {
            countryCode = rs.getLong("COUNTRY_CODE");
            description = rs.getString("DESCRIPTION");
        }

        public boolean matchesResultSet(ResultSet rs) throws SQLException {
            return equals(new DDECountryCodesData(rs));
        }

        public boolean equals(Object o) {
            if (o instanceof DDECountryCodesData) {
                DDECountryCodesData d = (DDECountryCodesData) o;
                return (d.countryCode == countryCode)
                        && objectsMatch(description, d.description);
            }
            return false;
        }
    }

}