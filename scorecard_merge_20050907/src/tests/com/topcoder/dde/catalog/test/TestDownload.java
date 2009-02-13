/*
 * TestDownload.java
 *
 * a JUnit test case for com.topcoder.dde.catalog.Download;
 *
 * By John C. Bollinger
 *
 * Copyright (c) 2002
 */
package com.topcoder.dde.catalog.test;

import com.topcoder.dde.catalog.Download;
import junit.framework.TestCase;

public class TestDownload extends TestCase {

    private static final String DL_DESC = "Test Foo manual";
    private static final String DL_URL = "http://foo.org";

    private Download testDownload = new Download(DL_DESC, DL_URL);

    public TestDownload(String testName) {
        super(testName);
    }

    /*
     * getDescription() and getURL() methods are tested implicitly in the
     * constructor and setter method tests
     * getId() not tested -- no good way to predict the result
     */

    public void testConstructor() {
        assertNotNull("test download is null", testDownload);
        assertEquals("Wrong description", DL_DESC, testDownload.getDescription());
        assertEquals("Wrong URL", DL_URL, testDownload.getURL());
    }

    public void testConstr_NullDescription() {
        Download d;
        try {
            d = new Download(null, DL_URL);
            fail("Expected an IllegalArgumentException");
        } catch (IllegalArgumentException iae) {
            /* the expected case */
        }
    }

    public void testConstr_NullURL() {
        Download d;
        try {
            d = new Download(DL_DESC, null);
            fail("Expected an IllegalArgumentException");
        } catch (IllegalArgumentException iae) {
            /* the expected case */
        }
    }

    public void testSetDescription() throws Exception {
        java.lang.String[] tests = {"", " ", "a", "A", "�", "�", "0123456789", "012345678901234567890", "\n"};

        for (int i = 0; i < tests.length; i++) {
            testDownload.setDescription(tests[i]);
            assertEquals(tests[i], testDownload.getDescription());
        }
    }

    public void testSetDescription_Null() {
        try {
            testDownload.setDescription(null);
            fail("Expected an IllegalArgumentException");
        } catch (IllegalArgumentException iae) {
            /* the expected case */
        }
    }

    public void testSetURL() throws Exception {
        String testURL = "http://foobar/foo.bar.baz";

        testDownload.setURL(testURL);
        assertEquals("URLs not equal", testURL, testDownload.getURL());
    }

    public void testSetURL_Null() {
        try {
            testDownload.setURL(null);
            fail("Expected an IllegalArgumentException");
        } catch (IllegalArgumentException iae) {
            /* the expected case */
        }
    }

    public void testEquals() throws Exception {
        Download doc1 = new Download(DL_DESC, DL_URL);
        Download doc3 = new Download(DL_DESC + "D'oh!", DL_URL);
        Download doc4 = new Download(DL_DESC, DL_URL + "/doh");

        assertEquals("Downloads not equal", testDownload, doc1);
        assertTrue("Downloads unexpectedly equal", !testDownload.equals(doc3));
        assertTrue("Downloads unexpectedly equal", !testDownload.equals(doc4));
    }

    public void testHashCode_ConsistentWithEquals() throws Exception {
        Download doc1 = new Download(DL_DESC, DL_URL);
        Download doc3 = new Download(DL_DESC + "D'oh!", DL_URL);

        assertEquals("Hash codes should match", testDownload.hashCode(),
                doc1.hashCode());
        assertTrue("Hash codes should not match", testDownload.hashCode() !=
                doc3.hashCode());
    }

    public void testToString() throws Exception {
        assertNotNull(testDownload.toString());
    }

}
