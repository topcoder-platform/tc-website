/*
 * TestComponentManager_Category.java
 *
 * By John C. Bollinger
 *
 * Copyright (c) 2002
 */
package com.topcoder.dde.catalog.test;

import com.topcoder.dde.catalog.Catalog;
import com.topcoder.dde.catalog.CatalogException;
import com.topcoder.dde.catalog.Category;

import java.util.Collection;
import java.util.Iterator;

import junit.framework.Test;
import junit.framework.TestSuite;

/**
 * a JUnit test case that exercises the Category management methods of the
 * ComponentManager EJB
 *
 * @author John C. Bollinger
 * @version 1.0
 */
public class TestComponentManager_Category
        extends RemoteComponentManagerTestCase {

    protected Catalog catalog;
    protected Category category;

    /**
     * constructs a new instance configured to run the named test
     *
     * @param  testName a <code>String</code> containing the name of the test
     *         to run
     */
    public TestComponentManager_Category(String testName) {
        super(testName);
    }

    public void setUp() throws Exception {
        super.setUp();
        catalog = catalogHome.create();
        category = catalog.addCategory(
                new Category("Test Category #" + idGen.nextId(),
                        "a category for use in testing"));
    }

    public void tearDown() throws Exception {
        catalog.removeCategory(category.getId());
        catalog.remove();
        super.tearDown();
    }

    /**
     * tests the normal functioning of the addCategory method
     */
    synchronized public void testAddCategory() throws Exception {
        manager1.addCategory(category.getId());
        Iterator it = manager1.getCategories().iterator();
        try {
            assertEquals("Category not added correctly", category, it.next());
        } finally {
            manager1.removeCategory(category.getId());
        }
    }

    /**
     * tests the functioning of the addCategory method when a category matching
     * the argument already exists
     */
    synchronized public void testAddCategory_Missing() throws Exception {
        try {
            manager1.addCategory(idGen.nextId());
            fail("Expected a CatalogException");
        } catch (CatalogException ce) {
            /* the expected case */
        }
    }

    synchronized public void testAddCategory_Assigned() throws Exception {
        manager1.addCategory(category.getId());
        try {
            manager1.addCategory(category.getId());
        } finally {
            manager1.removeCategory(category.getId());
        }
    }

    /*
     * getCategories tested implicitly throughout this test case
     */

    /**
     * tests the normal functioning of the removeCategory method
     */
    synchronized public void testRemoveCategory() throws Exception {
        manager1.addCategory(category.getId());
        Collection categories;

        manager1.removeCategory(category.getId());
        categories = manager1.getCategories();

        assertTrue("Category not removed", !categories.contains(category));
    }

    /**
     * tests the functioning of the removeCategory method when no category
     * matching the argument exists
     */
    public void testRemoveCategory_Missing() throws Exception {
        try {
            manager1.removeCategory(idGen.nextId());
            fail("Expected a CatalogException");
        } catch (CatalogException ce) {
            /* the expected case */
        }
    }

    /**
     * tests the functioning of the removeCategory method when the category
     * matching the argument is not associated with the component being managed
     */
    synchronized public void testRemoveCategory_NotAssigned() throws Exception {
        manager2.addCategory(category.getId());
        try {
            manager1.removeCategory(category.getId());
            fail("Expected a CatalogException");
        } catch (CatalogException ce) {
            /* the expected case */
            manager2.removeCategory(category.getId());
        }
    }

    public static Test suite() {
        return new ComponentManagerTestSetup(new TestSuite(TestComponentManager_Category.class));
    }

}