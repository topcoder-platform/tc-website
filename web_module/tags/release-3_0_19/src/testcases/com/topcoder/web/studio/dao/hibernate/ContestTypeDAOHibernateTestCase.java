/*
 * Copyright (C) 2008 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.studio.dao.hibernate;

import com.topcoder.web.common.dao.hibernate.GenericBase;
import com.topcoder.web.studio.TCHibernateTestCase;
import com.topcoder.web.studio.model.ContestType;
import junit.framework.Assert;

import java.util.List;

/**
 * <p>A unit test for {@link ContestTypeDAOHibernate} class.</p>
 *
 * @author isv
 * @version 1.0
 * @since TopCoder Studio Modifications Assembly (Req# 5.1)
 */
public class ContestTypeDAOHibernateTestCase extends TCHibernateTestCase {

    /**
     * <p>The instance of {@link ContestTypeDAOHibernate} which is tested. This instance is initialized in
     * {@link #setUp()} method and released in {@link #tearDown()} method.</p>
     */
    private ContestTypeDAOHibernate testedInstance = null;

    /**
     * <p>Constructs new <code>ContestTypeDAOHibernateTestCase</code> instance with specified test name.</p>
     *
     * @param name a <code>String</code> providing the name of the test.
     */
    public ContestTypeDAOHibernateTestCase(String name) {
        setName(name);
    }

    /**
     * <p>Sets up the fixture. This method is called before a test is executed.</p>
     */
    public void setUp() {
        super.setUp();
        this.testedInstance = new ContestTypeDAOHibernate();
    }

    /**
     * <p>Tears down the fixture. This method is called after a test is executed.</p>
     */
    public void tearDown() {
        this.testedInstance = null;
        super.tearDown();
    }

    /**
     * <p>Accuracy test. Tests the {@link ContestTypeDAOHibernate#find(Integer)} method for accurate behavior.</p>
     *
     * <p>Passes the IDs of existing contest types and expects the method to return the valid {@link ContestType}
     * instances matching the provided IDs.</p>
     */
    public void testFind_Integer_Existing() {
        int contestTypesCnt = 3;
        Integer[] ids = {ContestType.STORYBOARD, ContestType.PROTOTYPE, ContestType.LOGO};
        String[] descriptions = {"Storyboard", "Prototype", "Logo"};
        Boolean[] imagePreviewReqs = {false, false, true};
        Boolean[] filePreviewReqs = {true, true, false};

        for (int i = 0; i < contestTypesCnt; i++) {
            ContestType type = this.testedInstance.find(ids[i]);
            Assert.assertNotNull("The existing content type is not found", type);
            Assert.assertEquals("Wrong contest type ID retrieved", ids[i], type.getId());
            Assert.assertEquals("Wrong contest type description retrieved", descriptions[i], type.getDescription());
            Assert.assertEquals("Wrong contest type image preview required flag retrieved",
                                imagePreviewReqs[i], type.getPreviewImageRequired());
            Assert.assertEquals("Wrong contest type file preview required flag retrieved",
                                filePreviewReqs[i], type.getPreviewFileRequired());
        }
    }

    /**
     * <p>Accuracy test. Tests the {@link ContestTypeDAOHibernate#find(Integer)} method for accurate behavior.</p>
     *
     * <p>Passes the IDs of non-existing contest types and expects the method to return <code>nuill</code>.</p>
     */
    public void testFind_Integer_NonExisting() {
        Integer[] ids = {-10, 0, 3232, 10};
        for (int i = 0; i < ids.length; i++) {
            ContestType type = this.testedInstance.find(ids[i]);
            Assert.assertNull("The ContentType instance is returned for non-existing ID", type);
        }
    }

    /**
     * <p>Accuracy test. Tests the {@link ContestTypeDAOHibernate#getContestTypes()} method for accurate behavior.</p>
     *
     * <p>Verifies that the method returns the valid {@link ContestType} instances for all existing content types.</p>
     */
    public void testGetContestTypes() {
        int contestTypesCnt = 3;
        Integer[] ids = {ContestType.STORYBOARD, ContestType.PROTOTYPE, ContestType.LOGO};
        String[] descriptions = {"Storyboard", "Prototype", "Logo"};
        Boolean[] imagePreviewReqs = {false, false, true};
        Boolean[] filePreviewReqs = {true, true, false};

        List<ContestType> types = this.testedInstance.getContestTypes();
        Assert.assertEquals("Wrong number of contest types is retrieved", contestTypesCnt, types.size());

        for (int i = 0; i < contestTypesCnt; i++) {
            boolean found = false;
            for (ContestType returnedType : types) {
                if (returnedType.getId().equals(ids[i])) {
                    found = true;
                    Assert.assertEquals("Wrong contest type description retrieved", descriptions[i],
                                        returnedType.getDescription());
                    Assert.assertEquals("Wrong contest type image preview required flag retrieved",
                                        imagePreviewReqs[i], returnedType.getPreviewImageRequired());
                    Assert.assertEquals("Wrong contest type file preview required flag retrieved",
                                        filePreviewReqs[i], returnedType.getPreviewFileRequired());
                }
            }
            Assert.assertTrue("The contest type " + ids[i] + " is not retrieved", found);
        }
    }

    /**
     * <p>Accuracy test. Tests the declaration of the tested class.</p>
     *
     * <p>Verifies that the interface is declared correctly.</p>
     */
    public void testDeclaration() {
        Class<GenericBase> superClass = GenericBase.class;
        Class<ContestTypeDAOHibernate> testedClass = ContestTypeDAOHibernate.class;
        Assert.assertTrue(testedClass.getName() + " does not extend " + superClass.getName(),
                          superClass.isAssignableFrom(testedClass));
    }
}
