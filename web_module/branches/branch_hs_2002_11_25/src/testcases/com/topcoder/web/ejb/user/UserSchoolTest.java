package com.topcoder.web.ejb.user;

import junit.framework.*;

import java.rmi.RemoteException;
import javax.naming.*;
import javax.ejb.CreateException;

import com.topcoder.web.ejb.EJBTestCase;
import com.topcoder.web.ejb.school.*;
import com.topcoder.security.GeneralSecurityException;
import com.topcoder.security.TCSubject;
import com.topcoder.security.UserPrincipal;
import com.topcoder.security.admin.PrincipalMgrRemoteHome;
import com.topcoder.security.admin.PrincipalMgrRemote;
import com.topcoder.shared.util.TCContext;

public class UserSchoolTest extends EJBTestCase {


    private static final String
            USER_SCHOOL_HOME=UserSchoolHome.class.getName();
    private static final String
            SCHOOL_HOME=SchoolHome.class.getName();
    private static final String
            USER_HOME=UserHome.class.getName();


    private String createHandle() {

        return alphaNum(this.getClass().getName() + System.currentTimeMillis());
    }

    private String alphaNum(String s) {

        String rv = "";
        for (int i = 0; i < s.length(); i++) {
            char c = s.charAt(i);
            if (c >= 'a' && c <= 'z' || c >= 'A' && c <= 'Z' || c >= '0' && c <= '9') rv += c;
            else rv += 'X';
        }
        return rv;
    }

    private long createSecurityUser(String handle) throws RemoteException, GeneralSecurityException, CreateException, NamingException {

        Context ctx= TCContext.getInitial();
        PrincipalMgrRemoteHome pmrh=(PrincipalMgrRemoteHome)
                                  ctx.lookup(PrincipalMgrRemoteHome.EJB_REF_NAME);
        PrincipalMgrRemote pmr=pmrh.create();

        TCSubject tcs=new TCSubject(0);
        UserPrincipal up=pmr.createUser(handle, "password",tcs);
        return up.getId();
    }

    ////////////////////////////////////////////////////////////////////////////
    public static Test suite() {
    ////////////////////////////////////////////////////////////////////////////

        TestSuite ts=new TestSuite("UserSchoolTest");
        ts.addTestSuite(UserSchoolTest.class);
        return(ts);
    }


    ////////////////////////////////////////////////////////////////////////////
    public UserSchoolTest(String name) {
    ////////////////////////////////////////////////////////////////////////////

        super(name);
    }


    ////////////////////////////////////////////////////////////////////////////
    private UserSchool getHandle() throws Exception {
    ////////////////////////////////////////////////////////////////////////////

        return ((UserSchoolHome)
                getContext().lookup(USER_SCHOOL_HOME)).create();
    }


    ////////////////////////////////////////////////////////////////////////////
    private User getUserHandle() throws Exception {
    ////////////////////////////////////////////////////////////////////////////

        return ((UserHome) getContext().lookup(USER_HOME)).create();
    }


    ////////////////////////////////////////////////////////////////////////////
    private School getSchoolHandle() throws Exception {
    ////////////////////////////////////////////////////////////////////////////

        return ((SchoolHome) getContext().lookup(SCHOOL_HOME)).create();
    }


    ////////////////////////////////////////////////////////////////////////////
    public void testCreateUserSchool() throws Exception {
    ////////////////////////////////////////////////////////////////////////////

        User u = getUserHandle();
        School s = getSchoolHandle();
        UserSchool us = getHandle();

        String handle = createHandle() + "testCreateUserSchool";
        long uid = createSecurityUser(handle);
        u.createUser(uid, handle, 'A');
        long sid = s.createSchool();

        us.createUserSchool(uid, sid);

        assertTrue(!us.isCurrent(uid, sid));

        try {
            us.createUserSchool(uid, sid);
            fail("created repeat");
        } catch (Exception e) {
        }

        try {
            us.createUserSchool(uid, -1);
            fail("no exception when school id < 0");
        } catch (Exception e) {
        }

        try {
            us.createUserSchool(-1, sid);
            fail("no exception when user id < 0");
        } catch (Exception e) {
        }
    }


    ////////////////////////////////////////////////////////////////////////////
    public void testCurrent() throws Exception {
    ////////////////////////////////////////////////////////////////////////////

        User u = getUserHandle();
        School s = getSchoolHandle();
        UserSchool us = getHandle();

        String handle = createHandle() + "testCurrent";
        long uid = createSecurityUser(handle);
        u.createUser(uid, handle, 'A');
        long sid = s.createSchool();

        us.createUserSchool(uid, sid);

        us.setCurrent(uid, sid, true);
        assertTrue(us.isCurrent(uid, sid));

        us.setCurrent(uid, sid, false);
        assertTrue(!us.isCurrent(uid, sid));

        try {
            us.setCurrent(uid, -1, false);
            fail("no exception when school id < 0");
        } catch (Exception e) {
        }

        try {
            us.setCurrent(-1, sid, false);
            fail("no exception when user id < 0");
        } catch (Exception e) {
        }

        try {
            us.isCurrent(uid, -1);
            fail("no exception when school id < 0");
        } catch (Exception e) {
        }

        try {
            us.isCurrent(-1, sid);
            fail("no exception when user id < 0");
        } catch (Exception e) {
        }
    }


    ////////////////////////////////////////////////////////////////////////////
    public void testRemoveUserSchool() throws Exception {
    ////////////////////////////////////////////////////////////////////////////


        User u = getUserHandle();
        School s = getSchoolHandle();
        UserSchool us = getHandle();

        String handle = createHandle() + "testRemoveUserSchool";
        long uid = createSecurityUser(handle);
        u.createUser(uid, handle, 'A');
        long sid = s.createSchool();

        us.createUserSchool(uid, sid);
        us.removeUserSchool(uid, sid);

        try {
            us.setCurrent(uid, sid, false);
            fail("no exception after relationship removed");
        } catch (Exception e) {
        }

        try {
            us.isCurrent(uid, sid);
            fail("no exception after relationship removed");
        } catch (Exception e) {
        }
    }
}