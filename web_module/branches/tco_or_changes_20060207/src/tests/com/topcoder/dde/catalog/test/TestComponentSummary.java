/*
 * TestComponentSummary.java
 *
 * By John C. Bollinger
 *
 * Copyright (c) 2002
 */
package com.topcoder.dde.catalog.test;

import com.topcoder.dde.catalog.ComponentSummary;
import com.topcoder.dde.catalog.ComponentInfo;
import com.topcoder.dde.catalog.ComponentVersionInfo;

import java.util.Date;

import junit.framework.Test;
import junit.framework.TestSuite;

public class TestComponentSummary extends RemoteCatalogTestCase {

    public TestComponentSummary(String testName) {
        super(testName);
    }

    /*
     * Our ComponentSummary for testing is inherited from RemoteCatalogTestCase
     */

    public void testGetComments() {
        assertEquals("Wrong comments", DEF_COMP_COMMENTS,
                compSummary.getComments());
    }

    public void testGetDescription() {
        assertEquals("Wrong description", DEF_COMP_DESC,
                compSummary.getDescription());
    }

    public void testGetName() {
        assertEquals("Wrong name", DEF_COMP_NAME, compSummary.getName());
    }

    public void testGetPhase() {
        assertEquals("Wrong phase", ComponentVersionInfo.COLLABORATION,
                compSummary.getPhase());
    }

    public void testGetPhaseDate() {
        long phaseDays = compSummary.getPhaseDate().getTime() / (24 * 3600000);
        long preRequestDays = requestDate1.getTime() / (24 * 3600000);
        long postRequestDays = requestDate2.getTime() / (24 * 3600000);
        assertTrue("wrong Phase Date", phaseDays > 1L);
        assertTrue("wrong Phase Date", phaseDays <= postRequestDays);
        assertTrue("wrong Phase Date", phaseDays >= preRequestDays);
    }

    public void testGetPrice() {
        assertEquals("Wrong Price", 0d, compSummary.getPrice(), 5d - 3);
    }

    public void testGetShortDescription() {
        assertEquals("Wrong short description", DEF_COMP_SHORTD,
                compSummary.getShortDescription());
    }

    public void testGetStatus() {
        assertEquals("Wrong status", ComponentInfo.REQUESTED,
                compSummary.getStatus());
    }

    public void testGetVersion() {
        assertEquals("Wrong version", 1L, compSummary.getVersion());
    }

    public void testGetVersionLabel() {
        assertEquals("Wrong version", DEF_COMP_VERSION,
                compSummary.getVersionLabel());
    }

    public void testToString() {
        assertNotNull("toString() returned null", compSummary.toString());
    }

    public void testEquals_Self() {
        assertEquals("Not equal to self", compSummary, compSummary);
    }

    public static Test suite() {
        return new CatalogTestSetup(new TestSuite(TestComponentSummary.class));
    }

}
