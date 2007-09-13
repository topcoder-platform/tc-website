/*
 * TestLocalDDEStatusHome.java
 *
 * By John C. Bollinger
 *
 * Copyright (c) 2002
 */

package com.topcoder.dde.persistencelayer.test;

import com.topcoder.dde.persistencelayer.interfaces.LocalDDEStatusHome;
import com.topcoder.dde.persistencelayer.interfaces.LocalDDEStatus;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Collection;
import javax.ejb.CreateException;
import javax.ejb.ObjectNotFoundException;
import javax.ejb.SessionContext;

/**
 * a JUnit test case that exercises the DDEStatus EJB's local home interface
 *
 * @author John C. Bollinger
 * @version 1.0
 */
public class TestLocalDDEStatusHome extends PersistenceTestCase {

    /* descriptions used for testing the create method */
    private static final String DEFAULT_DESC = "Test Description";
    private static final String LONG_DESC =
            "260-character test description xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx";
    private static final String[] STRANGE_DESC = {
        "/* not a comment */", "'not quoted'", "embedded'quote",
        "% SQL metachar", "WHERE 1=0", "; not a terminator",
        "embedded \0 null", "trailing backslash \\"};

    /* the size of the description field */
    private static final int DESC_WIDTH = 254;

    private LocalDDEStatusHome localHome;

    public TestLocalDDEStatusHome(String testName) {
        this(testName, null);
    }

    /**
     * constructs a new TestLocalDDECategoriesHome configured to run the named
     * test in the specified session context
     */
    public TestLocalDDEStatusHome(String testName, SessionContext sc) {
        super(testName, "STATUS", sc);
    }

    /**
     * sets up the fixture for this test
     */
    public void setUp() throws Exception {
        super.setUp();
        synchronized (contextLock) {
            localHome = (LocalDDEStatusHome) ctx.lookup(
                    LocalDDEStatusHome.EJB_REF_NAME);
        }
    }

    /**
     * creates a default status entity
     */
    LocalDDEStatus createDefault() throws Exception {
        return localHome.create(nextId(), DEFAULT_DESC);
    }

