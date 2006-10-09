/*
 * TestComponentManager_Technology.java
 *
 * By John C. Bollinger
 *
 * Copyright (c) 2002
 */
package com.topcoder.dde.catalog.test;

import com.topcoder.dde.catalog.Catalog;
import com.topcoder.dde.catalog.CatalogException;
import com.topcoder.dde.catalog.Technology;

import java.util.Collection;
import java.util.Iterator;

import junit.framework.Test;
import junit.framework.TestSuite;

/**
 * a JUnit test case that exercises the Technology management methods of the
 * ComponentManager EJB
 *
 * @author John C. Bollinger
 * @version 1.0
 */
public class TestComponentManager_Technology
        extends RemoteComponentManagerTestCase {

    protected Catalog catalog;
    protected Technology technology;

    /**
     * constructs a new instance configured to run the named test
     *
     * @param  testName a <code>String</code> containing the name of the test
     *         to run
     */
    public TestComponentManager_Technology(String testName) {
        super(testName);
    }

    public void setUp() throws Exception {
        super.setUp();
        catalog = catalogHome.create();
        technology = catalog.addTechnology(
                new Technology("Test Technology #" + idGen.nextId(),
                        "a technology for use in testing"));
    }

    public void tearDown() throws Exception {
        catalog.removeTechnology(technology.getId());
        catalog.remove();
        super.tearDown();
    }

    /**
     * tests the normal functioning of the addTechnology method
     */
    synchronized public void testAddTechnology() throws Exception {
        manager1.addTechnology(technology.getId());
        Iterator it = manager1.getTechnologies().iterator();
        try {
            assertEquals("Technology not added correctly", technology, it.next());
        } finally {
            manager1.removeTechnology(technology.getId());
        }
    }

    /**
     * tests the functioning of the addTechnology method when a technology matching
     * the argument already exists
     */
    synchronized public void testAddTechnology_Missing() throws Exception {
        try {
            manager1.addTechnology(idGen.nextId());
            fail("Expected a CatalogException");
        } catch (CatalogException ce) {
            /* the expected case */
        }
    }

    synchronized public void testAddTechnology_Assigned() throws Exception {
        manager1.addTechnology(technology.getId());
        try {
            manager1.addTechnology(technology.getId());
        } finally {
            manager1.removeTechnology(technology.getId());
        }
    }

    /*
     * getTechnologies tested implicitly throughout this test case
     */

    /**
     * tests the normal functioning of the removeTechnology method
     */
    synchronized public void testRemoveTechnology() throws Exception {
        manager1.addTechnology(technology.getId());
        Collection technologies;

        manager1.removeTechnology(technology.getId());
        technologies = manager1.getTechnologies();

        assertTrue("Technology not removed", !technologies.contains(technology));
    }

    /**
     * tests the functioning of the removeTechnology method when no technology
     * matching the argument exists
     */
    public void testRemoveTechnology_Missing() throws Exception {
        try {
            manager1.removeTechnology(idGen.nextId());
            fail("Expected a CatalogException");
        } catch (CatalogException ce) {
            /* the expected case */
        }
    }

    /**
     * tests the functioning of the removeTechnology method when the technology
     * matching the argument is not associated with the component being managed
     */
    synchronized public void testRemoveTechnology_NotAssigned() throws Exception {
        manager2.addTechnology(technology.getId());
        try {
            manager1.removeTechnology(technology.getId());
            fail("Expected a CatalogException");
        } catch (CatalogException ce) {
            /* the expected case */
            manager2.removeTechnology(technology.getId());
        }
    }

    public static Test suite() {
        return new ComponentManagerTestSetup(new TestSuite(TestComponentManager_Technology.class));
    }

}