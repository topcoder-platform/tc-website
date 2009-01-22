/*
 * TestRegistrationInfo.java
 *
 * By John C. Bollinger
 *
 * Copyright (c) 2002
 */
package com.topcoder.dde.user.test;

import com.topcoder.dde.user.*;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import junit.framework.*;

/**
 * a JUnit TestCase that exercises the RegistrationInfo class.  These tests assume RegistrationInfo
 * to be a dumb container without validation logic, and merely verify that the
 * values set by the class' mutators are the same ones returned by its
 * accessors.
 */
public class TestRegistrationInfo extends TestCase {

    protected RegistrationInfo regInfo;

    public void setUp() {
        regInfo = new RegistrationInfo();
    }

    public TestRegistrationInfo(String testName) {
        super(testName);
    }

    public void testDefaultAddress() {
        assertNull(regInfo.getAddress());
    }

    public void testSetGetAddress() {
        String address = "321 Test Dr.";

        regInfo.setAddress(address);
        assertEquals("Wrong address", address, regInfo.getAddress());
    }

    public void testDefaultCity() {
        assertNull(regInfo.getCity());
    }

    public void testSetGetCity() {
        String city = "Examinopolis";

        regInfo.setCity(city);
        assertEquals("Wrong address", city, regInfo.getCity());
    }

    public void testDefaultCompany() {
        assertNull(regInfo.getCompany());
    }

    public void testSetGetCompany() {
        String company = "National Examiner";

        regInfo.setCompany(company);
        assertEquals("Wrong company", company, regInfo.getCompany());
    }

    public void testDefaultCountry() {
        assertEquals(regInfo.getCountryCode(), 0L);
    }

    public void testSetGetCountry() {
        long countryCode = 840L;

        regInfo.setCountryCode(countryCode);
        assertEquals("Wrong country", countryCode, regInfo.getCountryCode());
    }

    public void testDefaultEmail() {
        assertNull(regInfo.getEmail());
    }

    public void testSetGetEmail() {
        String email = "tester@nationalexaminer.com";

        regInfo.setEmail(email);
        assertEquals("Wrong email", email, regInfo.getEmail());
    }

    public void testDefaultFirstName() {
        assertNull(regInfo.getFirstName());
    }

    public void testSetGetFirstName() {
        String firstName = "Tiberius";

        regInfo.setFirstName(firstName);
        assertEquals("Wrong first name", firstName, regInfo.getFirstName());
    }

    public void testDefaultLastName() {
        assertNull(regInfo.getLastName());
    }

    public void testSetGetLastName() {
        String lastName = "Ter";

        regInfo.setLastName(lastName);
        assertEquals("Wrong last name", lastName, regInfo.getLastName());
    }

    public void testDefaultNewsInHtml() {
        assertTrue(!regInfo.getNewsInHtml());
    }

    public void testSetGetNewsInHtml() {
        regInfo.setNewsInHtml(true);
        assertTrue("Wrong news in html flag", regInfo.getNewsInHtml());
        regInfo.setNewsInHtml(false);
        assertTrue("Wrong news in html flag", !regInfo.getNewsInHtml());
    }

    public void testDefaultPassword() {
        assertNull(regInfo.getPassword());
    }

    public void testSetGetPassword() {
        String password = "ts+3r_III";

        regInfo.setPassword(password);
        assertEquals("Wrong password", password, regInfo.getPassword());
    }

    public void testDefaultPhoneArea() {
        assertNull(regInfo.getPhoneArea());
    }

    public void testSetGetPhoneArea() {
        String phoneArea = "TST";

        regInfo.setPhoneArea(phoneArea);
        assertEquals("Wrong phone area", phoneArea, regInfo.getPhoneArea());
    }

    public void testDefaultPhoneCountry() {
        assertNull(regInfo.getPhoneCountry());
    }

    public void testSetGetPhoneCountry() {
        String phoneCountry = "123";

        regInfo.setPhoneCountry(phoneCountry);
        assertEquals("Wrong phone country", phoneCountry,
                regInfo.getPhoneCountry());
    }

