/*
 * TestLocalDDECompCatalogHome.java
 *
 * By John C. Bollinger
 *
 * Copyright (c) 2002
 */

package com.topcoder.dde.persistencelayer.test;

import com.topcoder.dde.persistencelayer.interfaces.*;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Collection;
import java.util.Date;
import javax.ejb.CreateException;
import javax.ejb.ObjectNotFoundException;
import javax.ejb.SessionContext;
import javax.ejb.SessionContext;

/**
 * contains tests for the local home interface of the DDECompCatalog EJB
 *
 * @author John C. Bollinger
 *
 * @version 1.0
 */
public class TestLocalDDECompCatalogHome extends PersistenceTestCase {

    /* an instance of the localHome interface implementation to work with */
    private LocalDDECompCatalogHome localHome;

    /* default field values for entity instances */
    static final long DEF_VERSION = 42L;
    static final String DEF_NAME = "TEST COMPONENT";
    static final String DEF_DESC =
            "A very nice, albeit inconveniently imaginary, component.  "
            + "It is a fiction of the test suite.";
    static final Timestamp DEF_CREATE =
            new Timestamp(System.currentTimeMillis());
    static final long DEF_STATUS = 1L;
    static final String DEF_SHORT = "imaginary component";
    static final String DEF_FUNC = "frobs widgets";

    /**
     * a default constructor for use only by other test cases in this package
     */
    TestLocalDDECompCatalogHome() {
        this("testCreate");
    }

    /**
     * constructs a new TestLocalDDECompCatalogHome configured to run the named
     * test
     */
    public TestLocalDDECompCatalogHome(String testName) {
        this(testName, null);
    }

    /**
     * constructs a new TestLocalDDECategoriesHome configured to run the named
     * test in the specified session context
     */
    public TestLocalDDECompCatalogHome(String testName, SessionContext sc) {
        super(testName, "COMP_CATALOG", sc);
        pkFieldName = "COMPONENT_ID";
    }

    /**
     * sets up the fixture for this test
     */
    public void setUp() throws Exception {
        super.setUp();
        synchronized (contextLock) {
            localHome = (LocalDDECompCatalogHome) ctx.lookup(
                    LocalDDECompCatalogHome.EJB_REF_NAME);
        }
    }

    /*
     * creates a LocalDDECompCatalog entity with default parameters
     */
    LocalDDECompCatalog createDefault() throws Exception {
        return localHome.create(DEF_VERSION, DEF_NAME, DEF_DESC, DEF_CREATE,
                DEF_STATUS, DEF_SHORT, DEF_FUNC, 0);
    }

