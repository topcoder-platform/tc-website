/*
 * TestLocalDDELicenseLevelHome.java
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
 * contains tests for the local home interface of the DDELicenseLevel EJB
 *
 * @author John C. Bollinger
 *
 * @version 1.0
 */
public class TestLocalDDELicenseLevelHome extends PersistenceTestCase {

    /* an instance of the localHome interface implementation to work with */
    private LocalDDELicenseLevelHome localHome;

    /* default field values for entity instances */
    static final double DEF_MULT = 0.7d;
    static final String DEF_DESC = "Five to ten licenses, academic";
    private static final long DEF_STATUS = 1L;
    private static final long INVALID_STATUS = -1L;

    /**
     * a default constructor for use only by other test cases in this package
     */
    TestLocalDDELicenseLevelHome() {
        this("testCreate");
    }

    /**
     * constructs a new TestLocalDDELicenseLevelHome configured to run the named
     * test
     */
    public TestLocalDDELicenseLevelHome(String testName) {
        this(testName, null);
    }

    /**
     * constructs a new TestLocalDDECategoriesHome configured to run the named
     * test in the specified session context
     */
    public TestLocalDDELicenseLevelHome(String testName, SessionContext sc) {
        super(testName, "LICENSE_LEVEL", sc);
    }

    /**
     * sets up the fixture for this test
     */
    public void setUp() throws Exception {
        super.setUp();
        synchronized (contextLock) {
            localHome = (LocalDDELicenseLevelHome) ctx.lookup(
                    LocalDDELicenseLevelHome.EJB_REF_NAME);
        }
    }

    /*
     * creates a LocalDDELicenseLevel entity with default parameters
     */
    LocalDDELicenseLevel createDefault() throws Exception {
        return localHome.create(DEF_MULT, DEF_DESC, DEF_STATUS);
    }

    /**
     * tests the basic entity creation functionality of the bean
     */
    public void testCreate() throws Exception {
        synchronized (TestLocalDDELicenseLevelHome.class) {
            LocalDDELicenseLevel local = createDefault();
            assertNotNull("local bean reference is null", local);
            try {
                assertEquals(DEF_MULT, local.getPriceMultiplier(), 0.0001d);
                assertEquals(DEF_DESC, local.getDescription());
                transactionBoundary();
                assertMatchesDB(new DDELicenseLevelData(local.getPrimaryKey(),
                        DEF_MULT, DEF_DESC, new Long(DEF_STATUS)));
            } finally {
                local.remove();
            }
        }
    }

    /**
     * tests creation of a new DDECategory entity with a null description
     */
    public void testCreateNullDescription() throws Exception {
        try {
            LocalDDELicenseLevel local = localHome.create(DEF_MULT, null, DEF_STATUS);
            local.remove();
            fail("entity was created with invalid status");
        } catch (CreateException ce) {
            /* the expected case */
        }
    }

    /**
     * tests the findByPrimaryKey finder method
     */
    public void testFindByPrimaryKey() throws Exception {
        DDELicenseLevelData rowData = new DDELicenseLevelData(
                nextId(), DEF_MULT, DEF_DESC, new Long(DEF_STATUS));
        ensureInDB(rowData);
        try {
            LocalDDELicenseLevel local = localHome.findByPrimaryKey(
                    (Long) rowData.getPrimaryKey());
            assertEquals("Found entity does not match stored entity",
                    rowData, new DDELicenseLevelData(local.getPrimaryKey(),
                            local.getPriceMultiplier(), local.getDescription(),
                            new Long(local.getStatusId())));
        } finally {
            deleteRow(rowData);
        }
    }

    class DDELicenseLevelData implements RowData {
        long licenseLevelId;
        double priceMultiplier;
        String description;
        Long statusId;

        DDELicenseLevelData(Object id, double multiplier, String desc, Long stat) {
            this(keyToLong(id), multiplier, desc, stat);
        }

        DDELicenseLevelData(long id, double multiplier, String desc, Long stat) {
            licenseLevelId = id;
            priceMultiplier = multiplier;
            description = desc;
            statusId = stat;
        }

        DDELicenseLevelData(ResultSet rs) throws SQLException {
            readRowData(rs);
        }

        public Object getPrimaryKey() {
            return new Long(licenseLevelId);
        }

        private void updateResultSet(ResultSet rs) throws SQLException {
            rs.updateDouble("PRICE_MULTIPLIER", priceMultiplier);
            rs.updateString("DESCRIPTION", description);
            if (statusId == null) {
                rs.updateNull("STATUS_ID");
            } else {
                rs.updateLong("STATUS_ID", statusId.longValue());
            }
        }

        public void storeRowData(ResultSet rs) throws SQLException {
            updateResultSet(rs);
            rs.updateRow();
        }

        public void insertRowData(ResultSet rs) throws SQLException {
            rs.moveToInsertRow();
            rs.updateLong("LICENSE_LEVEL_ID", licenseLevelId);
            updateResultSet(rs);
            rs.insertRow();
        }

        public void readRowData(ResultSet rs) throws SQLException {
            long templ;

            licenseLevelId = rs.getLong("LICENSE_LEVEL_ID");
            priceMultiplier = rs.getDouble("PRICE_MULTIPLIER");
            description = rs.getString("DESCRIPTION");
            templ = rs.getLong("STATUS_ID");
            if (rs.wasNull()) {
                statusId = null;
            } else {
                statusId = new Long(templ);
            }
        }

        public boolean matchesResultSet(ResultSet rs) throws SQLException {
            return equals(new DDELicenseLevelData(rs));
        }

        public boolean equals(Object o) {
            if (!(o instanceof DDELicenseLevelData)) {
                return false;
            }
            DDELicenseLevelData d = (DDELicenseLevelData) o;
            return (
                    (licenseLevelId == d.licenseLevelId)
                    && (Math.abs(priceMultiplier - d.priceMultiplier) < 0.001)
                    && objectsMatch(description, d.description)
                    && objectsMatch(statusId, d.statusId));
        }

    }

}
