/*
 * Copyright (C) 2012 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc.controller.request.development;

import com.topcoder.management.review.application.BaseLookupEntity;
import com.topcoder.management.review.application.ReviewApplication;
import com.topcoder.management.review.application.ReviewApplicationManager;
import com.topcoder.management.review.application.ReviewApplicationManagerException;
import com.topcoder.management.review.application.ReviewApplicationResourceRole;
import com.topcoder.management.review.application.ReviewApplicationRole;
import com.topcoder.management.review.application.ReviewAuction;
import com.topcoder.management.review.application.ReviewAuctionManager;
import com.topcoder.management.review.application.impl.ReviewApplicationManagerImpl;
import com.topcoder.management.review.application.impl.ReviewAuctionManagerImpl;
import com.topcoder.management.review.application.search.ReviewApplicationFilterBuilder;
import com.topcoder.search.builder.filter.AndFilter;
import com.topcoder.search.builder.filter.Filter;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.model.DefaultPriceComponent;
import com.topcoder.web.common.model.comp.Project;
import com.topcoder.web.tc.Constants;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

/**
 * <p>A helper class providing some utility methods to be used for review application functionalities.</p>
 * 
 * @author isv
 * @version 1.0 (Review Application Integration assembly)
 */
class ReviewAuctionHelper {

    /**
     * <p>A <code>long</code> providing the ID for review auction category for contest reviews.</p>
     */
    static final long CONTEST_REVIEW_AUCTION_CATEGORY_ID = 1;

    /**
     * <p>A <code>long</code> providing the ID for review auction category for specification reviews.</p>
     */
    static final long SPEC_REVIEW_AUCTION_CATEGORY_ID = 2;

    /**
     * <p>A <code>long</code> providing the ID for <code>Pending</code> review application status.</p>
     */
    static final long PENDING_APPLICATION_ROLE_STATUS_ID = 1;

    /**
     * <p>A <code>long</code> providing the ID for <code>Cancelled</code> review application status.</p>
     */
    static final long CANCELLED_APPLICATION_ROLE_STATUS_ID = 2;

    /**
     * <p>A <code>ReviewAuctionManager</code> to be used for accessing review auctions data.</p>
     */
    private static final ReviewAuctionManager reviewAuctionManager = new ReviewAuctionManagerImpl();

    /**
     * <p>A <code>ReviewApplicationManager</code> to be used for accessing review applications data.</p>
     */
    private static final ReviewApplicationManager reviewApplicationManager = new ReviewApplicationManagerImpl();

    /**
     * <p>Constructs new <code>ReviewAuctionHelper</code> instance. This implementation does nothing.</p>
     */
    private ReviewAuctionHelper() {
    }

    /**
     * <p>Gets the manager for the review auctions.</p>
     *
     * @return a <code>ReviewAuctionManager</code> to be used for accessing review auctions data.
     */
    static ReviewAuctionManager createReviewAuctionManager() {
        return reviewAuctionManager;
    }

    /**
     * <p>Gets the manager for the review applications.</p>
     *
     * @return a <code>ReviewApplicationManager</code> to be used for accessing review applications data.
     */
    static ReviewApplicationManager createReviewApplicationManager() {
        return reviewApplicationManager;
    }

    /**
     * <p>Gets the project matching the specified ID.</p>
     * 
     * @param projectId an <code>int</code> providing the ID of a project.
     * @return a <code>Project</code> providing details for the project or <code>null</code> if such a project is not
     *         found.
     */
    static Project getProject(int projectId) {
        return DAOUtil.getFactory().getProjectDAO().find(projectId);
    }

    /**
     * <p>Calculates the payments per review application roles for specified review auction.</p>
     * 
     * @param dataAccess a <code>DataAccess</code> providing access to database. 
     * @param reviewAuction a <code>ReviewAuction</code> providing details for review auction. 
     * @return a <code>Map</code> mapping the IDs for review application roles to payments.
     * @throws Exception if an unexpected error occurs.
     */
    static Map<Long, Float> calculateReviewAssignmentPayments(DataAccessInt dataAccess, ReviewAuction reviewAuction)
        throws Exception {
        // Get basic details for project associated with review auction
        Project project = getProject((int) reviewAuction.getProjectId());
        if (project == null) {
            throw new TCWebException("Project for review auction is not found: " + reviewAuction.getProjectId());
        }
        int phaseId = project.getCategoryId() + (int) Constants.GENERAL_PHASE_OFFSET;

        // For contest reviews retrieve additional data to be used for payment calculation
        boolean isSpecReview
            = reviewAuction.getAuctionType().getAuctionCategory().getId() == SPEC_REVIEW_AUCTION_CATEGORY_ID;
        ResultSetContainer reviewAuctionProjectsData = null;
        if (!isSpecReview) {
            reviewAuctionProjectsData = getReviewAuctionProjectsData(dataAccess, Arrays.asList(reviewAuction), 
                                                                     "review_auction_projects");
        }

        // Iterate over all review assignment roles and calculate the  
        Map<Long, Float> prices = new TreeMap<Long, Float>();
        List<ReviewApplicationRole> reviewApplicationRoles = reviewAuction.getAuctionType().getApplicationRoles();
        for (ReviewApplicationRole role : reviewApplicationRoles) {
            float rolePayment;
            if (isSpecReview) {
                // For specification review
                DefaultPriceComponent price = new DefaultPriceComponent(0, 0, 0, phaseId, 0, 0);
                rolePayment = price.getSpecReviewCost();
            } else {
                // For contest reviews
                rolePayment = calculateContestReviewPayment(reviewAuctionProjectsData.getRow(0), phaseId, role);
            }
            prices.put(role.getId(), rolePayment);
        }
        return prices;
    }

