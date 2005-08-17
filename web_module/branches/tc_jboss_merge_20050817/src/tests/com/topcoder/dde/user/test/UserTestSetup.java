/*
 * UserTestSetup.java
 *
 * By John C. Bollinger
 *
 * Copyright (c) 2002
 */
package com.topcoder.dde.user.test;

import com.topcoder.dde.user.*;
import com.topcoder.util.idgenerator.bean.*;

import java.util.ArrayList;
import java.util.Hashtable;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.rmi.PortableRemoteObject;

import junit.extensions.TestSetup;
import junit.framework.*;

public class UserTestSetup extends TestSetup {

    static final String NAMING_HOST = "localhost:1099";
    static final String FACTORY_NAME =
            "org.jnp.interfaces.NamingContextFactory";
    private static final String IDGEN_NAME = "idgenerator/IdGenEJB";

    private static int initializationCount = 0;

    public static UserManagerRemoteHome managerRemoteHome;
    public static UserManagerRemote userManager;
    public static User defaultUser;
    public static IdGen idGen;
    public static Context namingContext;

    public UserTestSetup(Test t) {
        super(t);
    }

    public void setUp() throws Exception {
        synchronized (UserTestSetup.class) {
            if (initializationCount == 0) {
                Hashtable environment;
                UserManagerRemoteHome userHome;
                RegistrationInfo regInfo = new RegistrationInfo();
                IdGenHome idGenHome;

                environment = new Hashtable();
                environment.put(Context.PROVIDER_URL, NAMING_HOST);
                environment.put(Context.INITIAL_CONTEXT_FACTORY,
                        "org.jnp.interfaces.NamingContextFactory");
                namingContext = new InitialContext(environment);

                managerRemoteHome =
                        (UserManagerRemoteHome) PortableRemoteObject.narrow(
                                namingContext.lookup(UserManagerRemoteHome.EJB_REF_NAME), UserManagerRemoteHome.class);
                userManager = managerRemoteHome.create();

                idGenHome = (IdGenHome) PortableRemoteObject.narrow(
                        namingContext.lookup(IDGEN_NAME), IdGenHome.class);
                idGen = idGenHome.create();

                regInfo.setEmail("test123@test.net");
                regInfo.setFirstName("T");
                regInfo.setLastName("T123");
                regInfo.setPassword("p8$sw0rd");
                regInfo.setUsername("test" + System.currentTimeMillis());
                regInfo.setAddress("123 Virtual Street");
                regInfo.setCity("New York City");
                regInfo.setCompany("bad");
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

                defaultUser = userManager.register(regInfo);

                initializationCount++;
            }
        }
    }

    public void tearDown() throws Exception {
        synchronized (UserTestSetup.class) {
            if (--initializationCount == 0) {
                namingContext.close();
                userManager.removeUser(defaultUser);
                userManager.remove();
                idGen.remove();
            }
        }
    }

}