/*
 * TestComponentManager_Dependency.java
 *
 * By John C. Bollinger
 *
 * Copyright (c) 2002
 */
package com.topcoder.dde.catalog.test;

import com.topcoder.dde.catalog.Catalog;
import com.topcoder.dde.catalog.CatalogException;
import com.topcoder.dde.catalog.ComponentSummary;

import java.util.Collection;
import java.util.Iterator;

import junit.framework.Test;
import junit.framework.TestSuite;

/**
 * a JUnit test case that exercises the Dependency management methods of the
 * ComponentManager EJB
 *
 * @author John C. Bollinger
 * @version 1.0
 */
public class TestComponentManager_Dependency
        extends RemoteComponentManagerTestCase {

    protected Catalog catalog;
    protected ComponentSummary dependency;

    /**
     * constructs a new instance configured to run the named test
     *
     * @param  testName a <code>String</code> containing the name of the test
     *         to run
     */
    public TestComponentManager_Dependency(String testName) {
        super(testName);
    }

    public void setUp() throws Exception {
        super.setUp();
        dependency = summary2;
    }

    /**
     * tests the normal functioning of the addDependency method
     */
    synchronized public void testAddDependency() throws Exception {
        manager1.addDependency(dependency.getVersionId());
        Iterator it = manager1.getDependencies().iterator();
        try {
            assertTrue("No dependency added", it.hasNext());
            ComponentSummary dep = (ComponentSummary) it.next();
            assertEquals("Dependency not added correctly",
                    dependency.getVersionId(), dep.getVersionId());
        } finally {
            manager1.removeDependency(dependency.getVersionId());
        }
    }

    /**
     * tests the functioning of the addDependency method when a dependency matching
     * the argument already exists
     */
    synchronized public void testAddDependency_Missing() throws Exception {
        try {
            manager1.addDependency(idGen.nextId());
            fail("Expected a CatalogException");
        } catch (CatalogException ce) {
            /* the expected case */
        }
    }

    synchronized public void testAddDependency_Assigned() throws Exception {
        manager1.addDependency(dependency.getVersionId());
        try {
            manager1.addDependency(dependency.getVersionId());
        } finally {
            manager1.removeDependency(dependency.getVersionId());
        }
    }

/*
 * Rejecting circular dependency graphs is not a requirement of this version
 *
    synchronized public void testAddDependency_Self() throws Exception {
        try {
            manager1.addDependency(summary1.getVersionId());
            manager1.removeDependency(summary1.getVersionId());
            fail("Expected a CatalogException");
        } catch (CatalogException ce) {
            // the expected case
        }
    }
 */

    /*
     * getDependencies tested implicitly throughout this test case
     */

    /**
     * tests the normal functioning of the removeDependency method
     */
    synchronized public void testRemoveDependency() throws Exception {
        Collection categories;

        manager1.addDependency(dependency.getVersionId());
        manager1.removeDependency(dependency.getVersionId());
        categories = manager1.getDependencies();

        assertTrue("Dependency not removed", !categories.contains(dependency));
    }

    /**
     * tests the functioning of the removeDependency method when no dependency
     * matching the argument exists
     */
    public void testRemoveDependency_Missing() throws Exception {
        try {
            manager1.removeDependency(idGen.nextId());
            fail("Expected a CatalogException");
        } catch (CatalogException ce) {
            /* the expected case */
        }
    }

    /**
     * tests the functioning of the removeDependency method when the dependency
     * matching the argument is not associated with the component being managed
     */
    synchronized public void testRemoveDependency_NotAssigned() throws Exception {
        manager2.addDependency(dependency.getVersionId());
        try {
            manager1.removeDependency(dependency.getVersionId());
            fail("Expected a CatalogException");
        } catch (CatalogException ce) {
            /* the expected case */
            manager2.removeDependency(dependency.getVersionId());
        }
    }

    public static Test suite() {
        return new ComponentManagerTestSetup(new TestSuite(TestComponentManager_Dependency.class));
    }

}