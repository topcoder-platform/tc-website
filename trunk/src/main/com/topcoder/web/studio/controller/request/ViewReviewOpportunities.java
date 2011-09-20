/*
 * Copyright (C) 2001 - 2010 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.studio.controller.request;

import java.util.Iterator;

import com.topcoder.shared.dataAccess.DataAccess;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer.ResultSetRow;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.BaseProcessor;
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
 * @author TCSDEVELOPER, isv, TCSASSEMBER
 * @version 1.1
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
     * A <code>String</code> constant that stores the review opportunities module name
     */
    protected static final String MODULE_NAME = "ViewReviewOpportunities";

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

        setNextPage(REVIEW_OPPORTUNITIES_JSP);
        setIsNextPageInContext(true);
    }
}
