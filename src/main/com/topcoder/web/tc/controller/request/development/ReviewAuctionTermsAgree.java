/*
 * Copyright (C) 2012 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc.controller.request.development;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.*;

import com.topcoder.management.review.application.ReviewApplication;
import com.topcoder.management.review.application.ReviewApplicationManager;
import com.topcoder.management.review.application.ReviewApplicationRole;
import com.topcoder.management.review.application.ReviewApplicationStatus;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.tc.Constants;

/**
 * <p>Processor for the user requests to applying to review auctions after accepting terms of use.</p>
 *
 * @author isv
 * @version 1.0 (Review Application Integration assembly)
 */
public class ReviewAuctionTermsAgree extends ReviewAuctionApply {

    /**
     * <p>A <code>Logger</code> to be used for logging the events.</p>
     */
    private static Logger log = Logger.getLogger(ReviewAuctionTermsAgree.class);

    /**
     * <p>Constructs new <code>ReviewAuctionTermsAgree</code> instance. This implementation does nothing.</p>
     */
    public ReviewAuctionTermsAgree() {
    }

    /**
     * <p>This method processes review auction application.</p>
     *
     * @param roleIds an <code>int</code> array listing the IDs for resource roles which user applies to.
     * @throws Exception if any error occurs
     */
    protected void applicationProcessing(int[] roleIds) throws Exception {
        String termsOfUseId = StringUtils.checkNull(getRequest().getParameter(Constants.TERMS_OF_USE_ID));

        long userId = getUser().getId();

        if ("POST".equals(getRequest().getMethod())) {
            if (!"".equals(termsOfUseId)) {
                if (!"on".equalsIgnoreCase(getRequest().getParameter(Constants.TERMS_AGREE))) {
                    addError(Constants.TERMS_AGREE, "You must agree to the terms in order to review the contest.");
                } else {
                    if (hasTermsOfUseBan(userId, Long.parseLong(termsOfUseId))) {
                        addError(Constants.TERMS_AGREE, "Sorry, you can not agree to this terms of use.");
                    } else {
                        // save user terms of use record
                        saveUserTermsOfUse(userId, Long.parseLong(termsOfUseId));
                        if (hasPrePendingTerm("ReviewAuctionApply")) {
                            return;
                        }
                    }
                }

                boolean hasMoreTerms = processTermsOfUse(String.valueOf(projectId), userId,
                                                         roleIds, Long.parseLong(termsOfUseId));
                if (!hasMoreTerms) {
                    loadCaptcha();
                }

                setNextPage(getReviewTermsView(projectTypeId));
                setIsNextPageInContext(true);
            } else {
                if (!answeredCaptchaCorrectly()) {
                    addError(Constants.CAPTCHA_RESPONSE, "Sorry, your response was incorect.");
                }

                // make sure they don't have pending terms of use
                if (processTermsOfUse(String.valueOf(projectId), userId, roleIds, -1) || hasErrors()) {
                    loadCaptcha();

                    setNextPage(getReviewTermsView(projectTypeId));
                    setIsNextPageInContext(true);
                } else {
                    apply(roleIds);
                    setNextPage("/review_board/reviewApplicationResult.jsp");
                    setIsNextPageInContext(true);
                }
            }
        } else {
            throw new NavigationException("Invalid request type.");
        }
    }

    /**
     * <p>Checks if user has answered correctly to CAPTCHA.</p>
     * 
     * @return <code>true</code> if response was correct; <code>false</code> otherwise.
     * @throws NavigationException if session has expired.
     */
    private boolean answeredCaptchaCorrectly() throws NavigationException {
        String response = StringUtils.checkNull(getRequest().getParameter(Constants.CAPTCHA_RESPONSE));
        String word = (String) getRequest().getSession().getAttribute(Constants.CAPTCHA_WORD);
        // invalidates the captcha word after it has been used
        getRequest().getSession().removeAttribute(Constants.CAPTCHA_WORD);

        if (word == null) {
            throw new NavigationException("Sorry, your session has expired, please start your registration again.");
        } else {
            return word.compareToIgnoreCase(response.trim()) == 0;
        }
    }

