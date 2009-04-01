/*
 * TestComponentRequest.java
 *
 * By John C. Bollinger
 *
 * Copyright (c) 2002
 */
package com.topcoder.dde.catalog.test;

import com.topcoder.dde.catalog.ComponentInfo;
import com.topcoder.dde.catalog.ComponentRequest;
import com.topcoder.dde.catalog.ComponentVersionRequest;
import junit.framework.*;

public class TestComponentRequest extends TestComponentVersionRequest {

    protected ComponentRequest crequest;

    protected static final String DEF_NAME =
            "Test Component " + System.currentTimeMillis();
    protected static final String DEF_SHORTD = "Fooey";
    protected static final String DEF_DESC =
            "A hypothetical component serving as test data";
    protected static final String DEF_FUNCTIONAL =
            "Performs F. Bar's BAZ algorithm on DEK's favorite initialism";
    protected static final String DEF_KEYWORDS =
            "bar" + ComponentInfo.KEYWORD_DELIMITER + "baz"
            + ComponentInfo.KEYWORD_DELIMITER + "scrumpdillyiscious";

    public TestComponentRequest(String testName) {
        super(testName);
    }

    public void setUp() throws Exception {
        super.setUp();
        crequest = new ComponentRequest(DEF_NAME, DEF_SHORTD, DEF_DESC,
                DEF_FUNCTIONAL, DEF_KEYWORDS, DEF_COMMENTS, DEF_VLABEL,
                DEF_USERID);
        request = crequest;
    }

    public void testConstructor() throws Exception {
        super.testConstructor();
        assertEquals("Name is incorrect", DEF_NAME, crequest.getName());
        assertEquals("Short description is incorrect", DEF_SHORTD,
                crequest.getShortDescription());
        assertEquals("Description is incorrect", DEF_DESC,
                crequest.getDescription());
        assertEquals("Functional description is incorrect", DEF_FUNCTIONAL,
                crequest.getFunctionalDescription());
        assertEquals("Keywords are incorrect", DEF_KEYWORDS,
                crequest.getKeywords());
        assertEquals("Constructed with categories", 0,
                crequest.getCategories().size());
    }

    public void testConstr_NullName() throws Exception {
        try {
            crequest = new ComponentRequest(null, DEF_SHORTD, DEF_DESC,
                    DEF_FUNCTIONAL, DEF_KEYWORDS, DEF_COMMENTS, DEF_VLABEL,
                    DEF_USERID);
            fail("Expected an IllegalArgumentException");
        } catch (IllegalArgumentException iae) {
            /* the expected case */
        }
    }

    public void testConstr_NullShortDesc() throws Exception {
        try {
            crequest = new ComponentRequest(DEF_NAME, null, DEF_DESC,
                    DEF_FUNCTIONAL, DEF_KEYWORDS, DEF_COMMENTS, DEF_VLABEL,
                    DEF_USERID);
            fail("Expected an IllegalArgumentException");
        } catch (IllegalArgumentException iae) {
            /* the expected case */
        }
    }

    public void testConstr_NullDescription() throws Exception {
        try {
            crequest = new ComponentRequest(DEF_NAME, DEF_SHORTD, null,
                    DEF_FUNCTIONAL, DEF_KEYWORDS, DEF_COMMENTS, DEF_VLABEL,
                    DEF_USERID);
            fail("Expected an IllegalArgumentException");
        } catch (IllegalArgumentException iae) {
            /* the expected case */
        }
    }

    public void testConstr_NullFunctionalDesc() throws Exception {
        try {
            crequest = new ComponentRequest(DEF_NAME, DEF_SHORTD, DEF_DESC,
                    null, DEF_KEYWORDS, DEF_COMMENTS, DEF_VLABEL,
                    DEF_USERID);
            fail("Expected an IllegalArgumentException");
        } catch (IllegalArgumentException iae) {
            /* the expected case */
        }
    }

    public void testConstr_NullKeywords() throws Exception {
        try {
            crequest = new ComponentRequest(DEF_NAME, DEF_SHORTD, DEF_DESC,
                    DEF_FUNCTIONAL, null, DEF_COMMENTS, DEF_VLABEL,
                    DEF_USERID);
            fail("Expected an IllegalArgumentException");
        } catch (IllegalArgumentException iae) {
            /* the expected case */
        }
    }

    public void testAddCategory() throws Exception {
        crequest.addCategory(13L);
        crequest.addCategory(17L);
        crequest.addCategory(27L);
        assertCollectionMatches(crequest.getCategories(),
                new long[]{13L, 17L, 27L});
    }

    public void testAddCategory_Duplicate() throws Exception {
        crequest.addCategory(13L);
        crequest.addCategory(13L);
        crequest.addCategory(17L);
        assertCollectionMatches(crequest.getCategories(),
                new long[]{13L, 17L});
    }

    public void testRemoveCategory() throws Exception {
        crequest.addCategory(13L);
        crequest.addCategory(13L);
        crequest.addCategory(17L);
        crequest.removeCategory(13L);
        assertCollectionMatches(crequest.getCategories(),
                new long[]{17L});
    }

