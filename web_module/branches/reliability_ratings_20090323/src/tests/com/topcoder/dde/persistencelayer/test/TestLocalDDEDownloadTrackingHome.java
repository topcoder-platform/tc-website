/*
 * TestLocalDDEDownloadTrackingHome.java
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

/**
 * contains tests for the local home interface of the DDEDownloadTracking EJB
 *
 * @author John C. Bollinger
 *
 * @version 1.0
 */
public class TestLocalDDEDownloadTrackingHome extends PersistenceTestCase {

    /* an instance of the localHome interface implementation to work with */
    private LocalDDEDownloadTrackingHome localHome;

    /* default field values for entity instances */
    static final private Timestamp DEF_CREATE_TIME
            = new Timestamp(System.currentTimeMillis());
    static final private double DEF_PRICE = 1999.95d;
    static final private long DEF_UNIT_COST = 3L;

    /**
     * a default constructor for use only by other test cases in this package
     */
    TestLocalDDEDownloadTrackingHome() {
        this("testCreate");
    }

    /**
     * constructs a new TestLocalDDEDownloadTrackingHome configured to run the named
     * test
     */
    public TestLocalDDEDownloadTrackingHome(String testName) {
        this(testName, null);
    }

    /**
     * constructs a new TestLocalDDECategoriesHome configured to run the named
     * test in the specified session context
     */
    public TestLocalDDEDownloadTrackingHome(String testName, SessionContext sc) {
        super(testName, "DOWNLOAD_TRACKING", sc);
        pkFieldName = "DOWNLOAD_TRACK_ID";
    }

    /**
     * sets up the fixture for this test
     */
    public void setUp() throws Exception {
        super.setUp();
        synchronized (contextLock) {
            localHome = (LocalDDEDownloadTrackingHome) ctx.lookup(
                    LocalDDEDownloadTrackingHome.EJB_REF_NAME);
        }
    }

    /*
     * creates a LocalDDEDownloadTracking entity with default parameters
     */
    LocalDDEDownloadTracking createDefault(LocalDDECompVersions version,
                                           LocalDDEUserMaster master, LocalDDELicenseLevel license,
                                           LocalDDECompDownload download) throws Exception {
        return localHome.create(DEF_PRICE, DEF_CREATE_TIME, version, master,
                license, download, DEF_UNIT_COST);
    }

    /**
     * tests all entity creation functionality of the bean
     */
    public void testAllCreate() throws Exception {
        /*
         * This is messy because we need to obtain a LocalDDECompVersions object
         * and a LocalDDEUserMaster object in order to create a
         * LocalDDEDownloadTracking.  Because the setup is so involved, there are
         * several logically different tests bundled together here.
         */
        synchronized (TestLocalDDECompCatalogHome.class) {
            LocalDDECompCatalog localComponent;
            TestLocalDDECompCatalogHome compHome =
                    new TestLocalDDECompCatalogHome();

            compHome.setUp();
            localComponent = compHome.createDefault();
            assertNotNull(localComponent);
            try {
                synchronized (TestLocalDDECompVersionsHome.class) {
                    LocalDDECompVersions localVersion;
                    TestLocalDDECompVersionsHome versionsHome =
                            new TestLocalDDECompVersionsHome();
                    versionsHome.setUp();
                    localVersion = versionsHome.createDefault(localComponent);
                    assertNotNull(localVersion);
                    try {
                        synchronized (TestLocalDDEUserMasterHome.class) {
                            LocalDDEUserMaster localMaster;
                            TestLocalDDEUserMasterHome masterHome
                                    = new TestLocalDDEUserMasterHome();
                            masterHome.setUp();
                            localMaster = masterHome.createDefault();
                            assertNotNull(localMaster);
                            try {
                                synchronized (TestLocalDDELicenseLevelHome.class) {
                                    LocalDDELicenseLevel localLicense;
                                    TestLocalDDELicenseLevelHome licenseHome
                                            = new TestLocalDDELicenseLevelHome();
                                    licenseHome.setUp();
                                    localLicense = licenseHome.createDefault();
                                    assertNotNull(localLicense);
                                    try {
                                        synchronized (TestLocalDDECompDownloadHome.class) {
                                            LocalDDECompDownload localDownload;
                                            TestLocalDDECompDownloadHome downloadHome
                                                    = new TestLocalDDECompDownloadHome();
                                            downloadHome.setUp();
                                            localDownload = downloadHome.createDefault(localVersion);
                                            assertNotNull(localDownload);
                                            try {

                                                synchronized (TestLocalDDEDownloadTrackingHome.class) {
                                                    /* test normal creation */
                                                    LocalDDEDownloadTracking local =
                                                            createDefault(localVersion,
                                                                    localMaster,
                                                                    localLicense,
                                                                    localDownload);
                                                    assertNotNull(local);
                                                    try {
                                                        assertEquals(DEF_CREATE_TIME,
                                                                local.getCreateTime());
                                                        assertTrue(localVersion.isIdentical(
                                                                local.getCompVersions()));
                                                        assertTrue(localMaster.isIdentical(
                                                                local.getUserMaster()));
                                                        /* test create duplicate */
                                                        try {
                                                            LocalDDEDownloadTracking local2 =
                                                                    createDefault(localVersion,
                                                                            localMaster,
                                                                            localLicense,
                                                                            localDownload);
                                                            local2.remove();
                                                            fail("Expected a CreateException");
                                                        } catch (CreateException ce) {
                                                            /* the expected behavior */
                                                        }
                                                    } finally {
                                                        local.remove();
                                                    }

                                                    /* test creation with null component version */
                                                    local = localHome.create(DEF_PRICE,
                                                            DEF_CREATE_TIME,
                                                            null, localMaster,
                                                            localLicense, localDownload,
                                                            DEF_UNIT_COST);
                                                    assertNotNull(local);
                                                    local.remove();
                                                    /* test creation with null user */
                                                    local = localHome.create(DEF_PRICE,
                                                            DEF_CREATE_TIME,
                                                            localVersion, null,
                                                            localLicense, localDownload,
                                                            DEF_UNIT_COST);
                                                    assertNotNull(local);
                                                    local.remove();
                                                }

                                            } finally {
                                                localDownload.remove();
                                            }
                                        }
                                    } finally {
                                        localLicense.remove();
                                    }
                                }
                            } finally {
                                localMaster.remove();
                            }
                        }
                    } finally {
                        localVersion.remove();
                    }
                }
            } finally {
                localComponent.remove();
            }
        }
    }

