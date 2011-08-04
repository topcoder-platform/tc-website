/*
 * Copyright (C) 2001 - 2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.studio.controller.request;

import java.rmi.RemoteException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.ejb.CreateException;
import javax.naming.NamingException;

import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.TCRequest;
import com.topcoder.web.common.model.User;
import com.topcoder.web.ejb.project.ProjectRoleTermsOfUse;
import com.topcoder.web.ejb.project.ProjectRoleTermsOfUseLocator;
import com.topcoder.web.ejb.termsofuse.TermsOfUse;
import com.topcoder.web.ejb.termsofuse.TermsOfUseEntity;
import com.topcoder.web.ejb.termsofuse.TermsOfUseLocator;
import com.topcoder.web.ejb.user.UserTermsOfUse;
import com.topcoder.web.ejb.user.UserTermsOfUseLocator;
import com.topcoder.web.studio.Constants;
import com.topcoder.web.studio.dto.Project;
import com.topcoder.web.studio.dto.Resource;
import com.topcoder.web.studio.dto.ResourceInfo;
import com.topcoder.web.studio.dto.ResourceRole;

/**
 * <p>This helper class provides common functionality among registration processors.</p>
 *
 * <p>
 *   Version 1.0 (Configurable Contest Terms-Studio Release Assembly v1.0) Change notes:
 *   <ol>
 *     <li>Added generic terms of use processing.</li>
 *   </ol>
 * </p>
 *
 * <p>
 * Version 1.1 (Re-platforming Studio Release 2 Assembly 1.0) Change notes:
 *   <ol>
 *     <li>Refactored <code>processTermsOfUse</code> method to accept contest ID instead of contest as parameter.</li>
 *     <li>Added {@link #getSubmitterResource(Project, long)} method.</li>
 *   </ol>
 * </p>
 *
 * <p>
 * Version 1.2 (Re-platforming Studio Release 4 Assembly 1.0) Change notes:
 *   <ol>
 *     <li>Re-factored the logic for terms processing.</li>
 *   </ol>
 * </p>
 *
 * <p>
 * Version 1.3 (Replatforming Studio Release 5) change notes:
 *   <ol>
 *     <li>Using the dto classes in com.topcoder.web.studio.dto package instead of in com.topcoder.web.common.model.comp package.</li>
 *   </ol>
 * </p>
 * 
 * @author pulky, isv, TCSDEVELOPER
 * @version 1.3
 * @since Configurable Contest Terms-Studio Release Assembly v1.0
 */
public class RegistrationHelper {

    /**
     * An <code>Integer[]</code> containing resource role ids for a submitter.
     */
    protected static final Integer[] REGISTRANT_ROLE_IDS = new Integer[] {ResourceRole.SUBMITTER_RESOURCE_ROLE_ID};