    public void testDefaultPhoneNumber() {
        assertNull(regInfo.getPhoneNumber());
    }

    public void testSetGetPhoneNumber() {
        String phoneNumber = "5309";

        regInfo.setPhoneNumber(phoneNumber);
        assertEquals("Wrong phone number", phoneNumber,
                regInfo.getPhoneNumber());
    }

    public void testDefaultPostalcode() {
        assertNull(regInfo.getPostalcode());
    }

    public void testSetGetPostalcode() {
        String postalcode = "AZ123";

        regInfo.setPostalcode(postalcode);
        assertEquals("Wrong postal code", postalcode, regInfo.getPostalcode());
    }

    public void testDefaultPricingTier() {
        assertNull(regInfo.getPricingTier());
    }

    public void testSetGetPricingTier() {
        PricingTier tier;

        regInfo.setPricingTier(new PricingTier(3L, 7d));
        tier = regInfo.getPricingTier();
        assertEquals("Wrong pricing tier", 3L, tier.getId());
        assertEquals("Wrong pricing tier", 7d, tier.getDiscount(), 0d);
    }

    public void testDefaultReceiveNews() {
        assertTrue(!regInfo.getReceiveNews());
    }

    public void testSetGetReceiveNews() {
        regInfo.setReceiveNews(true);
        assertTrue("Wrong receive news", regInfo.getReceiveNews());
        regInfo.setReceiveNews(false);
        assertTrue("Wrong receive news", !regInfo.getReceiveNews());
    }

    public void testDefautlTechnologies() {
        assertEquals("Wrong technologies", 0, regInfo.getTechnologies().size());
    }

    public void testSetGetTechnologies() {
        UserTechnology tech1 = new UserTechnology(16L, 3, 5);
        UserTechnology tech2 = new UserTechnology(25L, 4, 6);
        List techs = new ArrayList();
        Collection col;
        Iterator techIterator;

        techs.add(tech1);
        techs.add(tech2);
        regInfo.setTechnologies(techs);
        col = regInfo.getTechnologies();
        assertTrue("returned collection is a set", !(col instanceof Set));
        assertEquals("Wrong number of technologies", 2, col.size());
        techIterator = col.iterator();
        while (techIterator.hasNext()) {
            UserTechnology tech = (UserTechnology) techIterator.next();
            switch ((int) tech.getTechnologyId()) {
                case 16:
                    assertEquals("Garbled technology", 3, tech.getRating());
                    assertEquals("Garbled technology", 5, tech.getMonths());
                    break;
                case 25:
                    assertEquals("Garbled technology", 4, tech.getRating());
                    assertEquals("Garbled technology", 6, tech.getMonths());
                    break;
                default:
                    fail("Wrong technology returned");
            }
        }
    }

    public void testDefaultUseComponents() {
        assertTrue(!regInfo.getUseComponents());
    }

    public void testSetGetUseComponents() {
        regInfo.setUseComponents(true);
        assertTrue("Wrong use components", regInfo.getUseComponents());
        regInfo.setUseComponents(false);
        assertTrue("Wrong use components", !regInfo.getUseComponents());
    }

    public void testDefaultUseConsultants() {
        assertTrue(!regInfo.getUseConsultants());
    }

    public void testSetGetUseConsultants() {
        regInfo.setUseConsultants(true);
        assertTrue("Wrong use consultants", regInfo.getUseConsultants());
        regInfo.setUseConsultants(false);
        assertTrue("Wrong use consultants", !regInfo.getUseConsultants());
    }

    public void testDefaultUsername() {
        assertNull(regInfo.getUsername());
    }

    public void testSetGetUsername() {
        String username = "tester123";

        regInfo.setUsername(username);
        assertEquals("Wrong username", username, regInfo.getUsername());
    }

    public static Test suite() {
        return new TestSuite(TestRegistrationInfo.class);
    }

}
