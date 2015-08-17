/*
 * Copyright (C) 2008 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.studio.dao;

import com.topcoder.web.studio.TCHibernateTestCase;
import com.topcoder.web.studio.model.ContestProperty;
import junit.framework.Assert;

import java.util.List;

/**
 * <p>A unit test for default implementation of {@link ContestPropertyDAO} interface.</p>
 *
 * @author isv
 * @version 1.0
 * @since TopCoder Studio Modifications Assembly (Req# 5.4)
 */
public class ContestPropertyDAOTestCase extends TCHibernateTestCase {

    /**
     * <p>The instance of {@link ContestPropertyDAO} which is tested. This instance is initialized in {@link #setUp()}
     * method and released in {@link #tearDown()} method.</p>
     */
    private ContestPropertyDAO testedInstance = null;

    /**
     * <p>An <code>Integer</code> array listinf the IDs of pre-defined contest properties.</p>
     */
    private final Integer[] ids = {ContestProperty.CONTEST_OVERVIEW_TEXT, ContestProperty.PRIZE_DESCRIPTION,
                                   ContestProperty.VIEWABLE_SUBMISSIONS, ContestProperty.MIN_WIDTH,
                                   ContestProperty.MAX_WIDTH, ContestProperty.MIN_HEIGHT, ContestProperty.MAX_HEIGHT,
                                   ContestProperty.MAX_SUBMISSIONS, ContestProperty.VIEWABLE_SUBMITTERS,
                                   ContestProperty.REQUIRE_PREVIEW_IMAGE, ContestProperty.REQUIRE_PREVIEW_FILE,
                                   ContestProperty.OTHER_FILE_TYPES, ContestProperty.FULL_DESCRIPTION,
                                   ContestProperty.COLOR_REQUIREMENTS, ContestProperty.FONT_REQUIREMENTS,
                                   ContestProperty.SIZE_REQUIREMENTS, ContestProperty.CONTENT_REQUIREMENTS,
                                   ContestProperty.OTHER_REQUIREMENTS, ContestProperty.SUBMISSION_FILE_FORMAT,
                                   ContestProperty.WINNER_SELECTION, ContestProperty.ELIGIBILITY,
                                   ContestProperty.CLIENT};

    /**
     * <p>A <code>String</code> array listinf the descriptions of pre-defined contest properties.</p>
     */
    private final String[] descriptions = {"Contest Overview Text", "Prize Description", "Viewable Submissions Flag",
                                            "Minimum Submission Image Width", "Maximum Submission Image Width",
                                            "Minimum Submission Image Height", "Maximum Submission Image Height",
                                            "Maximum Submissions", "Viewable Submitters", "Requires Preview Image",
                                            "Requires Preview File",
                                            "Other File Types", "Full Description", "Color Requirements",
                                            "Font Requirements", "Size Requirements", "Content Requirements",
                                            "Other Requirements", "Submission File Format", "Winner Selection",
                                            "Eligibility", "Client"};

    /**
     * <p>Constructs new <code>ContestPropertyDAOTestCase</code> instance with specified test name.</p>
     *
     * @param name a <code>String</code> providing the name of the test.
     */
    public ContestPropertyDAOTestCase(String name) {
        setName(name);
    }

    /**
     * <p>Sets up the fixture. This method is called before a test is executed.</p>
     */
    public void setUp() {
        super.setUp();
        this.testedInstance = StudioDAOUtil.getFactory().getContestPropertyDAO();
    }

    /**
     * <p>Tears down the fixture. This method is called after a test is executed.</p>
     */
    public void tearDown() {
        this.testedInstance = null;
        super.tearDown();
    }

    /**
     * <p>Accuracy test. Tests the {@link ContestPropertyDAO#find(Integer)} method for accurate behavior.</p>
     *
     * <p>Passes the IDs of existing contest properties and expects the method to return the valid
     * {@link ContestProperty} instances matching the provided IDs.</p>
     */
    public void testFind_Integer() {
        int contestPropertiesCnt = this.ids.length;

        for (int i = 0; i < contestPropertiesCnt; i++) {
            ContestProperty property = this.testedInstance.find(ids[i]);
            Assert.assertNotNull("The existing contest property is not found", property);
            Assert.assertEquals("Wrong contest property ID retrieved", ids[i], property.getId());
            Assert.assertEquals("Wrong contest property description retrieved",
                                descriptions[i], property.getDescription());
        }
    }

    /**
     * <p>Accuracy test. Tests the {@link ContestPropertyDAO#find(Integer)} method for accurate behavior.</p>
     *
     * <p>Passes the IDs of non-existing contest properties and expects the method to return <code>nuill</code>.</p>
     */
    public void testFind_Integer_NonExisting() {
        Integer[] ids = {-10, 0, 3232, 103313132};
        for (int i = 0; i < ids.length; i++) {
            ContestProperty property = this.testedInstance.find(ids[i]);
            Assert.assertNull("The ContestProperty instance is returned for non-existing ID", property);
        }
    }

    /**
     * <p>Accuracy test. Tests the {@link ContestPropertyDAO#getProperties()} method for accurate behavior.</p>
     *
     * <p>Verifies that the method returns the valid {@link ContestProperty} instances for all existing contest
     * properties.</p>
     */
    public void testGetContestTypes() {
        int contestPropertiesCnt = this.ids.length;

        List properties = this.testedInstance.getProperties();
        Assert.assertEquals("Wrong number of contest properties is retrieved", contestPropertiesCnt, properties.size());

        for (int i = 0; i < contestPropertiesCnt; i++) {
            boolean found = false;
            for (ContestProperty returnedProperty : (List<ContestProperty>) properties) {
                if (returnedProperty.getId().equals(ids[i])) {
                    found = true;
                    Assert.assertEquals("Wrong contest property description retrieved", descriptions[i],
                                        returnedProperty.getDescription());
                }
            }
            Assert.assertTrue("The contest property " + ids[i] + " is not retrieved", found);
        }
    }
}
