package com.topcoder.web.ejb.security;

import com.topcoder.shared.ejb.EJB3Locator;
import com.topcoder.shared.util.ApplicationServer;

import javax.ejb.CreateException;
import javax.naming.NamingException;
import java.rmi.RemoteException;

/**
 * @author dok
 * @version $Id$
 *          Create Date: Feb 27, 2008
 */
public class AuthenticationServiceLocator extends EJB3Locator<Authentication> {


    private static final AuthenticationServiceLocator locator = new AuthenticationServiceLocator();

    private AuthenticationServiceLocator() {
        super(ApplicationServer.SECURITY_PROVIDER_URL, true);
    }

    public static Authentication getServices() throws CreateException, NamingException, RemoteException {
        return locator.getService();
    }

}