    /**
     * <p>Does the apply to the review auction.</p>
     *
     * @param roleIds an <code>int</code> array listing the IDs for resource roles which user applies to.
     * @throws Exception if any error occurs during apply.
     */
    private void apply(int[] roleIds) throws Exception {
        log.info("processing application for " + getUser().getUserName()
                 + ", roleIds " + Arrays.toString(roleIds) + ", project " + projectId + ", auction: " 
                 + reviewAuction.getId());

        ReviewApplicationManager reviewApplicationManager = ReviewAuctionHelper.createReviewApplicationManager();
        Map<Long, ReviewApplicationStatus> applicationStatuses =
            ReviewAuctionHelper.buildLookupMap(reviewApplicationManager.getApplicationStatuses());
        ReviewApplicationStatus pendingStatus =
            applicationStatuses.get(ReviewAuctionHelper.PENDING_APPLICATION_ROLE_STATUS_ID);

        // Get the existing non-cancelled applications for current user
        List<ReviewApplication> currentUserApplications 
            = ReviewAuctionHelper.getPendingReviewApplications(getUser().getId(), this.reviewAuction.getId());

        // Remove those pending applications which haven't been selected by user
        ReviewApplicationStatus cancelledStatus =
            applicationStatuses.get(ReviewAuctionHelper.CANCELLED_APPLICATION_ROLE_STATUS_ID);
        for (ReviewApplication application : currentUserApplications) {
            if (application.getStatus().getId() == ReviewAuctionHelper.PENDING_APPLICATION_ROLE_STATUS_ID) {
                boolean canRemove = true;
                for (ReviewApplicationRole role : this.requestedReviewApplicationRoles) {
                    if (role.getId() == application.getApplicationRoleId()) {
                        canRemove = false;
                        break;
                    }
                }
                if (canRemove) {
                    application.setStatus(cancelledStatus);
                    reviewApplicationManager.updateApplication(application);
                }
            }
        }

        // Otherwise create new applications for user if necessary
        for (ReviewApplicationRole role : this.requestedReviewApplicationRoles) {
            // Check if pending application for user does not already exist
            boolean canAdd = true;
            for (ReviewApplication application : currentUserApplications) {
                if (application.getApplicationRoleId() == role.getId()) {
                    if (application.getStatus().getId() == ReviewAuctionHelper.PENDING_APPLICATION_ROLE_STATUS_ID) {
                        canAdd = false;
                    }
                }
            }
            if (canAdd) {
                ReviewApplication reviewApplication = new ReviewApplication();
                reviewApplication.setApplicationRoleId(role.getId());
                reviewApplication.setAuctionId(reviewAuction.getId());
                reviewApplication.setCreateDate(new Date());
                reviewApplication.setStatus(pendingStatus);
                reviewApplication.setUserId(getUser().getId());
                reviewApplicationManager.createApplication(reviewApplication);
            }
        }
        
        // Generate the message to be displayed to user
        Date now = new Date();
        String message;
        if (this.requestedReviewApplicationRoles.isEmpty()) {
            message = "Your review application for this contest has been cancelled.";
        } else if (this.reviewAuction.getAssignmentDate().compareTo(now) > 0) {
            DateFormat dateFormat = new SimpleDateFormat("MM.dd.yyyy HH:mm z");
            message = "You have successfully applied to review this contest. The system will automatically " +
                      "select reviewers that best match the review positions for this contest on " 
                      + dateFormat.format(this.reviewAuction.getAssignmentDate())
                      + ". You will be notified by email what review role you were assigned to.";
        } else {
            message = "You have successfully applied to review this contest. The system will automatically decide " +
                      "whether you match the reviewer requirements for this contest now. You will be notified by " +
                      "email shortly.";
        }
        getRequest().setAttribute("message", message);
    }

    /**
     * <p>Checks whether the user has pre-pending dependent terms of use to agree. If so, the page will be redirect to 
     * the dependent terms of use to let the user agree.</p>
     *
     * @param viewRegModule the module to let the user agree terms of use.
     * @return true if the user has pre-pending dependent terms of use to agree; false otherwise.
     */
    protected boolean hasPrePendingTerm(String viewRegModule) {
        String prePendingTerms = getRequest().getParameter(Constants.PRE_PENDING_TERMS);
        if (prePendingTerms == null || prePendingTerms.trim().length() == 0) {
            // no pre-pending term
            return false;
        }

        String[] terms = prePendingTerms.split(",");
        if (terms.length == 0) {
            return false;
        }
        long term = Long.valueOf(terms[terms.length - 1]);
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < terms.length - 1; i++) {
            if (i > 0) {
                sb.append(",");
            }
            sb.append(terms[i]);
        }
        getRequest().setAttribute(Constants.PRE_PENDING_TERMS, sb.toString());

        // redirect to agree the pre-pending term
        StringBuilder url = new StringBuilder();
        url.append("/tc?").append(Constants.MODULE_KEY).append("=").append(viewRegModule);
        url.append("&").append(Constants.TERMS_OF_USE_ID).append("=").append(term);
        url.append("&").append(Constants.PRE_PENDING_TERMS).append("=").append(sb.toString());
        url.append("&").append(Constants.REVIEW_AUCTION_ID).append("=")
            .append(getRequest().getParameter(Constants.REVIEW_AUCTION_ID));
        String[] parameterValues =
            getRequest().getParameterValues(Constants.REVIEW_APPLICATION_ROLE_ID);
        if (parameterValues != null) {
            for (int i = 0; i < parameterValues.length; i++) {
                String parameterValue = parameterValues[i];
                url.append("&").append(Constants.REVIEW_APPLICATION_ROLE_ID).append("=")
                    .append(parameterValue);
            }
        }
        setNextPage(url.toString());
        setIsNextPageInContext(false);

        return true;
    }
}
