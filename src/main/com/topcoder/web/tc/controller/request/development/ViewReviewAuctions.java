/*
 * Copyright (C) 2012-2013 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc.controller.request.development;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.topcoder.management.review.application.ReviewAuction;
import com.topcoder.management.review.application.ReviewAuctionManager;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.common.error.RequestRateExceededException;
import com.topcoder.web.common.throttle.Throttle;

/**
 * <p>A controller to handle the requests for displaying the list of active review auctions of specified type. The
 * desired project type is expected to be provided as {@link Constants#PROJECT_TYPE_ID} request parameter.</p>
 *
 * <p>
 * Version 1.1 Change notes:
 *   <ol>
 *     <li>The payments for review auctions are calculated using <code>Project Payment Calculator</code> component.</li>
 *   </ol>
 * </p>
 *
 * @author isv
 * @version 1.1 (Review Application Integration assembly)
 */
public class ViewReviewAuctions extends ReviewAuctionDetails {

    /**
     * <p>Protects the page from throttling in a long term. Allows for no more than 300 requests per 3000 minutes, which
     * is 1 request per 10 minutes in average.</p>
     */
    private static final Throttle longThrottle = new Throttle(300, 300 * (10 * 60 * 1000));

    /**
     * <p>Constructs new <code>ViewReviewAuctions</code> instance. This implementation does nothing.</p>
     */
    public ViewReviewAuctions() {
    }

