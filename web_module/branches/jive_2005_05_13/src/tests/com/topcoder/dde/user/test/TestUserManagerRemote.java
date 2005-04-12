/*
 * TestUserManagerRemote.java
 *
 * By John C. Bollinger
 *
 * Copyright (c) 2002
 */
package com.topcoder.dde.user.test;

import com.topcoder.dde.user.*;
import com.topcoder.security.TCSubject;
import com.topcoder.security.login.AuthenticationException;
import com.topcoder.util.idgenerator.bean.IdGen;

import java.util.Iterator;

import junit.framework.*;

public class TestUserManagerRemote extends TestCase {

    protected UserManagerRemote userManager;
    protected IdGen idGen;
    protected User user;

    public TestUserManagerRemote(String testName) {
        super(testName);
    }

    public void setUp() throws Exception {
        super.setUp();

        idGen = UserTestSetup.idGen;
        userManager = UserTestSetup.managerRemoteHome.create();
        assertNotNull("Did not obtain UserManager", userManager);
        user = UserTestSetup.defaultUser;
        setUserStatus(UserStatus.ACTIVE);
    }

    public void tearDown() throws Exception {
        userManager.remove();
        super.tearDown();
    }

    protected void setUserStatus(long status) throws Exception {
        user.setStatus(status);
        userManager.updateUser(user);
    }

/*
 *  cannot test remotely -- no way to obtain the activation code
 *
    public void testActivate() {
    }
 */

    public void testGetPricingTiers() throws Exception {
        /*
         * This is a strange test because the correct result of the method
         * being tested is only approximately known.  No attempt is made to
         * verify that _all_ pricing tiers are returned, only that everything
         * returned is a PricingTier.
         */
        Iterator tierIterator = userManager.getPricingTiers().iterator();
        while (tierIterator.hasNext()) {
            assertTrue("Not a PricingTier",
                    tierIterator.next() instanceof PricingTier);
        }
    }

    public void testGetUser_Long() throws Exception {
        User localUser = userManager.getUser(user.getId());

        assertEquals("Wrong user obtained", user.getId(), localUser.getId());
        assertEquals("Wrong user obtained", user.getRegInfo().getUsername(),
                localUser.getRegInfo().getUsername());
    }

    public void testGetUser_LongMissing() throws Exception {
        try {
            userManager.getUser(idGen.nextId());
            fail("Expected a NoSuchUserException");
        } catch (NoSuchUserException nsue) {
            /* the expected case */
        }
    }

    public void testGetUser_String() throws Exception {
        User localUser = userManager.getUser(user.getRegInfo().getUsername());

        assertEquals("Wrong user obtained", user.getRegInfo().getUsername(),
                localUser.getRegInfo().getUsername());
        assertEquals("Wrong user obtained", user.getId(), localUser.getId());
    }

    public void testGetUser_StringNull() throws Exception {
        try {
            userManager.getUser(null);
            fail("Expected a NoSuchUserException");
        } catch (NoSuchUserException nsue) {
            /* the expected case */
        }
    }

    public void testGetUser_StringMissing() throws Exception {
        try {
            userManager.getUser("Missing User #" + idGen.nextId());
            fail("Expected a NoSuchUserException");
        } catch (NoSuchUserException nsue) {
            /* the expected case */
        }
    }

    public void testLogin() throws Exception {
        user = userManager.getUser(user.getId());
        Thread.currentThread().sleep(1);
        TCSubject subject = userManager.login(user.getRegInfo().getUsername(),
                user.getRegInfo().getPassword());
        /*
         * If it were known which roles this user should have then the presence
         * of those roles could be tested here
         */
        User localUser = userManager.getUser(user.getId());

        assertEquals("Number of logins not incremented",
                user.getNumLogins() + 1, localUser.getNumLogins());
        assertTrue("Last Logon date not updated correctly",
                user.getLastLogonTime().compareTo(localUser.getLastLogonTime())
                < 0);
    }

    public void testLogin_NullUsername() throws Exception {
        try {
            userManager.login(null, user.getRegInfo().getPassword());
            fail("Expected an AuthenticationException");
        } catch (AuthenticationException ae) {
            /* the expected case */
        }
    }

    public void testLogin_NullPassword() throws Exception {
        try {
            userManager.login(user.getRegInfo().getUsername(), null);
            fail("Expected an AuthenticationException");
        } catch (AuthenticationException ae) {
            /* the expected case */
        }
    }