    public void testFindByPrimaryKey() {
        fail("Test not yet implemented");
    }

    class DDEDownloadTrackingData implements RowData {
        long downloadTrackId;
        Long compVersId;
        Long loginId;
        Long licenseLevelId;
        Long downloadId;
        long unitCost;
        double price;
        Timestamp createTime;

        DDEDownloadTrackingData(Object id, Long version, Long login,
                                Long license, Long download, long unit, double pr, Timestamp create) {
            this(keyToLong(id), version, login, license, download, unit, pr, create);
        }

        DDEDownloadTrackingData(long id, Long version, Long login,
                                Long license, Long download, long unit, double pr, Timestamp create) {
            downloadTrackId = id;
            compVersId = version;
            loginId = login;
            licenseLevelId = license;
            downloadId = download;
            unitCost = unit;
            price = pr;
            createTime = (Timestamp) create.clone();
        }

        DDEDownloadTrackingData(ResultSet rs) throws SQLException {
            readRowData(rs);
        }

        public Object getPrimaryKey() {
            return new Long(downloadTrackId);
        }

        private void updateResultSet(ResultSet rs) throws SQLException {
            if (compVersId == null) {
                rs.updateNull("COMP_VERS_ID");
            } else {
                rs.updateLong("COMP_VERS_ID", compVersId.longValue());
            }
            if (loginId == null) {
                rs.updateNull("LOGIN_ID");
            } else {
                rs.updateLong("LOGIN_ID", loginId.longValue());
            }
            if (licenseLevelId == null) {
                rs.updateNull("LICENSE_LEVEL_ID");
            } else {
                rs.updateLong("LICENSE_LEVEL_ID", licenseLevelId.longValue());
            }
            if (downloadId == null) {
                rs.updateNull("DOWNLOAD_ID");
            } else {
                rs.updateLong("DOWNLOAD_ID", downloadId.longValue());
            }
            rs.updateLong("UNIT_COST", unitCost);
            rs.updateDouble("PRICE", price);
            rs.updateTimestamp("CREATE_TIME", createTime);
        }

        public void storeRowData(ResultSet rs) throws SQLException {
            updateResultSet(rs);
            rs.updateRow();
        }

        public void insertRowData(ResultSet rs) throws SQLException {
            rs.moveToInsertRow();
            rs.updateLong("DOWNLOAD_TRACK_ID", downloadTrackId);
            updateResultSet(rs);
            rs.insertRow();
        }

        public void readRowData(ResultSet rs) throws SQLException {
            long l;

            downloadTrackId = rs.getLong("DOWNLOAD_TRACK_ID");
            l = rs.getLong("COMP_VERS_ID");
            if (rs.wasNull()) {
                compVersId = null;
            } else {
                compVersId = new Long(l);
            }
            l = rs.getLong("LOGIN_ID");
            if (rs.wasNull()) {
                loginId = null;
            } else {
                loginId = new Long(l);
            }
            l = rs.getLong("LICENSE_LEVEL_ID");
            if (rs.wasNull()) {
                licenseLevelId = null;
            } else {
                licenseLevelId = new Long(l);
            }
            l = rs.getLong("DOWNLOAD_ID");
            if (rs.wasNull()) {
                downloadId = null;
            } else {
                downloadId = new Long(l);
            }
            unitCost = rs.getLong("UNIT_COST");
            price = rs.getDouble("PRICE");
            createTime = rs.getTimestamp("CREATE_TIME");
        }

        public boolean matchesResultSet(ResultSet rs) throws SQLException {
            return equals(new DDEDownloadTrackingData(rs));
        }

        public boolean equals(Object o) {
            if (!(o instanceof DDEDownloadTrackingData)) {
                return false;
            }
            DDEDownloadTrackingData d = (DDEDownloadTrackingData) o;
            return (
                    (downloadTrackId == d.downloadTrackId)
                    && objectsMatch(compVersId, d.compVersId)
                    && objectsMatch(loginId, d.loginId)
                    && objectsMatch(licenseLevelId, d.licenseLevelId)
                    && objectsMatch(downloadId, d.downloadId)
                    && (unitCost == d.unitCost)
                    && (Math.abs(price - d.price) < 0.001)
                    && objectsMatch(createTime, d.createTime));
        }

    }

}