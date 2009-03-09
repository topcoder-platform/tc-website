/*
 * TestLocalDDEUserCustomerHome.java
 *
 * By John C. Bollinger
 *
 * Copyright (c) 2002
 */

package com.topcoder.dde.persistencelayer.test;

import com.topcoder.dde.persistencelayer.interfaces.*;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Collection;
import java.util.Date;
import javax.ejb.CreateException;
import javax.ejb.ObjectNotFoundException;
import javax.ejb.SessionContext;

/**
 * contains tests for the local home interface of the DDEUserCustomer EJB
 *
 * @author John C. Bollinger
 *
 * @version 1.0
 */
public class TestLocalDDEUserCustomerHome extends PersistenceTestCase {

    /* an instance of the localHome interface implementation to work with */
    private LocalDDEUserCustomerHome localHome;

    /* default field values for entity instances */
    private static final String DEF_FIRST_NAME = "Melvin";
    private static final String DEF_LAST_NAME = "Smith";
    private static final String DEF_COMPANY = "Marauders, Inc.";
    private static final String DEF_ADDRESS = "1 Atlantis Blvd.";
    private static final String DEF_CITY = "Sydney";
    private static final String DEF_POSTAL = "01010";
    private static final String DEF_TEL_COUNTRY = "1";
    private static final String DEF_TEL_AREA = "800";
    private static final String DEF_TEL_NBR = "123-7654";
    private static final boolean DEF_USE_COMP = true;
    private static final boolean DEF_USE_CONS = true;
    private static final boolean DEF_TCSNEWS = false;
    private static final boolean DEF_HTMLNEWS = false;
    private static final String DEF_ACT_CODE = "Penguin Power";
    private static final String DEF_EMAIL = "melvins@marauders.com";

    /**
     * a default constructor for use only by other test cases in this package
     */
    TestLocalDDEUserCustomerHome() {
        this("testCreate");
    }

    /**
     * constructs a new TestLocalDDEUserCustomerHome configured to run the named
     * test
     */
    public TestLocalDDEUserCustomerHome(String testName) {
        this(testName, null);
    }

    /**
     * constructs a new TestLocalDDECategoriesHome configured to run the named
     * test in the specified session context
     */
    public TestLocalDDEUserCustomerHome(String testName, SessionContext sc) {
        super(testName, "USER_CUSTOMER", sc);
    }

    /**
     * sets up the fixture for this test
     */
    public void setUp() throws Exception {
        super.setUp();
        synchronized (contextLock) {
            localHome = (LocalDDEUserCustomerHome) ctx.lookup(
                    LocalDDEUserCustomerHome.EJB_REF_NAME);
        }
    }

    /*
     * creates a LocalDDEUserCustomer entity with default parameters
     */
    LocalDDEUserCustomer createDefault(LocalDDEUserMaster master,
                                       LocalDDECountryCodes country, LocalDDECompanySize size,
                                       LocalDDEPriceTiers tier) throws Exception {
        return localHome.create(DEF_FIRST_NAME, DEF_LAST_NAME, DEF_COMPANY,
                DEF_ADDRESS, DEF_CITY, DEF_POSTAL, DEF_TEL_COUNTRY, DEF_TEL_AREA,
                DEF_TEL_NBR, DEF_USE_COMP, DEF_USE_CONS, DEF_TCSNEWS,
                DEF_HTMLNEWS, DEF_ACT_CODE, DEF_EMAIL, master, country, size,
                tier);
    }

