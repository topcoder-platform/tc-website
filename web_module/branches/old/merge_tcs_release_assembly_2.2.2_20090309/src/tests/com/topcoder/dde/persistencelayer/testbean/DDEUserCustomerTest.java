package com.topcoder.dde.persistencelayer.testbean;

import javax.ejb.CreateException;
import javax.ejb.FinderException;
import javax.ejb.RemoveException;
import javax.naming.NamingException;

import com.topcoder.dde.persistencelayer.interfaces.LocalDDECompanySize;
import com.topcoder.dde.persistencelayer.interfaces.LocalDDECountryCodes;
import com.topcoder.dde.persistencelayer.interfaces.LocalDDEPriceTiers;
import com.topcoder.dde.persistencelayer.interfaces.LocalDDEUserCustomer;
import com.topcoder.dde.persistencelayer.interfaces.LocalDDEUserCustomerHome;
import com.topcoder.dde.persistencelayer.interfaces.LocalDDEUserMaster;

public final class DDEUserCustomerTest extends DDEServerTestCase {

    private LocalDDEUserCustomerHome userCustomerHome;

    DDEUserCustomerTest() {
    }

    protected void setUp() throws NamingException {
        userCustomerHome = (LocalDDEUserCustomerHome) lookup(LocalDDEUserCustomerHome.EJB_REF_NAME);
    }

    public void test() throws Exception {
        testTheBean();
    }

    private void testTheBean() throws CreateException, FinderException, RemoveException {
        LocalDDEUserMaster userMaster = DDEUserMasterTest.create();
        String firstName = "John";
        String lastName = "Smith";
        String company = "Foo";
        String address = "123 ABC St";
        String city = "SomeCity";
        String postalCode = "12345-6789";
        String telephoneCountry = "00012";
        String telephoneArea = "00123";
        String telephoneNbr = "0123456789";
        boolean useComponents = true;
        boolean useConsultants = true;
        boolean receiveTcsnews = true;
        boolean receiveNewshtml = false;
        String activationCode = "012";
        String emailAddress = "anon@invalid.com";
        LocalDDECountryCodes countryCodes = DDECountryCodesTest.create();
        LocalDDECompanySize companySize = DDECompanySizeTest.create();
        LocalDDEPriceTiers priceTiers = DDEPriceTiersTest.create();
        LocalDDEUserCustomer userCustomer = userCustomerHome.create(firstName, lastName, company, address, city, postalCode,
                telephoneCountry, telephoneArea, telephoneNbr, useComponents, useConsultants, receiveTcsnews, receiveNewshtml,
                activationCode, emailAddress, userMaster, countryCodes, companySize, priceTiers);
        Long primaryKey = testGetPrimaryKey(userCustomer);
        testGetFirstName(userCustomer, firstName);
        testGetLastName(userCustomer, lastName);
        testGetCompany(userCustomer, company);
        testGetAddress(userCustomer, address);
        testGetCity(userCustomer, city);
        testGetPostalCode(userCustomer, postalCode);
        testGetTelephoneCountry(userCustomer, telephoneCountry);
        testGetTelephoneArea(userCustomer, telephoneArea);
        testGetTelephoneNbr(userCustomer, telephoneNbr);
        testGetUseComponents(userCustomer, useComponents);
        testGetUseConsultants(userCustomer, useConsultants);
        testGetReceiveTcsnews(userCustomer, receiveTcsnews);
        testGetReceiveNewshtml(userCustomer, receiveNewshtml);
        testGetUserMaster(userCustomer, userMaster);
        testGetCountryCodes(userCustomer, countryCodes);
        testGetCompanySize(userCustomer, companySize);
        testGetPriceTiers(userCustomer, priceTiers);
        testFindByLoginId(userMaster, userCustomer);
        testGetEmailAddress(userCustomer, emailAddress);
        testGetActivationCode(userCustomer, activationCode);
        testRemove(userCustomer, countryCodes, companySize, priceTiers, primaryKey);
    }

    private void testGetActivationCode(LocalDDEUserCustomer userCustomer, String activationCode) {
        String activationCode2 = userCustomer.getActivationCode();
        assertEquals(activationCode, activationCode2);
    }

    private void testGetEmailAddress(LocalDDEUserCustomer userCustomer, String emailAddress) {
        String emailAddress2 = userCustomer.getEmailAddress();
        assertEquals(emailAddress, emailAddress2);
    }

    private void testFindByLoginId(LocalDDEUserMaster userMaster, LocalDDEUserCustomer userCustomer) throws FinderException {
        long loginId = ((Long) userMaster.getPrimaryKey()).longValue();
        LocalDDEUserCustomer userCustomer2 = userCustomerHome.findByLoginId(loginId);
        assertTrue(userCustomer.isIdentical(userCustomer2));
    }