    /**
     * <p>Calculates the payment for contest review for specified review application role.</p>
     * 
     * @param reviewAuctionProjectRow a <code>ResultSetRow</code> providing the data from the result set.  
     * @param phaseId an <code>int</code> providing the phase ID.
     * @param role a <code>ReviewApplicationRole</code> providing the details for review application role. 
     * @return a <code>float</code> providing the payment for the specified role. 
     */
    static float calculateContestReviewPayment(ResultSetContainer.ResultSetRow reviewAuctionProjectRow, int phaseId, 
                                               ReviewApplicationRole role ) {
        int submissionCount = reviewAuctionProjectRow.getIntItem("submission_count");
        int submissionPassedScreeningCount
            = reviewAuctionProjectRow.getIntItem("submission_passed_screening_count");
        if (submissionCount == 0) {
            submissionCount = 1;
            submissionPassedScreeningCount = 1;
        }
        float prize = reviewAuctionProjectRow.getFloatItem("prize");

        DefaultPriceComponent price = new DefaultPriceComponent(0, submissionCount, submissionPassedScreeningCount, 
                                                                phaseId, prize, 0);

        float sum = 0;
        List<ReviewApplicationResourceRole> resourceRoles = role.getResourceRoles();
        for (ReviewApplicationResourceRole resourceRole : resourceRoles) {
            long resourceRoleId = resourceRole.getResourceRoleId();
            if (resourceRoleId == 2) { // Primary Screener
                sum += price.getScreeningCost();
            } else if (resourceRoleId >= 4 && resourceRoleId <= 7) { // Reviewer, Stress/Failure/Accuracy Reviewer
                sum += price.getReviewCost();
            } else if (resourceRoleId == 8) { // Aggregator
                sum += price.getAggregationCost();
            } else if (resourceRoleId == 9) { // Final Reviewer
                sum += price.getFinalReviewCost();
            } else if (resourceRoleId == 19) { // Milestone Screener
                sum += price.getMilestoneScreeningCost();
            }
        }
        return sum;
    }

    /**
     * <p>Gets the data for projects associated with the specified review auctions. Uses specified 
     * <code>DataAccessInt</code> for running the specified query for getting the desired data.</p>
     *
     * @param dataAccess a <code>DataAccess</code> providing access to database. 
     * @param reviewAuctions a <code>List</code> of review auctions.
     * @param queryName a <code>String</code> providing the name of the query to be executed for data retrieval.
     * @return a <code>String</code> providing the comma-separated list of IDs of projects associated with the specified
     *         review auctions.
     * @throws Exception if an unexpected error occurs.
     */
    static ResultSetContainer getReviewAuctionProjectsData(DataAccessInt dataAccess, List<ReviewAuction> reviewAuctions, 
                                                           String queryName)
        throws Exception {
        if (!reviewAuctions.isEmpty()) {
            String reviewAuctionProjectIdsList = concatenateReviewAuctionProjectIds(reviewAuctions);
            Request r = new Request();
            r.setContentHandle(queryName);
            r.setProperty("pids", reviewAuctionProjectIdsList);
            return dataAccess.getData(r).get(queryName);
        } else {
            return new ResultSetContainer();
        }
    }

    /**
     * <p>Builds the comma-separated list of IDs of projects for specified review auctions.</p>
     *
     * @param reviewAuctions a <code>List</code> of review auctions.
     * @return a <code>String</code> providing the comma-separated list of IDs of projects associated with the specified
     *         review auctions.
     */
    static String concatenateReviewAuctionProjectIds(List<ReviewAuction> reviewAuctions) {
        StringBuilder reviewAuctionProjectIdsList = new StringBuilder();
        for (ReviewAuction reviewAuction : reviewAuctions) {
            if (reviewAuctionProjectIdsList.length() > 0) {
                reviewAuctionProjectIdsList.append(",");
            }
            reviewAuctionProjectIdsList.append(reviewAuction.getProjectId());
        }
        return reviewAuctionProjectIdsList.toString();
    }

    /**
     * <p>Builds the mapping from the IDs to entities from the specified list.</p>
     * 
     * @param list a <code>List</code> providing the entities. 
     * @return a <code>Map</code> mapping entity IDs to entities. 
     */
    static <K extends BaseLookupEntity> Map<Long, K> buildLookupMap(List<K> list) {
        Map<Long, K> result = new HashMap<Long, K>();
        for (K entity : list) {
            result.put(entity.getId(), entity);
        }
        return result;
    }

    /**
     * <p>Gets the list of pending review applications for specified user for specified review auction.</p>
     * 
     * @param userId a <code>long</code> providing the ID of a user.
     * @param reviewAuctionId a <code>long</code> providing the ID of a review auction.
     * @return a <code>List</code> listing the pending  
     * @throws ReviewApplicationManagerException if an unexpected error occurs.
     */
    static List<ReviewApplication> getPendingReviewApplications(long userId, long reviewAuctionId) 
        throws ReviewApplicationManagerException {
        Filter userIdFilter = ReviewApplicationFilterBuilder.createUserIdFilter(userId);
        Filter pendingStatusIdFilter = ReviewApplicationFilterBuilder.createApplicationStatusIdFilter(
            ReviewAuctionHelper.PENDING_APPLICATION_ROLE_STATUS_ID);
        Filter auctionIdFilter = ReviewApplicationFilterBuilder.createAuctionIdFilter(reviewAuctionId);
        Filter filter = new AndFilter(Arrays.asList(userIdFilter, auctionIdFilter, pendingStatusIdFilter));
        return createReviewApplicationManager().searchApplications(filter);
    }
}
