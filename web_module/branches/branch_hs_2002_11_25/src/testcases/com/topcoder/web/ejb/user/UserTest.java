package com.topcoder.web.ejb.user;

import junit.framework.*;

import java.util.*;
import javax.naming.*;
import javax.rmi.*;
import javax.ejb.EJBException;
import javax.ejb.EJBObject;
import com.topcoder.web.ejb.EJBTestCase;

public class UserTest extends EJBTestCase {


    private static final String USER_HOME=UserHome.class.toString();


    ////////////////////////////////////////////////////////////////////////////
    public static Test suite() {
    ////////////////////////////////////////////////////////////////////////////

        TestSuite ts=new TestSuite("UserTest");
        ts.addTestSuite(UserTest.class);
        return(ts);
    }


    ////////////////////////////////////////////////////////////////////////////
    public UserTest(String name) {
    ////////////////////////////////////////////////////////////////////////////

        super(name);
    }


    ////////////////////////////////////////////////////////////////////////////
    private User getHandle() throws Exception {
    ////////////////////////////////////////////////////////////////////////////

        return ((UserHome) getContext().lookup(USER_HOME)).create();
    }


    ////////////////////////////////////////////////////////////////////////////
    public void testCreateUser() throws Exception {
    ////////////////////////////////////////////////////////////////////////////

        User u = getHandle();

        long id = u.createUser();

        assertTrue(id >= 0);
        assertTrue(null == u.getFirstName());
        assertTrue(null == u.getLastName());
        assertEquals(0, u.getUserStatusId());
    }


    ////////////////////////////////////////////////////////////////////////////
    public void testFirstName() {
    ////////////////////////////////////////////////////////////////////////////

        User u = getHandle();

        long id = u.createUser();

        String name = "testUser";

        u.setFirstName(id, name);
        assertEquals(name, u.getFirstName(id));

        try {
            u.setFirstName(id, null);
            fail("No exception thrown when set to null");
        } catch (Exception e) {
            if (e instanceof RuntimeException) {
                fail (e.toString());
            }
        }

        try {
            u.setFirstName(-1, name);
            fail("No exception thrown when id < 0");
        } catch (Exception e) {
            if (e instanceof RuntimeException) {
                fail (e.toString());
            }
        }
    }


    ////////////////////////////////////////////////////////////////////////////
    public void testLastName() {
    ////////////////////////////////////////////////////////////////////////////

        User u = getHandle();

        long id = u.createUser();

        String name = "testUser";

        u.setLastName(id, name);
        assertEquals(name, u.getLastName(id));

        try {
            u.setLastName(id, null);
            fail("No exception thrown when set to null");
        } catch (Exception e) {
            if (e instanceof RuntimeException) {
                fail (e.toString());
            }
        }

        try {
            u.setLastName(-1, name);
            fail("No exception thrown when id < 0");
        } catch (Exception e) {
            if (e instanceof RuntimeException) {
                fail (e.toString());
            }
        }
    }


    ////////////////////////////////////////////////////////////////////////////
    public void testUserStatusId() {
    ////////////////////////////////////////////////////////////////////////////

        User u = getHandle();

        long id = u.createUser();

        long status = 1;

        u.setUserStatusId(id, status);
        assertEquals(status, u.getUserStatusId(id));

        try {
            u.setUserStatusId(id, -1);
            fail("No exception thrown when status < 0");
        } catch (Exception e) {
            if (e instanceof RuntimeException) {
                fail (e.toString());
            }
        }

        try {
            u.setLastName(-1, status);
            fail("No exception thrown when id < 0");
        } catch (Exception e) {
            if (e instanceof RuntimeException) {
                fail (e.toString());
            }
        }
    }
}
