/*
 * Copyright (C) 2001 - 2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.studio.controller.request;

import java.util.HashSet;
import java.util.Set;

import com.topcoder.web.common.model.Address;
import com.topcoder.web.common.model.Country;
import com.topcoder.web.common.model.User;
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
     * Checks whether the user with the specified country can register contest.
     *
     * @return true if the user with the specified country can register contest, false otherwise.
     */
    private static boolean isEligibleCountry(Country country) {
        Set<String> ineligibleCountries = new HashSet<String>();
        ineligibleCountries.add("Iran");
        ineligibleCountries.add("North Korea");
        ineligibleCountries.add("Cuba");
        ineligibleCountries.add("Sudan");
        ineligibleCountries.add("Syria");
        return !ineligibleCountries.contains(country.getName());
    }
    
    /**
     * This method will check if member's country is eligible.
     *
     * @param user the user to check
     * @return true if the user can register contest, false otherwise.
     */
    protected static boolean checkMemberCountry(User user) throws Exception {
        if (user != null) {
            Set<Address> addresses = user.getAddresses();
            if (addresses != null) {
                for (Address address : addresses) {
                    Country country = address.getCountry();
                    if (country != null && !isEligibleCountry(country)) {
                        return false;
                    }
                }
            }
        }
        return true;
    }
}
