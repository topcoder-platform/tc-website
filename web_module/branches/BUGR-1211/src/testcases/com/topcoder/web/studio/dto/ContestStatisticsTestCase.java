/*
 * Copyright (C) 2008 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.studio.dto;

import junit.framework.TestCase;
import junit.framework.Assert;
import com.topcoder.web.studio.model.ContestType;

/**
 * <p>A unit test for {@link ContestStatistics} class.</p>
 *
 * @author TCSDEVELOPER
 * @version 1.0
 * @since TopCoder Studio Member Profile Assembly
 */
public class ContestStatisticsTestCase extends TestCase {

    /**
     * <p>The instance of {@link ContestStatistics} which is tested. This instance is initialized in {@link #setUp()}
     * method and released in {@link #tearDown()} method.</p>
     */
    private ContestStatistics testedInstance = null;

    /**
     * <p>Constructs new <code>ContestStatisticsTestCase</code> instance with specified test name.</p>
     *
     * @param name a <code>String</code> providing the name of the test.
     */
    public ContestStatisticsTestCase(String name) {
        setName(name);
    }

    /**
     * <p>Sets up the fixture. This method is called before a test is executed.</p>
     *
     * @throws Exception if an unexpected error occurs.
     */
    public void setUp() throws Exception {
        super.setUp();
        this.testedInstance = new ContestStatistics();
    }

    /**
     * <p>Tears down the fixture. This method is called after a test is executed.</p>
     *
     * @throws Exception if an unexpected error occurs.
     */
    public void tearDown() throws Exception {
        this.testedInstance = null;
        super.tearDown();
    }

    /**
     * <p>Accuracy test. Tests the {@link ContestStatistics#ContestStatistics()} constructor for accurate behavior.</p>
     *
     * <p>Verifies that instance fields are initialized to <code>null</code> and zeros.</p>
     */
    public void testConstructor() {
        Assert.assertEquals("The number of contest registrations is not valid",
                            0, this.testedInstance.getContestsRegistered());
        Assert.assertEquals("The number of contest submissions is not valid",
                            0, this.testedInstance.getNumberOfSubmissions());
        Assert.assertEquals("The number of wins is not valid", 0, this.testedInstance.getNumberOfWins());
        Assert.assertEquals("The passed screening percentage is not valid",
                            0, this.testedInstance.getPassedScreeningPercentage());
        Assert.assertEquals("The number of submissions passed screening is not valid",
                            0, this.testedInstance.getSubmissionPassedScreening());
        Assert.assertEquals("The submissions percentage is not valid",
                            0, this.testedInstance.getSubmissionPercentage());
        Assert.assertEquals("The winning percentage is not valid", 0, this.testedInstance.getWinPercentage());
        Assert.assertNull("Contest type is not null", this.testedInstance.getContestType());
    }

    /**
     * <p>Accuracy test. Tests the {@link ContestStatistics#setContestsRegistered(int)} and
     * {@link ContestStatistics#getContestsRegistered()} methods for accurate behavior.</p>
     *
     * <p>Passses the valid values to {@link ContestStatistics#setContestsRegistered(int)} method and reads them back
     * through {@link ContestStatistics#getContestsRegistered()} methods and verifies that the read value is matching
     * the set value.</p>
     */
    public void testSetGetContestsRegistered() {
        int[] validValues = new int[] {1, -1, 32232, 121231, 446564, 0};
        for (int i = 0; i < validValues.length; i++) {
            this.testedInstance.setContestsRegistered(validValues[i]);
            Assert.assertEquals("The [contestsRegistered] property is not set and read correctly",
                                validValues[i], this.testedInstance.getContestsRegistered());
        }
    }

    /**
     * <p>Accuracy test. Tests the {@link ContestStatistics#setNumberOfSubmissions(int)} and
     * {@link ContestStatistics#getNumberOfSubmissions()} methods for accurate behavior.</p>
     *
     * <p>Passses the valid values to {@link ContestStatistics#setNumberOfSubmissions(int)} method and reads them back
     * through {@link ContestStatistics#getNumberOfSubmissions()} methods and verifies that the read value is matching
     * the set value.</p>
     */
    public void testSetGetNumberOfSubmissions() {
        int[] validValues = new int[] {1, -1, 32232, 121231, 446564, 0};
        for (int i = 0; i < validValues.length; i++) {
            this.testedInstance.setNumberOfSubmissions(validValues[i]);
            Assert.assertEquals("The [numberOfSubmissions] property is not set and read correctly",
                                validValues[i], this.testedInstance.getNumberOfSubmissions());
        }
    }