    /**
     * <p>This helper method provides terms of use processing for Studio contest registration requests.</p>
     *
     * <p>The code will go through all necessary terms of use for this particular contest and resource roles and
     * verify the user has already agreed to them. If it finds a terms of use the user has not agreed to yet, it will
     * add it to the request so that it is presented as corresponds. If all terms of use are correct, the list is
     * added to the request so it can showed in the confirmation page before actual registration.</p>
     *
     * <p>Note: Even though Studio will only use Submitter role for now, it's likely to change in the future to
     * support reviewer registration or any other kind of resources so it's important to prepare for that change.
     * This is why this method accepts an array of roles and not just a single role id.</p>
     *
     *
     * @param request the request being processed
     * @param contestId contest ID
     * @param user the user applying to this contest
     * @param roleIds an array of role ids corresponding to the user
     * @throws IllegalArgumentException if any of the arguments is null (including contest.id) or roleIds is empty
     * @return true if there are pending terms of use to agree to.
     * @throws CreateException if an unexpected error occurs.
     * @throws NamingException if an unexpected error occurs.
     * @throws RemoteException if an unexpected error occurs.
     */
    protected static boolean processTermsOfUse(TCRequest request, Long contestId, User user, Integer[] roleIds)
        throws CreateException, NamingException, RemoteException {
        if (request == null) {
            throw new IllegalArgumentException("request cannot be null");
        }

        if (contestId == null) {
            throw new IllegalArgumentException("contest.id cannot be null");
        }

        if (user == null) {
            throw new IllegalArgumentException("user cannot be null");
        }

        if (roleIds == null || roleIds.length == 0) {
            throw new IllegalArgumentException("roleIds cannot be null or empty");
        }

        int[] roleIdsInt = new int[roleIds.length];
        for (int i = 0; i < roleIdsInt.length; i++) {
            roleIdsInt[i] = roleIds[i];
        }

        // validate the user has agreed to the necessary terms of use
        List<TermsOfUseEntity> pendingTermsOfUse = getPendingTermsOfUse(roleIdsInt, contestId.intValue(),
                                                                        user.getId());
        if (!pendingTermsOfUse.isEmpty()) {
            request.setAttribute(Constants.TERMS, pendingTermsOfUse.get(0));
            return true;
        }

        // the user agreed to all necessary terms
        request.setAttribute(Constants.TERMS_AGREED, getNecessaryTermsOfUseEntities(roleIdsInt,
                                                                                    contestId.intValue()));
        return false;
    }
    
    /**
     * <p>Looks up for the resource of <code>Submitter</code> role associated with specified user in context of
     * specified project.</p>
     * 
     * @param project a <code>Project</code> providing the details for project. 
     * @param userId a <code>long</code> providing the ID of a user.
     * @return a <code>Resource</code> of submitter role within specified project for specified user or
     *         <code>null</code> if specified user is not registered as submitter for specified project.
     * @since 1.1
     */
    protected static Resource getSubmitterResource(Project project, long userId) {
        return getResource(project, userId, ResourceRole.SUBMITTER_RESOURCE_ROLE_ID);
    }
    
    /**
     * <p>Looks up for the resource of <code>Specification Reviewer</code> role associated with specified user in context of
     * specified project.</p>
     * 
     * @param project a <code>Project</code> providing the details for project. 
     * @param userId a <code>long</code> providing the ID of a user.
     * @return a <code>Resource</code> of specification reviewer role within specified project for specified user or
     *         <code>null</code> if specified user is not registered as specification reviewer for specified project.
     * @since 1.1
     */
    protected static Resource getSpecReviewerResource(Project project, long userId) {
        return getResource(project, userId, ResourceRole.SPEC_REVIEWER_RESOURCE_ROLE_ID);
    }
    
     /**
     * <p>Looks up for the resource of passed role associated with specified user in context of
     * specified project.</p>
     * 
     * @param project a <code>Project</code> providing the details for project. 
     * @param userId a <code>long</code> providing the ID of a user.
     * @param roleId a <code>Integer</code> providing id of role to lookup
     * @return a <code>Resource</code> with passed role id within specified project for specified user or
     *         <code>null</code> if specified user is not registered as submitter for specified project.
     * @since 1.1
     */
    private static Resource getResource(Project project, long userId, Integer roleId) {
        Set<Resource> resources = project.getResources();
        for (Resource resource : resources){
            if (resource.getRole().getId().intValue() == roleId.intValue()) {
                Set<ResourceInfo> infos = resource.getInfo();
                for (ResourceInfo info : infos) {
                    if (info.getId().getTypeId() == 1) {
                        if (String.valueOf(userId).equals(info.getValue())) {
                            return resource;
                        }
                    }
                }
            }
        }
        return null;
    }

