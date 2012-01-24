/*
 * Copyright (C) 2001 - 2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.studio.controller.request;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import com.topcoder.shared.dataAccess.DataAccess;
import com.topcoder.shared.dataAccess.DataAccessConstants;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer.ResultSetRow;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.model.StudioConstantReviewerPaymentCalculator;

/**
 * <p>This class will process a view review opportunities request.</p>
 *
 * <p>This processor will use Query Tool to retrieve from the database Studio contests specification reviews.</p>
 *
 * <p>
 * Version 1.0.1 (Replatforming Studii Release 1 Assembly 1.0) Change notes:
 *   <ol>
 *     <li>Updated the {@link #businessProcessing()} to use TCS_CATALOG datasource.</li>
 *   </ol>
 * </p>
 *
 * <p>
 * Version 1.1 (Replatforming Studio Release 5) change notes:
 *   <ol>
 *     <li>Updated {@link #businessProcessing()} method to use <code>StudioConstantReviewerPaymentCalculator</code> to
 *     calculate reviewer payment.</li>
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
 * @author TCSDEVELOPER, isv, TCSASSEMBER, duxiaoyang
 * @version 1.2
 * @since Studio Release Assembly - Spec Review Sign up page v1.0
 */
public class ViewReviewOpportunities extends BaseProcessor {

    /**
     * A <code>String</code> constant that stores the review opportunities jsp file path
     */
    private static final String REVIEW_OPPORTUNITIES_JSP = "/reviewOpportunities.jsp";

    /**
     * A <code>String</code> constant that stores the query name for the review_opportunities query
     */
    private static final String REVIEW_OPPORTUNITIES_QUERY_NAME = "studio_review_opportunities";

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
     * A <code>String</code> constant that stores the review opportunities module name
     */
    protected static final String MODULE_NAME = "ViewReviewOpportunities";

    /**
     * <p>
     * Static initializer. It initializes default sort priority and direction.
     * </p>
     */
    static {
        DEFAULT_SORT_PRIORITY.add(8);          // review_type
        DEFAULT_SORT_DIRECTION.put(8, true);
        DEFAULT_SORT_PRIORITY.add(2);          // name
        DEFAULT_SORT_DIRECTION.put(2, true);
        DEFAULT_SORT_PRIORITY.add(7);          // sort_start_time
        DEFAULT_SORT_DIRECTION.put(7, true);
        DEFAULT_SORT_PRIORITY.add(10);          // reviewer_handle
        DEFAULT_SORT_DIRECTION.put(10, true);
    }

    /**
     * This method executes the actual business logic for this processor.
     *
     * @throws Exception if any error occurs
     * @see com.topcoder.web.common.BaseProcessor#businessProcessing()
     */
    protected void businessProcessing() throws Exception {
        DataAccess da = new DataAccess(DBMS.TCS_OLTP_DATASOURCE_NAME);
        Request r = new Request();
        r.setContentHandle(REVIEW_OPPORTUNITIES_QUERY_NAME);

        String col = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.SORT_COLUMN));
        String order = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.SORT_DIRECTION));

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
        r.setProperty(SortingHelper.MULTI_SORTING_KEY, sortCriteria);
        r.setProperty(DataAccessConstants.SORT_QUERY, REVIEW_OPPORTUNITIES_QUERY_NAME);

        ResultSetContainer reviews = da.getData(r).get(REVIEW_OPPORTUNITIES_QUERY_NAME);
        Iterator<ResultSetRow> iterator = reviews.iterator();
        float[] payments = new float[reviews.size()];
        int index = 0;
        while (iterator.hasNext()) {
            ResultSetRow row = iterator.next();
            String reviewType = row.getStringItem("review_type").trim();
            int projectCategory = row.getIntItem("project_category_id");
            StudioConstantReviewerPaymentCalculator paymentCalculator = new StudioConstantReviewerPaymentCalculator(projectCategory);
            float payment = 0.0f;
            if ("Screening".equalsIgnoreCase(reviewType)) {
                payment += paymentCalculator.getScreeningCost();
                if (row.getTimestampItem("milestone_screening_start_time") != null) {
                    // multi round
                    payment += paymentCalculator.getMilestoneScreeningCost();
                }
            } else if ("Spec Review".equalsIgnoreCase(reviewType)) {
                payment = paymentCalculator.getSpecReviewCost();
            }
            payments[index++] = payment;
        }
        
        getRequest().setAttribute("reviews", reviews);
        getRequest().setAttribute("payments", payments);
        getRequest().setAttribute("userLoggedIn", userLoggedIn());
        getRequest().setAttribute("sortColumn", col);
        getRequest().setAttribute("sortDirection", order.equals("asc") ? "desc" : "asc");
        getRequest().setAttribute(SortingHelper.SORTING_CRITERIA_KEY, sortCriteria);

        setNextPage(REVIEW_OPPORTUNITIES_JSP);
        setIsNextPageInContext(true);
    }
}
