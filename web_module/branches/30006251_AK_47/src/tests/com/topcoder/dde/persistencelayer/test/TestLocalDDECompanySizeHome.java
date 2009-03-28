/*
 * TestLocalDDECompanySizeHome.java
 *
 * A JUnit Test Case for LocalDDECompanySizeHome
 *
 * By John C. Bollinger
 *
 * Copyright (c) 2002
 */
package com.topcoder.dde.persistencelayer.test;

import com.topcoder.dde.persistencelayer.interfaces.LocalDDECompanySizeHome;
import com.topcoder.dde.persistencelayer.interfaces.LocalDDECompanySize;

import java.sql.ResultSet;
import java.sql.SQLException;
import javax.ejb.CreateException;
import javax.ejb.ObjectNotFoundException;
import javax.ejb.SessionContext;

/**
 * a JUnit test case that exercises the DDECompanySize EJB's local home
 * interface
 *
 * @author John C. Bollinger
 * @version 1.0
 */
public class TestLocalDDECompanySizeHome extends PersistenceTestCase {

    /* descriptions used for testing the create method */
    private static final String DEFAULT_DESC = "Test Description";
    private static final String LONG_DESC = "30-character test description ";
    private static final String[] STRANGE_DESC = {
        "/* not a comment */", "'not quoted'", "embedded'quote",
        "% SQL metachar", "WHERE 1=0", "; not a terminator",
        "embedded \0 null", "trailing backslash \\"};

    /* the size of the description field */
    private static final int DESC_WIDTH = 25;

    /* an instance of the a local home implementation to test with */
    private LocalDDECompanySizeHome localHome;

    /**
     * a default constructor for use only by other test cases in this package
     */
    TestLocalDDECompanySizeHome() {
        this("testCreate");
    }

    /**
     * constructs an instance that will execute the specified test
     *
     * @param  testName a <code>String</code> containing the name of the test
     *         that should be run
     */
    public TestLocalDDECompanySizeHome(String testName) {
        this(testName, null);
    }

    /**
     * constructs a new TestLocalDDECategoriesHome configured to run the named
     * test in the specified session context
     */
    public TestLocalDDECompanySizeHome(String testName, SessionContext sc) {
        super(testName, "COMPANY_SIZE", sc);
    }

    /**
     * sets up the fixture for this test
     */
    public void setUp() throws Exception {
        super.setUp();
        synchronized (contextLock) {
            localHome = (LocalDDECompanySizeHome) ctx.lookup(
                    LocalDDECompanySizeHome.EJB_REF_NAME);
        }
        assertNotNull("Obtained null local home implementation", localHome);
    }

    /*
     * creates a LocalDDECompanySize entity with default parameters
     */
    LocalDDECompanySize createDefault() throws Exception {
        return localHome.create(DEFAULT_DESC);
    }

    /**
     * tests the basic operation of the create method
     */
    public void testCreate() throws Exception {
        synchronized (TestLocalDDECompanySizeHome.class) {
            LocalDDECompanySize local = createDefault();
            assertNotNull(local);
            try {
                assertEquals(DEFAULT_DESC, local.getDescription());
                transactionBoundary();
                assertMatchesDB(new DDECompanySizeData(
                        local.getPrimaryKey(), DEFAULT_DESC));
            } finally {
                local.remove();
            }
        }
    }

    /**
     * tests the operation of the create method when invoked with a
     * <code>null</code> argument
     */
    public void testCreateNull() throws Exception {
        try {
            LocalDDECompanySize local = localHome.create(null);
            /* a CreateException should have been thrown */
            local.remove();
            fail("Expected an SQLException");
        } catch (CreateException ce) {
            /* The expected behavior */
        }
    }