    /**
     * <p>Gets the terms of use which are to be accepted by the specified user for accessing the specified project with
     * specified roles.</p>
     * 
     * @param roleIds an <code>int</code> array listing the IDs of roles.
     * @param projectId an <code>int</code> providing the project ID. 
     * @param userId a <code>long</code> providing the user ID.
     * @return a <code>List</code> listing the pending terms of use. 
     * @throws CreateException if an unexpected error occurs.
     * @throws NamingException if an unexpected error occurs.
     * @throws RemoteException if an unexpected error occurs.
     */
    protected static List<TermsOfUseEntity> getPendingTermsOfUse(int[] roleIds, int projectId, long userId)
        throws CreateException, NamingException, RemoteException {
        UserTermsOfUse userTermsOfUse = UserTermsOfUseLocator.getService();
        TermsOfUse termsOfUse = TermsOfUseLocator.getService();
        List<Long>[] necessaryTerms = getNecessaryTermsOfUse(roleIds, projectId);
        List<TermsOfUseEntity> termsPending = new ArrayList<TermsOfUseEntity>();
        
        for (int i = 0; i < necessaryTerms.length; i++) {
            if (necessaryTerms[i] != null) {
                for (int j = 0; j < necessaryTerms[i].size(); j++) {
                    Long termsId = necessaryTerms[i].get(j);
                    System.out.println("ISV : terms of use : " + termsId);
                    if (!userTermsOfUse.hasTermsOfUse(userId, termsId, DBMS.COMMON_OLTP_DATASOURCE_NAME)) {
                        TermsOfUseEntity terms =  termsOfUse.getEntity(termsId, DBMS.COMMON_OLTP_DATASOURCE_NAME);
                        termsPending.add(terms);
                    }
                }
            }
        }
        
        return termsPending;
    }

    /**
     * <p>Gets the list of necessary terms of use for specified roles to access the specified project.</p>
     *  
     * @param roleIds an <code>int</code> array listing the IDs of roles.
     * @param projectId an <code>int</code> providing the project ID. 
     * @return a <code>List</code> of IDs of terms of use grouped by roles. 
     * @throws NamingException if an unexpected error occurs.
     * @throws RemoteException if an unexpected error occurs.
     * @throws CreateException if an unexpected error occurs.
     * @since 1.2
     */
    private static List<Long>[] getNecessaryTermsOfUse(int[] roleIds, int projectId)
        throws NamingException, RemoteException, CreateException {
        ProjectRoleTermsOfUse projectRoleTermsOfUse = ProjectRoleTermsOfUseLocator.getService();
        return projectRoleTermsOfUse.getTermsOfUse(projectId, roleIds, DBMS.COMMON_OLTP_DATASOURCE_NAME);
    }

    /**
     * <p>Gets the list of necessary terms of use entities for specified roles to access the specified project.</p>
     *  
     * @param roleIds an <code>int</code> array listing the IDs of roles.
     * @param projectId an <code>int</code> providing the project ID. 
     * @return a <code>List</code> of IDs of terms of use grouped by roles. 
     * @throws NamingException if an unexpected error occurs.
     * @throws RemoteException if an unexpected error occurs.
     * @throws CreateException if an unexpected error occurs.
     * @since 1.2
     */
    private static List<TermsOfUseEntity> getNecessaryTermsOfUseEntities(int[] roleIds, int projectId)
        throws NamingException, RemoteException, CreateException {
        Set<Long> collectedTermsOfUseIds = new HashSet<Long>();
        List<Long>[] termsIds = getNecessaryTermsOfUse(roleIds, projectId);
        TermsOfUse termsOfUseService = TermsOfUseLocator.getService();
        List<TermsOfUseEntity> terms = new ArrayList<TermsOfUseEntity>();
        if (termsIds != null) {
            for (List<Long> termsOdUseIds : termsIds) {
                if (termsOdUseIds != null) {
                    for (Long termId : termsOdUseIds) {
                        if (!collectedTermsOfUseIds.contains(termId)) {
                            terms.add(termsOfUseService.getEntity(termId, DBMS.COMMON_OLTP_DATASOURCE_NAME));
                            collectedTermsOfUseIds.add(termId);
                        }
                    }
                }
            }
        }
        return terms;
    }
}
