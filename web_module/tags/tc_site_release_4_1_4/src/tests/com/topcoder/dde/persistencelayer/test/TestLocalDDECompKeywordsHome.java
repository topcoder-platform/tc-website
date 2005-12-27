/*
 * TestLocalDDECompKeywordsHome.java
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
 * contains tests for the local home interface of the DDECompKeywords EJB
 *
 * @author John C. Bollinger
 *
 * @version 1.0
 */
public class TestLocalDDECompKeywordsHome extends PersistenceTestCase {

    /* an instance of the localHome interface implementation to work with */
    private LocalDDECompKeywordsHome localHome;

    /* default field values for entity instances */
    static final private String DEF_KEYWORD = "KEYWORD";

    /**
     * a default constructor for use only by other test cases in this package
     */
    TestLocalDDECompKeywordsHome() {
        this("testCreate");
    }

    /**
     * constructs a new TestLocalDDECompKeywordsHome configured to run the named
     * test
     */
    public TestLocalDDECompKeywordsHome(String testName) {
        this(testName, null);
    }

    /**
     * constructs a new TestLocalDDECategoriesHome configured to run the named
     * test in the specified session context
     */
    public TestLocalDDECompKeywordsHome(String testName, SessionContext sc) {
        super(testName, "COMP_KEYWORDS", sc);
    }

    /**
     * sets up the fixture for this test
     */
    public void setUp() throws Exception {
        super.setUp();
        synchronized (contextLock) {
            localHome = (LocalDDECompKeywordsHome) ctx.lookup(
                    LocalDDECompKeywordsHome.EJB_REF_NAME);
        }
    }

    /*
     * creates a LocalDDECompKeywords entity with default parameters
     */
    LocalDDECompKeywords createDefault(LocalDDECompCatalog component)
            throws Exception {
        return localHome.create(DEF_KEYWORD, component);
    }

    /**
     * tests all entity creation functionality of the bean
     */
    public void testAllCreate() throws Exception {
        /*
         * setting up for a LocalDDECompDocument creation is sufficiently
         * complicated that we do it once (below) and perform all necessary
         * creation tests inside.  The setUp and setUpEJB methods are not
         * sufficient for this because we have to synchronize.
         */
        synchronized (TestLocalDDECompCatalogHome.class) {
            TestLocalDDECompCatalogHome compHome
                    = new TestLocalDDECompCatalogHome();
            LocalDDECompCatalog localComp;

            compHome.setUp();
            localComp = compHome.createDefault();
            assertNotNull(localComp);
            try {
                synchronized (TestLocalDDECompKeywordsHome.class) {
                    /* test standard creation */
                    LocalDDECompKeywords local
                            = createDefault(localComp);
                    assertNotNull(local);
                    try {
                        assertEquals(DEF_KEYWORD, local.getKeyword());
                        assertTrue(local.getCompCatalog().isIdentical(
                                localComp));
                        transactionBoundary();
                        assertMatchesDB(new DDECompKeywordsData(
                                local.getPrimaryKey(),
                                (Long) local.getCompCatalog().getPrimaryKey(),
                                local.getKeyword()
                        ));
                    } finally {
                        local.remove();
                    }
                    /* test null component */
                    local = localHome.create(DEF_KEYWORD, null);
                    assertNotNull(local);
                    local.remove();
                    /* test blank keyword */
                    local = localHome.create("", localComp);
                    assertNotNull(local);
                    local.remove();
                    /* test null keyword */
                    try {
                        local = localHome.create(null, localComp);
                        local.remove();
                        fail("bean creation with null name should have failed");
                    } catch (CreateException ce) {
                        /* expected behavior */
                    }
                }
            } finally {
                localComp.remove();
            }
            compHome.tearDown();
        }
    }

    /**
     * tests the findByPrimaryKey finder method
     */
    public void testFindByPrimaryKey() throws Exception {
        fail("Test not yet implemented");
    }

    /**
     * tests the findByCompVersId finder method
     */
//    public void testFindByComponentId() throws Exception {
//        fail("Test not yet implemented");
//    }

    class DDECompKeywordsData implements RowData {
        long compKeywordsId;
        Long componentId;
        String keyword;

        DDECompKeywordsData(Object id, Long component, String key) {
            this(((Long) id).longValue(), component, key);
        }

        DDECompKeywordsData(long id, Long component, String key) {
            compKeywordsId = id;
            componentId = component;
            keyword = key;
        }

        DDECompKeywordsData(ResultSet rs) throws SQLException {
            readRowData(rs);
        }

        public Object getPrimaryKey() {
            return new Long(compKeywordsId);
        }

        private void updateResultSet(ResultSet rs) throws SQLException {
            if (componentId == null) {
                rs.updateNull("COMPONENT_ID");
            } else {
                rs.updateLong("COMPONENT_ID", componentId.longValue());
            }
            rs.updateString("KEYWORD", keyword);
        }

        public void storeRowData(ResultSet rs) throws SQLException {
            updateResultSet(rs);
            rs.updateRow();
        }

        public void insertRowData(ResultSet rs) throws SQLException {
            rs.moveToInsertRow();
            rs.updateLong("COMP_KEYWORDS_ID", compKeywordsId);
            updateResultSet(rs);
            rs.insertRow();
        }

        public void readRowData(ResultSet rs) throws SQLException {
            compKeywordsId = rs.getLong("COMP_KEYWORDS_ID");
            componentId = new Long(rs.getLong("COMPONENT_ID"));
            if (rs.wasNull()) {
                componentId = null;
            }
            keyword = rs.getString("KEYWORD");
        }

        public boolean matchesResultSet(ResultSet rs) throws SQLException {
            return equals(new DDECompKeywordsData(rs));
        }

        public boolean equals(Object o) {
            if (!(o instanceof DDECompKeywordsData)) {
                return false;
            }
            DDECompKeywordsData d = (DDECompKeywordsData) o;
            return (
                    (compKeywordsId == d.compKeywordsId)
                    && objectsMatch(componentId, d.componentId)
                    && objectsMatch(keyword, d.keyword));
        }
    }

}