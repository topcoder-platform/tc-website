package com.topcoder.dde.persistencelayer.testbean;

import java.sql.Timestamp;
import javax.ejb.FinderException;
import javax.ejb.RemoveException;
import javax.naming.NamingException;

import com.topcoder.dde.persistencelayer.interfaces.LocalDDECompCatalog;
import com.topcoder.dde.persistencelayer.interfaces.LocalDDECompDownload;
import com.topcoder.dde.persistencelayer.interfaces.LocalDDECompVersions;
import com.topcoder.dde.persistencelayer.interfaces.LocalDDEDownloadTracking;
import com.topcoder.dde.persistencelayer.interfaces.LocalDDEDownloadTrackingHome;
import com.topcoder.dde.persistencelayer.interfaces.LocalDDELicenseLevel;
import com.topcoder.dde.persistencelayer.interfaces.LocalDDEUserMaster;

public final class DDEDownloadTrackingTest extends DDEServerTestCase {

    private LocalDDEDownloadTrackingHome downloadTrackingHome;

    DDEDownloadTrackingTest() {
    }

    protected void setUp() throws NamingException {
        downloadTrackingHome = (LocalDDEDownloadTrackingHome) lookup(LocalDDEDownloadTrackingHome.EJB_REF_NAME);
    }

    public void test() throws Exception {
        LocalDDECompCatalog catalog = DDECompCatalogTest.create();
        LocalDDECompVersions versions = DDECompVersionsTest.create(catalog);
        LocalDDEUserMaster userMaster = DDEUserMasterTest.create();
        Timestamp createTime = currentTimestamp();
        double price = 1.0;
        LocalDDELicenseLevel licenseLevel = DDELicenseLevelTest.create();
        LocalDDECompDownload compDownload = DDECompDownloadTest.create(versions);
        long unitCost = 3;
        LocalDDEDownloadTracking downloadTracking = downloadTrackingHome.create(price, createTime, versions, userMaster,
                licenseLevel, compDownload, unitCost);
        Long primaryKey = testGetPrimaryKey(downloadTracking);
        testGetCompVersions(downloadTracking, versions);
        testGetUserMaster(downloadTracking, userMaster);
        testGetCreateTime(downloadTracking, createTime);
        testGetPrice(downloadTracking, price);
        testGetUnitCost(downloadTracking, unitCost);
        testRemove(compDownload, licenseLevel, downloadTracking, versions, catalog, primaryKey);
    }

    private void testGetUnitCost(LocalDDEDownloadTracking downloadTracking, long unitCost) {
        long unitCost2 = downloadTracking.getUnitCost();
        assertEquals(unitCost, unitCost2);
    }

    private void testRemove(LocalDDECompDownload compDownload, LocalDDELicenseLevel licenseLevel, LocalDDEDownloadTracking downloadTracking, LocalDDECompVersions versions, LocalDDECompCatalog catalog, Long primaryKey) throws RemoveException {
        compDownload.remove();
        licenseLevel.remove();
        downloadTracking.remove();
        versions.remove();
        catalog.remove();
        try {
            downloadTrackingHome.findByPrimaryKey(primaryKey);
            fail();
        } catch (FinderException e) {
        }
    }

    private void testGetPrice(LocalDDEDownloadTracking downloadTracking, double price) {
        double price2 = downloadTracking.getPrice();
        assertEquals(price, price2, 0);
    }

    private void testGetCreateTime(LocalDDEDownloadTracking downloadTracking, Timestamp createTime) {
        Timestamp createTime2 = downloadTracking.getCreateTime();
        assertEquals(createTime, createTime2);
    }

    private void testGetUserMaster(LocalDDEDownloadTracking downloadTracking, LocalDDEUserMaster userMaster) {
        LocalDDEUserMaster userMaster2 = downloadTracking.getUserMaster();
        assertTrue(userMaster.isIdentical(userMaster2));
    }

    private void testGetCompVersions(LocalDDEDownloadTracking downloadTracking, LocalDDECompVersions versions) {
        LocalDDECompVersions versions2 = downloadTracking.getCompVersions();
        assertTrue(versions.isIdentical(versions2));
    }

    private Long testGetPrimaryKey(LocalDDEDownloadTracking downloadTracking) throws FinderException {
        Long primaryKey = (Long) downloadTracking.getPrimaryKey();
        LocalDDEDownloadTracking downloadTracking2 = downloadTrackingHome.findByPrimaryKey(primaryKey);
        assertTrue(downloadTracking.isIdentical(downloadTracking2));
        return primaryKey;
    }

}
