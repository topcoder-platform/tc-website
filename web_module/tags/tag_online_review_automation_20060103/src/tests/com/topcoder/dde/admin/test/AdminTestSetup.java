/*
 * AdminTestSetup.java
 *
 * By John C. Bollinger
 *
 * Copyright (c) 2002
 */
package com.topcoder.dde.admin.test;

import com.topcoder.dde.admin.*;
import com.topcoder.dde.user.test.UserTestSetup;
import com.topcoder.security.RolePrincipal;
import com.topcoder.security.UserPrincipal;
import com.topcoder.security.admin.PrincipalMgrRemote;
import com.topcoder.security.admin.PrincipalMgrRemoteHome;
import com.topcoder.security.login.LoginRemote;
import com.topcoder.security.login.LoginRemoteHome;

import javax.rmi.PortableRemoteObject;

import junit.framework.Test;

/**
 * a JUnit TestSetup subclass for use with the dde.admin test suite.  This setup
 * depends on the default values for the admin role name and id; the tests will
 * break if those values are changed.
 *
 * @author  John C. Bollinger
 * @version 1.0
 */
public class AdminTestSetup extends UserTestSetup {

    private static int adminInitializationCount = 0;

    static PrincipalMgrRemote principalMgr;
    static AdminLogin adminLogin;
    static LoginRemote login;
    static RolePrincipal adminRole;
    static UserPrincipal defaultUserPrincipal;

    public AdminTestSetup(Test t) {
        super(t);
    }

    public void setUp() throws Exception {
        super.setUp();
        synchronized (AdminTestSetup.class) {
            if (adminInitializationCount++ == 0) {
                PrincipalMgrRemoteHome principalMgrHome =
                        (PrincipalMgrRemoteHome) PortableRemoteObject.narrow(
                                namingContext.lookup(PrincipalMgrRemoteHome.EJB_REF_NAME),
                                PrincipalMgrRemoteHome.class);
                AdminLoginHome adminLoginHome =
                        (AdminLoginHome) PortableRemoteObject.narrow(
                                namingContext.lookup("AdminLoginEJB"),
                                AdminLoginHome.class);
                LoginRemoteHome loginHome =
                        (LoginRemoteHome) PortableRemoteObject.narrow(
                                namingContext.lookup(LoginRemoteHome.EJB_REF_NAME),
                                LoginRemoteHome.class);
                principalMgr = principalMgrHome.create();
                adminLogin = adminLoginHome.create();
                login = loginHome.create();
                adminRole = new RolePrincipal("Administrator", 1L);
                defaultUserPrincipal = principalMgr.getUser(defaultUser.getId());
            }
        }
    }

    public void tearDown() throws Exception {
        synchronized (AdminTestSetup.class) {
            if (--adminInitializationCount == 0) {
                principalMgr.remove();
                adminLogin.remove();
                login.remove();
            }
        }
        super.tearDown();
    }

}