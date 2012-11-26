package com.topcoder.dde.persistencelayer.testbean;

import java.sql.Timestamp;
import javax.ejb.CreateException;
import javax.ejb.FinderException;
import javax.ejb.RemoveException;
import javax.naming.NamingException;

import com.topcoder.dde.persistencelayer.interfaces.LocalDDECompCatalog;
import com.topcoder.dde.persistencelayer.interfaces.LocalDDECompVersions;
import com.topcoder.dde.persistencelayer.interfaces.LocalDDECompVersionsHome;

public final class DDECompVersionsTest extends DDEServerTestCase {

    private static final double PRICE = 10.00;
    private static final String COMMENTS = "VersionsComments1";
    private static final Timestamp CREATE_TIME = currentTimestamp();
    private static final Timestamp PHASE_TIME = currentTimestamp();
    private static final long PHASE_ID = DDEPhaseTest.PHASE_ID;
    private static final String VERSION_TEXT = "CompVersionsVersionText2";

    private static long version = 0;

    private LocalDDECompVersionsHome versionsHome;

    DDECompVersionsTest() {
    }

    private static long getVersion() {
        return version++;
    }

    static LocalDDECompVersions create(LocalDDECompCatalog catalog) throws CreateException {
        try {
            LocalDDECompVersionsHome versionsHome = lookup();
            return versionsHome.create(getVersion(), CREATE_TIME, PHASE_ID, PHASE_TIME, PRICE, COMMENTS, catalog, VERSION_TEXT);
        } catch (NamingException e) {
            throw new CreateException("" + e);
        }
    }

    protected void setUp() throws NamingException {
        versionsHome = lookup();
    }

    private static LocalDDECompVersionsHome lookup() throws NamingException {
        return (LocalDDECompVersionsHome) lookup(LocalDDECompVersionsHome.EJB_REF_NAME);
    }

    public void test() throws Exception {
        Timestamp createTime = CREATE_TIME;
        Timestamp phaseTime = PHASE_TIME;
        double price = PRICE;
        String comments = COMMENTS;
        long phaseId = PHASE_ID;
        String versionText = VERSION_TEXT;
        LocalDDECompCatalog catalog = DDECompCatalogTest.create();
        LocalDDECompVersions versions = create(catalog);
        Long primaryKey = testGetPrimaryKey(versions);
        testGetCreateTime(versions, createTime);
        testGetPhaseTime(versions, phaseTime);
        testGetPrice(versions, price);
        testGetComments(versions, comments);
        testGetCompCatalog(versions, catalog);
        testGetPhase(versions, phaseId);
        testGetVersionText(versions, versionText);
        testRemove(versions, catalog, primaryKey);
    }

    private void testGetVersionText(LocalDDECompVersions versions, String versionText) {
        String versionText2 = versions.getVersionText();
        assertEquals(versionText, versionText2);
    }

    private void testRemove(LocalDDECompVersions versions, LocalDDECompCatalog catalog, Long primaryKey)
            throws RemoveException {
        versions.remove();
        catalog.remove();
        try {
            versionsHome.findByPrimaryKey(primaryKey);
            fail();
        } catch (FinderException e) {
        }
    }

    private void testGetPhase(LocalDDECompVersions versions, long phase) {
        long phase2 = versions.getPhaseId();
        assertEquals(phase, phase2);
    }

    private void testGetCompCatalog(LocalDDECompVersions versions, LocalDDECompCatalog catalog) {
        LocalDDECompCatalog catalog2 = versions.getCompCatalog();
        assertTrue(catalog.isIdentical(catalog2));
    }

    private void testGetComments(LocalDDECompVersions versions, String comments) {
        String comments2 = versions.getComments();
        assertEquals(comments, comments2);
    }

    private void testGetPrice(LocalDDECompVersions versions, double price) {
        double price2 = versions.getPrice();
        assertEquals(0, price, price2);
    }

    private void testGetPhaseTime(LocalDDECompVersions versions, Timestamp phaseTime) {
        Timestamp phaseTime2 = versions.getPhaseTime();
        assertEquals(phaseTime, phaseTime2);
    }

    private void testGetCreateTime(LocalDDECompVersions versions, Timestamp createTime) {
        Timestamp createTime2 = versions.getCreateTime();
        assertEquals(createTime, createTime2);
    }

    private Long testGetPrimaryKey(LocalDDECompVersions versions) throws FinderException {
        Long primaryKey = (Long) versions.getPrimaryKey();
        LocalDDECompVersions versions2 = versionsHome.findByPrimaryKey(primaryKey);
        assertTrue(versions.isIdentical(versions2));
        return primaryKey;
    }

}
