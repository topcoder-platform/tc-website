/*
 * TestLocalDDEUserContactHome.java
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
 * contains tests for the local home interface of the DDEUserContact EJB
 *
 * @author John C. Bollinger
 *
 * @version 1.0
 */
public class TestLocalDDEUserContactHome extends PersistenceTestCase {

    /* an instance of the localHome interface implementation to work with */
    private LocalDDEUserContactHome localHome;

    /* default field values for entity instances */
    private static final String DEF_INFO = "Don't call me -- I'll call you";

    /**
     * a default constructor for use only by other test cases in this package
     */
    TestLocalDDEUserContactHome() {
        this("testCreate");
    }

    /**
     * constructs a new TestLocalDDEUserContactHome configured to run the named
     * test
     */
    public TestLocalDDEUserContactHome(String testName) {
        this(testName, null);
    }

    /**
     * constructs a new TestLocalDDECategoriesHome configured to run the named
     * test in the specified session context
     */
    public TestLocalDDEUserContactHome(String testName, SessionContext sc) {
        super(testName, "USER_CONTACT", sc);
    }

    /**
     * sets up the fixture for this test
     */
    public void setUp() throws Exception {
        super.setUp();
        synchronized (contextLock) {
            localHome = (LocalDDEUserContactHome) ctx.lookup(
                    LocalDDEUserContactHome.EJB_REF_NAME);
        }
    }

    /*
     * creates a LocalDDEUserContact entity with default parameters
     */
    LocalDDEUserContact createDefault(LocalDDEUserMaster master,
                                      LocalDDEContactType type) throws Exception {
        return localHome.create(DEF_INFO, master, type);
    }

    /**
     * tests all entity creation functionality of the bean
     */
    public void testAllCreate() throws Exception {
        synchronized (TestLocalDDEUserMasterHome.class) {
            LocalDDEUserMaster localMaster;
            TestLocalDDEUserMasterHome masterHome =
                    new TestLocalDDEUserMasterHome();

            masterHome.setUp();
            localMaster = masterHome.createDefault();
            assertNotNull(localMaster);
            try {
                synchronized (TestLocalDDEContactTypeHome.class) {
                    LocalDDEContactType localType;
                    TestLocalDDEContactTypeHome typeHome =
                            new TestLocalDDEContactTypeHome();

                    typeHome.setUp();
                    localType = typeHome.createDefault();
                    assertNotNull(localType);
                    try {
                        synchronized (TestLocalDDEUserContactHome.class) {
                            /* test normal creation */
                            LocalDDEUserContact local = createDefault(localMaster,
                                    localType);
                            assertNotNull(local);
                            try {
                                assertEquals(DEF_INFO, local.getContactInfo());
                                assertTrue(localMaster.isIdentical(
                                        local.getUserMaster()));
                                assertTrue(localType.isIdentical(
                                        local.getContactType()));
                            } finally {
                                local.remove();
                            }

                            /* test creation with null user */
                            local = createDefault(null, localType);
                            assertNotNull(local);
                            local.remove();
                            /* test creation with null type */
                            local = createDefault(localMaster, null);
                            assertNotNull(local);
                            local.remove();
                        }
                    } finally {
                        localType.remove();
                        typeHome.tearDown();
                    }
                }
            } finally {
                localMaster.remove();
                masterHome.tearDown();
            }
        }
    }

    public void testFindByPrimaryKey() {
        fail("Test not yet implemented");
    }

    class DDEUserContactData implements RowData {
        long userContactId;
        Long contactTypeId;
        Long loginId;
        String contactInfo;

        DDEUserContactData(Object id, Long type, Long login, String info) {
            this(keyToLong(id), type, login, info);
        }

        DDEUserContactData(long id, Long type, Long login, String info) {
            userContactId = id;
            contactTypeId = type;
            loginId = login;
            contactInfo = info;
        }

        DDEUserContactData(ResultSet rs) throws SQLException {
            readRowData(rs);
        }

        public Object getPrimaryKey() {
            return new Long(userContactId);
        }

        private void updateResultSet(ResultSet rs) throws SQLException {
            if (contactTypeId == null) {
                rs.updateNull("CONTACT_TYPE_ID");
            } else {
                rs.updateLong("CONTACT_TYPE_ID", contactTypeId.longValue());
            }
            if (loginId == null) {
                rs.updateNull("LOGIN_ID");
            } else {
                rs.updateLong("LOGIN_ID", loginId.longValue());
            }
            rs.updateString("CONTACT_INFO", contactInfo);
        }

        public void storeRowData(ResultSet rs) throws SQLException {
            updateResultSet(rs);
            rs.updateRow();
        }

        public void insertRowData(ResultSet rs) throws SQLException {
            rs.moveToInsertRow();
            rs.updateLong("USER_CONTACT_ID", userContactId);
            updateResultSet(rs);
            rs.insertRow();
        }

        public void readRowData(ResultSet rs) throws SQLException {
            long l;

            userContactId = rs.getLong("USER_CONTACT_ID");
            l = rs.getLong("CONTACT_TYPE_ID");
            if (rs.wasNull()) {
                contactTypeId = null;
            } else {
                contactTypeId = new Long(l);
            }
            l = rs.getLong("LOGIN_ID");
            if (rs.wasNull()) {
                loginId = null;
            } else {
                loginId = new Long(l);
            }
            contactInfo = rs.getString("CONTACT_INFO");
        }

        public boolean matchesResultSet(ResultSet rs) throws SQLException {
            return equals(new DDEUserContactData(rs));
        }

        public boolean equals(Object o) {
            if (!(o instanceof DDEUserContactData)) {
                return false;
            }
            DDEUserContactData d = (DDEUserContactData) o;
            return (
                    (userContactId == d.userContactId)
                    && objectsMatch(contactTypeId, d.contactTypeId)
                    && objectsMatch(loginId, d.loginId)
                    && objectsMatch(contactInfo, d.contactInfo));
        }


    }

}