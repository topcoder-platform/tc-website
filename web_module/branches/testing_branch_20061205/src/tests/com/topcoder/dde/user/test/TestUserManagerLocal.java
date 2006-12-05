/*
 * TestUserManagerLocal.java
 *
 * By John C. Bollinger
 *
 * Copyright (c) 2002
 */
package com.topcoder.dde.user.test;

import com.topcoder.dde.user.*;
import com.topcoder.security.TCSubject;
import com.topcoder.security.login.AuthenticationException;
import com.topcoder.util.idgenerator.bean.LocalIdGen;
import com.topcoder.util.idgenerator.bean.LocalIdGenHome;

import java.util.Hashtable;
import java.util.Iterator;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.rmi.PortableRemoteObject;

import junit.framework.*;
import net.sourceforge.junitejb.*;

public class TestUserManagerLocal extends EJBTestCase {

    protected UserManagerLocal userManager;
    protected LocalIdGen idGen;
    protected User user;
    private long userId;
    protected static final String TEST_RUNNER_NAME = "user/EJBTestRunner";

    public TestUserManagerLocal(String testName) {
        this(testName, -1L);
    }

    public TestUserManagerLocal(String testName, long uid) {
        super(testName);
        userId = uid;
    }

    public void setUp() throws Exception {
        super.setUp();

        Context namingContext = new InitialContext();
        LocalIdGenHome idGenHome = (LocalIdGenHome)
                namingContext.lookup(LocalIdGenHome.EJB_REF_NAME);
        UserManagerLocalHome managerHome = (UserManagerLocalHome)
                namingContext.lookup(UserManagerLocalHome.EJB_REF_NAME);
        namingContext.close();

        idGen = idGenHome.create();
        userManager = managerHome.create();
        assertNotNull("Did not obtain UserManager", userManager);
        user = userManager.getUser(userId);
        setUserStatus(UserStatus.ACTIVE);
    }

    public void tearDown() throws Exception {
        idGen.remove();
        userManager.remove();
        super.tearDown();
    }

    protected void setUserStatus(long status) throws Exception {
        user.setStatus(status);
        userManager.updateUser(user);
    }

/*
 *  will not test -- no way to obtain the activation code without recourse
 *  to persistence layer access, which is undesirable because it breaks the
 *  test suite modularity
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
            fail("Expected a UserNotActivatedException");
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
        return new UserTestSetup(new TestSuite(TestUserManagerLocal.class));
    }

    /*
     * Note: this method copied directly from EJBTestCase to work around that
     *       class' brain dead InitialContext construction.  This works with
     *       getEJBTestRunner(), below.
     */
    public void runBare() throws Throwable {
        if (!isServerSide()) {
            // We're not on the server side yet, invoke the test on the serverside.
            EJBTestRunner testRunner = null;
            try {
                testRunner = getEJBTestRunner();
                assertNotNull("Obtained a null EJBTestRunner reference", testRunner);
                testRunner.run(getClass().getName(), getName());
            } catch (RemoteTestException e) {
                // if the remote test exception is from an assertion error
                // rethrow it with a sub class of AssertionFailedError so it is
                // picked up as a failure and not an error.
                // The server has to throw sub classes of Error because that is the
                // allowable scope of application exceptions. So
                // AssertionFailedError which is an instance of error has to be
                // wrapped in an exception.
                Throwable remote = e.getRemoteThrowable();
                if (remote instanceof AssertionFailedError) {
                    throw new RemoteAssertionFailedError(
                            (AssertionFailedError) remote, e.getRemoteStackTrace());
                }
                throw e;
            } finally {
                // be a good citizen, drop my ref to the session bean.
                if (testRunner != null) {
                    testRunner.remove();
                }
            }
        } else {
            // We're on the server side, so invoke the test the regular way.
            super.runBare();
        }
    }

    /**
     * Looks up the ejb test runner home in JNDI (at "ejb/EJBTestRunner")
     * and creates a new runner.  This method is invoked only on the client
     * side.
     *
     * @throws Exception if any problem happens
     */
    private EJBTestRunner getEJBTestRunner() throws Exception {
        Hashtable environment = new Hashtable();
        environment.put(Context.PROVIDER_URL, UserTestSetup.NAMING_HOST);
        environment.put(Context.INITIAL_CONTEXT_FACTORY,
                "org.jnp.interfaces.NamingContextFactory");
        Context jndiContext = new InitialContext(environment);
        Object ref;

        // Get a reference from this to the Bean's Home interface
        ref = jndiContext.lookup(TEST_RUNNER_NAME);
        TCSEJBTestRunnerHome runnerHome = (TCSEJBTestRunnerHome)
                PortableRemoteObject.narrow(ref, TCSEJBTestRunnerHome.class);

        // create the test runner
        return runnerHome.create(UserTestSetup.defaultUser.getId());
    }

}