    /**
     * tests the operation of the create method when invoked with an empty
     * string argument
     */
    public void testCreateEmpty() throws Exception {
        synchronized (TestLocalDDECompanySizeHome.class) {
            LocalDDECompanySize local = localHome.create("");
            assertNotNull(local);
            try {
                assertEquals("", local.getDescription());
                transactionBoundary();
                assertMatchesDB(new DDECompanySizeData(
                        local.getPrimaryKey(), ""));
            } finally {
                local.remove();
            }
        }
    }

//
// This test determined not relevant
//
//  /**
//   * tests the operation of the create method when invoked with a string
//   * argument of length greater than the length of the underlying DB field
//   */
//  public void testCreateLong() throws Exception {
//      LocalDDECompanySize local = localHome.create(LONG_DESC);
//      assertNotNull(local);
//      try {
//          // String expected = LONG_DESC.substring(0, DESC_WIDTH);
//          // String received = local.getDescription();
//          // assertEquals(expected, received);
//          assertMatchesDB(new DDECompanySizeData(
//                  local.getPrimaryKey(), /* expected */ local.getDescription()) );
//      } finally {
//          local.remove();
//      }
//  }

    /**
     * tests the operation of the create method when invoked with each of
     * several string arguments that should be legal but have potential to be
     * troublesome
     */
    public void testCreateStrange() throws Exception {
        for (int i = 0; i < STRANGE_DESC.length; i++) {
            synchronized (TestLocalDDECompanySizeHome.class) {
                LocalDDECompanySize local = localHome.create(STRANGE_DESC[i]);
                assertNotNull(local);
                try {
                    assertEquals(STRANGE_DESC[i], local.getDescription());
                    assertMatchesDB(new DDECompanySizeData(
                            local.getPrimaryKey(), STRANGE_DESC[i]));
                } finally {
                    local.remove();
                }
            }
        }
    }

    /**
     * tests that findByPrimaryKey correctly returns an object known to be in
     * the database
     */
    public void testFindByPrimaryKeyNormal() throws Exception {
        DDECompanySizeData rowData =
                new DDECompanySizeData(nextId(), DEFAULT_DESC);

        synchronized (TestLocalDDECompanySizeHome.class) {
            ensureInDB(rowData);
            try {
                LocalDDECompanySize local =
                        localHome.findByPrimaryKey(
                                (Long) rowData.getPrimaryKey());
                assertNotNull("findByPrimaryKey lookup failed", local);
                assertEquals(rowData, new DDECompanySizeData(
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
        DDECompanySizeData rowData =
                new DDECompanySizeData(nextId(), DEFAULT_DESC);
        synchronized (TestLocalDDECompanySizeHome.class) {
            deleteRow(rowData); // does nothing if the row doesn't exist
            try {
                LocalDDECompanySize local =
                        localHome.findByPrimaryKey(
                                (Long) rowData.getPrimaryKey());
                fail("Expected an ObjectNotFoundException");
            } catch (ObjectNotFoundException onfe) {
                /* the expected case */
            }
        }
    }

    /**
     * a <code>RowData</code> implementation for the COMPANY_SIZE table
     */
    class DDECompanySizeData implements RowData {
        long companySizeId;
        String description;

        DDECompanySizeData(Object id, String desc) {
            this(keyToLong(id), desc);
        }

        DDECompanySizeData(long id, String desc) {
            companySizeId = id;
            description = desc;
        }

        public Object getPrimaryKey() {
            return new Long(companySizeId);
        }

        public void storeRowData(ResultSet rs) throws SQLException {
            rs.updateString("DESCRIPTION", description);
            rs.updateRow();
        }

        public void insertRowData(ResultSet rs) throws SQLException {
            rs.moveToInsertRow();
            rs.updateLong("COMPANY_SIZE_ID", companySizeId);
            rs.updateString("DESCRIPTION", description);
            rs.insertRow();
        }

        public void readRowData(ResultSet rs) throws SQLException {
            companySizeId = rs.getLong("COMPANY_SIZE_ID");
            description = rs.getString("DESCRIPTION");
        }

        public boolean matchesResultSet(ResultSet rs) throws SQLException {
            if (companySizeId != rs.getLong("COMPANY_SIZE_ID")) {
                return false;
            }
            String desc = rs.getString("DESCRIPTION");
            return (description == null ? desc == null
                    : description.equals(desc));
        }

        public boolean equals(Object o) {
            if (o instanceof DDECompanySizeData) {
                DDECompanySizeData d = (DDECompanySizeData) o;
                return (d.companySizeId == companySizeId)
                        && (description == null ? d.description == null
                        : description.equals(d.description));
            }
            return false;
        }
    }

}