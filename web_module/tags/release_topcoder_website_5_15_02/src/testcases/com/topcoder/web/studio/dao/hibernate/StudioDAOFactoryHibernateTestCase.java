/*
 * Copyright (C) 2008 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.studio.dao.hibernate;

import junit.framework.TestCase;
import junit.framework.Assert;
import com.topcoder.web.studio.dao.ContestTypeDAO;
import com.topcoder.web.studio.dao.ContestChannelDAO;
import com.topcoder.web.studio.dao.MediumDAO;

/**
 * <p>A unit test for {@link StudioDAOFactoryHibernate} class.</p>
 *
 * @author isv
 * @version 2.0
 * @since TopCoder Studio Modifications Assembly (Req# 5.1, 5.2)
 */
public class StudioDAOFactoryHibernateTestCase extends TestCase {

    /**
     * <p>The instance of {@link StudioDAOFactoryHibernate} which is tested. This instance is initialized in
     * {@link #setUp()} method and released in {@link #tearDown()} method.</p>
     */
    private StudioDAOFactoryHibernate testedInstance = null;

    /**
     * <p>Constructs new <code>StudioDAOFactoryHibernateTestCase</code> instance with specified test name.</p>
     *
     * @param name a <code>String</code> providing the name of the test.
     */
    public StudioDAOFactoryHibernateTestCase(String name) {
        super(name);
    }

    /**
     * <p>Sets up the fixture. This method is called before a test is executed.</p>
     *
     * @throws Exception if any error occurs.
     */
    protected void setUp() throws Exception {
        super.setUp();
        this.testedInstance = new StudioDAOFactoryHibernate();
    }

    /**
     * <p>Tears down the fixture. This method is called after a test is executed.</p>
     *
     * @throws Exception if any error occurs.
     */
    protected void tearDown() throws Exception {
        this.testedInstance = null;
        super.tearDown();
    }

    /**
     * <p>Accuracy test. Tests the {@link StudioDAOFactoryHibernate#getContestTypeDAO} method for accuracy.</p>
     *
     * <p>Verifies that the method returns the {@link ContestTypeDAO} implementation of {@link ContestTypeDAOHibernate}
     * type on each method call. The tested method is called <code>100</code> times.</p>
     */
    public void testGetContestTypeDAO() {
        for (int i = 0; i < 100; i++) {
            ContestTypeDAO dao = this.testedInstance.getContestTypeDAO();
            Assert.assertNotNull("The factory does not return ContestTypeDAO", dao);
            Assert.assertEquals("The factory does not return ContestTypeDAO of correct type",
                                ContestTypeDAOHibernate.class.getName(), dao.getClass().getName());
        }
    }

    /**
     * <p>Accuracy test. Tests the {@link StudioDAOFactoryHibernate#getContestChannelDAO()} method for accuracy.</p>
     *
     * <p>Verifies that the method returns the {@link ContestChannelDAO} implementation of
     * {@link ContestChannelDAOHibernate} type on each method call. The tested method is called <code>100</code> times.
     * </p>
     */
    public void testGetContestChannelDAO() {
        for (int i = 0; i < 100; i++) {
            ContestChannelDAO dao = this.testedInstance.getContestChannelDAO();
            Assert.assertNotNull("The factory does not return ContestChannelDAO", dao);
            Assert.assertEquals("The factory does not return ContestChannelDAO of correct type",
                                ContestChannelDAOHibernate.class.getName(), dao.getClass().getName());
        }
    }

    /**
     * <p>Accuracy test. Tests the {@link StudioDAOFactoryHibernate#getMediumDAO()} method for accuracy.</p>
     *
     * <p>Verifies that the method returns the {@link MediumDAO} implementation of {@link MediumDAOHibernate} type on
     * each method call. The tested method is called <code>100</code> times.</p>
     * 
     * @since TopCoder Studio Modifications Assembly v2 (Req# 5.1.5)
     */
    public void testGetMediumDAO() {
        for (int i = 0; i < 100; i++) {
            MediumDAO dao = this.testedInstance.getMediumDAO();
            Assert.assertNotNull("The factory does not return MediumDAO", dao);
            Assert.assertEquals("The factory does not return MediumDAO of correct type",
                                MediumDAOHibernate.class.getName(), dao.getClass().getName());
        }
    }
}
