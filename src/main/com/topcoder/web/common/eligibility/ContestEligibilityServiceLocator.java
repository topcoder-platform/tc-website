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
 * <p>A simple locator for the Contest Eligibility Service EJB</p>
 *
 * @author pulky
 * @version 1.0 (Competition Registration Eligibility v1.0)
 */
public class ContestEligibilityServiceLocator extends EJB3Locator<ContestEligibilityService> {

    /**
     * The locator for the contest eligibility service
     */
    private static final ContestEligibilityServiceLocator locator = new ContestEligibilityServiceLocator();

    /**
     * Default constructor. It will delegate to super and will use configured values in <code>ApplicationServer</code>
     */
    public ContestEligibilityServiceLocator() {
        super(ApplicationServer.COCKPIT_PROVIDER_URL, ApplicationServer.CONTEST_ELIGIBILITY_SERVICES_JNDI_NAME);
    }

    /**
     * Retrieves the contest eligibility service service instance
     *
     * @return the contest eligibility service service instance
     *
     * @throws CreateException if any errors occur during creation
     * @throws NamingException if any errors occur during lookup
     * @throws RemoteException if any errors occur during remote invocation
     */
    public static ContestEligibilityService getServices() throws CreateException, NamingException, RemoteException {
        return locator.getService();
    }

}
