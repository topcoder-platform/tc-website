/*
 * TestLocalDDECategoriesHome.java
 *
 * By John C. Bollinger
 *
 * Copyright (c) 2002
 */

package com.topcoder.dde.persistencelayer.test;

import com.topcoder.dde.persistencelayer.interfaces.LocalDDECategoriesHome;
import com.topcoder.dde.persistencelayer.interfaces.LocalDDECategories;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Collection;
import javax.ejb.CreateException;
import javax.ejb.ObjectNotFoundException;
import javax.ejb.SessionContext;

/**
 * a JUnit test case that excercises the DDECategories local home interface
 *
 * @author John C. Bollinger
 *
 * @version 1.0
 */
public class TestLocalDDECategoriesHome extends PersistenceTestCase {

    private LocalDDECategoriesHome localHome;
    private LocalDDECategories parent;
    private Long parentId;

    private static final long DEFAULT_STATUS = 0L;
    private static final long ACTIVE_STATUS = 1L;
    private static final long OTHER_ACTIVE_STATUS = 101L;
    private static final String PARENT_CAT_NAME = "TEST PARENT CATEGORY";
    private static final String PARENT_CAT_DESC
            = "a category for use as a parent category during testing";
    private final String DEF_CAT_NAME = "TEST CATEGORY";
    private final String DEF_CAT_DESC = "a test category";
    private Long INVALID_PARENT_ID;

    /**
     * constructs a default TestLocalDDECategoriesHome; for internal use by
     * classes in the com.topcoder.dde.persistencelayer.test package
     */
    TestLocalDDECategoriesHome() {
        this("testCreate");
    }

    /**
     * constructs a new TestLocalDDECategoriesHome configured to run the named
     * test
     */
    public TestLocalDDECategoriesHome(String testName) {
        this(testName, null);
    }

    /**
     * constructs a new TestLocalDDECategoriesHome configured to run the named
     * test in the specified session context
     */
    public TestLocalDDECategoriesHome(String testName, SessionContext sc) {
        super(testName, "CATEGORIES", sc);
        pkFieldName = "CATEGORY_ID";
    }

    /**
     * sets up the fixture for this test
     */
    public void setUp() throws Exception {
        super.setUp();
        synchronized (contextLock) {
            localHome = (LocalDDECategoriesHome) ctx.lookup(
                    LocalDDECategoriesHome.EJB_REF_NAME);
        }
        parent = localHome.create(null, PARENT_CAT_NAME, PARENT_CAT_DESC,
                DEFAULT_STATUS);
        assertNotNull("local bean reference is null", parent);
        parentId = (Long) parent.getPrimaryKey();
        assertNotNull("parent category's id is null", parentId);
        INVALID_PARENT_ID = new Long(nextId());
    }

    public void tearDown() throws Exception {
        if (parent != null) {
            parent.remove();
        }
        super.tearDown();
    }

    /**
     * returns a new LocalDDECategories entity with default field values
     */
    LocalDDECategories createDefault() throws Exception {
        return localHome.create(parentId, DEF_CAT_NAME, DEF_CAT_DESC,
                DEFAULT_STATUS);
    }

    /**
     * tests normal creation of a new DDECategory entity
     */
    public void testCreate() throws Exception {
        synchronized (TestLocalDDECategoriesHome.class) {
            LocalDDECategories local = createDefault();
            assertNotNull("local bean reference is null", local);
            try {
                assertEquals(parentId, local.getParentCategoryId());
                assertEquals(DEF_CAT_NAME, local.getName());
                assertEquals(DEF_CAT_DESC, local.getDescription());
                assertEquals(DEFAULT_STATUS, local.getStatusId());
                transactionBoundary();
                assertMatchesDB(new DDECategoriesData(local.getPrimaryKey(),
                        parentId, DEF_CAT_NAME, DEF_CAT_DESC, DEFAULT_STATUS));
            } finally {
                local.remove();
            }
        }
    }

    /**
     * tests creation of a new DDECategory entity with a status that is not in
     * the status table
     */
    public void testCreateInvalidStatus() throws Exception {
        try {
            LocalDDECategories local = localHome.create(parentId, DEF_CAT_NAME,
                    DEF_CAT_DESC, -17);
            local.remove();
            fail("entity was created with invalid status");
        } catch (CreateException ce) {
            /* the expected case */
        }
    }


    /**
     * tests creation of a new DDECategory with a parent category not in the
     * DB
     */
    public void testCreateInvalidParent() throws Exception {
        /*
         * This test checks that the behavior matches that established as
         * correct during development -- that it is possible to create a
         * category with a parent id that does not match any category.
         */
        synchronized (TestLocalDDECategoriesHome.class) {
            LocalDDECategories local = localHome.create(INVALID_PARENT_ID,
                    DEF_CAT_NAME, DEF_CAT_DESC, DEFAULT_STATUS);
            assertNotNull(local);
            local.remove();
        }
    }

