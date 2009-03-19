/*
 * Copyright (C) 2008 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.studio.dto;

import junit.framework.TestCase;
import junit.framework.Assert;

import java.net.URL;
import java.util.Date;
import java.util.Map;
import java.util.HashMap;

/**
 * <p>A unit test for {@link MemberProfile} class.</p>
 *
 * @author TCSDEVELOPER
 * @version 1.0
 */
public class MemberProfileTestCase extends TestCase {

    /**
     * <p>The instance of {@link MemberProfile} which is tested. This instance is initialized in {@link #setUp()} method
     * and released in {@link #tearDown()} method.</p>
     */
    private MemberProfile testedInstance = null;

    /**
     * <p>Constructs new <code>MemberProfileTestCase</code> instance with specified test name.</p>
     *
     * @param name a <code>String</code> providing the name of the test.
     */
    public MemberProfileTestCase(String name) {
        setName(name);
    }

    /**
     * <p>Sets up the fixture. This method is called before a test is executed.</p>
     *
     * @throws Exception if an unexpected error occurs.
     */
    public void setUp() throws Exception {
        super.setUp();
        this.testedInstance = new MemberProfile();
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
     * <p>Accuracy test. Tests the {@link MemberProfile#MemberProfile()} constructor for accurate behavior.</p>
     *
     * <p>Verifies that instance fields are initialized to <code>null</code> and zeros.</p>
     */
    public void testConstructor() {
        Assert.assertNull("Country is not null", this.testedInstance.getCountry());
        Assert.assertNull("Handle is not null", this.testedInstance.getHandle());
        Assert.assertNull("Image URL is not null", this.testedInstance.getImageUrl());
        Assert.assertNull("Registration date is not null", this.testedInstance.getMemberSince());
        Assert.assertNull("Quote is not null", this.testedInstance.getQuote());
        Assert.assertNull("School is not null", this.testedInstance.getSchool());
        Assert.assertNull("Statistics is not null", this.testedInstance.getStatistics());
    }

    /**
     * <p>Accuracy test. Tests the {@link MemberProfile#setCountry(String)} and {@link MemberProfile#getCountry()}
     * methods for accurate behavior.</p>
     *
     * <p>Passses the valid values to {@link MemberProfile#setCountry(String)} method and reads them back
     * through {@link MemberProfile#getCountry()} methods and verifies that the read value is matching the set value.
     * </p>
     */
    public void testSetGetCountry() {
        String[] validValues = new String[] {null, "US", "China", "Antarctica"};
        for (int i = 0; i < validValues.length; i++) {
            this.testedInstance.setCountry(validValues[i]);
            Assert.assertEquals("The [country] property is not set and read correctly",
                                validValues[i], this.testedInstance.getCountry());
        }
    }

    /**
     * <p>Accuracy test. Tests the {@link MemberProfile#setHandle(String)} and {@link MemberProfile#getHandle()}
     * methods for accurate behavior.</p>
     *
     * <p>Passses the valid values to {@link MemberProfile#setHandle(String)} method and reads them back
     * through {@link MemberProfile#getHandle()} methods and verifies that the read value is matching the set value.</p>
     */
    public void testSetGetHandle() {
        String[] validValues = new String[] {null, "US", "China", "Antarctica"};
        for (int i = 0; i < validValues.length; i++) {
            this.testedInstance.setHandle(validValues[i]);
            Assert.assertEquals("The [handle] property is not set and read correctly",
                                validValues[i], this.testedInstance.getHandle());
        }
    }

    /**
     * <p>Accuracy test. Tests the {@link MemberProfile#setImageUrl(URL)} and {@link MemberProfile#getImageUrl()}
     * methods for accurate behavior.</p>
     *
     * <p>Passses the valid values to {@link MemberProfile#setImageUrl(URL)} method and reads them back
     * through {@link MemberProfile#getImageUrl()} methods and verifies that the read value is matching the set value.
     * </p>
     *
     * @throws Exception if an unexpected error occurs.
     */
    public void testSetGetImageURL() throws Exception {
        URL[] validValues = new URL[] {null, new URL("http://www.topcoder.com"),
                                       new URL("http://software.topcoder.com")};
        for (int i = 0; i < validValues.length; i++) {
            this.testedInstance.setImageUrl(validValues[i]);
            Assert.assertEquals("The [imageURL] property is not set and read correctly",
                                validValues[i], this.testedInstance.getImageUrl());
        }
    }

    /**
     * <p>Accuracy test. Tests the {@link MemberProfile#setQuote(String)} and {@link MemberProfile#getQuote()}
     * methods for accurate behavior.</p>
     *
     * <p>Passses the valid values to {@link MemberProfile#setQuote(String)} method and reads them back through
     * {@link MemberProfile#getQuote()} methods and verifies that the read value is matching the set value.</p>
     */
    public void testSetGetQuote() {
        String[] validValues = new String[] {null, "Quote1", "Quote2", "Quote3"};
        for (int i = 0; i < validValues.length; i++) {
            this.testedInstance.setQuote(validValues[i]);
            Assert.assertEquals("The [quote] property is not set and read correctly",
                                validValues[i], this.testedInstance.getQuote());
        }
    }

    /**
     * <p>Accuracy test. Tests the {@link MemberProfile#setSchool(String)} and {@link MemberProfile#getSchool()}
     * methods for accurate behavior.</p>
     *
     * <p>Passses the valid values to {@link MemberProfile#setSchool(String)} method and reads them back through
     * {@link MemberProfile#getSchool()} methods and verifies that the read value is matching the set value.</p>
     */
    public void testSetGetSchool() {
        String[] validValues = new String[] {null, "School1", "School2", "School3"};
        for (int i = 0; i < validValues.length; i++) {
            this.testedInstance.setSchool(validValues[i]);
            Assert.assertEquals("The [school] property is not set and read correctly",
                                validValues[i], this.testedInstance.getSchool());
        }
    }

    /**
     * <p>Accuracy test. Tests the {@link MemberProfile#setMemberSince(Date)} and {@link MemberProfile#getMemberSince()}
     * methods for accurate behavior.</p>
     *
     * <p>Passses the valid values to {@link MemberProfile#setMemberSince(Date)} method and reads them back through
     * {@link MemberProfile#getMemberSince()} methods and verifies that the read value is matching the set value.</p>
     */
    public void testSetGetMemberSince() {
        Date[] validValues = new Date[] {null, new Date(), new Date(System.currentTimeMillis() - 4838938L),
                                         new Date(System.currentTimeMillis() + 328942462L)};
        for (int i = 0; i < validValues.length; i++) {
            this.testedInstance.setMemberSince(validValues[i]);
            Assert.assertEquals("The [memberSince] property is not set and read correctly",
                                validValues[i], this.testedInstance.getMemberSince());
        }
    }

    /**
     * <p>Accuracy test. Tests the {@link MemberProfile#setStatistics(Map)} and {@link MemberProfile#getStatistics()}
     * methods for accurate behavior.</p>
     *
     * <p>Passses the valid values to {@link MemberProfile#setStatistics(Map)} method and reads them back through
     * {@link MemberProfile#getStatistics()} methods and verifies that the read value is matching the set value.</p>
     */
    public void testSetGetStatistics() {
        Map[] validValues = new Map[] {null, new HashMap(), new HashMap()};
        for (int i = 0; i < validValues.length; i++) {
            this.testedInstance.setStatistics(validValues[i]);
            Assert.assertSame("The [statistics] property is not set and read correctly",
                              validValues[i], this.testedInstance.getStatistics());
        }
    }
}
