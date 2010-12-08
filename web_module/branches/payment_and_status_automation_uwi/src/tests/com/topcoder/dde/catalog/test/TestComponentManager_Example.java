/*
 * TestComponentManager_Example.java
 *
 * By John C. Bollinger
 *
 * Copyright (c) 2002
 */
package com.topcoder.dde.catalog.test;

import com.topcoder.dde.catalog.CatalogException;
import com.topcoder.dde.catalog.Example;

import java.util.Collection;
import java.util.Iterator;

import junit.framework.Test;
import junit.framework.TestSuite;

/**
 * a JUnit test case that exercises the Example management methods of the
 * ComponentManager EJB
 *
 * @author John C. Bollinger
 * @version 1.0
 */
public class TestComponentManager_Example
        extends RemoteComponentManagerTestCase {

    protected Example example;

    /**
     * constructs a new instance configured to run the named test
     *
     * @param  testName a <code>String</code> containing the name of the test
     *         to run
     */
    public TestComponentManager_Example(String testName) {
        super(testName);
    }

    public void setUp() throws Exception {
        super.setUp();
        example = new Example("Test Example #" + idGen.nextId(),
                "http://test.com/ex");
    }

    /**
     * tests the normal functioning of the addExample method
     */
    synchronized public void testAddExample() throws Exception {
        Example ex = manager1.addExample(example);
        Iterator it = manager1.getExamples().iterator();
        try {
            assertEquals("Example not added correctly", example, it.next());
        } finally {
            manager1.removeExample(ex.getId());
        }
    }

    /**
     * tests the functioning of the addExample method when a example matching
     * the argument already exists
     */
/*
 * Objecting to this case is not required
 *
    synchronized public void testAddExample_Exists() throws Exception {
        Example ex = manager1.addExample(example);
        try {
            manager1.addExample(example);
            fail("Expected a CatalogException");
        } catch (CatalogException ce) {
            // the expected case
        } finally {
            manager1.removeExample(ex.getId());
        }
    }
 */

    /**
     * tests the functioning of the addExample method when the argument is
     * <code>null</code>
     */
    public void testAddExample_Null() throws Exception {
        try {
            manager1.addExample(null);
            fail("Expected a CatalogException");
        } catch (CatalogException ce) {
            /* the expected case */
        }
    }

    /*
     * getExamples tested implicitly throughout this test case
     */

    /**
     * tests the normal functioning of the removeExample method
     */
    synchronized public void testRemoveExample() throws Exception {
        Example ex = manager1.addExample(example);
        Collection examples;

        manager1.removeExample(ex.getId());
        examples = manager1.getExamples();

        assertTrue("Example not removed", !examples.contains(example));
    }

    /**
     * tests the functioning of the removeExample method when no example
     * matching the argument exists
     */
    public void testRemoveExample_Missing() throws Exception {
        try {
            manager1.removeExample(idGen.nextId());
            fail("Expected a CatalogException");
        } catch (CatalogException ce) {
            /* the expected case */
        }
    }

    /**
     * tests the functioning of the removeExample method when the example
     * matching the argument is not associated with the component being managed
     */
    synchronized public void testRemoveExample_NotOwned() throws Exception {
        Example ex = manager2.addExample(example);
        try {
            manager1.removeExample(ex.getId());
        } catch (Exception e) {
            manager2.removeExample(ex.getId());
            throw e;
        }
    }

    /**
     * tests the normal functioning of the updateExample method
     */
    synchronized public void testUpdateExample() throws Exception {
        Example ex = manager1.addExample(example);
        Example ex2 = new Example(ex.getDescription(), ex.getURL());
        Collection examples;

        try {
            ex.setURL("https://test.com/example/ex");
            manager1.updateExample(ex);
            examples = manager1.getExamples();
            assertTrue("Example not updated on the server",
                    examples.contains(ex));
            assertTrue("Example duplicated, not updated",
                    !examples.contains(ex2));
        } finally {
            manager1.removeExample(ex.getId());
        }
    }

    /**
     * tests the functioning of the updateExample method when the argument is
     * <code>null</code>
     */
    public void testUpdateExample_Null() throws Exception {
        try {
            manager1.updateExample(null);
            fail("Expected a CatalogException");
        } catch (CatalogException ce) {
            /* the expected case */
        }
    }

    /**
     * tests the functioning of the updateExample method when no example
     * matching the argument exists
     */
    public void testUpdateExample_Missing() throws Exception {
        try {
            manager1.updateExample(example);
            fail("Expected a CatalogException");
        } catch (CatalogException ce) {
            /* the expected case */
        }
    }

    /**
     * tests the functioning of the updateExample method when the example
     * matching the argument is not associated with the component being managed
     */
/*
 * Not a valid test -- the behavior is not required or expected
 *
    synchronized public void testUpdateExample_NotOwned() throws Exception {
        Example ex = manager2.addExample(example);
        try {
            manager1.updateExample(ex);
            fail("Expected a CatalogException");
        } catch (CatalogException ce) {
            // the expected case
        } finally {
            manager2.removeExample(ex.getId());
        }
    }
 *
 */

    public static Test suite() {
        return new ComponentManagerTestSetup(new TestSuite(TestComponentManager_Example.class));
    }

}