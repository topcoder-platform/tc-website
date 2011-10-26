/*
 * Copyright (C) 2004 - 2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.utilities.pacts;

import javax.naming.InitialContext;
import javax.rmi.PortableRemoteObject;

import com.topcoder.shared.util.TCContext;
import com.topcoder.shared.util.sql.DBUtility;
import com.topcoder.web.ejb.pacts.PactsClientServices;
import com.topcoder.web.ejb.pacts.PactsClientServicesHome;
import com.topcoder.web.tc.controller.legacy.pacts.common.PactsConstants;

/**
 * Utility class for expiring old payments, affidavits, assignment documents
 * and canceling payments of banned members.
 *
 * @author VolodymyrK
 * @version 1.0
 */
public class ExpireOldAffidavitsAndPayments extends DBUtility {

    /**
     * This method will be executed after connections are created.
     *
     * @throws Exception if any error occurs.
     */
    protected void runUtility() throws Exception {
        PactsClientServices  ejb = (PactsClientServices) createEJB();

        try {
            int n = ejb.expireOldAffidavits();
            log.info(n + " affidavits expired");
            	
            n = ejb.expireOldPayments();
            log.info(n + " payments expired");
                
            n = ejb.expireOldAssignmentDocuments();
            log.info(n + " assignment documents expired");
                
            n = ejb.checkInactiveCoders(0);
            log.info(n + " inactive coders were checked and related payments were notified");
                
            } catch (Exception e) {
                log.error(e.getMessage());
            }
    }

    /**
     * Private helper method to retrieve PACTS EJB.
     *
     * @return a <code>PactsClientServices</code> with PACTS EJB.
     * @throws Exception if any error occurs
     */
    private static PactsClientServices createEJB() throws Exception {
        InitialContext initial = TCContext.getInitial();

        Object objref = initial.lookup(PactsClientServicesHome.class.getName());
        PactsClientServicesHome home = (PactsClientServicesHome)
            PortableRemoteObject.narrow(objref, PactsClientServicesHome.class);

        return ((PactsClientServices) home.create());
    }

    /**
     * This method processes and validates the parameters.
     */
    protected void processParams() {
        super.processParams();
    }

    /**
     * This method shows usage of the ExpireOldAffidavitsAndPayments utility.
     *
     * @param msg The error message.
     */
    protected void setUsageError(String msg) {
        sErrorMsg.setLength(0);
        sErrorMsg.append(msg + "\n");
        sErrorMsg.append("ExpireOldAffidavitsAndPayments:\n");
        sErrorMsg.append("   No specific parameters required to run this utility.");
        fatal_error();
    }
}
