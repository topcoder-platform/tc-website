/*
 * TestDownloadPermission.java
 *
 * By John C. Bollinger
 *
 * Copyright (c) 2002
 */
package com.topcoder.dde.catalog.test;

import com.topcoder.dde.catalog.DownloadPermission;
import junit.framework.TestCase;

public class TestDownloadPermission extends TestCase {

    public TestDownloadPermission(String testName) {
        super(testName);
    }

    public void testEquals() {
        assertEquals("Like DownloadPermissions not equal",
                new DownloadPermission(1L), new DownloadPermission(1L));
    }

    public void testEquals_Unequal() {
        assertTrue("Unlike DownloadPermissions equal",
                !(new DownloadPermission(1L)).equals(
                        new DownloadPermission(2L)));
    }

    public void testHashCode() {
        assertEquals("Equal DownloadPermissions have different hashCodes",
                (new DownloadPermission(1L)).hashCode(),
                (new DownloadPermission(1L)).hashCode());
        assertTrue("Unequal DownloadPermissions have the same hashCode",
                (new DownloadPermission(1L)).hashCode() !=
                (new DownloadPermission(0x0000000100000001L)).hashCode());
    }
}