/*
 * TestCatalog_Technology.java
 *
 * By John C. Bollinger
 *
 * Copyright (c) 2002
 */
package com.topcoder.dde.catalog.test;

import com.topcoder.dde.catalog.Catalog;
import com.topcoder.dde.catalog.Technology;
import com.topcoder.dde.catalog.CatalogException;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;

import junit.framework.Test;
import junit.framework.TestSuite;

/**
 * a JUnit testcase exercising the Technology management of the Catalog EJB
 *
 * @author John C. Bollinger
 * @version 1.0
 */
public class TestCatalog_Technology extends RemoteCatalogTestCase {

    protected Technology tech;
    protected Catalog catalog;

    public TestCatalog_Technology(String testName) {
        super(testName);
    }

    public void setUp() throws Exception {
        super.setUp();
        catalog = catalogHome.create();
        tech = new Technology("Test technology #" + idGen.nextId(),
                "A technology for testing");
    }

    public void tearDown() throws Exception {
        catalog.remove();
        super.tearDown();
    }

    public void testAddTechnology() throws Exception {
        Technology l2 = catalog.addTechnology(tech);
        try {
            assertEquals("Technology not added correctly", tech,
                    catalog.getTechnology(l2.getId()));
        } finally {
            catalog.removeTechnology(l2.getId());
        }
    }

    public void testAddTechnology_Null() throws Exception {
        try {
            catalog.addTechnology(null);
            fail("Expected a CatalogException");
        } catch (CatalogException ce) {
            /* the expected case */
        }
    }

    public void testAddTechnology_Duplicate() throws Exception {
        Technology t2 = catalog.addTechnology(tech);
        try {
            catalog.addTechnology(t2);
            fail("Expected a CatalogException");
        } catch (CatalogException ce) {
            /* the expected case */
        } finally {
            catalog.removeTechnology(t2.getId());
        }
    }

    public void testGetTechnologies() throws Exception {
        ArrayList active = new ArrayList();
        ArrayList deleted = new ArrayList();
        Collection technologies;

        active.add(catalog.addTechnology(tech));
        active.add(catalog.addTechnology(new Technology(
                "Test technology #" + idGen.nextId(),
                "A technology for testing")));
        active.add(catalog.addTechnology(new Technology(
                "Test technology #" + idGen.nextId(),
                "A technology for testing")));
        tech = catalog.addTechnology(new Technology(
                "Test technology #" + idGen.nextId(),
                "A technology for testing"));
        catalog.removeTechnology(tech.getId());
        deleted.add(tech);
        tech = catalog.addTechnology(new Technology(
                "Test technology #" + idGen.nextId(),
                "A technology for testing"));
        catalog.removeTechnology(tech.getId());
        deleted.add(tech);

        technologies = catalog.getTechnologies();

        try {
            Iterator it = technologies.iterator();
            assertTrue("Missing active technologies",
                    technologies.containsAll(active));
            deleted.retainAll(technologies);
            assertEquals("Retrieved deleted technologies", 0, deleted.size());
            String last = ((Technology) it.next()).getName();
            while (it.hasNext()) {
                String next = ((Technology) it.next()).getName();
                assertTrue("Technologies out of order",
                        next.compareTo(last) >= 0);
                last = next;
            }
        } finally {
            Iterator it = active.iterator();
            while (it.hasNext()) {
                Technology l2 = (Technology) it.next();
                catalog.removeTechnology(l2.getId());
            }
        }
    }

    public void testGetTechnology_Missing() throws Exception {
        try {
            catalog.getTechnology(idGen.nextId());
            fail("Expected a CatalogException");
        } catch (CatalogException ce) {
            /* the expected case */
        }
    }

/*
 * removeTechnology tested implicitly in the getTechnologies test
 *
    public void testRemoveTechnology() throws Exception {
        Technology l2 = catalog.addTechnology(tech);
        catalog.removeTechnology(l2.getId());
        assertTrue("License Level not removed",
                !catalog.getTechnologies().contains(l2));
    }
*/

    public void testRemoveTechnology_Missing() throws Exception {
        try {
            catalog.removeTechnology(idGen.nextId());
            fail("Expected a CatalogException");
        } catch (CatalogException ce) {
            /* the expected case */
        }
    }

    public void testUpdateTechnology() throws Exception {
        Technology l2 = catalog.addTechnology(tech);
        l2.setDescription("Updated description");
        catalog.updateTechnology(l2);
        try {
            assertEquals("Technology update not successful", l2,
                    catalog.getTechnology(l2.getId()));
        } finally {
            catalog.removeTechnology(l2.getId());
        }
    }

    public void testUpdateTechnology_Missing() throws Exception {
        try {
            catalog.updateTechnology(tech);
            fail("Expected a CatalogException");
        } catch (CatalogException ce) {
            /* the expected case */
        }
    }

    public void testUpdateTechnology_Null() throws Exception {
        try {
            catalog.updateTechnology(null);
            fail("Expected a CatalogException");
        } catch (CatalogException ce) {
            /* the expected case */
        }
    }

    public static Test suite() {
        return new CatalogTestSetup(new TestSuite(TestCatalog_Technology.class));
    }

}