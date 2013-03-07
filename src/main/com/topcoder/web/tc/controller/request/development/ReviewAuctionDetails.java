/*
 * Copyright (C) 2012-2013 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc.controller.request.development;

import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.topcoder.management.review.application.ReviewApplication;
import com.topcoder.management.review.application.ReviewApplicationManager;
import com.topcoder.management.review.application.ReviewApplicationRole;
import com.topcoder.management.review.application.ReviewAuction;
import com.topcoder.management.review.application.ReviewAuctionManager;
import com.topcoder.management.review.application.search.ReviewApplicationFilterBuilder;
import com.topcoder.search.builder.filter.Filter;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.security.ClassResource;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.model.comp.Project;
import com.topcoder.web.tc.Constants;

/**
 * <p>A controller to handle the requests for displaying the details for the requested review auction.
 * The desired auction ID is expected to be provided as {@link Constants#REVIEW_AUCTION_ID} request parameter.</p>
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
public class ReviewAuctionDetails extends Base {

    /**
     * <p>Constructs new <code>ReviewAuctionDetails</code> instance. This implementation does nothing.</p>
     */
    public ReviewAuctionDetails() {
    }

    /**
     * <p>Handles the request for displaying the details for requested review auction. The ID of requested review 
     * auction is expected to be provided as {@link Constants#REVIEW_AUCTION_ID} request parameter.</p>
     *
     * @throws TCWebException if an unexpected error occurs or if requested project type is not supported.
     */
    protected void developmentProcessing() throws TCWebException {
        if (!userIdentified()) {
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));
        }
        try {
            // Parse review auction ID from the request
            String reviewAuctionIdParam = StringUtils.checkNull(getRequest().getParameter(Constants.REVIEW_AUCTION_ID));
            long reviewAuctionId = Long.parseLong(reviewAuctionIdParam);
            
            // Get details for review auction 
            ReviewAuctionManager reviewAuctionManager = ReviewAuctionHelper.createReviewAuctionManager();
            ReviewAuction reviewAuction = reviewAuctionManager.getAuction(reviewAuctionId);
            if (reviewAuction == null) {
                throw new NavigationException("Invalid review auction specified " + reviewAuctionIdParam);
            }
            getRequest().setAttribute("reviewAuction", reviewAuction);
            
            // Get details for project related to requested review auction
            long projectId = reviewAuction.getProjectId();
            Project project = ReviewAuctionHelper.getProject((int) projectId);
            long projectTypeId = project.getCategoryId();
            getRequest().setAttribute("projectType", projectTypeId);

            // Check eligibility constraints (if any)
            if (checkEligibilityConstraints(projectId, new ClassResource(this.getClass())) != 0) {
                throw new NavigationException("Could not find project information.");
            }

            // Get review details for project associated with the requested auction
            boolean isSpecificationReview = reviewAuction.getAuctionType().getAuctionCategory().getId()
                    == ReviewAuctionHelper.SPEC_REVIEW_AUCTION_CATEGORY_ID; 
            if (isSpecificationReview) {
                retrieveSpecReviewProjectDetail(projectId);
            } else {
                retrieveReviewProjectDetail(projectId, projectTypeId);
            }
            getRequest().setAttribute("isSpecificationReview", isSpecificationReview);
            
            // Get the list of reviewers already registered to auction
            ReviewApplicationManager reviewApplicationManager = ReviewAuctionHelper.createReviewApplicationManager();
            Filter auctionIdFilter = ReviewApplicationFilterBuilder.createAuctionIdFilter(reviewAuctionId);
            List<ReviewApplication> reviewApplications = reviewApplicationManager.searchApplications(auctionIdFilter);
            Collections.sort(reviewApplications, new Comparator<ReviewApplication>() {
                public int compare(ReviewApplication o1, ReviewApplication o2) {
                    Date date1 = o1.getCreateDate();
                    Date date2 = o2.getCreateDate();
                    return date1.compareTo(date2);
                }
            });
            getRequest().setAttribute("reviewApplications", reviewApplications);
            
            // Build the map for review application roles for the auction for faster lookup by JSP
            Map<Long, ReviewApplicationRole> roles = new HashMap<Long, ReviewApplicationRole>();
            List<ReviewApplicationRole> applicationRoles = reviewAuction.getAuctionType().getApplicationRoles();
            for (ReviewApplicationRole role : applicationRoles) {
                roles.put(role.getId(), role);
            }
            getRequest().setAttribute("reviewApplicationRoles", roles);
            
            // Get the payments for each review application role for review auction
            Map<Long, Float> reviewApplicationRolePayments = ReviewAuctionHelper.calculateReviewPayments(reviewAuction);
            getRequest().setAttribute("reviewApplicationRolePayments", reviewApplicationRolePayments);
            
            // Get the list of pending review applications for requested auction fr current user
            List<ReviewApplication> pendingReviewApplications =
                ReviewAuctionHelper.getPendingReviewApplications(getUser().getId(), reviewAuctionId);
            getRequest().setAttribute("currentPendingReviewApplications", pendingReviewApplications);

            // Forward to view
            setNextPage(Constants.UNIFIED_REVIEW_PROJECT_DETAIL_PAGE);
            setIsNextPageInContext(true);
        } catch (TCWebException e) {
            throw e;
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }

    /**
     * <p>Looks up for the details of requested review project, binds it to request.</p>
     *
     * @param projectId     project id to look for.
     * @param projectTypeId identifier of the type of project
     * @throws TCWebException if an unexpected error occurs.
     */
    private void retrieveReviewProjectDetail(long projectId, long projectTypeId)
        throws TCWebException {
        try {
            Request r = new Request();
            if (projectTypeId == Constants.BUG_HUNT_PROJECT_TYPE) {
                r.setContentHandle("bug_hunt_review_project_detail");
            } else {
                r.setContentHandle("review_project_detail");
            }
            r.setProperty(Constants.PROJECT_ID, String.valueOf(projectId));

            Map results = getDataAccess().getData(r);
            ResultSetContainer detail;

            if (projectTypeId == Constants.BUG_HUNT_PROJECT_TYPE) {
                detail = (ResultSetContainer) results.get("bug_hunt_review_project_detail");
            } else {
                detail = (ResultSetContainer) results.get("review_project_detail");
            }
            getRequest().setAttribute("projectDetail", detail);

            getRequest().setAttribute("specReviewExtensionNeeded", false);
            getRequest().setAttribute("screeningExtensionNeeded",
                                      detail.getBooleanItem(0, "screening_extension_needed"));
            getRequest()
                .setAttribute("reviewExtensionNeeded", detail.getBooleanItem(0, "review_extension_needed"));

            // Check if each relevant phase exists, and insert that information into the request.
            checkAllPhaseExistence(detail);

        } catch (TCWebException e) {
            throw e;
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }

    /**
     * <p>Looks up for the details of requested spec review project, binds it to request.</p>
     *
     * @param projectId project id to look for.
     * @throws TCWebException if an unexpected error occurs
     */
    @SuppressWarnings("unchecked")
    private void retrieveSpecReviewProjectDetail(long projectId) throws TCWebException {
        try {
            Request r = new Request();
            r.setContentHandle("spec_review_project_detail");
            r.setProperty(Constants.PROJECT_ID, String.valueOf(projectId));

            Map results = getDataAccess().getData(r);
            ResultSetContainer detail = (ResultSetContainer) results.get("spec_review_project_detail");
            if (detail.isEmpty()) {
                throw new NavigationException("Could not find information on the project selected.");
            }

            getRequest().setAttribute("projectDetail", detail);

            getRequest().setAttribute("specReviewExtensionNeeded",
                                      detail.getBooleanItem(0, "spec_review_extension_needed"));
            getRequest().setAttribute("screeningExtensionNeeded", false);
            getRequest().setAttribute("reviewExtensionNeeded", false);

            // Check if each relevant phase exists, and insert that information into the request.
            checkAllPhaseExistence(detail);
        } catch (TCWebException e) {
            throw e;
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }

    /**
     * <p>Checks the presence of various phases for project timeline.</p>
     * 
     * @param detail a <code>ResultSetContainer</code> providing the result set data. 
     */
    private void checkAllPhaseExistence(ResultSetContainer detail) {
        // Setting any of these to FALSE will now prevent the phase in question from showing in the view.  The
        // easiest way to achieve this is to modify the query to return an empty string for the phase's submission
        // start.
        getRequest()
            .setAttribute("hasSpecificationSubmission", checkPhaseExistence(detail, "specification_submission_start"));
        getRequest().setAttribute("hasSpecificationReview", checkPhaseExistence(detail, "specification_review_start"));
        getRequest().setAttribute("hasSubmission", checkPhaseExistence(detail, "submission_start"));
        getRequest().setAttribute("hasScreening", checkPhaseExistence(detail, "screening_start"));
        getRequest().setAttribute("hasReview", checkPhaseExistence(detail, "review_start"));
        getRequest().setAttribute("hasAppeals", checkPhaseExistence(detail, "appeals_start"));
        getRequest().setAttribute("hasAggregation", checkPhaseExistence(detail, "aggregation_start"));
        getRequest().setAttribute("hasAggregationReview", checkPhaseExistence(detail, "agg_review_start"));
        getRequest().setAttribute("hasFinalFixes", checkPhaseExistence(detail, "final_fix_start"));
        getRequest().setAttribute("hasFinalReview", checkPhaseExistence(detail, "final_review_start"));
    }

    /**
     * <p>Checks the presence of various phases for project timeline.</p>
     *
     * @param rsc a <code>ResultSetContainer</code> providing the result set data.
     * @param columnName a <code>String</code> providing the name of the column from result set to get data from.
     * @return <code>true</code> if specified column has non-empty or non-null value; <code>false</code> otherwise.
     */
    private Boolean checkPhaseExistence(ResultSetContainer rsc, String columnName) {
        if (!rsc.isValidColumn(columnName)) {
            return Boolean.FALSE;
        }

        String columnValue = rsc.getStringItem(0, columnName);
        if (columnValue == null || columnValue.trim().equals("")) {
            return Boolean.FALSE;
        } else {
            return Boolean.TRUE;
        }
    }
}