    /**
     * tests creation of a new DDECategory with a null name
     */
    public void testCreateNullName() throws Exception {
        try {
            LocalDDECategories local = localHome.create(parentId, null,
                    DEF_CAT_DESC, DEFAULT_STATUS);
            local.remove();
            fail("bean was created with null name");
        } catch (CreateException ce) {
            /* the expected case */
        }
    }

    /**
     * tests creation of a new DDECategory with a null description
     */
    public void testCreateNullDescription() throws Exception {
        try {
            LocalDDECategories local = localHome.create(parentId, DEF_CAT_NAME,
                    null, DEFAULT_STATUS);
            local.remove();
            fail("bean was created with null description");
        } catch (CreateException ce) {
            /* the expected case */
        }
    }

    /**
     * tests the findAllActive() method
     */
    public void testFindAllActive() throws Exception {
        Collection col;
        DDECategoriesData cd1 = new DDECategoriesData(new Long(nextId()),
                parentId, DEF_CAT_NAME + "1", DEF_CAT_DESC, ACTIVE_STATUS);
        DDECategoriesData cd2 = new DDECategoriesData(new Long(nextId()),
                parentId, DEF_CAT_NAME + "2", DEF_CAT_DESC, ACTIVE_STATUS);
        DDECategoriesData cd3 = new DDECategoriesData(new Long(nextId()),
                parentId, DEF_CAT_NAME + "3", DEF_CAT_DESC, 0);
        DDECategoriesData cd4 = new DDECategoriesData(new Long(nextId()),
                parentId, DEF_CAT_NAME + "4", DEF_CAT_DESC, OTHER_ACTIVE_STATUS);
        DDECategoriesData cd5 = new DDECategoriesData(new Long(nextId()),
                parentId, DEF_CAT_NAME + "5", DEF_CAT_DESC, 0);
        DDECategoriesData cd11 = new DDECategoriesData(new Long(nextId()),
                (Long) cd1.getPrimaryKey(), DEF_CAT_NAME + "1..1", DEF_CAT_DESC,
                ACTIVE_STATUS);
        /* must synchronize to avoid conflicts with other tests */
        synchronized (TestLocalDDECategoriesHome.class) {
            try {
                ensureInDB(cd1);
                ensureInDB(cd2);
                ensureInDB(cd3);
                ensureInDB(cd4);
                ensureInDB(cd5);
                ensureInDB(cd11);
                col = localHome.findAllActive();
                assertNotNull(col);
                /*
                 * again, a lazy check.  This will break if the DB also contains
                 * non-test data
                 */
                assertEquals("incorrect number of active categories returned",
                        4, col.size());
            } finally {
                deleteRow(cd1);
                deleteRow(cd2);
                deleteRow(cd3);
                deleteRow(cd4);
                deleteRow(cd5);
                deleteRow(cd11);
            }
        }
    }

    /**
     * tests the findByPrimaryKey() method when the requested key is present
     */
    public void testFindByPrimaryKeyNormal() throws Exception {
        DDECategoriesData catData = new DDECategoriesData(
                nextId(), null, DEF_CAT_NAME, DEF_CAT_DESC, DEFAULT_STATUS);
        /* must synchronize to avoid conflicts with other tests */
        synchronized (TestLocalDDECategoriesHome.class) {
            ensureInDB(catData);
            try {
                transactionBoundary();
                LocalDDECategories cat =
                        localHome.findByPrimaryKey(
                                (Long) catData.getPrimaryKey());
                assertNotNull(cat);
                assertEquals("Found the wrong data", catData,
                        new DDECategoriesData(
                                cat.getPrimaryKey(), cat.getParentCategoryId(),
                                cat.getName(), cat.getDescription(),
                                cat.getStatusId()));
            } finally {
                deleteRow(catData);
            }
        }
    }

    /**
     * tests the findByPrimaryKey() method when the requested key is absent
     */
    public void testFindByPrimaryKeyMissing() throws Exception {
        try {
            localHome.findByPrimaryKey(INVALID_PARENT_ID);
            fail("No entity should have been found");
        } catch (ObjectNotFoundException nfe) {
            /* the expected case */
        }
    }

