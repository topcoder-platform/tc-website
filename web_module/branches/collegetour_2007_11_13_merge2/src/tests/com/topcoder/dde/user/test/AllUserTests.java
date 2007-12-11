/*
 * AllUserTests.java
 *
 * By John C. Bollinger
 *
 * Copyright (c) 2002
 */
package com.topcoder.dde.user.test;

import junit.framework.*;

public class AllUserTests extends TestSuite {

    public AllUserTests() {
        addTest(TestPricingTier.suite());
        addTest(TestRegistrationInfo.suite());
        addTest(TestUser.suite());
        addTest(TestUserTechnology.suite());
        addTest(TestUserManagerRemote.suite());
        addTest(TestUserManagerLocal.suite());
    }

    public static Test suite() {
        return new UserTestSetup(new AllUserTests());
    }
}
