package com.topcoder.web.ejb.security;

import com.topcoder.shared.ejb.EJB3Locator;
import com.topcoder.shared.util.ApplicationServer;

/**
 * @author dok
 * @version $Id$
 *          Create Date: Feb 27, 2008
 */
public class AuthenticationServiceLocator extends EJB3Locator<Authentication> {
    public AuthenticationServiceLocator() {
        super(ApplicationServer.SECURITY_PROVIDER_URL, true);
    }
}
