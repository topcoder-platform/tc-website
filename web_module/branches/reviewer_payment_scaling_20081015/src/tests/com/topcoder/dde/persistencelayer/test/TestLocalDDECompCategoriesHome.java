/*
 * TestLocalDDECompCategoriesHome.java
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
 * contains tests for the local home interface of the DDECompCategories EJB
 *
 * @author John C. Bollinger
 *
 * @version 1.0
 */
public class TestLocalDDECompCategoriesHome extends PersistenceTestCase {

    /* an instance of the localHome interface implementation to work with */
    private LocalDDECompCategoriesHome localHome;

    public TestLocalDDECompCategoriesHome() {
        this("");
    }

    /**
     * constructs a new TestLocalDDECompCategoriesHome configured to run the named
     * test
     */
    public TestLocalDDECompCategoriesHome(String testName) {
        this(testName, null);
    }

    /**
     * constructs a new TestLocalDDECategoriesHome configured to run the named
     * test in the specified session context
     */
    public TestLocalDDECompCategoriesHome(String testName, SessionContext sc) {
        super(testName, "COMP_CATEGORIES", sc);
    }

    /**
     * sets up the fixture for this test
     */
    public void setUp() throws Exception {
        super.setUp();
        synchronized (contextLock) {
            localHome = (LocalDDECompCategoriesHome) ctx.lookup(
                    LocalDDECompCategoriesHome.EJB_REF_NAME);
        }
    }

    /**
     * tests all entity creation functionality of the bean
     */
    public void testAllCreate() throws Exception {
        /*
         * This is messy because we need to obtain LocalDDECategories and
         * LocalDDECompCatalog objects in order to create a
         * LocalDDECompCategories.  Because the setup is so involved, there
         * are three logically different tests bundled together here.
         */
        synchronized (TestLocalDDECompCatalogHome.class) {
            LocalDDECompCatalog localComponent;
            TestLocalDDECompCatalogHome compHome =
                    new TestLocalDDECompCatalogHome();

            compHome.setUp();
            localComponent = compHome.createDefault();
            assertNotNull(localComponent);
            try {
                synchronized (TestLocalDDECategoriesHome.class) {
                    LocalDDECategories localCategory;
                    TestLocalDDECategoriesHome categoryHome =
                            new TestLocalDDECategoriesHome();

                    categoryHome.setUp();
                    localCategory = categoryHome.createDefault();
                    assertNotNull(localCategory);
                    try {
                        synchronized (TestLocalDDECompCategoriesHome.class) {
                            /* test normal entity creation */
                            LocalDDECompCategories local = localHome.create(
                                    localComponent, localCategory);
                            assertNotNull("local bean reference is null",
                                    local);
                            try {
                                assertTrue(localCategory.isIdentical(
                                        local.getCategories()));
                                assertTrue(localComponent.isIdentical(
                                        local.getCompCatalog()));
                                transactionBoundary();
                                assertMatchesDB(new DDECompCategoriesData(
                                        local.getPrimaryKey(),
                                        (Long) localComponent.getPrimaryKey(),
                                        (Long) localCategory.getPrimaryKey()));
                            } finally {
                                local.remove();
                            }

                            /* test creation with null component */
                            local = localHome.create(null, localCategory);
                            assertNotNull(local);
                            local.remove();

                            /* test creation with null category */
                            local = localHome.create(localComponent, null);
                            assertNotNull(local);
                            local.remove();
                        }
                    } finally {
                        localCategory.remove();
                    }
                    categoryHome.tearDown();
                }
            } finally {
                localComponent.remove();
            }
            compHome.tearDown();
        }
    }

