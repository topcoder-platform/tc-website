/*
 * AllCatalogBeanTests.java
 *
 * By John C. Bollinger
 *
 * Copyright (c) 2002
 */
package com.topcoder.dde.catalog.test;

import junit.framework.*;

/**
 * a JUnit test suite that excercises the Component Catalog component's Catalog
 * EJB
 */
public class AllCatalogBeanTests extends TestSuite {

    /**
     * constructs a new instance of this test suite
     */
    public AllCatalogBeanTests() {
        super("All Catalog EJB Tests");
        addTest(new TestSuite(TestCatalog_Category.class));
        addTest(new TestSuite(TestCatalog_LicenseLevel.class));
        addTest(new TestSuite(TestCatalog_Role.class));
        addTest(new TestSuite(TestCatalog_Technology.class));
        addTest(new TestSuite(TestCatalog.class));
    }

    /**
     * create and return an instance of this test suite
     */
    public static Test suite() {
        return new CatalogTestSetup(new AllCatalogBeanTests());
    }


}