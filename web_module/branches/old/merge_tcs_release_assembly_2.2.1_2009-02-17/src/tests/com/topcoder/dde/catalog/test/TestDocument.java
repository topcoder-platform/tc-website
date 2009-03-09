/*
 * TestDocument.java
 *
 * a JUnit test case for com.topcoder.dde.catalog.Document;
 *
 * By John C. Bollinger
 *
 * Copyright (c) 2002
 */
package com.topcoder.dde.catalog.test;

import com.topcoder.dde.catalog.Document;
import junit.framework.TestCase;

public class TestDocument extends TestCase {

    private static final String DOC_NAME = "Test Foo manual";
    private static final String DOC_URL = "http://foo.org";
    private static final long DOC_TYPE = 1L;

    private Document testDocument = new Document(DOC_NAME, DOC_URL, DOC_TYPE);

    public TestDocument(String testName) {
        super(testName);
    }

    /*
     * getName(), getURL() and getType() methods tested implicitly in the
     * constructor and setter method tests
     * getId() not tested -- no good way to predict the result
     */

    public void testConstructor() {
        assertNotNull("test document is null", testDocument);
        assertEquals("Wrong name", DOC_NAME, testDocument.getName());
        assertEquals("Wrong URL", DOC_URL, testDocument.getURL());
        assertEquals("Wrong type", DOC_TYPE, testDocument.getType());
    }

    public void testConstr_NullName() {
        Document d;
        try {
            d = new Document(null, DOC_URL, DOC_TYPE);
            fail("Expected an IllegalArgumentException");
        } catch (IllegalArgumentException iae) {
            /* the expected case */
        }
    }

    public void testConstr_NullURL() {
        Document d;
        try {
            d = new Document(DOC_NAME, null, DOC_TYPE);
            fail("Expected an IllegalArgumentException");
        } catch (IllegalArgumentException iae) {
            /* the expected case */
        }
    }

    public void testConstr_InvalidType() {
        Document d;
        try {
            d = new Document(DOC_NAME, DOC_URL, -56L);
            fail("Expected an IllegalArgumentException");
        } catch (IllegalArgumentException iae) {
            /* the expected case */
        }
    }

    public void testSetName() throws Exception {
        java.lang.String[] tests = {"", " ", "a", "A", "�", "�", "0123456789", "012345678901234567890", "\n"};

        for (int i = 0; i < tests.length; i++) {
            testDocument.setName(tests[i]);
            assertEquals(tests[i], testDocument.getName());
        }
    }

    public void testSetName_Null() {
        try {
            testDocument.setName(null);
            fail("Expected an IllegalArgumentException");
        } catch (IllegalArgumentException iae) {
            /* the expected case */
        }
    }

    public void testSetURL() throws Exception {
        String testURL = "http://foobar/foo.bar.baz";

        testDocument.setURL(testURL);
        assertEquals("URLs not equal", testURL, testDocument.getURL());
    }

    public void testSetURL_Null() {
        try {
            testDocument.setURL(null);
            fail("Expected an IllegalArgumentException");
        } catch (IllegalArgumentException iae) {
            /* the expected case */
        }
    }

    public void testSetType() throws Exception {
        long[] tests = {0, 1, Long.MAX_VALUE};

        for (int i = 0; i < tests.length; i++) {
            testDocument.setType(tests[i]);
            assertEquals("Types not equal", tests[i], testDocument.getType());
        }
    }

    public void testSetType_Invalid() {
        try {
            testDocument.setType(-1L);
            fail("Expected an IllegalArgumentException");
        } catch (IllegalArgumentException iae) {
            /* the expected case */
        }
    }

    public void testEquals() throws Exception {
        Document doc1 = new Document(DOC_NAME, DOC_URL, DOC_TYPE);
        Document doc2 = new Document(DOC_NAME, DOC_URL, DOC_TYPE + 1L);
        Document doc3 = new Document(DOC_NAME + "D'oh!", DOC_URL, DOC_TYPE);
        Document doc4 = new Document(DOC_NAME, DOC_URL + "/doh", DOC_TYPE);

        assertEquals("Documents not equal", testDocument, doc1);
        assertEquals("Documents not equal", testDocument, doc2);
        assertTrue("Documents unexpectedly equal", !testDocument.equals(doc3));
        assertTrue("Documents unexpectedly equal", !testDocument.equals(doc4));
    }

    public void testHashCode_ConsistentWithEquals() throws Exception {
        Document doc1 = new Document(DOC_NAME, DOC_URL, DOC_TYPE);
        Document doc2 = new Document(DOC_NAME, DOC_URL, DOC_TYPE + 1L);
        Document doc3 = new Document(DOC_NAME + "D'oh!", DOC_URL, DOC_TYPE);

        assertEquals("Hash codes should match", testDocument.hashCode(),
                doc1.hashCode());
        assertEquals("Hash codes should match", testDocument.hashCode(),
                doc2.hashCode());
        assertTrue("Hash codes should not match", testDocument.hashCode() !=
                doc3.hashCode());
    }

    public void testToString() throws Exception {
        assertNotNull(testDocument.toString());
    }

}