    /**
     * <p>Handles the request for displaying the list of active review projects of requested type provided as {@link
     * Constants#PROJECT_TYPE_ID} request parameter.</p>
     *
     * <p>Looks up for the list of active review auctions of requested project type, binds it to request and forwards to
     * the corresponding JSP depending on requested project type.</p>
     *
     * @throws TCWebException if an unexpected error occurs or if requested project type is not supported.
     */
    protected void developmentProcessing() throws TCWebException {
        String projectTypeId = StringUtils.checkNull(getRequest().getParameter(Constants.PROJECT_TYPE_ID));
        if (!isProjectTypeSupported(projectTypeId)) {
            throw new NavigationException("Invalid project type specified " + projectTypeId);
        }
        long projectCategoryId = Long.parseLong(projectTypeId);

        ReviewAuctionManager reviewAuctionManager = ReviewAuctionHelper.createReviewAuctionManager();

        String remoteAddr = request.getHeader("X-Forwarded-For");
        if(remoteAddr == null || remoteAddr.trim().length()==0) {
            remoteAddr = request.getRemoteAddr();
        }

        try {
            if (longThrottle.throttle(remoteAddr) {
                throw new RequestRateExceededException(getRequest().getSession().getId(), getUser().getUserName());
            }
            
            // **** Process contest review auctions ****
            
            // Get the list of open contest review auctions for selected project category
            List<ReviewAuction> contestReviewAuctions 
                = retrieveReviewAuctions(reviewAuctionManager, ReviewAuctionHelper.CONTEST_REVIEW_AUCTION_CATEGORY_ID,
                                         projectCategoryId, "contestReviewAuctions", 
                                         "review_auction_projects", "contestReviewAuctionProjectsMap");
           
            // Calculate the reviewer payments for contest review auctions as maximum payment for one of the reviewer 
            // roles
            Map<Long, Float> contestReviewPrices = new HashMap<Long, Float>();
            for (ReviewAuction reviewAuction : contestReviewAuctions) {
                Map<Long, Float> auctionRolePayments = ReviewAuctionHelper.calculateReviewPayments(reviewAuction);
                contestReviewPrices.put(reviewAuction.getId(), getMaximumPayment(auctionRolePayments));
            }
            getRequest().setAttribute("contestReviewPrices", contestReviewPrices);

            // **** Process iterative review auctions ****
            
            // Get the list of open iterative review auctions for selected project category
            List<ReviewAuction> iterativeReviewAuctions 
                = retrieveReviewAuctions(reviewAuctionManager, ReviewAuctionHelper.ITERATIVE_REVIEW_AUCTION_CATEGORY_ID,
                                         projectCategoryId, "iterativeReviewAuctions", 
                                         "iterative_review_auction_projects", "iterativeReviewAuctionProjectsMap");
           
            // Calculate the reviewer payments for iterative review auctions as maximum payment for one of the reviewer 
            // roles
            Map<Long, Float> iterativeReviewPrices = new HashMap<Long, Float>();
            for (ReviewAuction reviewAuction : iterativeReviewAuctions) {
                Map<Long, Float> auctionRolePayments = ReviewAuctionHelper.calculateReviewPayments(reviewAuction);
                iterativeReviewPrices.put(reviewAuction.getId(), getMaximumPayment(auctionRolePayments));
            }
            getRequest().setAttribute("iterativeReviewPrices", iterativeReviewPrices);

            // **** Process specification review auctions ****
            
            // Get the list of open specification review auctions for selected project category
            List<ReviewAuction> specReviewAuctions
                = retrieveReviewAuctions(reviewAuctionManager, ReviewAuctionHelper.SPEC_REVIEW_AUCTION_CATEGORY_ID,
                                         projectCategoryId, "specReviewAuctions",
                                         "spec_review_auction_projects", "specReviewAuctionProjectsMap");

            // Calculate the reviewer payments for specification review auctions
            Map<Long, Float> specReviewPrices = new HashMap<Long, Float>();
            for (ReviewAuction specReviewAuction : specReviewAuctions) {
                Map<Long, Float> auctionRolePayments = ReviewAuctionHelper.calculateReviewPayments(specReviewAuction);
                specReviewPrices.put(specReviewAuction.getId(), getMaximumPayment(auctionRolePayments));
            }
            getRequest().setAttribute("specReviewPrices", specReviewPrices);
        } catch (TCWebException e) {
            throw e;
        } catch (Exception e) {
            throw new TCWebException(e);
        }
        setNextPage(Constants.UNIFIED_REVIEW_PROJECTS_PAGE);
        setIsNextPageInContext(true);
    }

    /**
     * <p>Builds the mapping from the IDs of projects to row from the result set. </p>
     * 
     * @param reviewAuctionProjects a <code>ResultSetContainer</code> providing the result set. 
     * @return a <code>Map</code> mapping the project IDs to row with project data. 
     */
    private Map<Long, ResultSetContainer.ResultSetRow> buildProjectDataLookupMap(
        ResultSetContainer reviewAuctionProjects) {
        Map<Long, ResultSetContainer.ResultSetRow> reviewAuctionProjectsMap 
            = new HashMap<Long, ResultSetContainer.ResultSetRow>();
        for (ResultSetContainer.ResultSetRow reviewAuctionProjectRow : reviewAuctionProjects) {
            long projectId = reviewAuctionProjectRow.getLongItem("project_id");
            reviewAuctionProjectsMap.put(projectId, reviewAuctionProjectRow);
        }
        return reviewAuctionProjectsMap;
    }

    /**
     * <p>Gets the maximum value of payments for specified review application roles.</p>
     * 
     * @param auctionRolePayments a <code>Map</code> mapping the review application role IDs to payment for such role. 
     * @return a <code>float</code> providing the maximum payment among the specified roles. 
     */
    private float getMaximumPayment(Map<Long, Float> auctionRolePayments) {
        float max = 0;
        for (Float payment : auctionRolePayments.values()) {
            if (payment > max) {
                max = payment;
            }
        }
        return max;
    }

    /**
     * <p>Gets the list of review auctions and binds supporting data to request.</p>
     * 
     * @param reviewAuctionManager a <code>ReviewAuctionManager</code> to be used for accessing the review auctions. 
     * @param reviewAuctionCategoryId a <code>long</code> referencing the review auctions category.
     * @param projectCategoryId a <code>long</code> referencing the category for projects.
     * @param reviewAuctionsAttrName a <code>String</code> providing the name of request attribute to bind auctions to.
     * @param reviewAuctionProjectsQuery a <code>String</code> providing the name of the query to be executed for 
     *                                   getting the data for projects.
     * @param reviewAuctionProjectsMapAttrName a <code>String</code> providing the name of request attribute to bind the
     *                                         mapping from auctions to projects.
     * @return a <code>List</code> or review auctions. 
     * @throws Exception if an unexpected error occurs.
     */
    private List<ReviewAuction> retrieveReviewAuctions(ReviewAuctionManager reviewAuctionManager,
                                                       long reviewAuctionCategoryId, long projectCategoryId, 
                                                       String reviewAuctionsAttrName, 
                                                       String reviewAuctionProjectsQuery, 
                                                       String reviewAuctionProjectsMapAttrName)
        throws Exception {
        List<ReviewAuction> reviewAuctions =
            reviewAuctionManager.searchOpenAuctions(reviewAuctionCategoryId,
                                                    Arrays.asList(projectCategoryId));
        getRequest().setAttribute(reviewAuctionsAttrName, reviewAuctions);

        // Retrieve additional data for projects associated with review auctions 
        ResultSetContainer reviewAuctionProjects
            = ReviewAuctionHelper.getReviewAuctionProjectsData(getDataAccess(), reviewAuctions,
                                                               reviewAuctionProjectsQuery);

        // Convert projects data for review auctions to map for faster lookup
        Map<Long, ResultSetContainer.ResultSetRow> reviewAuctionProjectsMap =
            buildProjectDataLookupMap(reviewAuctionProjects);
        getRequest().setAttribute(reviewAuctionProjectsMapAttrName, reviewAuctionProjectsMap);

        return reviewAuctions;
    }
}
