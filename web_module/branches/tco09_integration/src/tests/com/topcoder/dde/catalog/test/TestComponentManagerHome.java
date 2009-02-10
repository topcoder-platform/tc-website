/*
 * TestComponentManagerHome.java
 *
 * By John C. Bollinger
 *
 * Copyright (c) 2002
 */
package com.topcoder.dde.catalog.test;

import com.topcoder.dde.catalog.ComponentVersionRequest;
import com.topcoder.dde.catalog.ComponentManager;
import com.topcoder.dde.catalog.Catalog;
import com.topcoder.dde.catalog.ComponentRequest;
import com.topcoder.dde.catalog.ComponentSummary;

import javax.ejb.CreateException;

import junit.framework.AssertionFailedError;
import junit.framework.Test;
import junit.framework.TestSuite;

/**
 * a JUnit test case that exercises the RemoteCatalogHome class
 *
 * @author John C. Bollinger
 * @version 1.0
 */
public class TestComponentManagerHome extends RemoteCatalogTestCase {

    public static final String NEW_VERSION_LABEL = "Super Fooinator 83";
    public static final String NEW_VERSION_COMMENTS = "It's about time";

    public TestComponentManagerHome(String testName) {
        super(testName);
    }

/*
 * basic functionality of create(long) is already implicitly tested elsewhere
 * throughout the test suite
 */

    public void testCreate_Long_Missing() throws Exception {
        try {
            ComponentManager cm = componentManagerHome.create(idGen.nextId());
            cm.remove();
            fail("Expected a CreateException");
        } catch (CreateException ce) {
            /* the expected case */
        }
    }

    public void testCreate_LongLong() throws Exception {
        Catalog myCatalog = null;
        ComponentRequest request = null;
        ComponentSummary compSummary = null;
        ComponentVersionRequest vRequest = null;
        long newVersion = -1L;
        ComponentManager componentManagerOld = null;
        ComponentManager componentManagerNew1 = null;
        ComponentManager componentManagerNew2 = null;
        Throwable caught = null;

        try {
            /* setup */
            myCatalog = catalogHome.create();
            request = new ComponentRequest(DEF_COMP_NAME,
                    DEF_COMP_SHORTD, DEF_COMP_DESC, DEF_COMP_FUNCTIONAL,
                    DEF_COMP_KEYWORDS, DEF_COMP_COMMENTS, DEF_COMP_VERSION,
                    defaultUser.getId());
            compSummary = myCatalog.requestComponent(request);
            myCatalog.remove();
            vRequest = new ComponentVersionRequest(
                    NEW_VERSION_COMMENTS, NEW_VERSION_LABEL, defaultUser.getId());
            newVersion = manager.createNewVersion(vRequest);
            componentManagerOld =
                    componentManagerHome.create(compSummary.getComponentId(), 1L);
            componentManagerNew1 =
                    componentManagerHome.create(compSummary.getComponentId());
            componentManagerNew2 =
                    componentManagerHome.create(compSummary.getComponentId(), 2L);

            /* test */
            assertTrue("Wrong component version retrieved",
                    !componentManagerOld.getVersionInfo().equals(
                            componentManagerNew1.getVersionInfo()));
            assertTrue("Wrong component version retrieved",
                    !componentManagerOld.getVersionInfo().equals(
                            componentManagerNew2.getVersionInfo()));
            assertEquals("Wrong component version retrieved",
                    componentManagerNew1.getVersionInfo(),
                    componentManagerNew2.getVersionInfo());

        } catch (Exception e) {
            caught = e;
        } catch (AssertionFailedError afe) {
            caught = afe;
        }

        /* teardown */
        if (componentManagerOld != null) {
            componentManagerOld.remove();
        }
        if (componentManagerNew1 != null) {
            componentManagerNew1.remove();
        }
        if (componentManagerNew2 != null) {
            componentManagerNew2.remove();
        }
        myCatalog.removeComponent(compSummary.getComponentId());
        myCatalog.remove();
        if (caught != null) {
            if (caught instanceof Exception) {
                throw (Exception) caught;
            } else {
                throw (Error) caught;
            }
        }
    }

    public void testCreate_LongLong_Missing() throws Exception {
        try {
            ComponentManager cm =
                    componentManagerHome.create(idGen.nextId(), idGen.nextId());
            cm.remove();
            fail("Expected a CreateException");
        } catch (CreateException ce) {
            /* the expected case */
        }
    }

    public void testCreate_LongLong_BadVersion() throws Exception {
        try {
            ComponentManager cm = componentManagerHome.create(
                    compSummary.getComponentId(), idGen.nextId());
            cm.remove();
            fail("Expected a CreateException");
        } catch (CreateException ce) {
            /* the expected case */
        }
    }

    public static Test suite() {
        return new CatalogTestSetup(new TestSuite(TestComponentManagerHome.class));
    }

}
