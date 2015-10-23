/*
 * TestLocalDDECompReviewsHome.java
 *
 * By John C. Bollinger
 *
 * Copyright (c) 2002
 */

package com.topcoder.dde.persistencelayer.test;

import com.topcoder.dde.persistencelayer.interfaces.*;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Collection;
import java.util.Date;
import javax.ejb.CreateException;
import javax.ejb.ObjectNotFoundException;
import javax.ejb.SessionContext;

/**
 * contains tests for the local home interface of the DDECompReviews EJB
 *
 * @author John C. Bollinger
 *
 * @version 1.0
 */
public class TestLocalDDECompReviewsHome extends PersistenceTestCase {

    /* an instance of the localHome interface implementation to work with */
    private LocalDDECompReviewsHome localHome;

    /* default field values for entity instances */
    static final private Timestamp DEF_REVIEW_TIME
            = new Timestamp(System.currentTimeMillis());
    static final int DEF_RATING = 1000;
    static final String DEF_COMMENTS =
            "Foo component is the greatest thing since the widget --"
            + " and I mean the original, abstract widget, not these funky"
            + " UI component thingamabobs!";

    /**
     * a default constructor for use only by other test cases in this package
     */
    TestLocalDDECompReviewsHome() {
        this("testCreate");
    }

    /**
     * constructs a new TestLocalDDECompReviewsHome configured to run the named
     * test
     */
    public TestLocalDDECompReviewsHome(String testName) {
        this(testName, null);
    }

    /**
     * constructs a new TestLocalDDECategoriesHome configured to run the named
     * test in the specified session context
     */
    public TestLocalDDECompReviewsHome(String testName, SessionContext sc) {
        super(testName, "COMP_REVIEWS", sc);
    }

    /**
     * sets up the fixture for this test
     */
    public void setUp() throws Exception {
        super.setUp();
        synchronized (contextLock) {
            localHome = (LocalDDECompReviewsHome) ctx.lookup(
                    LocalDDECompReviewsHome.EJB_REF_NAME);
        }
    }

    /*
     * creates a LocalDDECompReviews entity with default parameters
     */
    LocalDDECompReviews createDefault(LocalDDECompVersions version,
                                      LocalDDEUserMaster master) throws Exception {
        return localHome.create(DEF_REVIEW_TIME, DEF_RATING, DEF_COMMENTS,
                version, master);
    }

    /**
     * tests all entity creation functionality of the bean
     */
    public void testAllCreate() throws Exception {
        /*
         * This is messy because we need to obtain a LocalDDECompVersions object
         * and a LocalDDEUserMaster object in order to create a
         * LocalDDECompReviews.  Because the setup is so involved, there are
         * several logically different tests bundled together here.
         */
        synchronized (TestLocalDDECompCatalogHome.class) {
            LocalDDECompCatalog localComponent;
            TestLocalDDECompCatalogHome compHome =
                    new TestLocalDDECompCatalogHome();

            compHome.setUp();
            localComponent = compHome.createDefault();
            assertNotNull(localComponent);
            try {
                synchronized (TestLocalDDECompVersionsHome.class) {
                    LocalDDECompVersions localVersion;
                    TestLocalDDECompVersionsHome versionsHome =
                            new TestLocalDDECompVersionsHome();
                    versionsHome.setUp();
                    localVersion = versionsHome.createDefault(localComponent);
                    assertNotNull(localVersion);
                    try {
                        synchronized (TestLocalDDEUserMasterHome.class) {
                            LocalDDEUserMaster localMaster;
                            TestLocalDDEUserMasterHome masterHome
                                    = new TestLocalDDEUserMasterHome();
                            masterHome.setUp();
                            localMaster = masterHome.createDefault();
                            assertNotNull(localMaster);
                            try {
                                synchronized (TestLocalDDECompReviewsHome.class) {
                                    /* test normal creation */
                                    LocalDDECompReviews local =
                                            createDefault(localVersion,
                                                    localMaster);
                                    assertNotNull(local);
                                    try {
                                        assertEquals(DEF_REVIEW_TIME,
                                                local.getReviewTime());
                                        assertEquals(DEF_RATING,
                                                local.getRating());
                                        assertEquals(DEF_COMMENTS,
                                                local.getComments());
                                        assertTrue(localVersion.isIdentical(
                                                local.getCompVersions()));
                                        assertTrue(localMaster.isIdentical(
                                                local.getUserMaster()));
                                        try {
                                            LocalDDECompReviews local2 =
                                                    createDefault(localVersion,
                                                            localMaster);
                                            local2.remove();
                                            fail("Expected a CreateException");
                                        } catch (CreateException ce) {
                                            /* the expected behavior */
                                        }
                                    } finally {
                                        local.remove();
                                    }

                                    /* test creation with null component version */
                                    local = localHome.create(DEF_REVIEW_TIME,
                                            DEF_RATING, DEF_COMMENTS, null,
                                            localMaster);
                                    assertNotNull(local);
                                    local.remove();
                                    /* test creation with null user */
                                    local = localHome.create(DEF_REVIEW_TIME,
                                            DEF_RATING, DEF_COMMENTS, localVersion,
                                            null);
                                    assertNotNull(local);
                                    local.remove();
                                    /* test creation with null version and user */
                                    local = localHome.create(DEF_REVIEW_TIME,
                                            DEF_RATING, DEF_COMMENTS, null,
                                            null);
                                    assertNotNull(local);
                                    local.remove();
                                }
                            } finally {
                                localMaster.remove();
                            }
                        }
                    } finally {
                        localVersion.remove();
                    }
                }
            } finally {
                localComponent.remove();
            }
        }
    }

