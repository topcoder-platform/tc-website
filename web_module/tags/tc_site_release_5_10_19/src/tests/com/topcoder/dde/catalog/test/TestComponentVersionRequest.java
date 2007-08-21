/*
 * TestComponentVersionRequest.java
 *
 * By John C. Bollinger
 *
 * Copyright (c) 2002
 */
package com.topcoder.dde.catalog.test;

import com.topcoder.dde.catalog.ComponentVersionRequest;

import java.util.Collection;
import java.util.Iterator;

import junit.framework.TestCase;

public class TestComponentVersionRequest extends TestCase {

    protected ComponentVersionRequest request;

    protected final static String DEF_COMMENTS = "How about a Foo component?";
    protected final static String DEF_VLABEL = "1";
    protected final static long DEF_USERID = 1721L;

    public TestComponentVersionRequest(String testName) {
        super(testName);
    }

    public void setUp() throws Exception {
        super.setUp();
        request = new ComponentVersionRequest(DEF_COMMENTS, DEF_VLABEL,
                DEF_USERID);
    }

    public void testConstructor() throws Exception {
        assertEquals("Comments are incorrect", DEF_COMMENTS,
                request.getComments());
        assertEquals("Version label is incorrect", DEF_VLABEL,
                request.getVersionLabel());
        assertEquals("User id is incorrect", DEF_USERID,
                request.getUserId());
        assertTrue("The technology collection is not empty",
                request.getTechnologies().isEmpty());
    }

    public void testConstr_NullComments() throws Exception {
        try {
            request = new ComponentVersionRequest(null, DEF_VLABEL, DEF_USERID);
            fail("Expected an IllegalArgumentException");
        } catch (IllegalArgumentException iae) {
            /* the expected case */
        }
    }

    public void testConstr_NullLabel() throws Exception {
        try {
            request =
                    new ComponentVersionRequest(DEF_COMMENTS, null, DEF_USERID);
            fail("Expected an IllegalArgumentException");
        } catch (IllegalArgumentException iae) {
            /* the expected case */
        }
    }

    protected void assertCollectionMatches(Collection c, long[] vals) {
        for (int i = 0; i < vals.length; i++) {
            assertTrue("Value missing: " + vals[i],
                    c.contains(new Long(vals[i])));
        }
        assertEquals("Collection has extra elements", vals.length, c.size());
    }

    public void testAddTechnology() throws Exception {
        request.addTechnology(13L);
        request.addTechnology(17L);
        request.addTechnology(27L);
        assertCollectionMatches(request.getTechnologies(),
                new long[]{13L, 17L, 27L});
    }

    public void testAddTechnology_Duplicate() throws Exception {
        request.addTechnology(13L);
        request.addTechnology(13L);
        request.addTechnology(17L);
        assertCollectionMatches(request.getTechnologies(),
                new long[]{13L, 17L});
    }

    public void testClearTechnologies() throws Exception {
        request.addTechnology(13L);
        request.addTechnology(17L);
        request.addTechnology(27L);
        request.clearTechnologies();
        assertEquals("Technologies not cleared", 0,
                request.getTechnologies().size());
    }

    public void testEquals() throws Exception {
        ComponentVersionRequest request2 =
                new ComponentVersionRequest(DEF_COMMENTS, DEF_VLABEL,
                        DEF_USERID);
        assertEquals("Expected ComponentVersionRequests to be equal",
                request, request2);
        request.addTechnology(62L);
        request2.addTechnology(62L);
        assertEquals("Expected ComponentVersionRequests to be equal",
                request, request2);
        request.addTechnology(67L);
        request.addTechnology(76L);
        request2.addTechnology(76L);
        request2.addTechnology(67L);
        assertEquals("Expected ComponentVersionRequests to be equal",
                request, request2);
    }

    public void testEquals_Unequal() throws Exception {
        ComponentVersionRequest request2 =
                new ComponentVersionRequest(DEF_COMMENTS, DEF_VLABEL,
                        DEF_USERID);
        request2.addTechnology(12L);
        assertTrue("Expected ComponentVersionRequests to be unequal",
                !request.equals(request2));
        request2.clearTechnologies();
        request2.setComments("Unequal");
        assertTrue("Expected ComponentVersionRequests to be unequal",
                !request.equals(request2));
        request2.setComments(DEF_COMMENTS);
        request2.setVersionLabel("122 SP 3.672 Rev. 18");
        assertTrue("Expected ComponentVersionRequests to be unequal",
                !request.equals(request2));
        request2.setVersionLabel(DEF_VLABEL);
        request2.setUserId(request.getUserId() + 1);
        assertTrue("Expected ComponentVersionRequests to be unequal",
                !request.equals(request2));
    }

    public void testEquals_BadType() throws Exception {
        assertTrue(!request.equals(new Object()));
    }

    public void testEquals_NUll() throws Exception {
        assertTrue(!request.equals(null));
    }

    public void testGetTechnologies_Unmodifiable() {
        Collection c = request.getTechnologies();
        try {
            c.add(new Long(42L));
            fail("Expected an UnsupportedOperationException");
        } catch (UnsupportedOperationException uoe) {
            /* the expected case */
        }
    }

    public void testHashCode() throws Exception {
        ComponentVersionRequest request2 =
                new ComponentVersionRequest(DEF_COMMENTS, DEF_VLABEL,
                        DEF_USERID);
        assertEquals("Expected hashCodes to match", request.hashCode(),
                request2.hashCode());
    }

    public void testRemoveTechnology() throws Exception {
        request.addTechnology(13L);
        request.addTechnology(13L);
        request.addTechnology(17L);
        request.removeTechnology(17L);
        assertCollectionMatches(request.getTechnologies(), new long[]{13L});
    }

    public void testRemoveTechnology_Missing() throws Exception {
        request.addTechnology(13L);
        request.addTechnology(13L);
        request.addTechnology(17L);
        request.removeTechnology(19L);
        assertCollectionMatches(request.getTechnologies(),
                new long[]{13L, 17L});
    }

    public void testSetComments() throws Exception {
        request.setComments("Foo component needs a Bar generator");
        assertEquals("Comments not correctly set",
                "Foo component needs a Bar generator", request.getComments());
    }

    public void testSetComments_Null() throws Exception {
        try {
            request.setComments(null);
            fail("Expected an IllegalArgumentException");
        } catch (IllegalArgumentException iae) {
            /* the expected case */
        }
    }

    public void testSetUserId() throws Exception {
        request.setUserId(41L);
        assertEquals("UserIds don't match", 41L, request.getUserId());
    }

    public void testSetVersionLabel() throws Exception {
        request.setVersionLabel("New Version");
        assertEquals("Version labels don't match", "New Version",
                request.getVersionLabel());
    }

    public void testSetVersionLabel_Null() throws Exception {
        try {
            request.setVersionLabel(null);
            fail("Expected an IllegalArgumentException");
        } catch (IllegalArgumentException iae) {
            /* the expected case */
        }
    }

    public void testToString() throws Exception {
        assertNotNull(request.toString());
    }


}