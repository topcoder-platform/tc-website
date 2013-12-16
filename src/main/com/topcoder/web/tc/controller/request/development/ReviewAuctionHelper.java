/*
 * Copyright (C) 2012-2013 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc.controller.request.development;

import com.topcoder.management.payment.calculator.ProjectPaymentCalculator;
import com.topcoder.management.payment.calculator.ProjectPaymentCalculatorException;
import com.topcoder.management.payment.calculator.impl.ProjectPaymentAdjustmentCalculator;
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
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.model.comp.Project;
import com.topcoder.web.tc.Constants;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 * <p>A helper class providing some utility methods to be used for review application functionalities.</p>
 *
 * <p>
 * Version 1.1 ( Assembly 1.0) Change notes:
 *   <ol>
 *     <li>Replaced <code>calculateContestReviewPayment</code> and <code>calculateReviewAssignmentPayments</code>
 *     methods with {@link #calculateReviewPayments(ReviewAuction)} method.</li>
 *   </ol>
 * </p>
 * 
 * @author isv
 * @version 1.1 (Review Application Integration assembly)
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
     * <p>A <code>long</code> providing the ID for review auction category for iterative reviews.</p>
     */
    static final long ITERATIVE_REVIEW_AUCTION_CATEGORY_ID = 3;

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
     * <p>A <code>ProjectPaymentCalculator</code> to be used for calculating the payments for reviewer roles for desired
     * projects.</p>
     */
    private static final ProjectPaymentCalculator projectPaymentCalculator = createProjectPaymentCalculator();

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
     * <p>Calculates the payment for contest review for specified review application role.</p>
     *
     * @return a <code>float</code> providing the payment for the specified role.
     * @throws ProjectPaymentCalculatorException if an unexpected error occurs while calculating project payments.
     */
    static Map<Long, Float> calculateReviewPayments(ReviewAuction reviewAuction) 
            throws ProjectPaymentCalculatorException {
        // Combine the unique set of IDs for resource roles associated with all review application roles for specified
        // review auction
        Set<Long> resourceRoleIds = new HashSet<Long>();
        List<ReviewApplicationRole> reviewApplicationRoles = reviewAuction.getAuctionType().getApplicationRoles();
        for (ReviewApplicationRole role : reviewApplicationRoles) {
            for (ReviewApplicationResourceRole resourceRole : role.getResourceRoles()) {
                resourceRoleIds.add(resourceRole.getResourceRoleId());
            }
        }

        // Get the ID of a project associated with the specified review auction
        long projectId = reviewAuction.getProjectId();

        // Get the payments for specified project  per resource roles and combine them into resulting map per 
        // review application roles
        Map<Long, BigDecimal> payments 
                = projectPaymentCalculator.getDefaultPayments(projectId, new ArrayList<Long>(resourceRoleIds));
        
        Map<Long, Float> result = new HashMap<Long, Float>();
        for (ReviewApplicationRole role : reviewApplicationRoles) {
            float rolePaymentAmount = 0;
            for (ReviewApplicationResourceRole resourceRole : role.getResourceRoles()) {
                if (payments.containsKey(resourceRole.getResourceRoleId())) {
                    rolePaymentAmount += payments.get(resourceRole.getResourceRoleId()).floatValue();
                }
            }
            result.put(role.getId(), rolePaymentAmount);
        }

        return result;
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

    /**
     * <p>Creates new instance of calculator for the project payments based on the available application configuration.
     * </p>
     * 
     * @return a <code>ProjectPaymentCalculator</code> to be used for calculating the payments for reviewer roles for
     *         desired projects. 
     */
    static ProjectPaymentCalculator createProjectPaymentCalculator() {
        try {
            Class clazz = Class.forName(Constants.PROJECT_PAYMENT_CALCULATOR_CLASS_NAME);
            ProjectPaymentCalculator calculator = (ProjectPaymentCalculator) clazz.newInstance();
            return calculator;
        } catch (Exception e) {
            throw new IllegalArgumentException("Failed to instantiate the project payment calculator of type: " 
                    + Constants.PROJECT_PAYMENT_CALCULATOR_CLASS_NAME, e);
        }
    }
}
