package com.topcoder.dde.persistencelayer.testbean;

import java.sql.Timestamp;
import javax.ejb.FinderException;
import javax.ejb.RemoveException;
import javax.naming.NamingException;

import com.topcoder.dde.persistencelayer.interfaces.LocalDDECompCatalog;
import com.topcoder.dde.persistencelayer.interfaces.LocalDDECompReviews;
import com.topcoder.dde.persistencelayer.interfaces.LocalDDECompReviewsHome;
import com.topcoder.dde.persistencelayer.interfaces.LocalDDECompVersions;
import com.topcoder.dde.persistencelayer.interfaces.LocalDDEUserMaster;

public final class DDECompReviewsTest extends DDEServerTestCase {

    private LocalDDECompReviewsHome reviewsHome;

    DDECompReviewsTest() {
    }

    protected void setUp() throws NamingException {
        reviewsHome = (LocalDDECompReviewsHome) lookup(LocalDDECompReviewsHome.EJB_REF_NAME);
    }

    public void test() throws Exception {
        LocalDDECompCatalog catalog = DDECompCatalogTest.create();
        LocalDDECompVersions versions = DDECompVersionsTest.create(catalog);
        String comments = "CompReviewsComments11";
        LocalDDEUserMaster userMaster = DDEUserMasterTest.create();
        Timestamp reviewTime = currentTimestamp();
        int rating = 12;
        LocalDDECompReviews reviews = reviewsHome.create(reviewTime, rating, comments, versions, userMaster);
        Long primaryKey = testGetPrimaryKey(reviews);
        testGetComments(reviews, comments);
        testGetCompVersions(reviews, versions);
        testGetUserMaster(reviews, userMaster);
        testGetRating(reviews, rating);
        testGetReviewTime(reviews, reviewTime);
        testRemove(reviews, versions, catalog, primaryKey);
    }

    private void testGetReviewTime(LocalDDECompReviews reviews, Timestamp reviewTime) {
        Timestamp reviewTime2 = reviews.getReviewTime();
        assertEquals(reviewTime, reviewTime2);
    }

    private void testGetRating(LocalDDECompReviews reviews, int rating) {
        int rating2 = reviews.getRating();
        assertEquals(rating, rating2);
    }

    private void testGetUserMaster(LocalDDECompReviews reviews, LocalDDEUserMaster userMaster) {
        LocalDDEUserMaster userMaster2 = reviews.getUserMaster();
        assertTrue(userMaster.isIdentical(userMaster2));
    }

    private void testGetCompVersions(LocalDDECompReviews reviews, LocalDDECompVersions versions) {
        LocalDDECompVersions versions2 = reviews.getCompVersions();
        assertTrue(versions.isIdentical(versions2));
    }

    private void testGetComments(LocalDDECompReviews reviews, String comments) {
        String comments2 = reviews.getComments();
        assertEquals(comments, comments2);
    }

    private Long testGetPrimaryKey(LocalDDECompReviews reviews) throws FinderException {
        Long primaryKey = (Long) reviews.getPrimaryKey();
        LocalDDECompReviews reviews2 = reviewsHome.findByPrimaryKey(primaryKey);
        assertTrue(reviews.isIdentical(reviews2));
        return primaryKey;
    }

    private void testRemove(LocalDDECompReviews reviews, LocalDDECompVersions versions,
                            LocalDDECompCatalog catalog, Long primaryKey) throws RemoveException {
        reviews.remove();
        versions.remove();
        catalog.remove();
        try {
            reviewsHome.findByPrimaryKey(primaryKey);
            fail();
        } catch (FinderException e) {
        }
    }

}