    public void testRemoveCategory_Missing() throws Exception {
        crequest.addCategory(13L);
        crequest.addCategory(13L);
        crequest.addCategory(17L);
        crequest.removeCategory(19L);
        assertCollectionMatches(crequest.getCategories(),
                new long[]{13L, 17L});
    }

    public void testClearCategories() throws Exception {
        crequest.addCategory(13L);
        crequest.addCategory(17L);
        crequest.addCategory(27L);
        crequest.clearCategories();
        assertEquals("Categories not cleared", 0,
                crequest.getCategories().size());
    }

    public void testSetDescription() throws Exception {
        crequest.setDescription("Spaghetti");
        assertEquals("Description not set correctly", "Spaghetti",
                crequest.getDescription());
    }

    public void testSetDescription_Null() throws Exception {
        try {
            crequest.setDescription(null);
            fail("Expected an IllegalArgumentException");
        } catch (IllegalArgumentException iae) {
            /* the expected case */
        }
    }

    public void testSetFunctionalDescription() throws Exception {
        crequest.setFunctionalDescription("Provides carbohydrate");
        assertEquals("Description not set correctly", "Provides carbohydrate",
                crequest.getFunctionalDescription());
    }

    public void testSetFunctionalDescription_Null() throws Exception {
        try {
            crequest.setFunctionalDescription(null);
            fail("Expected an IllegalArgumentException");
        } catch (IllegalArgumentException iae) {
            /* the expected case */
        }
    }

    public void testSetKeywords() throws Exception {
        crequest.setKeywords("carbohydrate");
        assertEquals("Description not set correctly", "carbohydrate",
                crequest.getKeywords());
    }

    public void testSetKeywords_Null() throws Exception {
        try {
            crequest.setKeywords(null);
            fail("Expected an IllegalArgumentException");
        } catch (IllegalArgumentException iae) {
            /* the expected case */
        }
    }

    public void testSetName() throws Exception {
        crequest.setName("angel hair");
        assertEquals("Description not set correctly", "angel hair",
                crequest.getName());
    }

    public void testSetName_Null() throws Exception {
        try {
            crequest.setName(null);
            fail("Expected an IllegalArgumentException");
        } catch (IllegalArgumentException iae) {
            /* the expected case */
        }
    }

    public void testSetShortDescription() throws Exception {
        crequest.setShortDescription("nourishes");
        assertEquals("Description not set correctly", "nourishes",
                crequest.getShortDescription());
    }

    public void testSetShortDescription_Null() throws Exception {
        try {
            crequest.setShortDescription(null);
            fail("Expected an IllegalArgumentException");
        } catch (IllegalArgumentException iae) {
            /* the expected case */
        }
    }

    public void testEquals() {
        ComponentRequest request2 =
                new ComponentRequest(DEF_NAME, DEF_SHORTD, DEF_DESC,
                        DEF_FUNCTIONAL, DEF_KEYWORDS, DEF_COMMENTS, DEF_VLABEL,
                        DEF_USERID);
        assertEquals("Expected objects to be equal", crequest, request2);
        assertEquals("Expected hashCodes to match", crequest.hashCode(),
                request2.hashCode());

        request2.setComments("Unequal");
        assertTrue("Expected objects to be unequal ", !crequest.equals(request2));
        request2.setComments(DEF_COMMENTS);

        request2.setVersionLabel("122 SP 3.672 Rev. 18");
        assertTrue("Expected objects to be unequal ", !crequest.equals(request2));
        request2.setVersionLabel(DEF_VLABEL);

        request2.setUserId(Long.MAX_VALUE);
        assertTrue("Expected objects to be unequal ", !crequest.equals(request2));
        request2.setUserId(DEF_USERID);

        request2.setName("Tortellini");
        assertTrue("Expected objects to be unequal ", !crequest.equals(request2));
        request2.setName(DEF_NAME);

        request2.setShortDescription("tori");
        assertTrue("Expected objects to be unequal ", !crequest.equals(request2));
        request2.setShortDescription(DEF_SHORTD);

        request2.setDescription("toroidal pasta in a rich cream sauce");
        assertTrue("Expected objects to be unequal ", !crequest.equals(request2));
        request2.setDescription(DEF_DESC);

        request2.setFunctionalDescription("tasty, and nutritious too!");
        assertTrue("Expected objects to be unequal ", !crequest.equals(request2));
        request2.setFunctionalDescription(DEF_FUNCTIONAL);

        request2.setKeywords("pasta");
        assertTrue("Expected objects to be unequal ", !crequest.equals(request2));
        request2.setKeywords(DEF_KEYWORDS);

        request2.addCategory(95L);
        assertTrue("Expected objects to be unequal ", !crequest.equals(request2));
        request2.clearCategories();

        request2.addTechnology(12L);
        assertTrue("Expected objects to be unequal ", !crequest.equals(request2));
        request2.clearTechnologies();
    }

    public void testHashCode() throws Exception {
        /*
         * overrides hashCode in TestComponentVersionRequest.  This version
         * always succeeds -- the real test of hashCode is performed along
         * with the equals tests
         */
    }

}