    public void testLogin_InvalidUsername() throws Exception {
        try {
            userManager.login("Username #" + idGen.nextId(),
                    user.getRegInfo().getPassword());
            fail("Expected an AuthenticationException");
        } catch (AuthenticationException ae) {
            /* the expected case */
        }
    }

    public void testLogin_WrongPassword() throws Exception {
        try {
            userManager.login(user.getRegInfo().getUsername(),
                    user.getRegInfo().getPassword() + "a");
            fail("Expected an AuthenticationException");
        } catch (AuthenticationException ae) {
            /* the expected case */
        }
    }

    public void testLogin_NotActivated() throws Exception {
        setUserStatus(UserStatus.PENDINGACTIVATION);
        try {
            userManager.login(user.getRegInfo().getUsername(),
                    user.getRegInfo().getPassword());
            fail("Expected an UserNotActivatedException");
        } catch (UserNotActivatedException unae) {
            /* the expected case */
        }
    }

    public void testLogin_Inactive() throws Exception {
        setUserStatus(UserStatus.INACTIVE);
        try {
            userManager.login(user.getRegInfo().getUsername(),
                    user.getRegInfo().getPassword());
            fail("Expected an AuthenticationException");
        } catch (AuthenticationException ae) {
            /* the expected case */
        }
    }

/*
 * Normal registration functionality tested in the test setup and elsewhere
 *
    public void testRegister() {
    }
 */

    public void testRegister_Null() throws Exception {
        try {
            userManager.register(null);
            fail("Expected a InvalidRegistrationException");
        } catch (InvalidRegistrationException ire) {
            /* the expected case */
        }
    }

    public void testRemoveUser_User() throws Exception {
        User localUser;

        userManager.removeUser(user);
        localUser = userManager.getUser(user.getId());
        assertEquals("User not removed", UserStatus.INACTIVE,
                localUser.getStatus());
    }

    public void testRemoveUser_UserMissing() throws Exception {
        try {
            userManager.removeUser(new User(idGen.nextId()));
            fail("Expected a NoSuchUserException");
        } catch (NoSuchUserException nsue) {
            /* the expected case */
        }
    }

    public void testRemoveUser_UserNull() throws Exception {
        try {
            User localUser = null;
            userManager.removeUser(localUser);
            fail("Expected a NoSuchUserException");
        } catch (NoSuchUserException nsue) {
            /* the expected case */
        }
    }

    public void testRemoveUser_String() throws Exception {
        User localUser;

        userManager.removeUser(user.getRegInfo().getUsername());
        localUser = userManager.getUser(user.getId());
        assertEquals("User not removed", UserStatus.INACTIVE,
                localUser.getStatus());
    }

    public void testRemoveUser_StringMissing() throws Exception {
        try {
            userManager.removeUser("MissingUser" + idGen.nextId());
            fail("Expected a NoSuchUserException");
        } catch (NoSuchUserException nsue) {
            /* the expected case */
        }
    }

    public void testRemoveUser_StringNull() throws Exception {
        try {
            String localUser = null;
            userManager.removeUser(localUser);
            fail("Expected a NoSuchUserException");
        } catch (NoSuchUserException nsue) {
            /* the expected case */
        }
    }

    public void testUpdateUser() throws Exception {
        RegistrationInfo regInfo1 = user.getRegInfo();
        RegistrationInfo regInfo2;

        regInfo1.setPostalcode("" + idGen.nextId());
        regInfo1.setLastName("Name" + idGen.nextId());
        user.setRegInfo(regInfo1);
        userManager.updateUser(user);
        user = userManager.getUser(user.getId());
        regInfo2 = user.getRegInfo();
        assertEquals("Update did not work", regInfo1.getPostalcode(),
                regInfo2.getPostalcode());
        assertEquals("Update did not work", regInfo1.getLastName(),
                regInfo2.getLastName());
    }

    public void testUpdateUser_Invalid() throws Exception {
        try {
            userManager.updateUser(new User(idGen.nextId()));
            fail("Expected a NoSuchUserException");
        } catch (NoSuchUserException nsue) {
            /* the expected case */
        }
    }

    public void testUpdateUser_Null() throws Exception {
        try {
            userManager.updateUser(null);
            fail("Expected a NoSuchUserException");
        } catch (NoSuchUserException nsue) {
            /* the expected case */
        }
    }

    public static Test suite() {
        return new UserTestSetup(new TestSuite(TestUserManagerRemote.class));
    }
}