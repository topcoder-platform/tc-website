/*
 * TestCategory.java
 *
 * By John C. Bollinger
 *
 * Copyright (c) 2002
 */
package com.topcoder.dde.catalog.test;

import com.topcoder.dde.catalog.Category;
import junit.framework.*;

public class TestCategory extends TestCase {

    private final static String CATEGORY_NAME = "Really useful components";
    private final static String CATEGORY_DESCRIPTION =
            "Do an important thing very well, or do lots of things";

    private Category testCategory = new Category(CATEGORY_NAME, CATEGORY_DESCRIPTION);

    public TestCategory(String testName) {
        super(testName);
    }

    /*
     * getName and getDescription methods tested implicitly in the constructor
     * and setter method tests.  getId not tested because there is no good way
     * to determine the correct return value.
     */

    public void testConstructor() {
        assertNotNull("test category is null", testCategory);
        assertEquals("Wrong name", CATEGORY_NAME, testCategory.getName());
        assertEquals("Wrong description", CATEGORY_DESCRIPTION,
                testCategory.getDescription());
    }

    public void testConstr_NullName() {
        try {
            testCategory = new Category(null, CATEGORY_DESCRIPTION);
            fail("Accepted null category name");
        } catch (IllegalArgumentException iae) {
            /* the expected behavior */
        }
    }

    public void testConstr_NullDesc() {
        try {
            testCategory = new Category(CATEGORY_NAME, null);
            fail("Accepted null category description");
        } catch (IllegalArgumentException iae) {
            /* the expected behavior */
        }
    }

    public void testEquals() {
        Category category2 = new Category(CATEGORY_NAME, CATEGORY_DESCRIPTION);
        Category category3 = new Category("", CATEGORY_DESCRIPTION);
        Category category4 = new Category(CATEGORY_NAME, "");
        assertEquals("Equality failure", testCategory, category2);
        assertTrue("Inequality failure", !testCategory.equals(category3));
        assertTrue("Inequality failure", !testCategory.equals(category4));
    }

    public void testHashCode_ConsistentWithEquals() {
        Category category2 = new Category(CATEGORY_NAME, CATEGORY_DESCRIPTION);
        Category category3 = new Category("", CATEGORY_DESCRIPTION);
        assertEquals("Hash codes should match", testCategory.hashCode(),
                category2.hashCode());
        assertTrue("Hash codes should not match",
                testCategory.hashCode() != category3.hashCode());
    }

    public void testSetDescription() {
        testCategory.setDescription("Foo-related components");
        assertEquals("Description not set correctly", "Foo-related components",
                testCategory.getDescription());
    }

    public void testSetDescription_Null() {
        try {
            testCategory.setDescription(null);
            fail("Accepted null category description");
        } catch (IllegalArgumentException iae) {
            /* the expected behavior */
        }
    }


    public void testSetName() {
        testCategory.setName("Foosters");
        assertEquals("Name not set correctly", "Foosters", testCategory.getName());
    }

    public void testSetName_Null() {
        try {
            testCategory.setName(null);
            fail("Accepted null category name");
        } catch (IllegalArgumentException iae) {
            /* the expected behavior */
        }
    }

    public void testToString() {
        assertNotNull(testCategory.toString());  // not much we can test
    }
}