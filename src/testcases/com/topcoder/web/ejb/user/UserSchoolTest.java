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
import com.topcoder.shared.util.DBMS;

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
        u.createUser(uid, handle, 'A',DBMS.HS_OLTP_DATASOURCE_NAME);
        long sid = s.createSchool(DBMS.HS_OLTP_DATASOURCE_NAME,DBMS.HS_OLTP_DATASOURCE_NAME);

        us.createUserSchool(uid, sid,DBMS.HS_OLTP_DATASOURCE_NAME);

        assertTrue(!us.isCurrentUserSchoolId(uid, sid,DBMS.HS_OLTP_DATASOURCE_NAME));

        try {
            us.createUserSchool(uid, sid,DBMS.HS_OLTP_DATASOURCE_NAME);
            fail("created repeat");
        } catch (Exception e) {
        }

        try {
            us.createUserSchool(uid, -1,DBMS.HS_OLTP_DATASOURCE_NAME);
            fail("no exception when school id < 0");
        } catch (Exception e) {
        }

        try {
            us.createUserSchool(-1, sid,DBMS.HS_OLTP_DATASOURCE_NAME);
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
        u.createUser(uid, handle, 'A', DBMS.HS_OLTP_DATASOURCE_NAME);
        long sid = s.createSchool(DBMS.HS_OLTP_DATASOURCE_NAME,DBMS.HS_OLTP_DATASOURCE_NAME);
        long sid2 = s.createSchool(DBMS.HS_OLTP_DATASOURCE_NAME,DBMS.HS_OLTP_DATASOURCE_NAME);

        us.createUserSchool(uid, sid,DBMS.HS_OLTP_DATASOURCE_NAME);
        us.createUserSchool(uid, sid2,DBMS.HS_OLTP_DATASOURCE_NAME);

        us.setCurrentUserSchoolId(uid, sid,DBMS.HS_OLTP_DATASOURCE_NAME);
        assertTrue(us.isCurrentUserSchoolId(uid, sid,DBMS.HS_OLTP_DATASOURCE_NAME));
        assertTrue(!us.isCurrentUserSchoolId(uid, sid2,DBMS.HS_OLTP_DATASOURCE_NAME));

        us.setCurrentUserSchoolId(uid, sid2,DBMS.HS_OLTP_DATASOURCE_NAME);
        assertTrue(!us.isCurrentUserSchoolId(uid, sid,DBMS.HS_OLTP_DATASOURCE_NAME));
        assertTrue(us.isCurrentUserSchoolId(uid, sid2,DBMS.HS_OLTP_DATASOURCE_NAME));

        try {
            us.setCurrentUserSchoolId(uid, -1,DBMS.HS_OLTP_DATASOURCE_NAME);
            fail("no exception when school id < 0");
        } catch (Exception e) {
        }

        try {
            us.setCurrentUserSchoolId(-1, sid,DBMS.HS_OLTP_DATASOURCE_NAME);
            fail("no exception when user id < 0");
        } catch (Exception e) {
        }

        try {
            us.isCurrentUserSchoolId(uid, -1,DBMS.HS_OLTP_DATASOURCE_NAME);
            fail("no exception when school id < 0");
        } catch (Exception e) {
        }

        try {
            us.isCurrentUserSchoolId(-1, sid,DBMS.HS_OLTP_DATASOURCE_NAME);
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
        u.createUser(uid, handle, 'A',DBMS.HS_OLTP_DATASOURCE_NAME);
        long sid = s.createSchool(DBMS.HS_OLTP_DATASOURCE_NAME,DBMS.HS_OLTP_DATASOURCE_NAME);

        us.createUserSchool(uid, sid,DBMS.HS_OLTP_DATASOURCE_NAME);
        us.removeUserSchool(uid, sid,DBMS.HS_OLTP_DATASOURCE_NAME);

        try {
            us.setCurrentUserSchoolId(uid, sid,DBMS.HS_OLTP_DATASOURCE_NAME);
            fail("no exception after relationship removed");
        } catch (Exception e) {
        }

        try {
            us.isCurrentUserSchoolId(uid, sid,DBMS.HS_OLTP_DATASOURCE_NAME);
            fail("no exception after relationship removed");
        } catch (Exception e) {
        }
    }
}