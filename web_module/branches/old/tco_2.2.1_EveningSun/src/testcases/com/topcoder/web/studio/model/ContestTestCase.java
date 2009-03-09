/*
 * Copyright (C) 2008 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.studio.model;

import com.topcoder.web.studio.TCHibernateTestCase;
import com.topcoder.web.studio.dao.ContestChannelDAO;
import com.topcoder.web.studio.dao.ContestPropertyDAO;
import com.topcoder.web.studio.dao.ContestTypeDAO;
import com.topcoder.web.studio.dao.StudioDAOUtil;
import junit.framework.Assert;

import java.sql.Timestamp;
import java.util.HashSet;
import java.util.Set;

/**
 * <p>A unit test for {@link Contest} class.</p>
 *
 * @author isv
 * @version 2.0
 * @since TopCoder Studio Modifications Assembly (Req# 5.3, 5.4)
 */
public class ContestTestCase extends TCHibernateTestCase {

    /**
     * <p>An <code>Integer</code> array listing the IDs of a contest properties</p>
     */
    protected static final Integer[] CONTEST_PROPS
            = {ContestProperty.MIN_HEIGHT, ContestProperty.MAX_HEIGHT, ContestProperty.MIN_WIDTH,
            ContestProperty.MAX_WIDTH, ContestProperty.CONTEST_OVERVIEW_TEXT, ContestProperty.PRIZE_DESCRIPTION,
            ContestProperty.VIEWABLE_SUBMISSIONS, ContestProperty.MAX_SUBMISSIONS,
            ContestProperty.VIEWABLE_SUBMITTERS, ContestProperty.CLIENT, ContestProperty.FULL_DESCRIPTION,
            ContestProperty.COLOR_REQUIREMENTS, ContestProperty.FONT_REQUIREMENTS, ContestProperty.SIZE_REQUIREMENTS,
            ContestProperty.CONTENT_REQUIREMENTS, ContestProperty.OTHER_REQUIREMENTS,
            ContestProperty.SUBMISSION_FILE_FORMAT, ContestProperty.WINNER_SELECTION, ContestProperty.ELIGIBILITY,
            ContestProperty.OTHER_FILE_TYPES};

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
        ContestPropertyDAO contestPropertyDAO = StudioDAOUtil.getFactory().getContestPropertyDAO();
        this.testedInstance = new Contest();
        Integer[] validValues = CONTEST_PROPS;
        for (int i = 0; i < validValues.length; i++) {
            ContestConfig config = new ContestConfig();
            config.setProperty(contestPropertyDAO.find(validValues[i]));
            this.testedInstance.addConfig(config);
        }
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
     * <p/>
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
     * <p/>
     * <p>Passses the valid values to {@link Contest#setChannel(ContestChannel)} method and reads them back through
     * {@link Contest#getChannel()} methods and verifies that the read value is matching the set value.</p>
     */
    public void testSetGetChannel() {
        ContestChannelDAO channelDAO = StudioDAOUtil.getFactory().getContestChannelDAO();
        ContestChannel[] validValues = new ContestChannel[]{null,
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
     * <p/>
     * <p>Passses the valid values to {@link Contest#setType(ContestType)} method and reads them back through
     * {@link Contest#getType()} methods and verifies that the read value is matching the set value.</p>
     */
    public void testSetGetType() {
        ContestTypeDAO typeDAO = StudioDAOUtil.getFactory().getContestTypeDAO();
        ContestType[] validValues = new ContestType[]{null,
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
     * <p/>
     * <p>Passses the valid values to {@link Contest#setDirectProjectId(Integer)} method and reads them back through
     * {@link Contest#getDirectProjectId()} methods and verifies that the read value is matching the set value.</p>
     */
    public void testSetGetDirectProjectId() {
        Integer[] validValues = new Integer[]{null, 1, 0, -1, 1000, -1398329, 5937858};
        for (int i = 0; i < validValues.length; i++) {
            this.testedInstance.setDirectProjectId(validValues[i]);
            Assert.assertEquals("The [directProjectId] property is not set and read correctly",
                    validValues[i], this.testedInstance.getDirectProjectId());
        }
    }

    /**
     * <p>Accuracy test. Tests the {@link Contest#setCreateUserId(Long)} and {@link Contest#getCreateUserId()}
     * methods for accurate behavior.</p>
     * <p/>
     * <p>Passses the valid values to {@link Contest#setCreateUserId(Long)} method and reads them back through
     * {@link Contest#getCreateUserId()} methods and verifies that the read value is matching the set value.</p>
     */
    public void testSetGetCreateUserId() {
        Long[] validValues = new Long[]{null, 1L, 0L, -1L, 1000L, -1398329L, 5937858L, 49294949494949L};
        for (int i = 0; i < validValues.length; i++) {
            this.testedInstance.setCreateUserId(validValues[i]);
            Assert.assertEquals("The [createUserId] property is not set and read correctly",
                    validValues[i], this.testedInstance.getCreateUserId());
        }
    }

    /**
     * <p>Accuracy test. Tests the {@link Contest#setWinnerAnnouncementTime(Timestamp)} and
     * {@link Contest#getWinnerAnnouncementTime()} methods for accurate behavior.</p>
     * <p/>
     * <p>Passses the valid values to {@link Contest#setWinnerAnnouncementTime(Timestamp)} method and reads them back
     * through {@link Contest#getWinnerAnnouncementTime()} methods and verifies that the read value is matching the set
     * value.</p>
     *
     * @since TopCoder Studio Modifications Assembly v2 (Req# 5.1.2)
     */
    public void testSetGetWinnerAnnouncementTime() {
        Timestamp[] validValues = new Timestamp[]{null, new Timestamp(System.currentTimeMillis())};
        for (int i = 0; i < validValues.length; i++) {
            this.testedInstance.setWinnerAnnouncementTime(validValues[i]);
            Assert.assertEquals("The [winnerAnnouncementTime] property is not set and read correctly",
                    validValues[i], this.testedInstance.getWinnerAnnouncementTime());
        }
    }

    /**
     * <p>Accuracy test. Tests the {@link Contest#setMediums(Set)} and {@link Contest#getMediums()} methods for accurate
     * behavior.</p>
     * <p/>
     * <p>Passses the valid values to {@link Contest#setMediums(Set)} method and reads them back through
     * {@link Contest#getMediums()} methods and verifies that the read value is matching the set value.</p>
     *
     * @since TopCoder Studio Modifications Assembly v2 (Req# 5.1.5)
     */
    public void testSetGetMediums() {
        Set<Medium>[] validValues = new Set[5];
        validValues[0] = null;
        validValues[1] = new HashSet<Medium>();
        validValues[2] = new HashSet<Medium>();
        validValues[3] = new HashSet<Medium>();
        validValues[4] = new HashSet<Medium>();
        for (int i = 0; i < validValues.length; i++) {
            this.testedInstance.setMediums(validValues[i]);
            Assert.assertEquals("The [mediums] property is not set and read correctly",
                    validValues[i], this.testedInstance.getMediums());
        }
    }

    /**
     * <p>Accuracy test. Tests the {@link Contest#addMedium(Medium)} method for accurate behavior.</p>
     * <p/>
     * <p>Passses the valid values to {@link Contest#addMedium(Medium)} method and reads them back through
     * {@link Contest#getMediums()} methods and verifies that the provided medium has been added to contest.</p>
     *
     * @since TopCoder Studio Modifications Assembly v2 (Req# 5.1.5)
     */
    public void testAddMedium() {
        Medium[] validValues = new Medium[]{new Medium(), new Medium(), new Medium(), new Medium()};
        for (int i = 0; i < validValues.length; i++) {
            Medium validValue = validValues[i];
            this.testedInstance.addMedium(validValue);
            Assert.assertTrue("The medium is not added", this.testedInstance.getMediums().contains(validValue));
        }
    }

    /**
     * <p>Accuracy test. Tests the {@link Contest#getConfig(Integer)} method for accurate behavior.</p>
     * <p/>
     * <p>Passses the IDs of contest properties which are set for the tested contest and expects the method to return
     * the appropriate contest configuration.</p>
     *
     * @since TopCoder Studio Modifications Assembly v2 (Req# 5.1.5)
     */
    public void testGetConfig_Integer_ExistingProperty() {
        Integer[] validValues = CONTEST_PROPS;
        for (int i = 0; i < validValues.length; i++) {
            ContestConfig contestConfig = this.testedInstance.getConfig(validValues[i]);
            Assert.assertNotNull("The contest configuration is not found", contestConfig);
            Assert.assertEquals("Wrong contest configuration is returned",
                    validValues[i], contestConfig.getProperty().getId());
        }
    }

    /**
     * <p>Accuracy test. Tests the {@link Contest#getConfig(Integer)} method for accurate behavior.</p>
     * <p/>
     * <p>Passses the IDs of contest properties which are set for the tested contest and expects the method to return
     * the appropriate contest configuration.</p>
     *
     * @since TopCoder Studio Modifications Assembly v2 (Req# 5.1.5)
     */
    public void testGetConfig_Integer_NonExistingProperty() {
        Integer[] invalidValues = new Integer[]{-1, 0, -1000, 1000, 100, 30303};
        for (int i = 0; i < invalidValues.length; i++) {
            ContestConfig contestConfig = this.testedInstance.getConfig(invalidValues[i]);
            Assert.assertNull("The non-existing contest configuration is found", contestConfig);
        }
    }

    /**
     * <p>Accuracy test. Tests the {@link Contest#getOtherFileTypes()} method for accurate behavior.</p>
     * <p/>
     * <p>Sets the tested contest with configuration for target property and expects the method to return the
     * appropriate contest configuration.</p>
     *
     * @since TopCoder Studio Modifications Assembly v2 (Req# 5.1.5)
     */
    public void testGetOtherFileTypes() {
        Integer propertyId = ContestProperty.OTHER_FILE_TYPES;
        ContestConfig contestConfig = this.testedInstance.getOtherFileTypes();
        Assert.assertNotNull("The contest configuration is not found", contestConfig);
        Assert.assertEquals("Wrong contest configuration is returned", propertyId, contestConfig.getProperty().getId());
    }

    /**
     * <p>Accuracy test. Tests the {@link Contest#getFullDescription()} method for accurate behavior.</p>
     * <p/>
     * <p>Sets the tested contest with configuration for target property and expects the method to return the
     * appropriate contest configuration.</p>
     *
     * @since TopCoder Studio Modifications Assembly v2 (Req# 5.1.5)
     */
    public void testGetFullDescription() {
        Integer propertyId = ContestProperty.FULL_DESCRIPTION;
        ContestConfig contestConfig = this.testedInstance.getFullDescription();
        Assert.assertNotNull("The contest configuration is not found", contestConfig);
        Assert.assertEquals("Wrong contest configuration is returned", propertyId, contestConfig.getProperty().getId());
    }

    /**
     * <p>Accuracy test. Tests the {@link Contest#getColorRequirements()} method for accurate behavior.</p>
     * <p/>
     * <p>Sets the tested contest with configuration for target property and expects the method to return the
     * appropriate contest configuration.</p>
     *
     * @since TopCoder Studio Modifications Assembly v2 (Req# 5.1.5)
     */
    public void testGetColorRequirements() {
        Integer propertyId = ContestProperty.COLOR_REQUIREMENTS;
        ContestConfig contestConfig = this.testedInstance.getColorRequirements();
        Assert.assertNotNull("The contest configuration is not found", contestConfig);
        Assert.assertEquals("Wrong contest configuration is returned", propertyId, contestConfig.getProperty().getId());
    }

    /**
     * <p>Accuracy test. Tests the {@link Contest#getFontRequirements()} method for accurate behavior.</p>
     * <p/>
     * <p>Sets the tested contest with configuration for target property and expects the method to return the
     * appropriate contest configuration.</p>
     *
     * @since TopCoder Studio Modifications Assembly v2 (Req# 5.1.5)
     */
    public void testGetFontRequirements() {
        Integer propertyId = ContestProperty.FONT_REQUIREMENTS;
        ContestConfig contestConfig = this.testedInstance.getFontRequirements();
        Assert.assertNotNull("The contest configuration is not found", contestConfig);
        Assert.assertEquals("Wrong contest configuration is returned", propertyId, contestConfig.getProperty().getId());
    }

    /**
     * <p>Accuracy test. Tests the {@link Contest#getSizeRequirements()} method for accurate behavior.</p>
     * <p/>
     * <p>Sets the tested contest with configuration for target property and expects the method to return the
     * appropriate contest configuration.</p>
     *
     * @since TopCoder Studio Modifications Assembly v2 (Req# 5.1.5)
     */
    public void testGetSizeRequirements() {
        Integer propertyId = ContestProperty.SIZE_REQUIREMENTS;
        ContestConfig contestConfig = this.testedInstance.getSizeRequirements();
        Assert.assertNotNull("The contest configuration is not found", contestConfig);
        Assert.assertEquals("Wrong contest configuration is returned", propertyId, contestConfig.getProperty().getId());
    }

    /**
     * <p>Accuracy test. Tests the {@link Contest#getContentRequirements()} method for accurate behavior.</p>
     * <p/>
     * <p>Sets the tested contest with configuration for target property and expects the method to return the
     * appropriate contest configuration.</p>
     *
     * @since TopCoder Studio Modifications Assembly v2 (Req# 5.1.5)
     */
    public void testGetContentRequirements() {
        Integer propertyId = ContestProperty.CONTENT_REQUIREMENTS;
        ContestConfig contestConfig = this.testedInstance.getContentRequirements();
        Assert.assertNotNull("The contest configuration is not found", contestConfig);
        Assert.assertEquals("Wrong contest configuration is returned", propertyId, contestConfig.getProperty().getId());
    }

    /**
     * <p>Accuracy test. Tests the {@link Contest#getOtherRequirements()} method for accurate behavior.</p>
     * <p/>
     * <p>Sets the tested contest with configuration for target property and expects the method to return the
     * appropriate contest configuration.</p>
     *
     * @since TopCoder Studio Modifications Assembly v2 (Req# 5.1.5)
     */
    public void testGetOtherRequirements() {
        Integer propertyId = ContestProperty.OTHER_REQUIREMENTS;
        ContestConfig contestConfig = this.testedInstance.getOtherRequirements();
        Assert.assertNotNull("The contest configuration is not found", contestConfig);
        Assert.assertEquals("Wrong contest configuration is returned", propertyId, contestConfig.getProperty().getId());
    }

    /**
     * <p>Accuracy test. Tests the {@link Contest#getSubmissionFileFormat()} method for accurate behavior.</p>
     * <p/>
     * <p>Sets the tested contest with configuration for target property and expects the method to return the
     * appropriate contest configuration.</p>
     *
     * @since TopCoder Studio Modifications Assembly v2 (Req# 5.1.5)
     */
    public void testGetSubmissionFileFormat() {
        Integer propertyId = ContestProperty.SUBMISSION_FILE_FORMAT;
        ContestConfig contestConfig = this.testedInstance.getSubmissionFileFormat();
        Assert.assertNotNull("The contest configuration is not found", contestConfig);
        Assert.assertEquals("Wrong contest configuration is returned", propertyId, contestConfig.getProperty().getId());
    }

    /**
     * <p>Accuracy test. Tests the {@link Contest#getWinnerSelection()} method for accurate behavior.</p>
     * <p/>
     * <p>Sets the tested contest with configuration for target property and expects the method to return the
     * appropriate contest configuration.</p>
     *
     * @since TopCoder Studio Modifications Assembly v2 (Req# 5.1.5)
     */
    public void testGetWinnerSelection() {
        Integer propertyId = ContestProperty.WINNER_SELECTION;
        ContestConfig contestConfig = this.testedInstance.getWinnerSelection();
        Assert.assertNotNull("The contest configuration is not found", contestConfig);
        Assert.assertEquals("Wrong contest configuration is returned", propertyId, contestConfig.getProperty().getId());
    }

    /**
     * <p>Accuracy test. Tests the {@link Contest#getEligibility()} method for accurate behavior.</p>
     * <p/>
     * <p>Sets the tested contest with configuration for target property and expects the method to return the
     * appropriate contest configuration.</p>
     *
     * @since TopCoder Studio Modifications Assembly v2 (Req# 5.1.5)
     */
    public void testGetEligibility() {
        Integer propertyId = ContestProperty.ELIGIBILITY;
        ContestConfig contestConfig = this.testedInstance.getEligibility();
        Assert.assertNotNull("The contest configuration is not found", contestConfig);
        Assert.assertEquals("Wrong contest configuration is returned", propertyId, contestConfig.getProperty().getId());
    }

    /**
     * <p>Accuracy test. Tests the {@link Contest#getClientName()} method for accurate behavior.</p>
     * <p/>
     * <p>Sets the tested contest with configuration for target property and expects the method to return the
     * appropriate contest configuration.</p>
     *
     * @since TopCoder Studio Modifications Assembly v2 (Req# 5.1.5)
     */
    public void testGetClientName() {
        Integer propertyId = ContestProperty.CLIENT;
        ContestConfig contestConfig = this.testedInstance.getClientName();
        Assert.assertNotNull("The contest configuration is not found", contestConfig);
        Assert.assertEquals("Wrong contest configuration is returned", propertyId, contestConfig.getProperty().getId());
    }


}
