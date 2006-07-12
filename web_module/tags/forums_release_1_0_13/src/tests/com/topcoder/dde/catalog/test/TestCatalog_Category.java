/*
 * TestCatalog_Category.java
 *
 * By John C. Bollinger
 *
 * Copyright (c) 2002
 */
package com.topcoder.dde.catalog.test;

import com.topcoder.dde.catalog.Catalog;
import com.topcoder.dde.catalog.Category;
import com.topcoder.dde.catalog.CatalogException;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;

import junit.framework.Test;
import junit.framework.TestSuite;

/**
 * a JUnit testcase exercising the Category management of the Catalog EJB
 *
 * @author John C. Bollinger
 * @version 1.0
 */
public class TestCatalog_Category extends RemoteCatalogTestCase {

    protected Category category;
    protected Catalog catalog;

    public TestCatalog_Category(String testName) {
        super(testName);
    }

    public void setUp() throws Exception {
        super.setUp();
        catalog = catalogHome.create();
        category = new Category("Test category #" + idGen.nextId(),
                "A category for testing");
    }

    public void tearDown() throws Exception {
        catalog.remove();
        super.tearDown();
    }

    public void testAddCategory() throws Exception {
        Category l2 = catalog.addCategory(category);
        try {
            assertEquals("Category not added correctly", category,
                    catalog.getCategory(l2.getId()));
        } finally {
            catalog.removeCategory(l2.getId());
        }
    }

    public void testAddCategory_LongCategory() throws Exception {
        Category l2 = catalog.addCategory(category);
        Category child = catalog.addCategory(l2.getId(),
                new Category("Test category #" + idGen.nextId(),
                        "A child category for testing"));
        try {
            Iterator it = catalog.getCategoryPath(child.getId()).iterator();
            assertEquals("Bad category path", l2, it.next());
            assertEquals("Bad category path", child, it.next());
        } finally {
            catalog.removeCategory(child.getId());
            catalog.removeCategory(l2.getId());
        }
    }

    public void testAddCategory_LongCategory_ParentMissing() throws Exception {
        try {
            catalog.addCategory(idGen.nextId(), category);
            fail("Expected a CatalogException");
        } catch (CatalogException ce) {
            /* the expected case */
        }
    }

    public void testAddCategory_Null() throws Exception {
        try {
            catalog.addCategory(null);
            fail("Expected a CatalogException");
        } catch (CatalogException ce) {
            /* the expected case */
        }
    }

    public void testAddCategory_Duplicate() throws Exception {
        Category c2 = catalog.addCategory(category);
        try {
            catalog.addCategory(c2);
            fail("Expected a CatalogException");
        } catch (CatalogException ce) {
            /* the expected case */
        } finally {
            catalog.removeCategory(c2.getId());
        }
    }

    public void testGetCategories() throws Exception {
        ArrayList active = new ArrayList();
        ArrayList deleted = new ArrayList();
        Collection categories;

        active.add(catalog.addCategory(category));
        active.add(catalog.addCategory(new Category("Test category #" + idGen.nextId(),
                "A category for testing")));
        active.add(catalog.addCategory(new Category("Test category #" + idGen.nextId(),
                "A category for testing")));
        category = catalog.addCategory(new Category("Test category #" + idGen.nextId(),
                "A category for testing"));
        catalog.removeCategory(category.getId());
        deleted.add(category);
        category = catalog.addCategory(new Category("Test category #" + idGen.nextId(),
                "A category for testing"));
        catalog.removeCategory(category.getId());
        deleted.add(category);

        categories = catalog.getCategories();

        try {
            Iterator it = categories.iterator();
            assertTrue("Missing active Categories",
                    categories.containsAll(active));
            deleted.retainAll(categories);
            assertEquals("Retrieved deleted Categories", 0, deleted.size());
            String last = ((Category) it.next()).getName();
            while (it.hasNext()) {
                String next = ((Category) it.next()).getName();
                assertTrue("Categories out of order", next.compareTo(last) >= 0);
                last = next;
            }
        } finally {
            Iterator it = active.iterator();
            while (it.hasNext()) {
                Category l2 = (Category) it.next();
                catalog.removeCategory(l2.getId());
            }
        }
    }

    public void testGetCategory_Missing() throws Exception {
        try {
            catalog.getCategory(idGen.nextId());
            fail("Expected a CatalogException");
        } catch (CatalogException ce) {
            /* the expected case */
        }
    }

/*
 * removeCategory tested implicitly in the getCategories test
 *
    public void testRemoveCategory() throws Exception {
        Category l2 = catalog.addCategory(category);

        catalog.removeCategory(l2.getId());
        assertTrue("Category not removed",
                !catalog.getCategories().contains(category));

    }
*/

    public void testRemoveCategory_Missing() throws Exception {
        try {
            catalog.removeCategory(idGen.nextId());
            fail("Expected a CatalogException");
        } catch (CatalogException ce) {
            /* the expected case */
        }
    }

    public void testUpdateCategory() throws Exception {
        Category l2 = catalog.addCategory(category);
        l2.setDescription("Updated description");
        catalog.updateCategory(l2);
        try {
            assertEquals("Category update not successful", l2,
                    catalog.getCategory(l2.getId()));
        } finally {
            catalog.removeCategory(l2.getId());
        }
    }

    public void testUpdateCategory_Missing() throws Exception {
        try {
            catalog.updateCategory(category);
            fail("Expected a CatalogException");
        } catch (CatalogException ce) {
            /* the expected case */
        }
    }

    public void testUpdateCategory_Null() throws Exception {
        try {
            catalog.updateCategory(null);
            fail("Expected a CatalogException");
        } catch (CatalogException ce) {
            /* the expected case */
        }
    }

    public static Test suite() {
        return new CatalogTestSetup(new TestSuite(TestCatalog_Category.class));
    }

}