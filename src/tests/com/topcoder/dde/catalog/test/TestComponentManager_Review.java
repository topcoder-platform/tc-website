/*
 * TestComponentManager_Review.java
 *
 * By John C. Bollinger
 *
 * Copyright (c) 2002
 */
package com.topcoder.dde.catalog.test;

import com.topcoder.dde.catalog.CatalogException;
import com.topcoder.dde.catalog.Review;

import java.util.Collection;
import java.util.Iterator;

import junit.framework.Test;
import junit.framework.TestSuite;

/**
 * a JUnit test case that exercises the Review management methods of the
 * ComponentManager EJB
 *
 * @author John C. Bollinger
 * @version 1.0
 */
public class TestComponentManager_Review
        extends RemoteComponentManagerTestCase {

    protected Review review;

    /**
     * constructs a new instance configured to run the named test
     *
     * @param  testName a <code>String</code> containing the name of the test
     *         to run
     */
    public TestComponentManager_Review(String testName) {
        super(testName);
    }

    public void setUp() throws Exception {
        super.setUp();
        review = new Review(defaultUser, 10, "Test Review #" + idGen.nextId());
    }

    /**
     * tests the normal functioning of the addReview method
     */
    synchronized public void testAddReview() throws Exception {
        Review rev = manager1.addReview(review);
        Iterator it = manager1.getReviews().iterator();
        try {
            assertEquals("Review not added correctly", review, it.next());
            assertEquals("Username incorrect",
                    defaultUser.getRegInfo().getUsername(),
                    rev.getUsername());
        } finally {
            manager1.removeReview(rev.getId());
        }
    }

    /**
     * tests the functioning of the addReview method when a review matching
     * the argument already exists
     */
/*
 * Objecting to this case is not required
 *
    synchronized public void testAddReview_Exists() throws Exception {
        Review rev = manager1.addReview(review);
        try {
            manager1.addReview(review);
            fail("Expected a CatalogException");
        } catch (CatalogException ce) {
            // the expected case
        } finally {
            manager1.removeReview(rev.getId());
        }
    }
 */

    /**
     * tests the functioning of the addReview method when the argument is
     * <code>null</code>
     */
    public void testAddReview_Null() throws Exception {
        try {
            manager1.addReview(null);
            fail("Expected a CatalogException");
        } catch (CatalogException ce) {
            /* the expected case */
        }
    }

    /*
     * getReviews tested implicitly throughout this test case
     */

    /**
     * tests the normal functioning of the removeReview method
     */
    synchronized public void testRemoveReview() throws Exception {
        Review rev = manager1.addReview(review);
        Collection reviews;

        manager1.removeReview(rev.getId());
        reviews = manager1.getReviews();

        assertTrue("Review not removed", !reviews.contains(review));
    }

    /**
     * tests the functioning of the removeReview method when no review
     * matching the argument exists
     */
    public void testRemoveReview_Missing() throws Exception {
        try {
            manager1.removeReview(idGen.nextId());
            fail("Expected a CatalogException");
        } catch (CatalogException ce) {
            /* the expected case */
        }
    }

    /**
     * tests the functioning of the removeReview method when the review
     * matching the argument is not associated with the component being managed
     */
    synchronized public void testRemoveReview_NotOwned() throws Exception {
        Review rev = manager2.addReview(review);
        try {
            manager1.removeReview(rev.getId());
        } catch (Exception e) {
            manager2.removeReview(rev.getId());
            throw e;
        }
    }

    /**
     * tests the normal functioning of the updateReview method
     */
    synchronized public void testUpdateReview() throws Exception {
        Review rev = manager1.addReview(review);
        Review rev2 = new Review(defaultUser, rev.getRating(),
                rev.getComments());

        try {
            Collection reviews;
            rev.setRating(5);
            manager1.updateReview(rev);
            reviews = manager1.getReviews();
            assertTrue("Review not updated on the server",
                    reviews.contains(rev));
            assertTrue("Review duplicated, not updated",
                    !reviews.contains(rev2));
        } finally {
            manager1.removeReview(rev.getId());
        }
    }

    /**
     * tests the functioning of the updateReview method when the argument is
     * <code>null</code>
     */
    public void testUpdateReview_Null() throws Exception {
        try {
            manager1.updateReview(null);
            fail("Expected a CatalogException");
        } catch (CatalogException ce) {
            /* the expected case */
        }
    }

    /**
     * tests the functioning of the updateReview method when no review
     * matching the argument exists
     */
    public void testUpdateReview_Missing() throws Exception {
        try {
            manager1.updateReview(review);
            fail("Expected a CatalogException");
        } catch (CatalogException ce) {
            /* the expected case */
        }
    }

    /**
     * tests the functioning of the updateReview method when the review
     * matching the argument is not associated with the component being managed
     */
/*
 * Not a valid test -- the behavior is not required or expected
 *
    synchronized public void testUpdateReview_NotOwned() throws Exception {
        Review rev = manager2.addReview(review);
        try {
            manager1.updateReview(rev);
            fail("Expected a CatalogException");
        } catch (CatalogException ce) {
            // the expected case
        } finally {
            manager2.removeReview(rev.getId());
        }
    }
 *
 */

    public static Test suite() {
        return new ComponentManagerTestSetup(new TestSuite(TestComponentManager_Review.class));
    }

}