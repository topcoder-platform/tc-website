/*
 * TestLicenseLevel.java
 *
 * By John C. Bollinger
 *
 * Copyright (c) 2002
 */
package com.topcoder.dde.catalog.test;

import com.topcoder.dde.catalog.LicenseLevel;
import junit.framework.*;
import junit.framework.Test;
import junit.framework.TestSuite;

public class TestLicenseLevel extends RemoteCatalogTestCase {

    private final static String LEVEL_DESCRIPTION = "Big Customer";
    private final static double LEVEL_PRICE_MULT = 0.95d;

    private LicenseLevel testLicenseLevel =
            new LicenseLevel(LEVEL_DESCRIPTION, LEVEL_PRICE_MULT);

    public TestLicenseLevel(String testName) {
        super(testName);
    }

    /*
     * getName and getDescription methods tested implicitly in the constructor
     * and setter method tests.  getId not tested because there is no good way
     * to determine the correct return value.
     */

    public void testConstructor() {
        assertNotNull("test license level is null", testLicenseLevel);
        assertEquals("Wrong description", LEVEL_DESCRIPTION,
                testLicenseLevel.getDescription());
        assertEquals("Wrong multiplier", LEVEL_PRICE_MULT,
                testLicenseLevel.getPriceMultiplier(), 0.0d);
    }

    public void testConstr_NullDesc() {
        try {
            testLicenseLevel = new LicenseLevel(null, LEVEL_PRICE_MULT);
            fail("Accepted null technology name");
        } catch (IllegalArgumentException iae) {
            /* the expected behavior */
        }
    }

    public void testEquals() {
        LicenseLevel level2 = new LicenseLevel(LEVEL_DESCRIPTION,
                LEVEL_PRICE_MULT);
        LicenseLevel level3 = new LicenseLevel("", LEVEL_PRICE_MULT);
        LicenseLevel level4 = new LicenseLevel(LEVEL_DESCRIPTION,
                LEVEL_PRICE_MULT + 1e-15d);
        assertEquals("Equality failure", testLicenseLevel, level2);
        assertTrue("Inequality failure", !testLicenseLevel.equals(level3));
        assertTrue("Inequality failure", !testLicenseLevel.equals(level4));
    }

    public void testHashCode_ConsistentWithEquals() {
        LicenseLevel level2 = new LicenseLevel(LEVEL_DESCRIPTION,
                LEVEL_PRICE_MULT);
        LicenseLevel level3 = new LicenseLevel("", LEVEL_PRICE_MULT);
        LicenseLevel level4 = new LicenseLevel(LEVEL_DESCRIPTION,
                LEVEL_PRICE_MULT + 1e-15d);
        assertEquals("Hash codes should match", testLicenseLevel.hashCode(),
                level2.hashCode());
        assertTrue("Hash codes should not match",
                testLicenseLevel.hashCode() != level3.hashCode());
        assertTrue("Hash codes should not match",
                testLicenseLevel.hashCode() != level4.hashCode());
    }

    public void testSetDescription() {
        testLicenseLevel.setDescription("Little Customer");
        assertEquals("Description not set correctly", "Little Customer",
                testLicenseLevel.getDescription());
    }

    public void testSetDescription_Null() {
        try {
            testLicenseLevel.setDescription(null);
            fail("Accepted null technology description");
        } catch (IllegalArgumentException iae) {
            /* the expected behavior */
        }
    }


    public void testSetPriceMultiplier() {
        testLicenseLevel.setPriceMultiplier(0.90d);
        assertEquals("Multiplier not set correctly", 0.90d,
                testLicenseLevel.getPriceMultiplier(), 0.0d);
    }

    public void testGetPricePerUnit() {
        assertEquals("Wrong price per unit", 0.0d,
                testLicenseLevel.getPricePerUnit(), 0.0d);
    }

    public void testToString() {
        assertNotNull(testLicenseLevel.toString());  // not much we can test
    }

    public static Test suite() {
        return new CatalogTestSetup(new TestSuite(TestLicenseLevel.class));
    }

}