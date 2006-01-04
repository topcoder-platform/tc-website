package com.topcoder.dde.persistencelayer.testbean;

import javax.ejb.CreateException;
import javax.ejb.FinderException;
import javax.ejb.RemoveException;
import javax.naming.NamingException;

import com.topcoder.dde.persistencelayer.interfaces.LocalDDELicenseLevel;
import com.topcoder.dde.persistencelayer.interfaces.LocalDDELicenseLevelHome;

public final class DDELicenseLevelTest extends DDEServerTestCase {

    private static final String DESCRIPTION = "ExamplesDesc5";
    private static final double PRICE_MULTIPLIER = 2.5;
    private static final long STATUS_ID = DDEStatusTest.STATUS_ID;

    private LocalDDELicenseLevelHome licenseLevelHome;

    DDELicenseLevelTest() {
    }

    static LocalDDELicenseLevel create() throws CreateException {
        try {
            LocalDDELicenseLevelHome licenseLevelHome = lookup();
            return licenseLevelHome.create(PRICE_MULTIPLIER, DESCRIPTION, STATUS_ID);
        } catch (NamingException e) {
            throw new CreateException("" + e);
        }
    }

    protected void setUp() throws NamingException {
        licenseLevelHome = lookup();
    }

    private static LocalDDELicenseLevelHome lookup() throws NamingException {
        return (LocalDDELicenseLevelHome) lookup(LocalDDELicenseLevelHome.EJB_REF_NAME);
    }

    public void test() throws Exception {
        String description = DESCRIPTION;
        double priceMultiplier = PRICE_MULTIPLIER;
        long statusId = STATUS_ID;
        LocalDDELicenseLevel licenseLevel = create();
        Long primaryKey = testGetPrimaryKey(licenseLevel);
        testGetDescription(licenseLevel, description);
        testGetPriceMultiplier(licenseLevel, priceMultiplier);
        testGetStatusId(licenseLevel, statusId);
        testRemove(licenseLevel, primaryKey);
    }

    private void testGetStatusId(LocalDDELicenseLevel licenseLevel, long statusId) {
        long statusId2 = licenseLevel.getStatusId();
        assertEquals(statusId, statusId2);
    }

    private void testGetPriceMultiplier(LocalDDELicenseLevel licenseLevel, double priceMultiplier) {
        double priceMultiplier2 = licenseLevel.getPriceMultiplier();
        assertEquals(priceMultiplier, priceMultiplier2, 0);
    }

    private void testGetDescription(LocalDDELicenseLevel licenseLevel, String description) {
        String description2 = licenseLevel.getDescription();
        assertEquals(description, description2);
    }

    private void testRemove(LocalDDELicenseLevel licenseLevel, Long primaryKey) throws RemoveException {
        licenseLevel.remove();
        try {
            licenseLevelHome.findByPrimaryKey(primaryKey);
            fail();
        } catch (FinderException e) {
        }
    }

    private Long testGetPrimaryKey(LocalDDELicenseLevel licenseLevel) throws FinderException {
        Long primaryKey = (Long) licenseLevel.getPrimaryKey();
        LocalDDELicenseLevel licenseLevel2 = licenseLevelHome.findByPrimaryKey(primaryKey);
        assertTrue(licenseLevel.isIdentical(licenseLevel2));
        return primaryKey;
    }

}