    /**
     * tests all entity creation functionality of the bean
     */
    public void testAllCreate() throws Exception {
        /*
         * This is messy because we need to obtain a LocalDDECompVersions object
         * and a LocalDDEUserMaster object in order to create a
         * LocalDDEUserCustomer.  Because the setup is so involved, there are
         * several logically different tests bundled together here.
         */
        synchronized (TestLocalDDECountryCodesHome.class) {
            LocalDDECountryCodes localCountry;
            TestLocalDDECountryCodesHome countryHome =
                    new TestLocalDDECountryCodesHome();

            countryHome.setUp();
            localCountry = countryHome.createDefault();
            assertNotNull(localCountry);
            try {
                synchronized (TestLocalDDECompanySizeHome.class) {
                    LocalDDECompanySize localSize;
                    TestLocalDDECompanySizeHome sizeHome =
                            new TestLocalDDECompanySizeHome();
                    sizeHome.setUp();
                    localSize = sizeHome.createDefault();
                    assertNotNull(localSize);
                    try {
                        synchronized (TestLocalDDEUserMasterHome.class) {
                            LocalDDEUserMaster localMaster;
                            TestLocalDDEUserMasterHome masterHome
                                    = new TestLocalDDEUserMasterHome();
                            masterHome.setUp();
                            localMaster = masterHome.createDefault();
                            assertNotNull(localMaster);
                            try {
                                synchronized (TestLocalDDEPriceTiersHome.class) {
                                    LocalDDEPriceTiers localTier;
                                    TestLocalDDEPriceTiersHome tiersHome
                                            = new TestLocalDDEPriceTiersHome();
                                    tiersHome.setUp();
                                    localTier = tiersHome.createDefault();
                                    assertNotNull(localTier);
                                    try {
                                        synchronized (TestLocalDDEUserCustomerHome.class) {
                                            /* test normal creation */
                                            LocalDDEUserCustomer local =
                                                    createDefault(localMaster,
                                                            localCountry,
                                                            localSize,
                                                            localTier);
                                            assertNotNull(local);
                                            try {
                                                assertEquals(DEF_FIRST_NAME,
                                                        local.getFirstName());
                                                assertEquals(DEF_LAST_NAME,
                                                        local.getLastName());
                                                assertEquals(DEF_COMPANY,
                                                        local.getCompany());
                                                assertEquals(DEF_ADDRESS,
                                                        local.getAddress());
                                                assertEquals(DEF_CITY,
                                                        local.getCity());
                                                assertEquals(DEF_POSTAL,
                                                        local.getPostalCode());
                                                assertEquals(DEF_TEL_COUNTRY,
                                                        local.getTelephoneCountry());
                                                assertEquals(DEF_TEL_AREA,
                                                        local.getTelephoneArea());
                                                assertEquals(DEF_TEL_NBR,
                                                        local.getTelephoneNbr());
                                                assertEquals(DEF_USE_COMP,
                                                        local.getUseComponents());
                                                assertEquals(DEF_USE_COMP,
                                                        local.getUseConsultants());
                                                assertEquals(DEF_TCSNEWS,
                                                        local.getReceiveTcsnews());
                                                assertEquals(DEF_HTMLNEWS,
                                                        local.getReceiveNewshtml());
                                                assertEquals(DEF_ACT_CODE,
                                                        local.getActivationCode());
                                                assertEquals(DEF_EMAIL,
                                                        local.getEmailAddress());
                                                assertTrue(localCountry.isIdentical(
                                                        local.getCountryCodes()));
                                                assertTrue(localMaster.isIdentical(
                                                        local.getUserMaster()));
                                                assertTrue(localSize.isIdentical(
                                                        local.getCompanySize()));
                                                assertTrue(localTier.isIdentical(
                                                        local.getPriceTiers()));
                                            } finally {
                                                local.remove();
                                            }
                                        }
                                    } finally {
                                        localTier.remove();
                                        tiersHome.tearDown();
                                    }
                                }
                            } finally {
                                localMaster.remove();
                                masterHome.tearDown();
                            }
                        }
                    } finally {
                        localSize.remove();
                        sizeHome.tearDown();
                    }
                }
            } finally {
                localCountry.remove();
                countryHome.tearDown();
            }
        }
    }

    public void testFindByPrimaryKey() {
        fail("Test not yet implemented");
    }

//    public void testFindByActivationCode() {
//        fail("Test not yet implemented");
//    }

//    public void testFindByLoginId() {
//        fail("Test not yet implemented");
//    }

    class DDEUserCustomerData implements RowData {
        long userCustomerId;
        Long loginId;
        String firstName;
        String lastName;
        String company;
        String address;
        String city;
        String postalCode;
        Long countryCode;
        String telephoneCountry;
        String telephoneArea;
        String telephoneNbr;
        boolean useComponents;
        boolean useConsultants;
        boolean receiveTcsnews;
        boolean receiveNewshtml;
        Long companySizeId;
        Long tierId;
        String activationCode;
        String emailAddress;

        DDEUserCustomerData(Object id, Long user, String first, String last,
                            String comp, String addr, String cit, String postal, Long country,
                            String telCountry, String telArea, String telNbr,
                            boolean components, boolean consultants, boolean tcsnews,
                            boolean newsHtml, Long size, Long tier, String activation,
                            String email) {
            this(keyToLong(id), user, first, last, comp, addr, cit, postal,
                    country, telCountry, telArea, telNbr, components, consultants,
                    tcsnews, newsHtml, size, tier, activation, email);
        }

        DDEUserCustomerData(long id, Long user, String first, String last,
                            String comp, String addr, String cit, String postal, Long country,
                            String telCountry, String telArea, String telNbr,
                            boolean components, boolean consultants, boolean tcsnews,
                            boolean newsHtml, Long size, Long tier, String activation,
                            String email) {
            userCustomerId = id;
            loginId = user;
            firstName = first;
            lastName = last;
            company = comp;
            address = addr;
            city = cit;
            postalCode = postal;
            countryCode = country;
            telephoneCountry = telCountry.trim();
            telephoneArea = telArea.trim();
            telephoneNbr = telNbr.trim();
            useComponents = components;
            useConsultants = consultants;
            receiveTcsnews = tcsnews;
            receiveNewshtml = newsHtml;
            companySizeId = size;
            tierId = tier;
            activationCode = activation;
            emailAddress = email;
        }

        DDEUserCustomerData(ResultSet rs) throws SQLException {
            readRowData(rs);
        }

        public Object getPrimaryKey() {
            return new Long(userCustomerId);
        }

