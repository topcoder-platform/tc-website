/*
 * TestReview.java
 *
 * By John C. Bollinger
 *
 * Copyright (c) 2002
 */
package com.topcoder.dde.catalog.test;

import com.topcoder.dde.catalog.Review;
import junit.framework.*;
import junit.framework.Test;
import junit.framework.TestSuite;

public class TestReview extends RemoteCatalogTestCase {

    private final static int REVIEW_RATING = 10;
    private final static String REVIEW_COMMENTS =
            "The most useful piece of software since the quicksort";

    private Review testReview;

    public TestReview(String testName) {
        super(testName);
    }

    public void setUp() throws Exception {
        super.setUp();
        testReview = new Review(defaultUser, REVIEW_RATING, REVIEW_COMMENTS);
    }

    /*
     * getName and getComments methods tested implicitly in the constructor
     * and setter method tests.  getId not tested because there is no good way
     * to determine the correct return value.
     */

    public void testConstructor() {
        assertNotNull("test review is null", testReview);
        assertEquals("Wrong user id", defaultUser.getId(),
                testReview.getUserId());
        assertNull("Wrong username", testReview.getUsername());
        assertEquals("Wrong rating", REVIEW_RATING, testReview.getRating());
        assertEquals("Wrong comments", REVIEW_COMMENTS,
                testReview.getComments());
    }

    public void testConstr_NullUser() {
        try {
            testReview = new Review(null, REVIEW_RATING, REVIEW_COMMENTS);
            fail("Accepted null user");
        } catch (IllegalArgumentException iae) {
            /* the expected behavior */
        }
    }

    public void testConstr_NullComments() {
        try {
            testReview = new Review(defaultUser, REVIEW_RATING, null);
            fail("Accepted null review description");
        } catch (IllegalArgumentException iae) {
            /* the expected behavior */
        }
    }

    public void testEquals() {
        Review review2 = new Review(defaultUser, REVIEW_RATING,
                REVIEW_COMMENTS);
        Review review3 = new Review(defaultUser, REVIEW_RATING, "");
        Review review4 = new Review(defaultUser, -1, REVIEW_COMMENTS);
        Review review5 = new Review(extraUser, REVIEW_RATING, REVIEW_COMMENTS);
        assertEquals("Equality failure", testReview, review2);
        assertTrue("Inequality failure", !testReview.equals(review3));
        assertTrue("Inequality failure", !testReview.equals(review4));
        assertTrue("Inequality failure", !testReview.equals(review5));
    }

    public void testHashCode_ConsistentWithEquals() {
        Review review2 = new Review(defaultUser, REVIEW_RATING,
                REVIEW_COMMENTS);
        Review review3 = new Review(defaultUser, REVIEW_RATING, "");
        assertEquals("Hash codes should match", testReview.hashCode(),
                review2.hashCode());
        assertTrue("Hash codes should not match",
                testReview.hashCode() != review3.hashCode());
    }

    public void testSetComments() {
        testReview.setComments("Foo rules!");
        assertEquals("Comments not set correctly", "Foo rules!",
                testReview.getComments());
    }

    public void testSetComments_Null() {
        try {
            testReview.setComments(null);
            fail("Accepted null review description");
        } catch (IllegalArgumentException iae) {
            /* the expected behavior */
        }
    }

    public void testSetRating() {
        testReview.setRating(5);
        assertEquals("Rating not set correctly", 5, testReview.getRating());
    }

    public void testToString() {
        assertNotNull(testReview.toString());  // not much we can test
    }

    public static Test suite() {
        return new CatalogTestSetup(new TestSuite(TestReview.class));
    }

}