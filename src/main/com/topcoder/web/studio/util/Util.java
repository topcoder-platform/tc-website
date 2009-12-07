/*
 * Copyright (C) 2008 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.studio.util;

import com.topcoder.security.TCPrincipal;
import com.topcoder.security.TCSubject;
import com.topcoder.shared.dataAccess.DataAccess;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.SecurityHelper;
import com.topcoder.web.studio.Constants;

import java.util.Iterator;

/**
 * <p>A helper class providing various utility methods to be utilized throughout the application.</p>
 *
 * <p>
 *   Version 1.1 (BUGR-2890) Change notes:
 *   <ol>
 *     <li>
 *         Added a method to check cockpit permissions.
 *     </li>
 *   </ol>
 * </p>
 *
 * @author isv, pulky
 * @version 1.1
 * @since TopCoder Studio Modifications Assembly v2
 */
public class Util {

    /**
     * A <code>String</code> constant that stores the query name for the has_cockpit_permissions query
     *
     * @since 1.1
     */
    private static final String HAS_COCKPIT_PERMISSIONS_QUERY_NAME = "has_cockpit_permissions";

    /**
     * <p>Checks if the submission referenced by the specified ID has been already purchased.</p>
     *
     * @param submissionId a <code>String</code> providing the ID of a submission to get the payment status for.
     * @return <code>true</code> if specified submission has been purchased already; <code>false</code> otherwise.
     * @throws Exception if an unexpected error occurs.
     */
    public static boolean isSubmissionPurchased(String submissionId) throws Exception {
        DataAccess da = new DataAccess(DBMS.STUDIO_DATASOURCE_NAME);
        Request r = new Request();
        r.setContentHandle("submission_payment");
        r.setProperty(Constants.SUBMISSION_ID, submissionId);
        ResultSetContainer result = da.getData(r).get("submission_payment");
        if (!result.isEmpty()) {
            ResultSetContainer.ResultSetRow row = result.getRow(0);
            Object paymentStatusId = row.getItem("payment_status_id").getResultData();
            if (paymentStatusId != null) {
                // The submission is considered purchased if it's payment status is Paid
                if (String.valueOf(paymentStatusId).equals("1")) {
                    return true;
                }
            }
        }
        return false;
    }


    /**
     * <p>Checks if the user has cockpit permissions over the specified contest.</p>
     *
     * @param userId the user id to query
     * @param contestId the user id to query
     * @return <code>true</code> if  the user has cockpit permissions over the specified contest, false otherwise
     * @throws Exception if an unexpected error occurs.
     * 
     * @since 1.1
     */
    public static boolean hasCockpitPermissions(long userId, long contestId) throws Exception {
        DataAccess da = new DataAccess(DBMS.STUDIO_DATASOURCE_NAME);
        Request r = new Request();
        r.setContentHandle(HAS_COCKPIT_PERMISSIONS_QUERY_NAME);
        r.setProperty(Constants.USER_ID, String.valueOf(userId));
        r.setProperty(Constants.CONTEST_ID, String.valueOf(contestId));
        ResultSetContainer result = da.getData(r).get(HAS_COCKPIT_PERMISSIONS_QUERY_NAME);
        if (!result.isEmpty()) {
            return true;
        }
        return false;
    }

    public static boolean isAdmin(long userId) throws Exception {
        TCSubject subject = SecurityHelper.getUserSubject(userId);
        boolean found = false;
        for (Iterator it = subject.getPrincipals().iterator(); it.hasNext() && !found;) {
            found = ((TCPrincipal) it.next()).getId() == Constants.CONTEST_ADMIN_ROLE_ID;
        }
        return found;
    }
}
