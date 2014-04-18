/*
 * Copyright (C) 2008-2013 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.studio.util;

import java.util.Iterator;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import com.topcoder.web.studio.dto.ProjectPhase;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.topcoder.security.TCPrincipal;
import com.topcoder.security.TCSubject;
import com.topcoder.security.groups.model.ResourceType;
import com.topcoder.security.groups.services.AuthorizationService;
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
 * <p>
 * Version 1.5 (Topcoder Security Groups Backend - Studio Permissions Propagation) change notes:
 *   <ol>
 *     <li>Added constants {@link #AUTHORIZATION_SERVICE_NAME} and {@link #DIRECT_PROJECT_AND_CLIENT_FOR_CONTEST_QUERY_NAME}.</li>
 *     <li>Updated {@link #hasCockpitPermissions(HttpServletRequest, long, long)} method to handle the
 *     new security group logic.</li>
 *   </ol>
 * </p>
 * 
 * <p>
 * Version 1.6 (TC Cockpit - Studio - Final Fixes Integration Part Two Assembly) Change notes:
 *   <ol>
 *     <li>Added {@link #getWinnerUserId(long)} method.</li>
 *     <li>Added {@link #showFinalFixTab(HttpServletRequest, Project, long)} method.</li>
 *   </ol>
 * </p>
 *
 * <p>
 * Version 1.7 Change notes:
 *   <ol>
 *     <li>Updated {@link #showFinalFixTab(HttpServletRequest, Project, long)} method to follow the logic as for viewing
 *     submissions.</li>
 *   </ol>
 * </p>
 * 
 * @author isv, pulky, pvmagacho
 * @version 1.7
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
     * A <code>String</code> constant that stores the spring bean name for the authorization service.
     * 
     * @since 1.5
     */
    private static final String AUTHORIZATION_SERVICE_NAME = "authorizationService";

    /**
     * A <code>String</code> constant that stores the query name for the direct_project_and_client_for_contest query.
     * 
     * @since 1.5
     */
    private static final String DIRECT_PROJECT_AND_CLIENT_FOR_CONTEST_QUERY_NAME = "direct_project_and_client_for_contest";
    
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
     * @param request the HTTP request instance
     * @param userId the user id to query
     * @param contestId the user id to query
     * @return <code>true</code> if  the user has cockpit permissions over the specified contest, false otherwise
     * @throws Exception if an unexpected error occurs.
     * @since 1.1
     */
    public static boolean hasCockpitPermissions(HttpServletRequest request, long userId, long contestId) throws Exception {
        DataAccess da = new DataAccess(DBMS.TCS_OLTP_DATASOURCE_NAME);
        Request r = new Request();
        r.setContentHandle(HAS_COCKPIT_PERMISSIONS_QUERY_NAME);
        r.setProperty(Constants.USER_ID, String.valueOf(userId));
        r.setProperty(Constants.PROJECT_ID_KEY, String.valueOf(contestId));
        ResultSetContainer result = da.getData(r).get(HAS_COCKPIT_PERMISSIONS_QUERY_NAME);
        if (!result.isEmpty()) {
            return true;
        }
        
        r = new Request();
        r.setContentHandle(DIRECT_PROJECT_AND_CLIENT_FOR_CONTEST_QUERY_NAME);
        r.setProperty(Constants.PROJECT_ID_KEY, String.valueOf(contestId));
        result = da.getData(r).get(DIRECT_PROJECT_AND_CLIENT_FOR_CONTEST_QUERY_NAME);
        if (!result.isEmpty()) {
            AuthorizationService authorizationService = retrieveAuthorizationService(request);
            long tcDirectId = result.getLongItem(0, "tc_direct_id");
            if (result.getItem(0, "client_id").getResultData() != null) {
                long clientId = result.getLongItem(0, "client_id");
                if (authorizationService.isCustomerAdministrator(userId, clientId)) {
                    return true;
                }
            }
            if (authorizationService.checkAuthorization(userId, tcDirectId, ResourceType.PROJECT) != null) {
                return true;
            }
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
    
    public static boolean isTCStuff(long userId) throws Exception {
        TCSubject subject = SecurityHelper.getUserSubject(userId);
        boolean found = false;
        for (Iterator it = subject.getPrincipals().iterator(); it.hasNext() && !found;) {
            found = ((TCPrincipal) it.next()).getId() == Constants.TC_STUFF_ROLE_ID;
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
                    if (r.getRole().getId().equals(roleId)) {
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
    
    /**
     * <p>Gets the ID of a user who won the specified contest.</p>
     * 
     * @param contestId a <code>long</code> providing the ID of a contest to get winner for. 
     * @return a <code>Long</code> providing the ID of a user who won the specified contest or <code>null</code> if 
     *         there is no such winner.
     * @throws Exception if an unexpected error occurs.        
     * @since 1.6
     */
    public static Long getWinnerUserId(long contestId) throws Exception {
        DataAccess da = new DataAccess(DBMS.TCS_OLTP_DATASOURCE_NAME);
        Request r = new Request();
        r.setContentHandle("studio_winner");
        r.setProperty(Constants.CONTEST_ID, String.valueOf(contestId));
        ResultSetContainer result = da.getData(r).get("studio_winner");
        if (result.isEmpty()) {
            return null;
        } else {
            return result.get(0).getLongItem(0);
        }
    }

    /**
     * <p>Checks if the <code>Final Fix</code> tabs are to be shown on view page for the specified project when viewed
     * by the specified user. The <code>Final Fix</code> tabs are to be shown in case the specified contest is finished
     * and is viewable or if the current user is the winner of specified contest.</p>
     * 
     * @param project a <code>Project</code> providing the details for the project. 
     * @param currentUserId a <code>long</code> providing the ID of a current user.
     * @return <code>true</code> if <code>Final Fix</code> tabs are to be shown; <code>false</code> otherwise.
     * @throws Exception if an unexpected error occurs.
     * @since 1.6
     */
    public static boolean showFinalFixTab(HttpServletRequest request, Project project, long currentUserId) throws Exception {
        Long winnerUserId = getWinnerUserId(project.getId());
        if ((winnerUserId != null) && (winnerUserId == currentUserId)) {
            return true;
        } else if (hasCockpitPermissions(request, currentUserId, project.getId())) {
            return true;
        } else if (project.getViewableSubmissions()) {
            Set<ProjectPhase> phases = project.getPhases();
            boolean approvalClosed = false;
            for (ProjectPhase phase : phases) {
                if (phase.getType() == 11) { // Approval phase must be closed
                    if (phase.getStatusId() == 3) {
                        approvalClosed = true;
                        break;
                    }
                }
            }
            if (approvalClosed) {
                return true;
            }
        }

        return false;
    }
    
    /**
     * Get authorization service from spring.
     *
     * @param request the http servlet request
     * @return retrieved authorization service
     * @since 1.5
     */
    private static AuthorizationService retrieveAuthorizationService(HttpServletRequest request) {
        return (AuthorizationService) WebApplicationContextUtils.getWebApplicationContext(
                request.getSession().getServletContext()).getBean(AUTHORIZATION_SERVICE_NAME);
    }
}
