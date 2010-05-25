package com.topcoder.dde.user;

import java.rmi.RemoteException;
import java.util.Collection;
import java.util.Hashtable;
import java.util.Vector;
import javax.ejb.CreateException;
import javax.ejb.FinderException;
import javax.ejb.RemoveException;
import javax.naming.Context;
import javax.naming.Binding;
import javax.naming.NamingEnumeration;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.rmi.PortableRemoteObject;

import junit.framework.TestCase;

import com.topcoder.dde.DDEException;
import com.topcoder.dde.user.*;
import com.topcoder.security.*;
import com.topcoder.security.admin.*;

public class UserManagerTest extends TestCase {

    public UserManagerTest(String name) {
        super(name);
    }

    public void testBean() throws Exception {
        Context context = getContext();

        Object um = context.lookup("dde/UserManager");

        UserManagerRemoteHome userManagerHome = (UserManagerRemoteHome) PortableRemoteObject.narrow(um, UserManagerRemoteHome.class);
        UserManagerRemote userManager = userManagerHome.create();
        Object prinmgr = context.lookup(PrincipalMgrRemoteHome.EJB_REF_NAME);
        PrincipalMgrRemoteHome home = (PrincipalMgrRemoteHome) PortableRemoteObject.narrow(prinmgr, PrincipalMgrRemoteHome.class);
        PrincipalMgrRemote remote = home.create();
        context.close();

        Collection c = userManager.getPricingTiers();
        System.out.println("got c");
        //assertEquals(c.size(), 1);

        try {
            User user = userManager.getUser(100000);
        } catch (NoSuchUserException e) {
            System.out.println("correctly caught NoSuchUserException");
        }

        String username = "test8";

        //Change username to test again
        RegistrationInfo ri = new RegistrationInfo();
        ri.setUsername(username);
        ri.setPassword("test");
        ri.setEmail("hlva@yahoo.com");
        ri.setFirstName("Testy");
        ri.setLastName("Tester");
        ri.setCompany("Test, inc");
        ri.setAddress("123 main st");
        ri.setCity("City");
        ri.setPostalcode("12345");
        ri.setPhoneCountry("001");
        ri.setPhoneArea("123");
        ri.setPhoneNumber("4567890");
        ri.setUseComponents(true);
        ri.setUseConsultants(false);
        ri.setReceiveNews(true);
        ri.setNewsInHtml(true);
        ri.setCompanySize(1);
        ri.setCountryCode(4);
        UserTechnology ut1 = new UserTechnology(1, 1200, 6);
        UserTechnology ut2 = new UserTechnology(2, 800, 3);
        UserTechnology ut3 = new UserTechnology(3, 1800, 30);
        UserTechnology ut4 = new UserTechnology(4, 800, 3);
        UserTechnology ut5 = new UserTechnology(5, 1800, 30);
        Vector v = new Vector();
        v.add(ut1);
        v.add(ut2);
        v.add(ut3);
        v.add(ut4);
        v.add(ut5);
        ri.setTechnologies(v);
        PricingTier pt = new PricingTier(1, 5);

        try {
            TCSubject requestor = null;
            UserPrincipal old = remote.getUser(username);
            remote.removeUser(old, requestor);
        } catch (com.topcoder.security.NoSuchUserException ignore) {
        }

        try {
            User user = userManager.register(ri);
        } catch (InvalidRegistrationException e) {
            System.out.println("correctly caught InvalidRegistrationException");
            ri.setPricingTier(pt);
            User user = userManager.register(ri);
        }
        System.out.println("registered user");

        try {
            User dupUser = userManager.register(ri);
        } catch (DuplicateUsernameException e) {
            System.out.println("correctly caught DuplicateUsernameException");
        }

        /*
        userManager.removeUser(user);
        System.out.println("removed user");

        User user2 = userManager.getUser(username);
        System.out.println("got user");
        //assertEquals(user2.getStatus(), UserStatus.INACTIVE);
        //System.out.println("user was removed");

        user2.setStatus(UserStatus.ACTIVE);

        v = new Vector();
        v.add(ut1);
        v.add(ut5);
        ri.setTechnologies(v);
        //user2.setRegInfo(ri);
        userManager.updateUser(user2);
        System.out.println("reactivate user");

        //userManager.activate("bE8JdRqSBD2ke03Qaz-1028770003712");
        User user3 = userManager.getUser(username);
        //assertEquals(user.getRegInfo().getFirstName(), "Testy");
        //assertEquals(user3.getStatus(), UserStatus.ACTIVE);
        assertEquals(user3.getStatus(), UserStatus.PENDINGACTIVATION);
        System.out.println("user was reactivated");
        */

        TCSubject tcsubject = userManager.login(username, "test");
        User user4 = userManager.getUser(username);
        assertEquals(1, user4.getNumLogins());

    }

    private static Context getContext() throws NamingException {
        Hashtable environment = new Hashtable();
        environment.put(Context.PROVIDER_URL, "localhost:1099");
        environment.put(Context.INITIAL_CONTEXT_FACTORY, "org.jnp.interfaces.NamingContextFactory");
        return new InitialContext(environment);
    }
}

