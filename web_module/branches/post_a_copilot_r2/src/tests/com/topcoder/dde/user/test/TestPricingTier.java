/*
 * TestPricingTier.java
 *
 * By John C. Bollinger
 *
 * Copyright (c) 2002
 */
package com.topcoder.dde.user.test;

import com.topcoder.dde.user.PricingTier;
import junit.framework.*;

/**
 * a JUnit TestCase that exercises the PricingTier class.  These tests assume
 * PricingTier to be a dumb container without validation logic, and merely
 * verify that the values with which one is constructed are the values its
 * accessor methods return.
 */
public class TestPricingTier extends TestCase {

    static final long DEF_TIER_ID = 505050L;
    static final double DEF_DISCOUNT = 0.43d;

    protected PricingTier tier;

    public TestPricingTier(String testName) {
        super(testName);
    }

    public void setUp() {
        tier = new PricingTier(DEF_TIER_ID, DEF_DISCOUNT);
    }

    public void testGetDiscount() {
        assertEquals("Wrong discount", DEF_DISCOUNT, tier.getDiscount(), 0.001d);
    }

    public void testGetId() {
        assertEquals("Wrong id", DEF_TIER_ID, tier.getId());
    }

    public static Test suite() {
        return new TestSuite(TestPricingTier.class);
    }
}