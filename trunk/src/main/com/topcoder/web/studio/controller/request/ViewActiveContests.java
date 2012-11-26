/*
 * Copyright (C) 2005-2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.studio.controller.request;

import com.topcoder.shared.dataAccess.DataAccess;
import com.topcoder.shared.dataAccess.DataAccessConstants;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.studio.Constants;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

/**
 * <p>A controller for servicing the requests for viewing <code>Active Contests</code> page for <code>Studio</code> 
 * website.</p>
 *
 * <p>
 * Version 1.1 (Replatforming Studio Release 1 Assembly 1.0) Change notes:
 *   <ol>
 *     <li>Updated the {@link #businessProcessing()} method to set the request with list of contests which have 
 *     eligibility constraints and flags indicating if current user is granted permission to access those contests or
 *     not.</li>
 *   </ol>
 * </p>
 *
 * <p>
 * Version 1.2 (TopCoder Studio Contest Listings Assembly) Change notes:
 *   <ol>
 *     <li>Added the logic to support multi-column sorting.</li>
 *   </ol>
 * </p>
 *
 * @author dok, isv, duxiaoyang
 * @version 1.2
 */
public class ViewActiveContests extends BaseProcessor {

    /**
     * Represents the default sort priority. It is a list containing column numbers.
     */
    private static final List<Integer> DEFAULT_SORT_PRIORITY = new LinkedList<Integer>();

    /**
     * Represents the default sort direction. It is a map with column number as key and a boolean indicating whether the
     * column is in ascending order as value.
     */
    private static final Map<Integer, Boolean> DEFAULT_SORT_DIRECTION = new HashMap<Integer, Boolean>();

    /**
     * <p>
     * Static initializer. It initializes default sort priority and direction.
     * </p>
     */
    static {
        DEFAULT_SORT_PRIORITY.add(1);          // name
        DEFAULT_SORT_DIRECTION.put(1, true);
        DEFAULT_SORT_PRIORITY.add(3);          // type_name
        DEFAULT_SORT_DIRECTION.put(3, true);
        DEFAULT_SORT_PRIORITY.add(4);          // start_time
        DEFAULT_SORT_DIRECTION.put(4, false);
        DEFAULT_SORT_PRIORITY.add(14);         // milestone_date
        DEFAULT_SORT_DIRECTION.put(14, true);
        DEFAULT_SORT_PRIORITY.add(5);          // end_time
        DEFAULT_SORT_DIRECTION.put(5, true);
        DEFAULT_SORT_PRIORITY.add(12);         // prize_total
        DEFAULT_SORT_DIRECTION.put(12, true);
        DEFAULT_SORT_PRIORITY.add(13);         // dr_points
        DEFAULT_SORT_DIRECTION.put(13, true);
        DEFAULT_SORT_PRIORITY.add(11);         // registrants
        DEFAULT_SORT_DIRECTION.put(11, true);
        DEFAULT_SORT_PRIORITY.add(7);          // submission_count
        DEFAULT_SORT_DIRECTION.put(7, true);
        DEFAULT_SORT_PRIORITY.add(9);          // is_user_registered
        DEFAULT_SORT_DIRECTION.put(9, true);
    }

    /**
     * <p>Implements the logic for processing the request.</p>
     * 
     * @throws Exception if an unexpected error occurs.
     */
    protected void businessProcessing() throws Exception {
        long userId = getUser().getId();
        
        //load up the contests
        DataAccess da = new DataAccess(DBMS.TCS_OLTP_DATASOURCE_NAME);
        Request r = new Request();
        r.setContentHandle("studio_active_contests_multi_sort");
        r.setProperty("uid", String.valueOf(userId));

        String col = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.SORT_COLUMN));
        String order = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.SORT_DIRECTION));
        if (col.trim().length() == 0) {
            col = "4";
        }
        if (order.trim().length() == 0) {
            order = "desc";
        }

        List<Integer> sortPriority = new ArrayList<Integer>(DEFAULT_SORT_PRIORITY);
        Map<Integer, Boolean> sortDirection = new HashMap<Integer, Boolean>(DEFAULT_SORT_DIRECTION);
        if (!"".equals(col)) {
            if (getRequest().getParameter(SortingHelper.SORTING_CRITERIA_KEY) != null) {
                SortingHelper.parseSortingParameter(
                        (String) getRequest().getParameter(SortingHelper.SORTING_CRITERIA_KEY), sortPriority,
                        sortDirection);
            }
            order = SortingHelper.changeSortingOrder(sortPriority, sortDirection, Integer.parseInt(col), order);
        }

        String sortCriteria = SortingHelper.getSortingClause(sortPriority, sortDirection);
        r.setProperty(Constants.USER_ID, String.valueOf(getUser().getId()));
        r.setProperty(SortingHelper.MULTI_SORTING_KEY, sortCriteria);
        r.setProperty(DataAccessConstants.SORT_QUERY, "studio_active_contests_multi_sort");

        ResultSetContainer contestsContainer = da.getData(r).get("studio_active_contests_multi_sort");
        getRequest().setAttribute("contests", contestsContainer);
        getRequest().setAttribute("sortColumn", col);
        getRequest().setAttribute("sortDirection", order.equals("asc") ? "desc" : "asc");
        getRequest().setAttribute(SortingHelper.SORTING_CRITERIA_KEY, sortCriteria);

        /*Map<Long, Boolean> eligibilityCheckResults 
            = EligibilityServiceHelper.checkContestsEligibility(contestsContainer, getLoggedInUser().getId());
        getRequest().setAttribute("eligibility", eligibilityCheckResults);*/

        setNextPage("/activeContests.jsp");
        setIsNextPageInContext(true);
    }
}