    /**
     * tests the basic entity creation functionality of the bean
     */
    public void testCreate() throws Exception {
        synchronized (TestLocalDDECompCatalogHome.class) {
            LocalDDECompCatalog local = createDefault();
            assertNotNull("local bean reference is null", local);
            try {
                assertEquals(DEF_VERSION, local.getCurrentVersion());
                assertEquals(DEF_NAME, local.getComponentName());
                assertEquals(DEF_DESC, local.getDescription());
                assertEquals(DEF_CREATE, local.getCreateTime());
                assertEquals(DEF_STATUS, local.getStatusId());
                assertEquals(DEF_SHORT, local.getShortDesc());
                assertEquals(DEF_FUNC, local.getFunctionDesc());
                transactionBoundary();
                assertMatchesDB(new DDECompCatalogData(local.getPrimaryKey(),
                        DEF_VERSION, DEF_SHORT, DEF_NAME, DEF_DESC, DEF_FUNC,
                        DEF_CREATE, DEF_STATUS));
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
            LocalDDECompCatalog local = localHome.create(DEF_VERSION, DEF_NAME,
                    DEF_DESC, DEF_CREATE, -17, DEF_SHORT, DEF_FUNC, 0);
            local.remove();
            fail("entity was created with invalid status");
        } catch (CreateException ce) {
            /* the expected case */
        }
    }

    /**
     * tests creation of a new DDECategory entity with a null name
     */
    public void testCreateNullName() throws Exception {
        try {
            LocalDDECompCatalog local = localHome.create(DEF_VERSION, null,
                    DEF_DESC, DEF_CREATE, DEF_STATUS, DEF_SHORT, DEF_FUNC, 0);
            local.remove();
            fail("entity was created with invalid status");
        } catch (CreateException ce) {
            /* the expected case */
        }
    }

    /**
     * tests creation of a new DDECategory entity with a null description
     */
    public void testCreateNullDescription() throws Exception {
        try {
            LocalDDECompCatalog local = localHome.create(DEF_VERSION, DEF_NAME,
                    null, DEF_CREATE, DEF_STATUS, DEF_SHORT, DEF_FUNC, 0);
            local.remove();
            fail("entity was created with invalid status");
        } catch (CreateException ce) {
            /* the expected case */
        }
    }

    /**
     * tests creation of a new DDECategory entity with a null creation time
     */
    public void testCreateNullCreateTime() throws Exception {
        try {
            LocalDDECompCatalog local = localHome.create(DEF_VERSION, DEF_NAME,
                    DEF_DESC, null, DEF_STATUS, DEF_SHORT, DEF_FUNC, 0);
            local.remove();
            fail("entity was created with invalid status");
        } catch (CreateException ce) {
            /* the expected case */
        }
    }

    /**
     * tests that findByPrimaryKey correctly returns an object known to be in
     * the database
     */
    public void testFindByPrimaryKeyNormal() throws Exception {
        DDECompCatalogData rowData =
                new DDECompCatalogData(nextId(), DEF_VERSION, DEF_SHORT, DEF_NAME,
                        DEF_DESC, DEF_FUNC, DEF_CREATE, DEF_STATUS);
        synchronized (TestLocalDDECompCatalogHome.class) {
            ensureInDB(rowData);
            try {
                LocalDDECompCatalog local =
                        localHome.findByPrimaryKey(
                                (Long) rowData.getPrimaryKey());
                assertNotNull("findByPrimaryKey lookup failed", local);
                assertEquals(rowData, new DDECompCatalogData(
                        local.getPrimaryKey(), local.getCurrentVersion(),
                        local.getShortDesc(), local.getComponentName(),
                        local.getDescription(), local.getFunctionDesc(),
                        local.getCreateTime(), local.getStatusId()));
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
        DDECompCatalogData rowData =
                new DDECompCatalogData(nextId(), DEF_VERSION, DEF_SHORT, DEF_NAME,
                        DEF_DESC, DEF_FUNC, DEF_CREATE, DEF_STATUS);
        synchronized (TestLocalDDECompCatalogHome.class) {
            deleteRow(rowData); // does nothing if the row doesn't exist
            try {
                LocalDDECompCatalog local =
                        localHome.findByPrimaryKey(
                                (Long) rowData.getPrimaryKey());
                fail("Expected an ObjectNotFoundException");
            } catch (ObjectNotFoundException onfe) {
                /* the expected case */
            }
        }
    }

    /**
     * tests the findByCurrentVersionActive finder method
     */
//    public void testFindByCurrentVersionActive() {
//        fail("Test not yet implemented");
//    }

    /**
     * tests the findByStatusId finder method
     */
//    public void testFindByStatusId() {
//        fail("Test not yet implemented");
//    }

    class DDECompCatalogData implements RowData {
        long componentId;
        long currentVersion;
        String shortDesc;
        String componentName;
        String description;
        String functionDesc;
        Timestamp createTime;
        long statusId;

        DDECompCatalogData(Object id, long version, String shortd, String name,
                           String desc, String function, Timestamp create, long status) {
            this(keyToLong(id), version, shortd, name, desc, function,
                    create, status);
        }

        DDECompCatalogData(long id, long version, String shortd, String name,
                           String desc, String function, Timestamp create, long status) {
            componentId = id;
            currentVersion = version;
            shortDesc = shortd;
            componentName = name;
            description = desc;
            functionDesc = function;
            createTime = (Timestamp) create.clone();
            statusId = status;
        }

        DDECompCatalogData(ResultSet rs) throws SQLException {
            readRowData(rs);
        }

        public Object getPrimaryKey() {
            return new Long(componentId);
        }

        private void updateResultSet(ResultSet rs) throws SQLException {
            rs.updateLong("CURRENT_VERSION", currentVersion);
            rs.updateString("SHORT_DESC", shortDesc);
            rs.updateString("COMPONENT_NAME", componentName);
            rs.updateString("DESCRIPTION", description);
            rs.updateString("FUNCTION_DESC", functionDesc);
            rs.updateTimestamp("CREATE_TIME", createTime);
            rs.updateLong("STATUS_ID", statusId);
        }

        public void storeRowData(ResultSet rs) throws SQLException {
            updateResultSet(rs);
            rs.updateRow();
        }

        public void insertRowData(ResultSet rs) throws SQLException {
            rs.moveToInsertRow();
            rs.updateLong("COMPONENT_ID", componentId);
            updateResultSet(rs);
            rs.insertRow();
        }

        public void readRowData(ResultSet rs) throws SQLException {
            componentId = rs.getLong("COMPONENT_ID");
            currentVersion = rs.getLong("CURRENT_VERSION");
            shortDesc = rs.getString("SHORT_DESC");
            componentName = rs.getString("COMPONENT_NAME");
            description = rs.getString("DESCRIPTION");
            functionDesc = rs.getString("FUNCTION_DESC");
            createTime = rs.getTimestamp("CREATE_TIME");
            statusId = rs.getLong("STATUS_ID");
        }

        public boolean matchesResultSet(ResultSet rs) throws SQLException {
            return equals(new DDECompCatalogData(rs));
        }

        public boolean equals(Object o) {
            if (!(o instanceof DDECompCatalogData)) {
                return false;
            }
            DDECompCatalogData d = (DDECompCatalogData) o;
            return (
                    (componentId == d.componentId)
                    && (currentVersion == d.currentVersion)
                    && objectsMatch(shortDesc, d.shortDesc)
                    && objectsMatch(componentName, d.componentName)
                    && objectsMatch(description, d.description)
                    && objectsMatch(functionDesc, d.functionDesc)
                    && objectsMatch(createTime, d.createTime)
                    && (statusId == d.statusId));
        }

    }

}