    public void testFindByPrimaryKey() {
        fail("Test not yet implemented");
    }

//    public void testFindByCompVersId() {
//        fail("Test not yet implemented");
//    }

    class DDECompReviewsData implements RowData {
        long compReviewsId;
        Long compVersId;
        Long loginId;
        Timestamp reviewTime;
        int rating;
        String comments;

        DDECompReviewsData(Object id, Long version, Long login,
                           Timestamp review, int rate, String com) {
            this(keyToLong(id), version, login, review, rate, com);
        }

        DDECompReviewsData(long id, Long version, Long login,
                           Timestamp review, int rate, String com) {
            compReviewsId = id;
            compVersId = version;
            loginId = login;
            reviewTime = (Timestamp) review.clone();
            rating = rate;
            comments = com;
        }

        DDECompReviewsData(ResultSet rs) throws SQLException {
            readRowData(rs);
        }

        public Object getPrimaryKey() {
            return new Long(compReviewsId);
        }

        private void updateResultSet(ResultSet rs) throws SQLException {
            if (compVersId == null) {
                rs.updateNull("COMP_VERS_ID");
            } else {
                rs.updateLong("COMP_VERS_ID", compVersId.longValue());
            }
            if (loginId == null) {
                rs.updateNull("LOGIN_ID");
            } else {
                rs.updateLong("LOGIN_ID", loginId.longValue());
            }
            rs.updateTimestamp("REVIEW_TIME", reviewTime);
            rs.updateInt("RATING", rating);
            rs.updateString("COMMENTS", comments);
        }

        public void storeRowData(ResultSet rs) throws SQLException {
            updateResultSet(rs);
            rs.updateRow();
        }

        public void insertRowData(ResultSet rs) throws SQLException {
            rs.moveToInsertRow();
            rs.updateLong("COMP_REVIEWS_ID", compReviewsId);
            updateResultSet(rs);
            rs.insertRow();
        }

        public void readRowData(ResultSet rs) throws SQLException {
            long l;

            compReviewsId = rs.getLong("COMP_REVIEWS_ID");
            l = rs.getLong("COMP_VERS_ID");
            if (rs.wasNull()) {
                compVersId = null;
            } else {
                compVersId = new Long(l);
            }
            l = rs.getLong("LOGIN_ID");
            if (rs.wasNull()) {
                loginId = null;
            } else {
                loginId = new Long(l);
            }
            reviewTime = rs.getTimestamp("REVIEW_TIME");
            rating = rs.getInt("RATING");
            comments = rs.getString("COMMENTS");
        }

        public boolean matchesResultSet(ResultSet rs) throws SQLException {
            return equals(new DDECompReviewsData(rs));
        }

        public boolean equals(Object o) {
            if (!(o instanceof DDECompReviewsData)) {
                return false;
            }
            DDECompReviewsData d = (DDECompReviewsData) o;
            return (
                    (compReviewsId == d.compReviewsId)
                    && objectsMatch(compVersId, d.compVersId)
                    && objectsMatch(loginId, d.loginId)
                    && objectsMatch(reviewTime, d.reviewTime)
                    && (rating == d.rating)
                    && objectsMatch(comments, d.comments));
        }

    }

}