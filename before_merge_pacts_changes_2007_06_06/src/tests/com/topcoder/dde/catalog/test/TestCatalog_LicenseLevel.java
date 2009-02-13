/*
 * TestCatalog_LicenseLevel.java
 *
 * By John C. Bollinger
 *
 * Copyright (c) 2002
 */
package com.topcoder.dde.catalog.test;

import com.topcoder.dde.catalog.Catalog;
import com.topcoder.dde.catalog.LicenseLevel;
import com.topcoder.dde.catalog.CatalogException;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;

import junit.framework.Test;
import junit.framework.TestSuite;

/**
 * a JUnit testcase exercising the LicenseLevel management of the Catalog EJB
 *
 * @author John C. Bollinger
 * @version 1.0
 */
public class TestCatalog_LicenseLevel extends RemoteCatalogTestCase {

    protected LicenseLevel level;
    protected Catalog catalog;

    public TestCatalog_LicenseLevel(String testName) {
        super(testName);
    }

    public void setUp() throws Exception {
        super.setUp();
        catalog = catalogHome.create();
        level = new LicenseLevel(
                "A license level for testing #" + idGen.nextId(), 0.2d);
    }

    public void tearDown() throws Exception {
        catalog.remove();
        super.tearDown();
    }

    public void testAddLicenseLevel() throws Exception {
        LicenseLevel l2 = catalog.addLicenseLevel(level);
        try {
            assertEquals("LicenseLevel not added correctly", level,
                    catalog.getLicenseLevel(l2.getId()));
        } finally {
            catalog.removeLicenseLevel(l2.getId());
        }
    }

    public void testAddLicenseLevel_Null() throws Exception {
        try {
            catalog.addLicenseLevel(null);
            fail("Expected a CatalogException");
        } catch (CatalogException ce) {
            /* the expected case */
        }
    }

    public void testAddLicenseLevel_Duplicate() throws Exception {
        LicenseLevel l2 = catalog.addLicenseLevel(level);
        try {
            catalog.addLicenseLevel(l2);
            fail("Expected a CatalogException");
        } catch (CatalogException ce) {
            /* the expected case */
        } finally {
            catalog.removeLicenseLevel(l2.getId());
        }
    }

    public void testGetLicenseLevels() throws Exception {
        ArrayList active = new ArrayList();
        ArrayList deleted = new ArrayList();
        Collection licenseLevels;

        active.add(catalog.addLicenseLevel(level));
        active.add(catalog.addLicenseLevel(new LicenseLevel(
                "A license level for testing #" + idGen.nextId(), 0.9d)));
        active.add(catalog.addLicenseLevel(new LicenseLevel(
                "A license level for testing #" + idGen.nextId(), 0.5d)));
        level = catalog.addLicenseLevel(new LicenseLevel(
                "A license level for testing #" + idGen.nextId(), 1.0d));
        catalog.removeLicenseLevel(level.getId());
        deleted.add(level);
        level = catalog.addLicenseLevel(new LicenseLevel(
                "A license level for testing #" + idGen.nextId(), 1.0d));
        catalog.removeLicenseLevel(level.getId());
        deleted.add(level);

        licenseLevels = catalog.getLicenseLevels();

        try {
            Iterator it = licenseLevels.iterator();
            assertTrue("Missing active License Levels",
                    licenseLevels.containsAll(active));
            deleted.retainAll(licenseLevels);
            assertEquals("Retrieved deleted License Levels", 0, deleted.size());
            double last = ((LicenseLevel) it.next()).getPriceMultiplier();
            while (it.hasNext()) {
                double next = ((LicenseLevel) it.next()).getPriceMultiplier();
                assertTrue("License levels out of order", next >= last);
                last = next;
            }
        } finally {
            Iterator it = active.iterator();
            while (it.hasNext()) {
                LicenseLevel l2 = (LicenseLevel) it.next();
                catalog.removeLicenseLevel(l2.getId());
            }

        }
    }

    public void testGetLicenseLevel_Missing() throws Exception {
        try {
            catalog.getLicenseLevel(idGen.nextId());
            fail("Expected a CatalogException");
        } catch (CatalogException ce) {
            /* the expected case */
        }
    }
/*
 * removeLicenseLevel test implicitly in the getLicenseLevels test
 *
    public void testRemoveLicenseLevel() throws Exception {
        LicenseLevel l2 = catalog.addLicenseLevel(level);
        catalog.removeLicenseLevel(l2.getId());
        assertTrue("License Level not removed",
                   !catalog.getLicenseLevels().contains(l2));
    }
 */

    public void testRemoveLicenseLevel_Missing() throws Exception {
        try {
            catalog.removeLicenseLevel(idGen.nextId());
            fail("Expected a CatalogException");
        } catch (CatalogException ce) {
            /* the expected case */
        }
    }

    public void testUpdateLicenseLevel() throws Exception {
        LicenseLevel l2 = catalog.addLicenseLevel(level);
        l2.setPriceMultiplier(0.5d);
        catalog.updateLicenseLevel(l2);
        try {
            assertEquals("LicenseLevel update not successful", l2,
                    catalog.getLicenseLevel(l2.getId()));
        } finally {
            catalog.removeLicenseLevel(l2.getId());
        }
    }

    public void testUpdateLicenseLevel_Missing() throws Exception {
        try {
            catalog.updateLicenseLevel(level);
            fail("Expected a CatalogException");
        } catch (CatalogException ce) {
            /* the expected case */
        }
    }

    public void testUpdateLicenseLevel_Null() throws Exception {
        try {
            catalog.updateLicenseLevel(null);
            fail("Expected a CatalogException");
        } catch (CatalogException ce) {
            /* the expected case */
        }
    }

    public static Test suite() {
        return new CatalogTestSetup(new TestSuite(TestCatalog_LicenseLevel.class));
    }

}