    /**
     * tests the findByParentCategoryId() method
     */
    public void testFindByParentCategoryId() throws Exception {
        Collection col;
        assertNotNull("parentId is null", parentId);
        DDECategoriesData cd1 = new DDECategoriesData(new Long(nextId()),
                parentId, DEF_CAT_NAME + "1", DEF_CAT_DESC, ACTIVE_STATUS);
        DDECategoriesData cd2 = new DDECategoriesData(new Long(nextId()),
                parentId, DEF_CAT_NAME + "2", DEF_CAT_DESC, ACTIVE_STATUS);
        DDECategoriesData cd3 = new DDECategoriesData(new Long(nextId()),
                parentId, DEF_CAT_NAME + "3", DEF_CAT_DESC, 101);
        DDECategoriesData cd4 = new DDECategoriesData(new Long(nextId()),
                parentId, DEF_CAT_NAME + "4", DEF_CAT_DESC, 0);
        DDECategoriesData cd5 = new DDECategoriesData(new Long(nextId()),
                parentId, DEF_CAT_NAME + "5", DEF_CAT_DESC, 0);
        DDECategoriesData cd11 = new DDECategoriesData(new Long(nextId()),
                (Long) cd1.getPrimaryKey(), DEF_CAT_NAME + "1..1", DEF_CAT_DESC,
                ACTIVE_STATUS);
        assertNotNull("test category 1's primary key is null",
                cd1.getPrimaryKey());
        DDECategoriesData cd12 = new DDECategoriesData(new Long(nextId()),
                (Long) cd1.getPrimaryKey(), DEF_CAT_NAME + "1..2", DEF_CAT_DESC,
                ACTIVE_STATUS);
        DDECategoriesData cd13 = new DDECategoriesData(new Long(nextId()),
                (Long) cd1.getPrimaryKey(), DEF_CAT_NAME + "1..3", DEF_CAT_DESC,
                0);
        /* must synchronize to avoid conflicts with other tests */
        synchronized (TestLocalDDECategoriesHome.class) {
            try {
                ensureInDB(cd1);
                ensureInDB(cd2);
                ensureInDB(cd3);
                ensureInDB(cd4);
                ensureInDB(cd5);
                ensureInDB(cd11);
                ensureInDB(cd12);
                ensureInDB(cd13);
                /*
                 * another set of poor man's criteria; should really compare the
                 * entities retrieved to those we expect
                 */
                /*
                 * finders with null keys are not required to be supported
                 */
//              col = localHome.findByParentCategoryId(null);
//              assertEquals("wrong number of entities ", 1, col.size());
                col = localHome.findByParentCategoryId(parentId);
                assertEquals("wrong number of entities ", 3, col.size());
                col = localHome.findByParentCategoryId((Long) cd1.getPrimaryKey());
                assertEquals("wrong number of entities ", 2, col.size());
            } finally {
                deleteRow(cd13);
                deleteRow(cd12);
                deleteRow(cd11);
                deleteRow(cd5);
                deleteRow(cd4);
                deleteRow(cd3);
                deleteRow(cd2);
                deleteRow(cd1);
            }
        }
    }

    class DDECategoriesData implements RowData {
        long categoryId;
        Long parentCategoryId;
        String categoryName;
        String description;
        long statusId;

        DDECategoriesData(Object id, Long parentId, String name, String desc,
                          long status) {
            this(keyToLong(id), parentId, name, desc, status);
        }

        DDECategoriesData(long id, Long parentId, String name, String desc,
                          long status) {
            categoryId = id;
            parentCategoryId = parentId;
            categoryName = name;
            description = desc;
            statusId = status;
        }

        DDECategoriesData(ResultSet rs) throws SQLException {
            readRowData(rs);
        }

        public Object getPrimaryKey() {
            return new Long(categoryId);
        }

        private void updateResultSet(ResultSet rs) throws SQLException {
            if (parentCategoryId == null) {
                rs.updateNull("PARENT_CATEGORY_ID");
            } else {
                rs.updateLong("PARENT_CATEGORY_ID",
                        parentCategoryId.longValue());
            }
            rs.updateString("CATEGORY_NAME", categoryName);
            rs.updateString("DESCRIPTION", description);
            rs.updateLong("STATUS_ID", statusId);
        }

        public void storeRowData(ResultSet rs) throws SQLException {
            updateResultSet(rs);
            rs.updateRow();
        }

        public void insertRowData(ResultSet rs) throws SQLException {
            rs.moveToInsertRow();
            rs.updateLong("CATEGORY_ID", categoryId);
            updateResultSet(rs);
            rs.insertRow();
        }

        public void readRowData(ResultSet rs) throws SQLException {
            long l;
            categoryId = rs.getLong("CATEGORY_ID");
            l = rs.getLong("PARENT_CATEGORY_ID");
            parentCategoryId = rs.wasNull() ? null : new Long(l);
            categoryName = rs.getString("CATEGORY_NAME");
            description = rs.getString("DESCRIPTION");
            statusId = rs.getLong("STATUS_ID");
        }

        public boolean matchesResultSet(ResultSet rs) throws SQLException {
            return equals(new DDECategoriesData(rs));
        }

        public boolean equals(Object o) {
            if (!(o instanceof DDECategoriesData)) {
                return false;
            }
            DDECategoriesData d = (DDECategoriesData) o;
            return (
                    (categoryId == d.categoryId)
                    && objectsMatch(parentCategoryId, d.parentCategoryId)
                    && objectsMatch(categoryName, d.categoryName)
                    && objectsMatch(description, d.description)
                    && (statusId == d.statusId));
        }
    }
}