    /**
     * tests that findByPrimaryKey correctly returns an object known to be in
     * the database
     */
    public void testFindByPrimaryKey() throws Exception {
        synchronized (TestLocalDDECompCatalogHome.class) {
            LocalDDECompCatalog localComponent;
            TestLocalDDECompCatalogHome compHome =
                    new TestLocalDDECompCatalogHome();

            compHome.setUp();
            localComponent = compHome.createDefault();
            assertNotNull(localComponent);
            try {
                synchronized (TestLocalDDECategoriesHome.class) {
                    LocalDDECategories localCategory;
                    TestLocalDDECategoriesHome categoryHome =
                            new TestLocalDDECategoriesHome();

                    categoryHome.setUp();
                    localCategory = categoryHome.createDefault();
                    assertNotNull(localCategory);
                    try {
                        synchronized (TestLocalDDECompCategoriesHome.class) {
                            LocalDDECompCategories local;
                            DDECompCategoriesData rowData =
                                    new DDECompCategoriesData(nextId(),
                                            (Long) localComponent.getPrimaryKey(),
                                            (Long) localCategory.getPrimaryKey());
                            /* test normal find */
                            ensureInDB(rowData);
                            try {
                                local = localHome.findByPrimaryKey(
                                        (Long) rowData.getPrimaryKey());
                                assertNotNull("findByPrimaryKey lookup failed", local);
                                assertEquals(rowData, new DDECompCategoriesData(
                                        local.getPrimaryKey(),
                                        (Long) local.getCompCatalog().getPrimaryKey(),
                                        (Long) local.getCategories().getPrimaryKey()));
                            } finally {
                                deleteRow(rowData);
                            }
                            /* test deleted find */
                            try {
                                local = localHome.findByPrimaryKey(
                                        (Long) rowData.getPrimaryKey());
                                fail("Expected an ObjectNotFoundException");
                            } catch (ObjectNotFoundException onfe) {
                                /* the expected case */
                            }
                        }
                    } finally {
                        localCategory.remove();
                    }
                    categoryHome.tearDown();
                }
            } finally {
                localComponent.remove();
            }
            compHome.tearDown();
        }
    }

    /**
     * tests the findByCurrentVersionActive finder method
     */
//    public void testFindByCategoryId() {
//        fail("Test not yet implemented");
//    }

    /**
     * tests the findByStatusId finder method
     */
//    public void testFindByComponentId() {
//        fail("Test not yet implemented");
//    }

    /**
     * tests the findByComponentIdAndCategoryId finder method
     */
//    public void testFindByComponentIdAndCategoryId() {
//        fail("Test not yet implemented");
//    }

    class DDECompCategoriesData implements RowData {
        long compCategoriesId;
        Long componentId;
        Long categoryId;

        DDECompCategoriesData(Object id, Long component, Long category) {
            this(((Long) id).longValue(), component, category);
        }

        DDECompCategoriesData(long id, Long component, Long category) {
            compCategoriesId = id;
            componentId = component;
            categoryId = category;
        }

        DDECompCategoriesData(ResultSet rs) throws SQLException {
            readRowData(rs);
        }

        public Object getPrimaryKey() {
            return new Long(compCategoriesId);
        }

        private void updateResultSet(ResultSet rs) throws SQLException {
            if (componentId == null) {
                rs.updateNull("COMPONENT_ID");
            } else {
                rs.updateLong("COMPONENT_ID", componentId.longValue());
            }
            if (categoryId == null) {
                rs.updateNull("CATEGORY_ID");
            } else {
                rs.updateLong("CATEGORY_ID", categoryId.longValue());
            }
        }

        public void storeRowData(ResultSet rs) throws SQLException {
            updateResultSet(rs);
            rs.updateRow();
        }

        public void insertRowData(ResultSet rs) throws SQLException {
            rs.moveToInsertRow();
            rs.updateLong("COMP_CATEGORIES_ID", compCategoriesId);
            updateResultSet(rs);
            rs.insertRow();
        }

        public void readRowData(ResultSet rs) throws SQLException {
            long l;
            compCategoriesId = rs.getLong("COMP_CATEGORIES_ID");
            l = rs.getLong("COMPONENT_ID");
            if (rs.wasNull()) {
                componentId = null;
            } else {
                componentId = new Long(l);
            }
            l = rs.getLong("CATEGORY_ID");
            if (rs.wasNull()) {
                categoryId = null;
            } else {
                categoryId = new Long(l);
            }
        }

        public boolean matchesResultSet(ResultSet rs) throws SQLException {
            return equals(new DDECompCategoriesData(rs));
        }

        public boolean equals(Object o) {
            if (!(o instanceof DDECompCategoriesData)) {
                return false;
            }
            DDECompCategoriesData d = (DDECompCategoriesData) o;
            return (
                    (compCategoriesId == d.compCategoriesId)
                    && objectsMatch(componentId, d.componentId)
                    && objectsMatch(categoryId, d.categoryId));
        }


    }

}
