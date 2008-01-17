/*
 * TestAdminLogin.java
 *
 * By John C. Bollinger
 *
 * Copyright (c) 2002
 */
package com.topcoder.dde.admin.test;

import com.topcoder.dde.admin.*;
import com.topcoder.dde.user.User;
import com.topcoder.util.idgenerator.bean.IdGen;
import com.topcoder.security.GeneralSecurityException;
import com.topcoder.security.RolePrincipal;
import com.topcoder.security.TCSubject;
import com.topcoder.security.UserPrincipal;
import com.topcoder.security.admin.PrincipalMgrRemote;
import com.topcoder.security.login.AuthenticationException;
import com.topcoder.security.login.LoginRemote;
import junit.framework.Test;
import junit.framework.TestCase;
import junit.framework.TestSuite;

/**
 * a JUnit test case for the AdminLoginEJB's remote interface
 *
 * @author  John C. Bollinger
 * @version 1.0
 */
public class TestAdminLogin extends TestCase {

    private PrincipalMgrRemote principalMgr;
    private AdminLogin adminLogin;
    private LoginRemote login;
    private RolePrincipal adminRole;
    private User defaultUser;
    private UserPrincipal defaultUserPrincipal;
    private IdGen idGen;

    public TestAdminLogin(String testName) {
        super(testName);
    }

    public void setUp() {
        principalMgr = AdminTestSetup.principalMgr;
        adminLogin = AdminTestSetup.adminLogin;
        login = AdminTestSetup.login;
        adminRole = AdminTestSetup.adminRole;
        defaultUser = AdminTestSetup.defaultUser;
        defaultUserPrincipal = AdminTestSetup.defaultUserPrincipal;
        idGen = AdminTestSetup.idGen;
    }

    public void testLogin() throws Exception {
        TCSubject subject;
        TCSubject adminSubject;

        principalMgr.assignRole(defaultUserPrincipal, adminRole, null);
        subject = login.login(defaultUser.getRegInfo().getUsername(),
                defaultUser.getRegInfo().getPassword());
        /* partial success if no exception is thrown: */
        adminSubject = adminLogin.login(defaultUser.getRegInfo().getUsername(),
                defaultUser.getRegInfo().getPassword());
        assertEquals("Subject not returned correctly", subject, adminSubject);

        principalMgr.unAssignRole(defaultUserPrincipal, adminRole, null);
        try {
            adminLogin.login(defaultUser.getRegInfo().getUsername(),
                    defaultUser.getRegInfo().getPassword());
            fail("Expected an AuthenticationException");
        } catch (AuthenticationException ae) {
            /* the expected case */
        }
    }

    public void testLogin_NullUsername() throws Exception {
        principalMgr.assignRole(defaultUserPrincipal, adminRole, null);
        try {
            adminLogin.login(null, defaultUser.getRegInfo().getPassword());
            fail("Expected a GeneralSecurityException");
        } catch (GeneralSecurityException gse) {
            /* the expected case */
        } finally {
            principalMgr.unAssignRole(defaultUserPrincipal, adminRole, null);
        }
    }

    public void testLogin_NullPassword() throws Exception {
        principalMgr.assignRole(defaultUserPrincipal, adminRole, null);
        try {
            adminLogin.login(defaultUser.getRegInfo().getUsername(), null);
            fail("Expected a GeneralSecurityException");
        } catch (GeneralSecurityException gse) {
            /* the expected case */
        } finally {
            principalMgr.unAssignRole(defaultUserPrincipal, adminRole, null);
        }
    }

    public void testLogin_BadPassword() throws Exception {
        principalMgr.assignRole(defaultUserPrincipal, adminRole, null);
        try {
            adminLogin.login(defaultUser.getRegInfo().getUsername(), "foobar");
            fail("Expected an AuthenticationException");
        } catch (AuthenticationException ae) {
            /* the expected case */
        } finally {
            principalMgr.unAssignRole(defaultUserPrincipal, adminRole, null);
        }
    }

    public void testLogin_BadUsername() throws Exception {
        principalMgr.assignRole(defaultUserPrincipal, adminRole, null);
        try {
            adminLogin.login("test" + idGen.nextId(),
                    defaultUser.getRegInfo().getPassword());
            fail("Expected an AuthenticationException");
        } catch (AuthenticationException ae) {
            /* the expected case */
        } finally {
            principalMgr.unAssignRole(defaultUserPrincipal, adminRole, null);
        }
    }

    public static Test suite() {
        return new AdminTestSetup(new TestSuite(TestAdminLogin.class));
    }
}