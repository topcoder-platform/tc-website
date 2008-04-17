/*
 * Copyright (C) 2008 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.studio.dao.hibernate;

import com.topcoder.web.studio.TCHibernateTestCase;
import com.topcoder.web.studio.dao.ContestChannelDAO;
import com.topcoder.web.studio.model.ContestChannel;
import com.topcoder.web.common.dao.hibernate.GenericBase;
import junit.framework.Assert;

import java.util.List;

/**
 * <p>A unit test case for {@link ContestChannelDAOHibernate} class.</p>
 *
 * @author isv
 * @version 1.0
 * @since TopCoder Studio Modifications Assembly (Req# 5.2)
 */
public class ContestChannelDAOHibernateTestCase extends TCHibernateTestCase {

    /**
     * <p>The instance of {@link ContestChannelDAOHibernate} which is tested. This instance is initialized in
     * {@link #setUp()} method and released in {@link #tearDown()} method.</p>
     */
    private ContestChannelDAOHibernate testedInstance = null;

    /**
     * <p>Constructs new <code>ContestChannelDAOHibernateTestCase</code> instance with specified test name.</p>
     *
     * @param name a <code>String</code> providing the name of the test.
     */
    public ContestChannelDAOHibernateTestCase(String name) {
        setName(name);
    }

    /**
     * <p>Sets up the fixture. This method is called before a test is executed.</p>
     */
    public void setUp() {
        super.setUp();
        this.testedInstance = new ContestChannelDAOHibernate();
    }

    /**
     * <p>Tears down the fixture. This method is called after a test is executed.</p>
     */
    public void tearDown() {
        this.testedInstance = null;
        super.tearDown();
    }

    /**
     * <p>Accuracy test. Tests the {@link ContestChannelDAO#find(Integer)} method for accurate behavior.</p>
     *
     * <p>Passes the IDs of existing contest channels and expects the method to return the valid {@link ContestChannel}
     * instances matching the provided IDs.</p>
     */
    public void testFind_Integer() {
        int contestChannelsCnt = 3;
        Integer[] ids = {ContestChannel.STUDIO_ADMINISTRATOR, ContestChannel.TOPCODER_DIRECT,
                         ContestChannel.STUDIO_ADMINISTRATOR_V1};
        String[] descriptions = {"Studio Administrator", "TopCoder Direct", "Studio Administrator v.1"};

        for (int i = 0; i < contestChannelsCnt; i++) {
            ContestChannel channel = this.testedInstance.find(ids[i]);
            Assert.assertNotNull("The existing contest channel is not found", channel);
            Assert.assertEquals("Wrong contest channel ID retrieved", ids[i], channel.getId());
            Assert.assertEquals("Wrong contest channel description retrieved",
                                descriptions[i], channel.getDescription());
        }
    }

    /**
     * <p>Accuracy test. Tests the {@link ContestChannelDAO#find(Integer)} method for accurate behavior.</p>
     *
     * <p>Passes the IDs of non-existing contest chanels and expects the method to return <code>nuill</code>.</p>
     */
    public void testFind_Integer_NonExisting() {
        Integer[] ids = {-10, 0, 3232, 10};
        for (int i = 0; i < ids.length; i++) {
            ContestChannel channel = this.testedInstance.find(ids[i]);
            Assert.assertNull("The ContestChannel instance is returned for non-existing ID", channel);
        }
    }

    /**
     * <p>Accuracy test. Tests the {@link ContestChannelDAO#getContestChannels()} method for accurate behavior.</p>
     *
     * <p>Verifies that the method returns the valid {@link ContestChannel} instances for all existing contest channels.
     * </p>
     */
    public void testGetContestChannels() {
        int contestChannelsCnt = 3;
        Integer[] ids = {ContestChannel.STUDIO_ADMINISTRATOR, ContestChannel.TOPCODER_DIRECT,
                         ContestChannel.STUDIO_ADMINISTRATOR_V1};
        String[] descriptions = {"Studio Administrator", "TopCoder Direct", "Studio Administrator v.1"};

        List<ContestChannel> channels = this.testedInstance.getContestChannels();
        Assert.assertEquals("Wrong number of contest channels is retrieved", contestChannelsCnt, channels.size());

        for (int i = 0; i < contestChannelsCnt; i++) {
            boolean found = false;
            for (ContestChannel returnedChannel : channels) {
                if (returnedChannel.getId().equals(ids[i])) {
                    found = true;
                    Assert.assertEquals("Wrong contest channel description retrieved", descriptions[i],
                                        returnedChannel.getDescription());
                }
            }
            Assert.assertTrue("The contest channel " + ids[i] + " is not retrieved", found);
        }
    }

    /**
     * <p>Accuracy test. Tests the declaration of the tested class.</p>
     *
     * <p>Verifies that the interface is declared correctly.</p>
     */
    public void testDeclaration() {
        Class<GenericBase> superClass = GenericBase.class;
        Class<ContestChannelDAOHibernate> testedClass = ContestChannelDAOHibernate.class;
        Assert.assertTrue(testedClass.getName() + " does not extend " + superClass.getName(),
                          superClass.isAssignableFrom(testedClass));
    }
}
