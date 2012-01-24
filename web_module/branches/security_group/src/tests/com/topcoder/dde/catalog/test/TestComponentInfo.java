/*
 * TestComponentInfo.java
 *
 * By John C. Bollinger
 *
 * Copyright (c) 2002
 */
package com.topcoder.dde.catalog.test;

import com.topcoder.dde.catalog.ComponentInfo;
import junit.framework.Test;
import junit.framework.TestSuite;

public class TestComponentInfo extends RemoteCatalogTestCase {

    private ComponentInfo info;

    public TestComponentInfo(String testName) {
        super(testName);
    }

    public void setUp() throws Exception {
        super.setUp();
        info = manager.getComponentInfo();
    }

    public void testGetCurrentVersion() throws Exception {
        assertEquals("Wrong current version", 1L, info.getCurrentVersion());
    }

    public void testGetDescription() throws Exception {
        assertEquals("Wrong description", DEF_COMP_DESC, info.getDescription());
    }

    public void testGetFunctionalDescription() throws Exception {
        assertEquals("Wrong functional description", DEF_COMP_FUNCTIONAL,
                info.getFunctionalDescription());
    }

    public void testGetKeywords() throws Exception {
        assertEquals("Wrong keywords", DEF_COMP_KEYWORDS, info.getKeywords());
    }

    public void testGetName() throws Exception {
        assertEquals("Wrong name", DEF_COMP_NAME, info.getName());
    }

    public void testGetShortDescription() throws Exception {
        assertEquals("Wrong short description", DEF_COMP_SHORTD,
                info.getShortDescription());
    }

    public void testGetStatus() throws Exception {
        assertEquals("Wrong status", ComponentInfo.REQUESTED,
                info.getStatus());
    }

    public void testSetDescription() throws Exception {
        String newVal = "Test Description " + idGen.nextId();
        info.setDescription(newVal);
        assertEquals(newVal, info.getDescription());
    }

    public void testSetDescription_Null() throws Exception {
        try {
            info.setDescription(null);
            fail("Expected an IllegalArgumentException");
        } catch (IllegalArgumentException iae) {
            /* the expected case */
        }
    }

    public void testSetFunctionalDescription() throws Exception {
        String newVal = "Test Functional Description " + idGen.nextId();
        info.setFunctionalDescription(newVal);
        assertEquals(newVal, info.getFunctionalDescription());
    }

    public void testSetFunctionalDescription_Null() throws Exception {
        try {
            info.setFunctionalDescription(null);
            fail("Expected an IllegalArgumentException");
        } catch (IllegalArgumentException iae) {
            /* the expected case */
        }
    }

    public void testSetKeywords() throws Exception {
        String newVal = "Test Keywords " + idGen.nextId();
        info.setKeywords(newVal);
        assertEquals(newVal, info.getKeywords());
    }

    public void testSetKeywords_Null() throws Exception {
        try {
            info.setKeywords(null);
            fail("Expected an IllegalArgumentException");
        } catch (IllegalArgumentException iae) {
            /* the expected case */
        }
    }

    public void testSetName() throws Exception {
        String newVal = "Test Name " + idGen.nextId();
        info.setName(newVal);
        assertEquals(newVal, info.getName());
    }

    public void testSetName_Null() throws Exception {
        try {
            info.setName(null);
            fail("Expected an IllegalArgumentException");
        } catch (IllegalArgumentException iae) {
            /* the expected case */
        }
    }

    public void testSetShortDescription() throws Exception {
        String newVal = "Test Short Description " + idGen.nextId();
        info.setShortDescription(newVal);
        assertEquals(newVal, info.getShortDescription());
    }

    public void testSetShortDescription_Null() throws Exception {
        try {
            info.setShortDescription(null);
            fail("Expected an IllegalArgumentException");
        } catch (IllegalArgumentException iae) {
            /* the expected case */
        }
    }

    public void testSetStatus() throws Exception {
        long newVal = ComponentInfo.APPROVED;
        info.setStatus(newVal);
        assertEquals(newVal, info.getStatus());
    }

    public void testSetStatus_Invalid() throws Exception {
        try {
            info.setStatus(-1L);
            fail("Expected an IllegalArgumentException");
        } catch (IllegalArgumentException iae) {
            /* the expected case */
        }
    }

    public void testToString() throws Exception {
        assertNotNull(info.toString());
    }

    public static Test suite() {
        return new CatalogTestSetup(new TestSuite(TestComponentInfo.class));
    }

}