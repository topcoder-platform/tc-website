/*
 * AllCatalogTests.java
 *
 * By John C. Bollinger
 *
 * Copyright (c) 2002
 */
package com.topcoder.dde.catalog.test;

import junit.framework.*;

/**
 * a JUnit test suite that excercises the Component Catalog component
 */
public class AllCatalogTests extends TestSuite {

    /**
     * constructs a new instance of this test suite
     */
    public AllCatalogTests() {
        super("All Component Catalog Tests");
        addTest(new TestSuite(TestRole.class));
        addTest(new TestSuite(TestCategory.class));
        addTest(new TestSuite(TestTechnology.class));
        addTest(new TestSuite(TestDocument.class));
        addTest(new TestSuite(TestDownload.class));
        addTest(new TestSuite(TestExample.class));
        addTest(new TestSuite(TestTeamMemberRole.class));
        addTest(new TestSuite(TestReview.class));
        addTest(new TestSuite(TestLicenseLevel.class));
        addTest(new TestSuite(TestDownloadPermission.class));
        addTest(new TestSuite(TestComponentVersionRequest.class));
        addTest(new TestSuite(TestComponentRequest.class));
        addTest(new TestSuite(TestComponentSummary.class));
        addTest(AllCatalogBeanTests.suite());
        addTest(AllComponentManagerBeanTests.suite());
    }

    /**
     * create and return an instance of this test suite
     */
    public static Test suite() {
        return new ComponentManagerTestSetup(new AllCatalogTests());
    }
}