        private void updateResultSet(ResultSet rs) throws SQLException {
            if (loginId == null) {
                rs.updateNull("LOGIN_ID");
            } else {
                rs.updateLong("LOGIN_ID", loginId.longValue());
            }
            rs.updateString("FIRST_NAME", firstName);
            rs.updateString("LAST_NAME", lastName);
            rs.updateString("COMPANY", company);
            rs.updateString("ADDRESS", address);
            rs.updateString("CITY", city);
            rs.updateString("POSTAL_CODE", postalCode);
            if (countryCode == null) {
                rs.updateNull("COUNTRY_CODE");
            } else {
                rs.updateLong("COUNTRY_CODE", countryCode.longValue());
            }
            rs.updateString("TELEPHONE_COUNTRY", telephoneCountry);
            rs.updateString("TELEPHONE_AREA", telephoneArea);
            rs.updateString("TELEPHONE_NBR", telephoneNbr);
            rs.updateBoolean("USE_COMPONENTS", useComponents);
            rs.updateBoolean("USE_CONSULTANTS", useConsultants);
            rs.updateBoolean("RECEIVE_TCSNEWS", receiveTcsnews);
            rs.updateBoolean("RECEIVE_NEWSHTML", receiveNewshtml);
            if (companySizeId == null) {
                rs.updateNull("COMPANY_SIZE_ID");
            } else {
                rs.updateLong("COMPANY_SIZE_ID", companySizeId.longValue());
            }
            if (tierId == null) {
                rs.updateNull("TIER_ID");
            } else {
                rs.updateLong("TIER_ID", tierId.longValue());
            }
            rs.updateString("ACTIVATION_CODE", activationCode);
            rs.updateString("EMAIL_ADDRESS", emailAddress);
        }

        public void storeRowData(ResultSet rs) throws SQLException {
            updateResultSet(rs);
            rs.updateRow();
        }

        public void insertRowData(ResultSet rs) throws SQLException {
            rs.moveToInsertRow();
            rs.updateLong("USER_CUSTOMER_ID", userCustomerId);
            updateResultSet(rs);
            rs.insertRow();
        }

        public void readRowData(ResultSet rs) throws SQLException {
            long l;

            userCustomerId = rs.getLong("USER_CUSTOMER_ID");

            l = rs.getLong("LOGIN_ID");
            if (rs.wasNull()) {
                loginId = null;
            } else {
                loginId = new Long(l);
            }
            firstName = rs.getString("FIRST_NAME");
            lastName = rs.getString("LAST_NAME");
            company = rs.getString("COMPANY");
            address = rs.getString("ADDRESS");
            city = rs.getString("CITY");
            postalCode = rs.getString("POSTAL_CODE");
            l = rs.getLong("COUNTRY_CODE");
            if (rs.wasNull()) {
                countryCode = null;
            } else {
                countryCode = new Long(l);
            }
            telephoneCountry = rs.getString("TELEPHONE_COUNTRY").trim();
            telephoneArea = rs.getString("TELEPHONE_AREA").trim();
            telephoneNbr = rs.getString("TELEPHONE_NBR").trim();
            useComponents = rs.getBoolean("USE_COMPONENTS");
            useConsultants = rs.getBoolean("USE_CONSULTANTS");
            receiveTcsnews = rs.getBoolean("RECEIVE_TCSNEWS");
            receiveNewshtml = rs.getBoolean("RECEIVE_NEWSHTML");
            l = rs.getLong("COMPANY_SIZE_ID");
            if (rs.wasNull()) {
                companySizeId = null;
            } else {
                companySizeId = new Long(l);
            }
            l = rs.getLong("TIER_ID");
            if (rs.wasNull()) {
                tierId = null;
            } else {
                tierId = new Long(l);
            }
            activationCode = rs.getString("ACTIVATION_CODE");
            emailAddress = rs.getString("EMAIL_ADDRESS");

        }

        public boolean matchesResultSet(ResultSet rs) throws SQLException {
            return equals(new DDEUserCustomerData(rs));
        }

        public boolean equals(Object o) {
            if (!(o instanceof DDEUserCustomerData)) {
                return false;
            }
            DDEUserCustomerData d = (DDEUserCustomerData) o;
            return (
                    (userCustomerId == d.userCustomerId)
                    && objectsMatch(loginId, d.loginId)
                    && objectsMatch(firstName, d.firstName)
                    && objectsMatch(lastName, d.lastName)
                    && objectsMatch(company, d.company)
                    && objectsMatch(address, d.address)
                    && objectsMatch(city, d.city)
                    && objectsMatch(postalCode, d.postalCode)
                    && objectsMatch(countryCode, d.countryCode)
                    && objectsMatch(telephoneCountry, d.telephoneCountry)
                    && objectsMatch(telephoneArea, d.telephoneArea)
                    && objectsMatch(telephoneNbr, d.telephoneNbr)
                    && (useComponents == d.useComponents)
                    && (useConsultants == d.useConsultants)
                    && (receiveTcsnews == d.receiveTcsnews)
                    && (receiveNewshtml == d.receiveNewshtml)
                    && objectsMatch(companySizeId, d.companySizeId)
                    && objectsMatch(tierId, d.tierId)
                    && objectsMatch(activationCode, d.activationCode)
                    && objectsMatch(emailAddress, d.emailAddress));
        }

    }

}