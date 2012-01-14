/*
 * TestComponentVersionInfo.java
 *
 * By John C. Bollinger
 *
 * Copyright (c) 2002
 */
package com.topcoder.dde.catalog.test;

import com.topcoder.dde.catalog.ComponentVersionInfo;

import java.util.Date;

import junit.framework.Test;
import junit.framework.TestSuite;

public class TestComponentVersionInfo extends RemoteCatalogTestCase {

    private ComponentVersionInfo info;

    public TestComponentVersionInfo(String testName) {
        super(testName);
    }

    public void setUp() throws Exception {
        super.setUp();
        info = manager.getVersionInfo();
    }

    public void testGetComments() {
        assertEquals("Wrong comments", DEF_COMP_COMMENTS, info.getComments());
    }

    public void testGetPhase() {
        assertEquals("Wrong phase", ComponentVersionInfo.COLLABORATION,
                info.getPhase());
    }

    public void testGetPhaseDate() {
        Date pd = info.getPhaseDate();
        assertTrue("wrong Phase Date", pd.compareTo(requestDate1) >= 0);
        assertTrue("wrong Phase Date", pd.compareTo(requestDate2) <= 0);
    }

    public void testGetPrice() {
        assertEquals("Wrong Price", 0d, info.getPrice(), 5d - 3);
    }

    public void testGetVersion() {
        assertEquals("Wrong version", 1L, info.getVersion());
    }

    public void testGetVersionLabel() {
        assertEquals("Wrong version", DEF_COMP_VERSION,
                info.getVersionLabel());
    }

    public void testSetComments() {
        info.setComments("Testing, shmesting.  I'm getting a bagel.");
        assertEquals("Comments not set correctly",
                "Testing, shmesting.  I'm getting a bagel.",
                info.getComments());
    }

    public void testSetComments_Null() {
        try {
            info.setComments(null);
            fail("Expected an IllegalArgumentException");
        } catch (IllegalArgumentException iae) {
            /* the expected case */
        }
    }

    public void testSetPhase() {
        info.setPhase(ComponentVersionInfo.DEVELOPMENT);
        assertEquals("Phase not set correctly",
                ComponentVersionInfo.DEVELOPMENT, info.getPhase());
    }

    public void testSetPhase_Invalid() {
        try {
            info.setPhase(42L);
            fail("Expected an IllegalArgumentException");
        } catch (IllegalArgumentException iae) {
            /* the expected case */
        }
    }

    public void testSetPhaseDate() {
        Date date = new Date();
        info.setPhaseDate(date);
        assertEquals("Phase date not set correctly", date, info.getPhaseDate());
    }

    public void testSetPhaseDate_Null() {
        try {
            info.setPhaseDate(null);
            fail("Expected an IllegalArgumentException");
        } catch (IllegalArgumentException iae) {
            /* the expected case */
        }
    }

    public void testSetPrice() {
        info.setPrice(1999.99d);
        assertEquals("Price not set correctly", 1999.99d, info.getPrice(),
                0.001d);
    }

    public void testSetPrice_Invalid() {
        try {
            info.setPrice(-1.00d);
            fail("Expected an IllegalArgumentException");
        } catch (IllegalArgumentException iae) {
            /* the expected case */
        }
        try {
            info.setPrice(Double.POSITIVE_INFINITY);
            fail("Expected an IllegalArgumentException");
        } catch (IllegalArgumentException iae) {
            /* the expected case */
        }
        try {
            info.setPrice(Double.NaN);
            fail("Expected an IllegalArgumentException");
        } catch (IllegalArgumentException iae) {
            /* the expected case */
        }
    }

    public void testSetVersionLabel() {
        info.setVersionLabel("Foo to you, too");
        assertEquals("Version label not set correctly", "Foo to you, too",
                info.getVersionLabel());
    }

    public void testSetVersionLabel_Null() {
        try {
            info.setVersionLabel(null);
            fail("Expected an IllegalArgumentException");
        } catch (IllegalArgumentException iae) {
            /* the expected case */
        }
    }

    public void testToString() {
        assertNotNull(info.toString());
    }

    public static Test suite() {
        return new CatalogTestSetup(new TestSuite(TestComponentVersionInfo.class));
    }

}
