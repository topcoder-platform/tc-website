/*
 * AllComponentManagerBeanTests.java
 *
 * By John C. Bollinger
 *
 * Copyright (c) 2002
 */
package com.topcoder.dde.catalog.test;

import junit.framework.*;

/**
 * a JUnit test suite that excercises the Component ComponentManager component's ComponentManager
 * EJB
 */
public class AllComponentManagerBeanTests extends TestSuite {

    /**
     * constructs a new instance of this test suite
     */
    public AllComponentManagerBeanTests() {
        super("All ComponentManager EJB Tests");
        addTest(new TestSuite(TestComponentManager_Category.class));
        addTest(new TestSuite(TestComponentManager_Dependency.class));
        addTest(new TestSuite(TestComponentManager_Document.class));
        addTest(new TestSuite(TestComponentManager_Download.class));
        addTest(new TestSuite(TestComponentManager_Example.class));
        addTest(new TestSuite(TestComponentManager_Review.class));
        addTest(new TestSuite(TestComponentManager_TeamMemberRole.class));
        addTest(new TestSuite(TestComponentManager_Technology.class));
        addTest(new TestSuite(TestComponentManager.class));
    }

    /**
     * create and return an instance of this test suite
     */

    public static Test suite() {
        return new ComponentManagerTestSetup(new AllComponentManagerBeanTests());
    }

}