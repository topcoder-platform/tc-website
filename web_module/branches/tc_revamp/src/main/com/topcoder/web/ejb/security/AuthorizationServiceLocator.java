package com.topcoder.web.ejb.security;

import com.topcoder.shared.ejb.EJB3Locator;
import com.topcoder.shared.util.ApplicationServer;

import javax.ejb.CreateException;
import javax.naming.NamingException;
import java.rmi.RemoteException;

/**
 * @author dok
 * @version $Id: AuthorizationServiceLocator.java 68750 2008-02-28 18:34:01Z gpaul $
 *          Create Date: Feb 28, 2008
 */
public class AuthorizationServiceLocator extends EJB3Locator<Authorization> {


    private static final AuthorizationServiceLocator locator = new AuthorizationServiceLocator();

    private AuthorizationServiceLocator() {
        super(ApplicationServer.SECURITY_PROVIDER_URL);
    }

    public static Authorization getServices() throws CreateException, NamingException, RemoteException {
        return locator.getService();
    }

}