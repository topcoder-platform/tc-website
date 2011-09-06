/*
 * Copyright (C) 2010 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.studio.controller.request;

import com.topcoder.service.contest.eligibilityvalidation.ContestEligibilityService;
import com.topcoder.service.contest.eligibilityvalidation.ContestEligibilityValidatorException;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.web.common.eligibility.ContestEligibilityServiceLocator;

import javax.ejb.CreateException;
import javax.naming.NamingException;
import java.rmi.RemoteException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 * <p>A helper class providing utility methods for calling eligibility services.</p>
 * 
 * @author isv
 * @version 1.0 (Replatforming Studio Release 1 Assembly)
 */
public class EligibilityServiceHelper {

    /**
     * <p>Constructs new <code>EligibilityServiceHelper</code> instance. This implementation does nothing.</p>
     */
    private EligibilityServiceHelper() {
    }

    /**
     * <p>Checks if specified user is eligible or not to access the contests listed by the specified result set.</p>
     * 
     * @param data a <code>ResultSetContainer</code> providing the data for desired contests retrieved from database. 
     * @param userId a <code>long</code> providing the ID of user.
     * @return a <code>Map</code> mapping the contest IDs to flags indicating whether the specified user is eligible to
     *         access respective contest or not.
     * @throws CreateException if an unexpected error occurs.
     * @throws NamingException if an unexpected error occurs.
     * @throws RemoteException if an unexpected error occurs.
     * @throws ContestEligibilityValidatorException if an unexpected error occurs.
     */
    public static Map<Long, Boolean> checkContestsEligibility(ResultSetContainer data, long userId)
        throws CreateException, NamingException, RemoteException, ContestEligibilityValidatorException {
        // Get the list of contests with eligibility constraints
        List<Long> contestIds = new ArrayList<Long>();
        for (ResultSetContainer.ResultSetRow row : data) {
            long contestId = row.getLongItem("contest_id");
            contestIds.add(contestId);
        }

        ContestEligibilityService eligibilityService = ContestEligibilityServiceLocator.getServices();
        Set<Long> contestsWithEligibilityConstraints 
            = eligibilityService.haveEligibility(contestIds.toArray(new Long[contestIds.size()]), false);

        // Determine which contests the user is eligible to see
        Map<Long, Boolean> eligibleContestIds = new HashMap<Long, Boolean>();
        for (ResultSetContainer.ResultSetRow row : data) {
            long contestId = row.getLongItem("contest_id");
            boolean eligible = row.getBooleanItem("user_resource_exists");
            eligible = eligible || row.getBooleanItem("user_is_contest_author"); 
            eligible = eligible || !contestsWithEligibilityConstraints.contains(contestId);
            eligible = eligible || eligibilityService.isEligible(userId, contestId, false);
            eligibleContestIds.put(contestId, eligible);
        }
        return eligibleContestIds;
    }
}
