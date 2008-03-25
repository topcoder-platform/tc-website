/*
 * Copyright (C) 2008 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.studio.model;

import com.topcoder.web.studio.TCHibernateTestCase;
import com.topcoder.web.studio.dao.ContestChannelDAO;
import com.topcoder.web.studio.dao.StudioDAOUtil;
import com.topcoder.web.studio.dao.ContestTypeDAO;
import junit.framework.Assert;

/**
 * <p>A unit test for {@link Contest} class.</p>
 *
 * @author isv
 * @version 1.0
 * @since TopCoder Studio Modifications Assembly (Req# 5.3, 5.4)
 */
public class ContestTestCase extends TCHibernateTestCase {

    /**
     * <p>The instance of {@link Contest} which is tested. This instance is initialized in {@link #setUp()} method
     * and released in {@link #tearDown()} method.</p>
     */
    private Contest testedInstance = null;

    /**
     * <p>Constructs new <code>ContestTestCase</code> instance with specified test name.</p>
     *
     * @param name a <code>String</code> providing the name of the test.
     */
    public ContestTestCase(String name) {
        setName(name);
    }

    /**
     * <p>Sets up the fixture. This method is called before a test is executed.</p>
     */
    public void setUp() {
        super.setUp();
        this.testedInstance = new Contest();
    }

    /**
     * <p>Tears down the fixture. This method is called after a test is executed.</p>
     */
    public void tearDown() {
        this.testedInstance = null;
        super.tearDown();
    }

    /**
     * <p>Accuracy test. Tests the {@link Contest} constructor for accurate behavior.</p>
     *
     * <p>Verifies that instance fields are initialized to <code>null</code>.</p>
     */
    public void testConstructor() {
        Assert.assertNull("The contest channel is not set to NULL", this.testedInstance.getChannel());
        Assert.assertNull("The contest type is not set to NULL", this.testedInstance.getType());
        Assert.assertNull("The contest direct project ID is not set to NULL", this.testedInstance.getDirectProjectId());
    }

    /**
     * <p>Accuracy test. Tests the {@link Contest#setChannel(ContestChannel)} and {@link Contest#getChannel()} methods
     * for accurate behavior.</p>
     *
     * <p>Passses the valid values to {@link Contest#setChannel(ContestChannel)} method and reads them back through
     * {@link Contest#getChannel()} methods and verifies that the read value is matching the set value.</p>
     */
    public void testSetGetChannel() {
        ContestChannelDAO channelDAO = StudioDAOUtil.getFactory().getContestChannelDAO();
        ContestChannel[] validValues = new ContestChannel[] {null,
                                                             channelDAO.find(ContestChannel.STUDIO_ADMINISTRATOR),
                                                             channelDAO.find(ContestChannel.TOPCODER_DIRECT),
                                                             channelDAO.find(ContestChannel.STUDIO_ADMINISTRATOR_V1)};
        for (int i = 0; i < validValues.length; i++) {
            this.testedInstance.setChannel(validValues[i]);
            Assert.assertEquals("The [channel] property is not set and read correctly",
                                validValues[i], this.testedInstance.getChannel());
        }
    }

    /**
     * <p>Accuracy test. Tests the {@link Contest#setType(ContestType)} and {@link Contest#getType()} methods for
     * accurate behavior.</p>
     *
     * <p>Passses the valid values to {@link Contest#setType(ContestType)} method and reads them back through
     * {@link Contest#getType()} methods and verifies that the read value is matching the set value.</p>
     */
    public void testSetGetType() {
        ContestTypeDAO typeDAO = StudioDAOUtil.getFactory().getContestTypeDAO();
        ContestType[] validValues = new ContestType[] {null,
                                                       typeDAO.find(ContestType.STORYBOARD),
                                                       typeDAO.find(ContestType.PROTOTYPE),
                                                       typeDAO.find(ContestType.LOGO)};
        for (int i = 0; i < validValues.length; i++) {
            this.testedInstance.setType(validValues[i]);
            Assert.assertEquals("The [type] property is not set and read correctly",
                                validValues[i], this.testedInstance.getType());
        }
    }

    /**
     * <p>Accuracy test. Tests the {@link Contest#setDirectProjectId(Integer)} and {@link Contest#getDirectProjectId()}
     * methods for accurate behavior.</p>
     *
     * <p>Passses the valid values to {@link Contest#setDirectProjectId(Integer)} method and reads them back through
     * {@link Contest#getDirectProjectId()} methods and verifies that the read value is matching the set value.</p>
     */
    public void testSetGetDirectProjectId() {
        Integer[] validValues = new Integer[] {null, 1, 0, -1, 1000, -1398329, 5937858};
        for (int i = 0; i < validValues.length; i++) {
            this.testedInstance.setDirectProjectId(validValues[i]);
            Assert.assertEquals("The [directProjectId] property is not set and read correctly",
                                validValues[i], this.testedInstance.getDirectProjectId());
        }
    }

    /**
     * <p>Accuracy test. Tests the {@link Contest#setCreateUserId(Long)} and {@link Contest#getCreateUserId()}
     * methods for accurate behavior.</p>
     *
     * <p>Passses the valid values to {@link Contest#setCreateUserId(Long)} method and reads them back through
     * {@link Contest#getCreateUserId()} methods and verifies that the read value is matching the set value.</p>
     */
    public void testSetGetCreateUserId() {
        Long[] validValues = new Long[] {null, 1L, 0L, -1L, 1000L, -1398329L, 5937858L, 49294949494949L};
        for (int i = 0; i < validValues.length; i++) {
            this.testedInstance.setCreateUserId(validValues[i]);
            Assert.assertEquals("The [createUserId] property is not set and read correctly",
                                validValues[i], this.testedInstance.getCreateUserId());
        }
    }
}