    private void testGetPriceTiers(LocalDDEUserCustomer userCustomer, LocalDDEPriceTiers priceTiers) {
        LocalDDEPriceTiers priceTiers2 = userCustomer.getPriceTiers();
        assertTrue(priceTiers.isIdentical(priceTiers2));
    }

    private void testGetCompanySize(LocalDDEUserCustomer userCustomer, LocalDDECompanySize companySize) {
        LocalDDECompanySize companySize2 = userCustomer.getCompanySize();
        assertTrue(companySize.isIdentical(companySize2));
    }

    private void testGetCountryCodes(LocalDDEUserCustomer userCustomer, LocalDDECountryCodes countryCodes) {
        LocalDDECountryCodes countryCodes2 = userCustomer.getCountryCodes();
        assertTrue(countryCodes.isIdentical(countryCodes2));
    }

    private void testGetUserMaster(LocalDDEUserCustomer userCustomer, LocalDDEUserMaster userMaster) {
        LocalDDEUserMaster userMaster2 = userCustomer.getUserMaster();
        assertTrue(userMaster.isIdentical(userMaster2));
    }

    private void testGetReceiveNewshtml(LocalDDEUserCustomer userCustomer, boolean receiveNewshtml) {
        boolean receiveNewshtml2 = userCustomer.getReceiveNewshtml();
        assertEquals(receiveNewshtml, receiveNewshtml2);
    }

    private void testGetReceiveTcsnews(LocalDDEUserCustomer userCustomer, boolean receiveTcsnews) {
        boolean receiveTcsnews2 = userCustomer.getReceiveTcsnews();
        assertEquals(receiveTcsnews, receiveTcsnews2);
    }

    private void testGetUseConsultants(LocalDDEUserCustomer userCustomer, boolean useConsultants) {
        boolean useConsultants2 = userCustomer.getUseConsultants();
        assertEquals(useConsultants, useConsultants2);
    }

    private void testGetUseComponents(LocalDDEUserCustomer userCustomer, boolean useComponents) {
        boolean useComponents2 = userCustomer.getUseComponents();
        assertEquals(useComponents, useComponents2);
    }

    private void testGetTelephoneNbr(LocalDDEUserCustomer userCustomer, String telephoneNbr) {
        String telephoneNbr2 = userCustomer.getTelephoneNbr();
        assertEquals(telephoneNbr, telephoneNbr2);
    }

    private void testGetTelephoneArea(LocalDDEUserCustomer userCustomer, String telephoneArea) {
        String telephoneArea2 = userCustomer.getTelephoneArea();
        assertEquals(telephoneArea, telephoneArea2);
    }

    private void testGetTelephoneCountry(LocalDDEUserCustomer userCustomer, String telephoneCountry) {
        String telephoneCountry2 = userCustomer.getTelephoneCountry();
        assertEquals(telephoneCountry, telephoneCountry2);
    }

    private void testGetPostalCode(LocalDDEUserCustomer userCustomer, String postalCode) {
        String postalCode2 = userCustomer.getPostalCode();
        assertEquals(postalCode, postalCode2);
    }

    private void testGetCity(LocalDDEUserCustomer userCustomer, String city) {
        String city2 = userCustomer.getCity();
        assertEquals(city, city2);
    }

    private void testGetAddress(LocalDDEUserCustomer userCustomer, String address) {
        String address2 = userCustomer.getAddress();
        assertEquals(address, address2);
    }

    private void testGetCompany(LocalDDEUserCustomer userCustomer, String company) {
        String company2 = userCustomer.getCompany();
        assertEquals(company, company2);
    }

    private void testGetLastName(LocalDDEUserCustomer userCustomer, String lastName) {
        String lastName2 = userCustomer.getLastName();
        assertEquals(lastName, lastName2);
    }

    private void testGetFirstName(LocalDDEUserCustomer userCustomer, String firstName) {
        String firstName2 = userCustomer.getFirstName();
        assertEquals(firstName, firstName2);
    }

    private void testRemove(LocalDDEUserCustomer userCustomer, LocalDDECountryCodes countryCodes, LocalDDECompanySize companySize,
                            LocalDDEPriceTiers priceTiers, Long primaryKey) throws RemoveException {
        userCustomer.remove();
        countryCodes.remove();
        companySize.remove();
        priceTiers.remove();
        try {
            userCustomerHome.findByPrimaryKey(primaryKey);
            fail();
        } catch (FinderException e) {
        }
    }

    private Long testGetPrimaryKey(LocalDDEUserCustomer userCustomer) throws FinderException {
        Long primaryKey = (Long) userCustomer.getPrimaryKey();
        LocalDDEUserCustomer userCustomer2 = userCustomerHome.findByPrimaryKey(primaryKey);
        assertTrue(userCustomer.isIdentical(userCustomer2));
        return primaryKey;
    }

}