    /**
     * <p>Accuracy test. Tests the {@link ContestStatistics#setNumberOfWins(int)} and
     * {@link ContestStatistics#getNumberOfWins()} methods for accurate behavior.</p>
     *
     * <p>Passses the valid values to {@link ContestStatistics#setNumberOfWins(int)} method and reads them back
     * through {@link ContestStatistics#getNumberOfWins()} methods and verifies that the read value is matching
     * the set value.</p>
     */
    public void testSetGetNumberOfWins() {
        int[] validValues = new int[] {1, -1, 32232, 121231, 446564, 0};
        for (int i = 0; i < validValues.length; i++) {
            this.testedInstance.setNumberOfWins(validValues[i]);
            Assert.assertEquals("The [numberOfWins] property is not set and read correctly",
                                validValues[i], this.testedInstance.getNumberOfWins());
        }
    }

    /**
     * <p>Accuracy test. Tests the {@link ContestStatistics#setPassedScreeningPercentage(int)} and
     * {@link ContestStatistics#getNumberOfWins()} methods for accurate behavior.</p>
     *
     * <p>Passses the valid values to {@link ContestStatistics#setPassedScreeningPercentage(int)} method and reads them
     * back through {@link ContestStatistics#getPassedScreeningPercentage()} methods and verifies that the read value is
     * matching the set value.</p>
     */
    public void testSetGetPassedScreeningPercentage() {
        int[] validValues = new int[] {1, -1, 32232, 121231, 446564, 0};
        for (int i = 0; i < validValues.length; i++) {
            this.testedInstance.setPassedScreeningPercentage(validValues[i]);
            Assert.assertEquals("The [passedScreeningPercentage] property is not set and read correctly",
                                validValues[i], this.testedInstance.getPassedScreeningPercentage());
        }
    }

    /**
     * <p>Accuracy test. Tests the {@link ContestStatistics#setSubmissionPassedScreening(int)} and
     * {@link ContestStatistics#getNumberOfWins()} methods for accurate behavior.</p>
     *
     * <p>Passses the valid values to {@link ContestStatistics#setSubmissionPassedScreening(int)} method and reads them
     * back through {@link ContestStatistics#getSubmissionPassedScreening()} methods and verifies that the read value is
     * matching the set value.</p>
     */
    public void testSetGetSubmissionPassedScreening() {
        int[] validValues = new int[] {1, -1, 32232, 121231, 446564, 0};
        for (int i = 0; i < validValues.length; i++) {
            this.testedInstance.setSubmissionPassedScreening(validValues[i]);
            Assert.assertEquals("The [submissionPassedScreening] property is not set and read correctly",
                                validValues[i], this.testedInstance.getSubmissionPassedScreening());
        }
    }

    /**
     * <p>Accuracy test. Tests the {@link ContestStatistics#setWinPercentage(int)} and
     * {@link ContestStatistics#getWinPercentage()} methods for accurate behavior.</p>
     *
     * <p>Passses the valid values to {@link ContestStatistics#setWinPercentage(int)} method and reads them
     * back through {@link ContestStatistics#getWinPercentage()} methods and verifies that the read value is
     * matching the set value.</p>
     */
    public void testSetGetWinPercentage() {
        int[] validValues = new int[] {1, -1, 32232, 121231, 446564, 0};
        for (int i = 0; i < validValues.length; i++) {
            this.testedInstance.setWinPercentage(validValues[i]);
            Assert.assertEquals("The [winPercentage] property is not set and read correctly",
                                validValues[i], this.testedInstance.getWinPercentage());
        }
    }

    /**
     * <p>Accuracy test. Tests the {@link ContestStatistics#setContestType(ContestType)} and
     * {@link ContestStatistics#getContestType()} methods for accurate behavior.</p>
     *
     * <p>Passses the valid values to {@link ContestStatistics#setContestType(ContestType)} method and reads them
     * back through {@link ContestStatistics#getContestType()} methods and verifies that the read value is
     * matching the set value.</p>
     */
    public void testSetGetContestType() {
        ContestType[] validValues = new ContestType[] {null, new ContestType(), new ContestType(), new ContestType()};
        for (int i = 0; i < validValues.length; i++) {
            this.testedInstance.setContestType(validValues[i]);
            Assert.assertSame("The [contestType] property is not set and read correctly",
                                validValues[i], this.testedInstance.getContestType());
        }
    }
}
