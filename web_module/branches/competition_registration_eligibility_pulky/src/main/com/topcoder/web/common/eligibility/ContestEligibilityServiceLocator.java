/*
 * Copyright (c) 2001-2009 TopCoder Inc.  All Rights Reserved.
 */
package com.topcoder.web.common.eligibility;

import java.rmi.RemoteException;

import javax.ejb.CreateException;
import javax.naming.NamingException;

import com.topcoder.service.contest.eligibilityvalidation.ContestEligibilityService;
import com.topcoder.shared.ejb.EJB3Locator;
import com.topcoder.shared.util.ApplicationServer;

/**
 * Copyright (c) 2001-2009 TopCoder, Inc. All rights reserved.
 * Only for use in connection with a TopCoder competition.
 *
 * @author pulky
 * @version $Id$
 * Create Date: Oct 24, 2009
 */
public class ContestEligibilityServiceLocator extends EJB3Locator<ContestEligibilityService> {
    private static final ContestEligibilityServiceLocator locator = new ContestEligibilityServiceLocator();

    public ContestEligibilityServiceLocator() {
        super(ApplicationServer.COCKPIT_PROVIDER_URL, ApplicationServer.CONTEST_ELIGIBILITY_SERVICES_JNDI_NAME);
    }

    public static ContestEligibilityService getServices() throws CreateException, NamingException, RemoteException {
        return locator.getService();
    }

}
