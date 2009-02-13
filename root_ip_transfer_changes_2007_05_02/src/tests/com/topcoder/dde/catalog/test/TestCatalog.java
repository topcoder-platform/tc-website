/*
 * TestCatalog.java
 *
 * By John C. Bollinger
 *
 * Copyright (c) 2002
 */
package com.topcoder.dde.catalog.test;

import com.topcoder.dde.catalog.Catalog;
import com.topcoder.dde.catalog.CatalogException;
import com.topcoder.dde.catalog.ComponentInfo;
import com.topcoder.dde.catalog.ComponentRequest;
import com.topcoder.dde.catalog.ComponentSummary;
import com.topcoder.dde.catalog.ComponentVersionInfo;

import java.util.Iterator;

import junit.framework.Test;
import junit.framework.TestSuite;

/**
 * a JUnit test case that exercises the Catalog EJB's remote interface
 *
 * @author John C. Bollinger
 * @version 1.0
 */
public class TestCatalog extends RemoteCatalogTestCase {

    protected Catalog catalog;
    protected ComponentSummary summary;

    public TestCatalog(String testName) {
        super(testName);
    }

    public void setUp() throws Exception {
        super.setUp();
        catalog = catalogHome.create();
        summary = catalog.requestComponent(new ComponentRequest(DEF_COMP_NAME, DEF_COMP_SHORTD,
                DEF_COMP_DESC, DEF_COMP_FUNCTIONAL, DEF_COMP_KEYWORDS,
                DEF_COMP_COMMENTS, DEF_COMP_VERSION, defaultUser.getId()));
    }

    public void tearDown() throws Exception {
        if (summary != null) {
            catalog.removeComponent(summary.getComponentId());
        }
        catalog.remove();
        super.tearDown();
    }

    public void testApproveComponent() throws Exception {
        Iterator searchIterator = catalog.search("Kemosabe", null).iterator();
        boolean found;
        while (searchIterator.hasNext()) {
            assertTrue("Component already indexed",
                    !(searchIterator.next().equals(summary)));
        }
        catalog.approveComponent(summary.getComponentId());
        summary = catalog.getComponent(summary.getComponentId());
        assertEquals("Component not approved", ComponentInfo.APPROVED,
                summary.getStatus());
        searchIterator = catalog.search("Kemosabe", null).iterator();
        found = false;
        while (searchIterator.hasNext()) {
            if (searchIterator.next().equals(summary)) {
                found = true;
                break;
            }
        }
        assertTrue("Component not indexed", found);
    }

    public void testApproveComponent_Missing() throws Exception {
        try {
            catalog.approveComponent(idGen.nextId());
            fail("Expected a CatalogException");
        } catch (CatalogException ce) {
            /* the expected case */
        }
    }

    public void testDeclineComponent_LongFalse() throws Exception {
        catalog.declineComponent(summary.getComponentId(), false);
        assertEquals("Component not approved", ComponentInfo.DECLINED,
                catalog.getComponent(summary.getComponentId()).getStatus());
        /*
         * could check that the component is removed from the search engine,
         * but something is wrong elsewhere if the declineComponent method is
         * called after the component is already approved, and it would have to
         * have been approved in order to be indexed in the first place.
         */
    }

    public void testDeclineComponent_LongTrue() throws Exception {
        catalog.declineComponent(summary.getComponentId(), true);
        assertEquals("Component not approved", ComponentInfo.DUPLICATE,
                catalog.getComponent(summary.getComponentId()).getStatus());
        /*
         * could check that the component is removed from the search engine,
         * but something is wrong elsewhere if the declineComponent method is
         * called after the component is already approved, and it would have to
         * have been approved in order to be indexed in the first place.
         */
    }

    public void testDeclineComponent_Missing() throws Exception {
        try {
            catalog.declineComponent(idGen.nextId(), false);
            fail("Expected a CatalogException");
        } catch (CatalogException ce) {
            /* the expected case */
        }
    }

/*
 *  This test performed with the ComponentManager tests when a category assignment
 *  is tested.
 *
 *  public void testGetCategoryComponents() throws Exception {
 *  }
 */

    public void testGetComponentsByStatus() throws Exception {
        assertTrue("Requested component not found",
                catalog.getComponentsByStatus(ComponentInfo.REQUESTED).contains(
                        summary));
    }

    public void testRemoveComponent() throws Exception {
        Iterator searchIterator;
        catalog.approveComponent(summary.getComponentId());
        catalog.removeComponent(summary.getComponentId());
        summary = catalog.getComponent(summary.getComponentId());
        assertEquals("Component not approved", ComponentInfo.DELETED,
                summary.getStatus());
        searchIterator = catalog.search("Kemosabe", null).iterator();
        while (searchIterator.hasNext()) {
            assertTrue("Component still indexed",
                    !(searchIterator.next().equals(summary)));
        }
    }

    public void testRemoveComponent_Missing() throws Exception {
        try {
            catalog.removeComponent(idGen.nextId());
            fail("Expected a CatalogException");
        } catch (CatalogException ce) {
            /* the expected case */
        }
    }

/*
 * search is tested implicitly in some of the other tests
 */

    public static Test suite() {
        return new CatalogTestSetup(new TestSuite(TestCatalog.class));
    }

}
