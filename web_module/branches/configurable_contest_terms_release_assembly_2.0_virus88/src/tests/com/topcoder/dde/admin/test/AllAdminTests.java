/*
 * AllAdminTests.java
 *
 * By John C. Bollinger
 *
 * Copyright (c) 2002
 */
package com.topcoder.dde.admin.test;

import junit.framework.Test;
import junit.framework.TestSuite;

public class AllAdminTests extends TestSuite {

    public AllAdminTests() {
        addTestSuite(TestAdminLogin.class);
    }

    public static Test suite() {
        return new AdminTestSetup(new AllAdminTests());
    }
}