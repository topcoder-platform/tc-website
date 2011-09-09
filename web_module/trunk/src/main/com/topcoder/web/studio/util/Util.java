/*
 * Copyright (C) 2008-2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.studio.util;

import java.util.Iterator;
import java.util.List;

import com.topcoder.security.TCPrincipal;
import com.topcoder.security.TCSubject;
import com.topcoder.shared.dataAccess.DataAccess;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.SecurityHelper;
import com.topcoder.web.common.model.User;
import com.topcoder.web.studio.Constants;
import com.topcoder.web.studio.dto.Project;
import com.topcoder.web.studio.dto.Resource;
import com.topcoder.web.studio.dto.ResourceInfo;

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
 * <p>
 * Version 1.2 (Re-platforming Studio Release 2 Assembly) Change notes:
 *   <ol>
 *     <li>Updated {@link #hasCockpitPermissions(long, long)} method to run the query against <code>tcs_catalog</code>
 *     database instead of <code>studio_oltp</code> database.</li>
 *   </ol>
 * </p>
 * 
 * <p>
 * Version 1.3 (Re-platforming Studio Release 2 Assembly) Change notes:
 *   <ol>
 *     <li>Added {@link #createSubmissionFilePath(Project, User)} method. This method will return the file path to save submission
 *     files.</li>
 *   </ol>
 * </p>
 *
 * <p>
 * Version 1.4 (Replatforming Studio Release 5) change notes:
 *   <ol>
 *     <li>Using the dto classes in com.topcoder.web.studio.dto package instead of in com.topcoder.web.common.model.comp package.</li>
 *   </ol>
 * </p>
 *
 * @author isv, pulky, isv, pvmagacho, TCSASSEMBER
 * @version 1.4
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
     * @since 1.1
     */
    public static boolean hasCockpitPermissions(long userId, long contestId) throws Exception {
        DataAccess da = new DataAccess(DBMS.TCS_OLTP_DATASOURCE_NAME);
        Request r = new Request();
        r.setContentHandle(HAS_COCKPIT_PERMISSIONS_QUERY_NAME);
        r.setProperty(Constants.USER_ID, String.valueOf(userId));
        r.setProperty(Constants.PROJECT_ID_KEY, String.valueOf(contestId));
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
    
    /**
     * Check if passed user has role from list in given contest.
     * 
     * @param c contest to check.
     * @param roleIds roleIds to check.
     * @param userId userId to check.
     * @return true if user had passed role in contest. false otherwise.
     */
    public static boolean checkUserHasRole(Project c, int[] roleIds, long userId) {
        for (Resource r : c.getResources()) {
            boolean currentUser = false;
            for (ResourceInfo info : r.getInfo()) {
                if (info.getId().getTypeId() == 1 && String.valueOf(userId).equals(info.getValue())) {
                    currentUser = true;
                    break;
                }
            }
            if (currentUser) {
                for (Integer roleId : roleIds) {
                    if (r.getRole().getId() == roleId) {
                        return true;
                    }
                }            
            }
        }
        return false;
    }
    
    /**
     * <p>Create the file path to store the submission files.</p>
     * 
     * @param c the submission contest 
     * @param u the owner of the submission
     * @return the submission path
     * @since 1.3
     */
    public static String createSubmissionPath(Project c, User u) {
        StringBuffer buf = new StringBuffer(80);
        buf.append(Constants.ROOT_STORAGE_PATH);
        buf.append(System.getProperty("file.separator"));
        buf.append(Constants.SUBMISSIONS_DIRECTORY_NAME);
        buf.append(System.getProperty("file.separator"));
        buf.append(c.getId());
        buf.append(System.getProperty("file.separator"));
        buf.append(u.getHandle().toLowerCase());
        buf.append("_");
        buf.append(u.getId());
        buf.append(System.getProperty("file.separator"));

        return buf.toString();
    }
}
