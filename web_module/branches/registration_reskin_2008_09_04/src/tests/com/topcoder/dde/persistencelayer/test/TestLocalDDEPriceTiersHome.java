/*
 * TestLocalDDEPriceTiersHome.java
 *
 * A JUnit Test Case for LocalDDEPriceTiersHome
 *
 * By John C. Bollinger
 *
 * Copyright (c) 2002
 */
package com.topcoder.dde.persistencelayer.test;

import com.topcoder.dde.persistencelayer.interfaces.LocalDDEPriceTiersHome;
import com.topcoder.dde.persistencelayer.interfaces.LocalDDEPriceTiers;

import java.sql.ResultSet;
import java.sql.SQLException;
import javax.ejb.CreateException;
import javax.ejb.ObjectNotFoundException;
import javax.ejb.SessionContext;

/**
 * a JUnit test case that exercises the DDEPriceTiers EJB's local home
 * interface
 *
 * @author John C. Bollinger
 * @version 1.0
 */
public class TestLocalDDEPriceTiersHome extends PersistenceTestCase {

    /* descriptions used for testing the create method */
    private static final double DEF_DISCOUNT = 0.42;

    /* an instance of the a local home implementation to test with */
    private LocalDDEPriceTiersHome localHome;

    /**
     * a default constructor for use only by other test cases in this package
     */
    TestLocalDDEPriceTiersHome() {
        this("testCreate");
    }

    /**
     * constructs an instance that will execute the specified test
     *
     * @param  testName a <code>String</code> containing the name of the test
     *         that should be run
     */
    public TestLocalDDEPriceTiersHome(String testName) {
        this(testName, null);
    }

    /**
     * constructs a new TestLocalDDECategoriesHome configured to run the named
     * test in the specified session context
     */
    public TestLocalDDEPriceTiersHome(String testName, SessionContext sc) {
        super(testName, "PRICE_TIERS", sc);
        pkFieldName = "TIER_ID";
    }

    /**
     * sets up the fixture for this test
     */
    public void setUp() throws Exception {
        super.setUp();
        synchronized (contextLock) {
            localHome = (LocalDDEPriceTiersHome) ctx.lookup(
                    LocalDDEPriceTiersHome.EJB_REF_NAME);
        }
        assertNotNull("Obtained null local home implementation", localHome);
    }

    /*
     * creates a LocalDDEPriceTiers entity with default parameters
     */
    LocalDDEPriceTiers createDefault() throws Exception {
        return localHome.create(DEF_DISCOUNT);
    }

    /**
     * tests the basic operation of the create method
     */
    public void testCreate() throws Exception {
        synchronized (TestLocalDDEPriceTiersHome.class) {
            LocalDDEPriceTiers local = createDefault();
            assertNotNull(local);
            try {
                assertEquals(DEF_DISCOUNT, local.getDiscountPercent(), 0.001);
                transactionBoundary();
                assertMatchesDB(new DDEPriceTiersData(
                        local.getPrimaryKey(), DEF_DISCOUNT));
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
        DDEPriceTiersData rowData =
                new DDEPriceTiersData(nextId(), DEF_DISCOUNT);

        synchronized (TestLocalDDEPriceTiersHome.class) {
            ensureInDB(rowData);
            try {
                LocalDDEPriceTiers local =
                        localHome.findByPrimaryKey(
                                (Long) rowData.getPrimaryKey());
                assertNotNull("findByPrimaryKey lookup failed", local);
                assertEquals(rowData, new DDEPriceTiersData(
                        local.getPrimaryKey(), local.getDiscountPercent()));
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
        DDEPriceTiersData rowData = new DDEPriceTiersData(nextId(), DEF_DISCOUNT);
        synchronized (TestLocalDDEPriceTiersHome.class) {
            deleteRow(rowData); // does nothing if the row doesn't exist
            try {
                LocalDDEPriceTiers local =
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
    class DDEPriceTiersData implements RowData {
        long tierId;
        double discountPercent;

        DDEPriceTiersData(Object id, double discount) {
            this(keyToLong(id), discount);
        }

        DDEPriceTiersData(long id, double discount) {
            tierId = id;
            discountPercent = discount;
        }

        DDEPriceTiersData(ResultSet rs) throws SQLException {
            readRowData(rs);
        }

        public Object getPrimaryKey() {
            return new Long(tierId);
        }

        public void storeRowData(ResultSet rs) throws SQLException {
            updateResultSet(rs);
            rs.updateRow();
        }

        public void insertRowData(ResultSet rs) throws SQLException {
            rs.moveToInsertRow();
            rs.updateLong("TIER_ID", tierId);
            updateResultSet(rs);
            rs.insertRow();
        }

        private void updateResultSet(ResultSet rs) throws SQLException {
            rs.updateDouble("DISCOUNT_PERCENT", discountPercent);
        }

        public void readRowData(ResultSet rs) throws SQLException {
            tierId = rs.getLong("TIER_ID");
            discountPercent = rs.getDouble("DISCOUNT_PERCENT");
        }

        public boolean matchesResultSet(ResultSet rs) throws SQLException {
            return equals(new DDEPriceTiersData(rs));
        }

        public boolean equals(Object o) {
            if (o instanceof DDEPriceTiersData) {
                DDEPriceTiersData d = (DDEPriceTiersData) o;
                // Possible hazard: comparing doubles with ==
                return (tierId == d.tierId)
                        && (discountPercent == d.discountPercent);
            }
            return false;
        }
    }

}