/**
 * 
 */
package com.topcoder.web.ejb.userservices;

import com.topcoder.shared.ejb.ServiceLocatorSupport;
import com.topcoder.shared.util.ApplicationServer;
import com.topcoder.shared.util.logging.Logger;

/**
 * A locator for the User Services EJB
 * 
 * @author Pablo
 */
public class UserServicesLocator extends ServiceLocatorSupport {

    private static Logger log = Logger.getLogger(UserServicesBean.class);

    public UserServicesLocator() {
        this(UserServices.class, 
                UserServicesHome.class, 
                UserServicesHome.EJB_REF_NAME, 
                ApplicationServer.USER_SERVICES_HOST_URL);
    }

    public UserServicesLocator(Class interfaceClass, Class homeInterfaceClass,
            String jndiName, String contextURL) {
        super(interfaceClass, homeInterfaceClass, jndiName, contextURL);
    }
}
