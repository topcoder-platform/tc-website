/*
 * TestExample.java
 *
 * a JUnit test case for com.topcoder.dde.catalog.Example;
 *
 * By John C. Bollinger
 *
 * Copyright (c) 2002
 */
package com.topcoder.dde.catalog.test;

import com.topcoder.dde.catalog.Example;

import java.net.URL;

import junit.framework.TestCase;

public class TestExample extends TestCase {

    private static final String EX_DESC = "Test Foo manual";
    private static final String EX_URL = "http://foo.org";

    private Example testExample;

    public TestExample(String testName) {
        super(testName);
    }

    public void setUp() throws Exception {
        super.setUp();
        testExample = new Example(EX_DESC, EX_URL);
    }

    /*
     * getDescription() and getURL() methods are tested implicitly in the
     * constructor and setter method tests
     * getId() not tested -- no good way to predict the result
     */

    public void testConstructor() {
        assertNotNull("test example is null", testExample);
        assertEquals("Wrong description", EX_DESC, testExample.getDescription());
        assertEquals("Wrong URL", EX_URL, testExample.getURL());
    }

    public void testConstr_NullDescription() {
        Example d;
        try {
            d = new Example(null, EX_URL);
            fail("Expected an IllegalArgumentException");
        } catch (IllegalArgumentException iae) {
            /* the expected case */
        }
    }

    public void testConstr_NullURL() {
        Example d;
        try {
            d = new Example(EX_DESC, null);
            fail("Expected an IllegalArgumentException");
        } catch (IllegalArgumentException iae) {
            /* the expected case */
        }
    }

    public void testSetDescription() throws Exception {
        java.lang.String[] tests = {"", " ", "a", "A", "�", "�", "0123456789", "012345678901234567890", "\n"};

        for (int i = 0; i < tests.length; i++) {
            testExample.setDescription(tests[i]);
            assertEquals(tests[i], testExample.getDescription());
        }
    }

    public void testSetDescription_Null() {
        try {
            testExample.setDescription(null);
            fail("Expected an IllegalArgumentException");
        } catch (IllegalArgumentException iae) {
            /* the expected case */
        }
    }

    public void testSetURL() throws Exception {
        String testURL = "http://foobar/foo.bar.baz";

        testExample.setURL(testURL);
        assertEquals("URLs not equal", testURL, testExample.getURL());
    }

    public void testSetURL_Null() {
        try {
            testExample.setURL(null);
            fail("Expected an IllegalArgumentException");
        } catch (IllegalArgumentException iae) {
            /* the expected case */
        }
    }

    public void testEquals() throws Exception {
        Example doc1 = new Example(EX_DESC, EX_URL);
        Example doc3 = new Example(EX_DESC + "D'oh!", EX_URL);
        Example doc4 = new Example(EX_DESC, EX_URL + "/doh");

        assertEquals("Examples not equal", testExample, doc1);
        assertTrue("Examples unexpectedly equal", !testExample.equals(doc3));
        assertTrue("Examples unexpectedly equal", !testExample.equals(doc4));
    }

    public void testHashCode_ConsistentWithEquals() throws Exception {
        Example doc1 = new Example(EX_DESC, EX_URL);
        Example doc3 = new Example(EX_DESC + "D'oh!", EX_URL);

        assertEquals("Hash codes should match", testExample.hashCode(),
                doc1.hashCode());
        assertTrue("Hash codes should not match", testExample.hashCode() !=
                doc3.hashCode());
    }

    public void testToString() throws Exception {
        assertNotNull(testExample.toString());
    }

}
