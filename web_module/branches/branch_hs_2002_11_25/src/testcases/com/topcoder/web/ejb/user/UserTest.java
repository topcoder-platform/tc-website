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
    public void testCreateUser() {}
    ////////////////////////////////////////////////////////////////////////////


    ////////////////////////////////////////////////////////////////////////////
    public void testFirstName() {}
    ////////////////////////////////////////////////////////////////////////////


    ////////////////////////////////////////////////////////////////////////////
    public void testLastName() {}
    ////////////////////////////////////////////////////////////////////////////


    ////////////////////////////////////////////////////////////////////////////
    public void testUserStatusId() {}
    ////////////////////////////////////////////////////////////////////////////
}