    /**
     * tests the basic operation of the create method
     */
    public void testCreate() throws Exception {
        synchronized (TestLocalDDEStatusHome.class) {
            LocalDDEStatus local = createDefault();
            assertNotNull(local);
            try {
                assertEquals(DEFAULT_DESC, local.getDescription());
                transactionBoundary();
                assertMatchesDB(new DDEStatusData(
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
            LocalDDEStatus local = localHome.create(nextId(), null);
            /* a CreateException should have been thrown */
            local.remove();
            fail("Expected a CreateException");
        } catch (CreateException ce) {
            /* The expected behavior */
        }
    }

    /**
     * tests the operation of the create method when invoked with an empty
     * string argument
     */
    public void testCreateEmpty() throws Exception {
        synchronized (TestLocalDDEStatusHome.class) {
            LocalDDEStatus local = localHome.create(nextId(), "");
            assertNotNull(local);
            try {
                assertEquals("", local.getDescription());
                transactionBoundary();
                assertMatchesDB(new DDEStatusData(local.getPrimaryKey(), ""));
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
//      LocalDDEStatus local = localHome.create(nextId(), LONG_DESC);
//      assertNotNull(local);
//      try {
//          assertMatchesDB(new DDEStatusData(
//                  local.getPrimaryKey(), local.getDescription()) );
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
        synchronized (TestLocalDDEStatusHome.class) {
            for (int i = 0; i < STRANGE_DESC.length; i++) {
                LocalDDEStatus local =
                        localHome.create(nextId(), STRANGE_DESC[i]);
                assertNotNull(local);
                try {
                    assertEquals(STRANGE_DESC[i], local.getDescription());
                    assertMatchesDB(new DDEStatusData(
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
        DDEStatusData rowData =
                new DDEStatusData(nextId(), DEFAULT_DESC);

        synchronized (TestLocalDDEStatusHome.class) {
            ensureInDB(rowData);
            try {
                LocalDDEStatus local =
                        localHome.findByPrimaryKey(
                                (Long) rowData.getPrimaryKey());
                assertNotNull("findByPrimaryKey lookup failed", local);
                assertEquals(rowData, new DDEStatusData(
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
        DDEStatusData rowData =
                new DDEStatusData(nextId(), DEFAULT_DESC);
        synchronized (TestLocalDDEStatusHome.class) {
            deleteRow(rowData); // does nothing if the row doesn't exist
            try {
                LocalDDEStatus local =
                        localHome.findByPrimaryKey(
                                (Long) rowData.getPrimaryKey());
                fail("Expected an ObjectNotFoundException");
            } catch (ObjectNotFoundException onfe) {
                /* the expected case */
            }
        }
    }

    /*
     * findAll not tested -- no reliable way to predict the correct test results
     */

    /**
     * tests that findByDescription retreives all the appropriate entities
     */
    public void testFindByDescription() throws Exception {
        DDEStatusData sd1
                = new DDEStatusData(nextId(), DEFAULT_DESC + "1");
        DDEStatusData sd2a
                = new DDEStatusData(nextId(), DEFAULT_DESC + "2");
        DDEStatusData sd2b
                = new DDEStatusData(nextId(), DEFAULT_DESC + "2");
        DDEStatusData sd3
                = new DDEStatusData(nextId(), DEFAULT_DESC + "3");
        DDEStatusData sd4
                = new DDEStatusData(nextId(), "4" + DEFAULT_DESC);
        synchronized (TestLocalDDEStatusHome.class) {
            ensureInDB(sd1);
            try {
                Collection col;
                ensureInDB(sd2a);
                ensureInDB(sd2b);
                ensureInDB(sd3);
                ensureInDB(sd4);
                col = localHome.findByDescription(DEFAULT_DESC);
                assertEquals("found " + col.size()
                        + " entities when 0 expected", 0, col.size());
                col = localHome.findByDescription(DEFAULT_DESC + "1");
                assertEquals("found " + col.size()
                        + " entities when 1 expected", 1, col.size());
                col = localHome.findByDescription(DEFAULT_DESC + "2");
                assertEquals("found " + col.size()
                        + " entities when 2 expected", 2, col.size());
            } finally {
                deleteRow(sd4);
                deleteRow(sd3);
                deleteRow(sd2b);
                deleteRow(sd2a);
                deleteRow(sd1);
            }
        }
    }

    /*
     * TODO: write tests for the finders, findAll, findByPrimaryKey, and
     *       findByDescription
     */

    class DDEStatusData implements RowData {
        long statusId;
        String description;

        DDEStatusData(Object id, String desc) {
            this(keyToLong(id), desc);
        }

        DDEStatusData(long id, String desc) {
            statusId = id;
            description = desc;
        }

        DDEStatusData(ResultSet rs) throws SQLException {
            readRowData(rs);
        }

        public Object getPrimaryKey() {
            return new Long(statusId);
        }

        private void updateResultSet(ResultSet rs) throws SQLException {
            rs.updateString("DESCRIPTION", description);
        }

        public void storeRowData(ResultSet rs) throws SQLException {
            updateResultSet(rs);
            rs.updateRow();
        }

        public void insertRowData(ResultSet rs) throws SQLException {
            rs.moveToInsertRow();
            rs.updateLong("STATUS_ID", statusId);
            updateResultSet(rs);
            rs.insertRow();
        }

        public void readRowData(ResultSet rs) throws SQLException {
            statusId = rs.getLong("STATUS_ID");
            description = rs.getString("DESCRIPTION");
        }

        public boolean matchesResultSet(ResultSet rs) throws SQLException {
            return equals(new DDEStatusData(rs));
        }

        public boolean equals(Object o) {
            if (!(o instanceof DDEStatusData)) {
                return false;
            }
            DDEStatusData d = (DDEStatusData) o;
            return ((statusId == d.statusId)
                    && objectsMatch(description, d.description));
        }
    }
}
