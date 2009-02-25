/**
 * 
 */
package com.topcoder.web.ejb.userservices;

import java.rmi.RemoteException;

import javax.ejb.CreateException;
import javax.naming.NamingException;

import com.topcoder.shared.ejb.ServiceLocatorSupport;
import com.topcoder.shared.util.ApplicationServer;

/**
 * A locator for the User Services EJB
 * 
 * @author Pablo
 */
public class UserServicesLocator {

    private static final ServiceLocatorSupport locator =
        new ServiceLocatorSupport(UserServices.class, 
            UserServicesHome.class, 
            UserServicesHome.EJB_REF_NAME, 
            ApplicationServer.USER_SERVICES_HOST_URL);

    public static UserServices getService() throws NamingException, RemoteException, CreateException {
        return (UserServices) locator.getService();
    }

}
