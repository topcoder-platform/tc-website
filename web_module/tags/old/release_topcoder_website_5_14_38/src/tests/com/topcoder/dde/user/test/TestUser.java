/*
 * TestUser.java
 *
 * By John C. Bollinger
 *
 * Copyright (c) 2002
 */
package com.topcoder.dde.user.test;

import com.topcoder.dde.user.*;

import java.util.ArrayList;
import java.util.Date;

import junit.framework.*;

/**
 * a JUnit TestCase that exercises the User class.  These tests assume User
 * to be a dumb container without validation logic, and merely verify that the
 * values set by the class' mutators are the same ones returned by its
 * accessors.
 */
public class TestUser extends TestCase {

    final static long DEF_USER_ID = 1313L;

    protected User user;

    public void setUp() {
        user = new User(DEF_USER_ID);
    }

    public TestUser(String testName) {
        super(testName);
    }

    public void testGetId() {
        assertEquals("Wrong id", DEF_USER_ID, user.getId());
    }

    public void testGetId_NotSet() {
        user = new User();
        assertEquals("Wrong id", 0L, user.getId());
    }

    public void testSetGetLastLogonTime() {
        Date testDate = new Date();
        user.setLastLogonTime(testDate);
        assertEquals("Wrong date", testDate, user.getLastLogonTime());
    }

    public void testSetGetNumLogins() {
        int numLogins = 42;
        user.setNumLogins(numLogins);
        assertEquals("Wrong number of logins", numLogins, user.getNumLogins());
    }

    public void testSetGetRegInfo() {
        RegistrationInfo regInfo = new RegistrationInfo();
        RegistrationInfo regInfo2;

        regInfo.setEmail("test456@test.net");
        regInfo.setFirstName("T");
        regInfo.setLastName("T456");
        regInfo.setPassword("sn00py");
        regInfo.setUsername("test" + System.currentTimeMillis());
        regInfo.setAddress("57 Noparking Parkway");
        regInfo.setCity("New Fork City");
        regInfo.setCompany("pleasant");
        regInfo.setCompanySize(2L);
        regInfo.setCountryCode(840L);
        regInfo.setNewsInHtml(true);
        regInfo.setPhoneArea("866");
        regInfo.setPhoneCountry("1");
        regInfo.setPhoneNumber("111111111");
        regInfo.setPostalcode("18G-254");
        regInfo.setPricingTier(new PricingTier(2L, 10d));
        regInfo.setReceiveNews(false);
        regInfo.setTechnologies(new ArrayList());
        regInfo.setUseComponents(true);
        regInfo.setUseConsultants(false);

        user.setRegInfo(regInfo);
        regInfo2 = user.getRegInfo();
        assertEquals("Wrong registration info", regInfo.getEmail(), regInfo2.getEmail());
        assertEquals("Wrong registration info", regInfo.getFirstName(), regInfo2.getFirstName());
        assertEquals("Wrong registration info", regInfo.getLastName(), regInfo2.getLastName());
        assertEquals("Wrong registration info", regInfo.getPassword(), regInfo2.getPassword());
        assertEquals("Wrong registration info", regInfo.getUsername(), regInfo2.getUsername());
        assertEquals("Wrong registration info", regInfo.getAddress(), regInfo2.getAddress());
        assertEquals("Wrong registration info", regInfo.getCity(), regInfo2.getCity());
        assertEquals("Wrong registration info", regInfo.getCompanySize(), regInfo2.getCompanySize());
        assertEquals("Wrong registration info", regInfo.getCountryCode(), regInfo2.getCountryCode());
        assertEquals("Wrong registration info", regInfo.getNewsInHtml(), regInfo2.getNewsInHtml());
        assertEquals("Wrong registration info", regInfo.getPhoneArea(), regInfo2.getPhoneArea());
        assertEquals("Wrong registration info", regInfo.getPhoneCountry(), regInfo2.getPhoneCountry());
        assertEquals("Wrong registration info", regInfo.getPhoneNumber(), regInfo2.getPhoneNumber());
        assertEquals("Wrong registration info", regInfo.getPostalcode(), regInfo2.getPostalcode());
        assertEquals("Wrong registration info", regInfo.getPricingTier().getId(), regInfo2.getPricingTier().getId());
        assertEquals("Wrong registration info", regInfo.getReceiveNews(), regInfo2.getReceiveNews());
        assertEquals("Wrong registration info", regInfo.getUseComponents(), regInfo2.getUseComponents());
        assertEquals("Wrong registration info", regInfo.getUseConsultants(), regInfo2.getUseConsultants());
    }

    public void testSetGetStatus() {
        int status = 432156789;
        user.setStatus(status);
        assertEquals("Wrong status", status, user.getStatus());
    }

    public static Test suite() {
        return new TestSuite(TestUser.class);
    }
}