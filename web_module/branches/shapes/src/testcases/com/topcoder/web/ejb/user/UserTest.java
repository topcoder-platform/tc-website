package com.topcoder.web.ejb.user;

import junit.framework.*;

import com.topcoder.web.ejb.EJBTestCase;
import com.topcoder.security.admin.PrincipalMgrRemoteHome;
import com.topcoder.security.admin.PrincipalMgrRemote;
import com.topcoder.security.TCSubject;
import com.topcoder.security.UserPrincipal;
import com.topcoder.security.GeneralSecurityException;
import com.topcoder.shared.util.TCContext;
import com.topcoder.shared.util.DBMS;

import javax.ejb.CreateException;
import javax.naming.Context;
import javax.naming.NamingException;
import java.rmi.RemoteException;

public class UserTest extends EJBTestCase {


    private static final String USER_HOME=UserHome.class.getName();

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
        String handle = createHandle() + "testCreateUser";

        long id = createSecurityUser(handle);

        u.createUser(id, createHandle(), 'A',DBMS.HS_OLTP_DATASOURCE_NAME);

        assertTrue(id >= 0);
        assertTrue(null == u.getFirstName(id,DBMS.HS_OLTP_DATASOURCE_NAME));
        assertTrue(null == u.getLastName(id,DBMS.HS_OLTP_DATASOURCE_NAME));
        assertEquals(0, u.getStatus(id,DBMS.HS_OLTP_DATASOURCE_NAME));
    }


    ////////////////////////////////////////////////////////////////////////////
    public void testFirstName() throws Exception {
    ////////////////////////////////////////////////////////////////////////////

        User u = getHandle();
        String handle = createHandle() + "testFirstName";

        long id = createSecurityUser(handle);


        u.createUser(id, createHandle(), 'A',DBMS.HS_OLTP_DATASOURCE_NAME);

        String name = "testUser";

        u.setFirstName(id, name,DBMS.HS_OLTP_DATASOURCE_NAME);
        assertEquals(name, u.getFirstName(id,DBMS.HS_OLTP_DATASOURCE_NAME));

        try {
            u.setFirstName(id, null,DBMS.HS_OLTP_DATASOURCE_NAME);
            fail("No exception thrown when set to null");
        } catch (Exception e) {
        }

        try {
            u.setFirstName(-1, name,DBMS.HS_OLTP_DATASOURCE_NAME);
            fail("No exception thrown when id < 0");
        } catch (Exception e) {
        }
    }


    ////////////////////////////////////////////////////////////////////////////
    public void testLastName() throws Exception {
    ////////////////////////////////////////////////////////////////////////////

        User u = getHandle();
        String handle = createHandle() + "testLastName";

        long id = createSecurityUser(handle);

        u.createUser(id, createHandle(), 'A',DBMS.HS_OLTP_DATASOURCE_NAME);

        String name = "testUser";

        u.setLastName(id, name,DBMS.HS_OLTP_DATASOURCE_NAME);
        assertEquals(name, u.getLastName(id,DBMS.HS_OLTP_DATASOURCE_NAME));

        try {
            u.setLastName(id, null,DBMS.HS_OLTP_DATASOURCE_NAME);
            fail("No exception thrown when set to null");
        } catch (Exception e) {
        }

        try {
            u.setLastName(-1, name,DBMS.HS_OLTP_DATASOURCE_NAME);
            fail("No exception thrown when id < 0");
        } catch (Exception e) {
        }
    }


    ////////////////////////////////////////////////////////////////////////////
    public void testUserStatusId() throws Exception {
    ////////////////////////////////////////////////////////////////////////////

        User u = getHandle();
        String handle = createHandle() + "testUserStatusId";

        long id = createSecurityUser(handle);

        u.createUser(id, createHandle(), 'A',DBMS.HS_OLTP_DATASOURCE_NAME);

        char status = 'A';

        u.setStatus(id, status,DBMS.HS_OLTP_DATASOURCE_NAME);
        assertEquals(status, u.getStatus(id,DBMS.HS_OLTP_DATASOURCE_NAME));


    }
}
