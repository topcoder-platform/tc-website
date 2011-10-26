package com.topcoder.web.ejb.security;

import com.topcoder.shared.ejb.EJB3Locator;
import com.topcoder.shared.util.ApplicationServer;

import javax.ejb.CreateException;
import javax.naming.NamingException;
import java.rmi.RemoteException;

/**
 * @author dok
 * @version $Id: SSOServiceLocator.java 74078 2008-12-22 18:06:25Z dbelfer $
 *          Create Date: Feb 27, 2008
 */
public class SSOServiceLocator extends EJB3Locator<SSOService> {
    private static final SSOServiceLocator locator = new SSOServiceLocator();

    private SSOServiceLocator() {
        super(ApplicationServer.SECURITY_PROVIDER_URL);
    }
    
    public static SSOService getServices() throws CreateException, NamingException, RemoteException {
        return locator.getService();
    }

}