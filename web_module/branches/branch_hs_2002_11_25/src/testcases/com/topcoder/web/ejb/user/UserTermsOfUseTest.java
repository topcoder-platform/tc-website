package com.topcoder.web.ejb.user;

import junit.framework.*;

import com.topcoder.web.ejb.EJBTestCase;
import com.topcoder.security.GeneralSecurityException;
import com.topcoder.security.TCSubject;
import com.topcoder.security.UserPrincipal;
import com.topcoder.security.admin.PrincipalMgrRemoteHome;
import com.topcoder.security.admin.PrincipalMgrRemote;
import com.topcoder.shared.util.TCContext;

import javax.ejb.CreateException;
import javax.naming.NamingException;
import javax.naming.Context;
import java.rmi.RemoteException;

public class UserTermsOfUseTest extends EJBTestCase {


    private static final String
            USER_TERMS_HOME=UserTermsOfUseHome.class.toString();


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

        TestSuite ts=new TestSuite("UserTermsOfUseTest");
        ts.addTestSuite(UserTermsOfUseTest.class);
        return(ts);
    }


    ////////////////////////////////////////////////////////////////////////////
    public UserTermsOfUseTest(String name) {
    ////////////////////////////////////////////////////////////////////////////

        super(name);
    }


    ////////////////////////////////////////////////////////////////////////////
    private UserTermsOfUse getHandle() throws Exception {
    ////////////////////////////////////////////////////////////////////////////

        return ((UserTermsOfUseHome) getContext().lookup(USER_TERMS_HOME)).create();
    }


    ////////////////////////////////////////////////////////////////////////////
    public void testCreateUserTermsOfUse() {
    ////////////////////////////////////////////////////////////////////////////

    }

    ////////////////////////////////////////////////////////////////////////////
    public void testRemoveUserTermsOfUse() {
    ////////////////////////////////////////////////////////////////////////////

    }
}