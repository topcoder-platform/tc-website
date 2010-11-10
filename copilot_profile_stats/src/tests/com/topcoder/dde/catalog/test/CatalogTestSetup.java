/*
 * CatalogTestSetup.java
 *
 * By John C. Bollinger
 *
 * Copyright (c) 2002
 */
package com.topcoder.dde.catalog.test;

import com.topcoder.dde.catalog.*;
import com.topcoder.dde.user.*;
import com.topcoder.dde.user.test.UserTestSetup;
import com.topcoder.security.admin.PolicyMgrRemoteHome;
import com.topcoder.security.admin.PrincipalMgrRemoteHome;

import java.util.ArrayList;
import java.util.Date;
import java.util.Hashtable;
import javax.naming.*;
import javax.rmi.PortableRemoteObject;

import junit.framework.Test;

public class CatalogTestSetup extends UserTestSetup {

    private static int catalogInitializationCount = 0;
    private static Catalog myCatalog;
    protected static CatalogHome catalogHome;
    protected static ComponentManagerHome componentManagerHome;
    protected static PolicyMgrRemoteHome policyManagerHome;
    protected static PrincipalMgrRemoteHome principalManagerHome;
    protected static User extraUser;
    protected static Date requestDate1, requestDate2;
    protected static LicenseLevel defaultLevel;

    protected static final String DEF_COMP_NAME = "Test Component";
    protected static final String DEF_COMP_SHORTD = "A test component";
    protected static final String DEF_COMP_DESC =
            "A component for testing the component catalog, Kemosabe";
    protected static final String DEF_COMP_FUNCTIONAL =
            "No function beyond testing";
    protected static final String DEF_COMP_KEYWORDS =
            "test" + ComponentInfo.KEYWORD_DELIMITER + "bacon";
    protected static final String DEF_COMP_COMMENTS = "testing 1, 2, 3 ...";
    protected static final String DEF_COMP_VERSION =
            "Texas tea edition";
    protected static ComponentSummary compSummary;

    public CatalogTestSetup(Test t) {
        super(t);
    }

    public void setUp() throws Exception {
        super.setUp();
        synchronized (CatalogTestSetup.class) {
            if (catalogInitializationCount++ == 0) {
                ComponentRequest request;
                RegistrationInfo regInfo = new RegistrationInfo();

                catalogHome = (CatalogHome) PortableRemoteObject.narrow(
                        namingContext.lookup(CatalogHome.EJB_REF_NAME),
                        CatalogHome.class);
                componentManagerHome =
                        (ComponentManagerHome) PortableRemoteObject.narrow(
                                namingContext.lookup(ComponentManagerHome.EJB_REF_NAME),
                                ComponentManagerHome.class);
                policyManagerHome =
                        (PolicyMgrRemoteHome) PortableRemoteObject.narrow(
                                namingContext.lookup(PolicyMgrRemoteHome.EJB_REF_NAME),
                                PolicyMgrRemoteHome.class);
                principalManagerHome =
                        (PrincipalMgrRemoteHome) PortableRemoteObject.narrow(
                                namingContext.lookup(PrincipalMgrRemoteHome.EJB_REF_NAME),
                                PrincipalMgrRemoteHome.class);

                regInfo.setEmail("bert@pigeoninc.com");
                regInfo.setFirstName("Bert");
                regInfo.setLastName("Smith");
                regInfo.setPassword("pi8e0n42");
                regInfo.setUsername("bert" + System.currentTimeMillis());
                regInfo.setAddress("123 Sesame Street");
                regInfo.setCity("New York City");
                regInfo.setCompany("CTW");
                regInfo.setCompanySize(1L);
                regInfo.setCountryCode(840L);
                regInfo.setNewsInHtml(false);
                regInfo.setPhoneArea("800");
                regInfo.setPhoneCountry("1");
                regInfo.setPhoneNumber("0000000");
                regInfo.setPostalcode("12345");
                regInfo.setPricingTier(new PricingTier(1L, 5d));
                regInfo.setReceiveNews(false);
                regInfo.setTechnologies(new ArrayList());
                regInfo.setUseComponents(true);
                regInfo.setUseConsultants(true);
                extraUser = userManager.register(regInfo);

                myCatalog = catalogHome.create();
                requestDate1 = new Date();
                request = new ComponentRequest(DEF_COMP_NAME, DEF_COMP_SHORTD,
                        DEF_COMP_DESC, DEF_COMP_FUNCTIONAL, DEF_COMP_KEYWORDS,
                        DEF_COMP_COMMENTS, DEF_COMP_VERSION, defaultUser.getId());
                compSummary = myCatalog.requestComponent(request);
                requestDate2 = new Date();
                defaultLevel = myCatalog.addLicenseLevel(new LicenseLevel(
                        "A default license level for test purposes", 0.85d));
            }
        }
    }

    public void tearDown() throws Exception {
        synchronized (CatalogTestSetup.class) {
            if (--catalogInitializationCount == 0) {
                userManager.removeUser(extraUser);
                myCatalog.removeComponent(compSummary.getComponentId());
                myCatalog.remove();
            }
        }
        super.tearDown();
    }
}