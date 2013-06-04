/*
 * Copyright (C) 2012 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc.controller.request.development;

import java.io.FileOutputStream;
import java.io.IOException;
import java.util.*;

import com.topcoder.management.review.application.ReviewApplicationResourceRole;
import com.topcoder.management.review.application.ReviewApplicationRole;
import com.topcoder.management.review.application.ReviewAuction;
import com.topcoder.management.review.application.ReviewAuctionManager;
import com.topcoder.randomstringimg.InvalidConfigException;
import com.topcoder.randomstringimg.ObfuscationException;
import com.topcoder.randomstringimg.RandomStringImage;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.security.ClassResource;
import com.topcoder.util.spell.ConfigException;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.error.RequestRateExceededException;
import com.topcoder.web.common.model.comp.Project;
import com.topcoder.web.common.throttle.Throttle;
import com.topcoder.web.tc.Constants;

/**
 * <p>Processor for the user requests to review the components by applying to review auctions.</p>
 *
 * @author isv
 * @version 1.0 (Review Application Integration assembly)
 */
public class ReviewAuctionApply extends Base {

    /**
     * <p>A <code>long</code> providing the ID of a project associated with the review auction.</p>
     */
    protected long projectId = 0;

    /**
     * <p>A <code>String</code> providing the ID of a project category.</p>
     */
    protected String projectTypeId = null;

    /**
     * <p>A <code>ReviewAuction</code> providing the details for review auction.</p>
     */
    protected ReviewAuction reviewAuction = null;

    /**
     * <p>A <code>List</code> listing the review application roles which user wants apply to.</p> 
     */
    protected List<ReviewApplicationRole> requestedReviewApplicationRoles = new ArrayList<ReviewApplicationRole>();

    /**
     * <p>A <code>Throttle</code> to be used for throttling the requests.</p>
     */
    private static final Throttle throttle = new Throttle(2, 2000);

    /**
     * <p>Constructs new <code>ReviewAuctionApply</code> instance. This implementation does nothing.</p>
     */
    public ReviewAuctionApply() {
    }

    /**
     * <p>Processes the incoming request.</p>
     *
     * @throws TCWebException if any error occurs during processing.
     */
    @SuppressWarnings("unchecked")
    protected void developmentProcessing() throws TCWebException {
        try {
            if (throttle.throttle(getRequest().getSession().getId())) {
                throw new RequestRateExceededException(getRequest().getSession().getId(), getUser().getUserName());
            }
            if (userIdentified()) {
                // Parse review auction ID from the request
                String reviewAuctionIdParam =
                    StringUtils.checkNull(getRequest().getParameter(Constants.REVIEW_AUCTION_ID));
                long reviewAuctionId = Long.parseLong(reviewAuctionIdParam);

                // Get details for review auction 
                ReviewAuctionManager reviewAuctionManager = ReviewAuctionHelper.createReviewAuctionManager();
                reviewAuction = reviewAuctionManager.getAuction(reviewAuctionId);
                if (reviewAuction == null) {
                    throw new NavigationException("Invalid review auction specified: " + reviewAuctionIdParam);
                }
                getRequest().setAttribute("reviewAuction", reviewAuction);

                // Validate auction and collect the resource roles selected by user if any
                Set<Integer> onlineReviewResourceRoleIds = new HashSet<Integer>();
                if (!reviewAuction.isOpen()) {
                    throw new NavigationException("Review registration is not open at this moment: " + reviewAuctionId);
                } else {
                    // Parse review application role IDs from the request
                    long[] reviewApplicationRoleIds = getReviewApplicationRoleIds();
                    boolean removeAllReviewApplicationsForUser = (reviewApplicationRoleIds.length == 0);
                    if (!removeAllReviewApplicationsForUser) {
                        List<Long> openPositions = reviewAuction.getOpenPositions();
                        List<ReviewApplicationRole> reviewApplicationRoles
                            = reviewAuction.getAuctionType().getApplicationRoles();
                        for (int i = 0; i < reviewApplicationRoleIds.length; i++) {
                            long reviewApplicationRoleId = reviewApplicationRoleIds[i];
                            boolean validRole = false;
                            for (int j = 0; j < reviewApplicationRoles.size(); j++) {
                                ReviewApplicationRole reviewApplicationRole = reviewApplicationRoles.get(j);
                                if (reviewApplicationRole.getId() == reviewApplicationRoleId) {
                                    validRole = true;
                                    if (openPositions.get(j) <= 0) {
                                        throw new NavigationException(
                                            "There are no open positions for selected review application role: "
                                            + reviewApplicationRole.getName());
                                    } else {
                                        List<ReviewApplicationResourceRole> resourceRoles =
                                            reviewApplicationRole.getResourceRoles();
                                        for (ReviewApplicationResourceRole resourceRole : resourceRoles) {
                                            onlineReviewResourceRoleIds.add((int) resourceRole.getResourceRoleId());
                                        }
                                        requestedReviewApplicationRoles.add(reviewApplicationRole);
                                        break;
                                    }
                                }
                            }
                            if (!validRole) {
                                throw new NavigationException("Review application role does not belong to the contest: " + reviewApplicationRoleId);
                            }
                        }
                        
                        // Validate user for being a review board member and not being registered to project already
                        Request r = new Request();
                        r.setContentHandle("review_board_member_for_project");
                        r.setProperty(Constants.PROJECT_ID, String.valueOf(reviewAuction.getProjectId()));
                        r.setProperty(Constants.USER_ID, String.valueOf(getUser().getId()));
                        if (this.reviewAuction.getAuctionType().getAuctionCategory().getId() 
                            == ReviewAuctionHelper.CONTEST_REVIEW_AUCTION_CATEGORY_ID) {
                            r.setProperty(Constants.RESOURCE_ROLE_IDS, "4,5,6,7");
                        } else {
                            r.setProperty(Constants.RESOURCE_ROLE_IDS, "18");
                        }

                        Map<String, ResultSetContainer> results = getDataAccess().getData(r);
                        if (results.get("review_board_member_for_project").isEmpty()) {
                            throw new NavigationException("You are not a Review Board member.");
                        } else if (!results.get("member_for_project").isEmpty()) {
                            throw new NavigationException("You are already assigned as reviewer for the contest.");
                        }
                    }
                }

                // Get details for project related to requested review auction
                projectId = reviewAuction.getProjectId();
                Project project = ReviewAuctionHelper.getProject((int) projectId);
                projectTypeId = String.valueOf(project.getCategoryId());
                getRequest().setAttribute("projectType", projectTypeId);

                // check eligibility constraints
                if (checkEligibilityConstraints(projectId, new ClassResource(this.getClass())) != 0) {
                    throw new NavigationException("Could not find project information.");
                }

                // Perform review application processing  
                int[] roleIds = new int[onlineReviewResourceRoleIds.size()];
                int index = 0;
                for (Integer roleId : onlineReviewResourceRoleIds) {
                    roleIds[index++] = roleId;
                }
                applicationProcessing(roleIds);
            } else {
                throw new PermissionException(getUser(), new ClassResource(this.getClass()));
            }
        } catch (PermissionException pe) {
            throw pe;
        } catch (TCWebException e) {
            throw e;
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }

    /**
     * <p>This method processes review auction application.</p>
     *
     * @param roleIds an <code>int</code> array listing the IDs for resource roles which user applies to.
     * @throws Exception if any error occurs.
     */
    protected void applicationProcessing(int[] roleIds) throws Exception {
        String termsOfUseId = StringUtils.checkNull(getRequest().getParameter(Constants.TERMS_OF_USE_ID));
        boolean hasMoreTerms = processTermsOfUse(String.valueOf(projectId), getUser().getId(),
                                                 roleIds, "".equals(termsOfUseId) ? -1 : Long.parseLong(termsOfUseId));
        if (!hasMoreTerms) {
            loadCaptcha();
        }

        setNextPage(getReviewTermsView(this.projectTypeId));
        setIsNextPageInContext(true);
    }

    /**
     * <p>Generates CAPTCHA image and binds it's parameters to request.</p>
     * 
     * @throws IOException if an unexpected error occurs.
     * @throws InvalidConfigException if an unexpected error occurs.
     * @throws ObfuscationException if an unexpected error occurs.
     * @throws ConfigException if an unexpected error occurs.
     */
    protected void loadCaptcha() throws IOException, InvalidConfigException, ObfuscationException, ConfigException {
        RandomStringImage rsi = new RandomStringImage(Constants.RANDOM_STRING_IMAGE_CONFIG);

        String fileName = getUser().getId() + "_" + System.currentTimeMillis() + ".png";
        FileOutputStream fos = new FileOutputStream(Constants.CAPTCHA_PATH + fileName);
        //so, i'm using the dictionary here because you can't use this component without configuring
        //a dictionary, i went to the effort of getting one, so might as well use it.
        //i'd rather just use a random string, but then i would need a key generator component
        //to do that, so i'll just use the dictionary
        String word = rsi.generateRandomFromDictionaries(fos);
        fos.close();
        getRequest().getSession().setAttribute(Constants.CAPTCHA_WORD, word);
        getRequest().setAttribute(Constants.CAPTCHA_FILE_NAME, fileName);
    }

    /**
     * <p>Gets the logical name for the view which is to be used for displaying the terms of use for the reviews of
     * specified type requested by client.</p>
     *
     * @param projectType a <code>String</code> referencing the project type requested by client.
     * @return a <code>String</code> referencing the view to be used for displaying the terms of use for projects of
     *         specified type.
     */
    protected String getReviewTermsView(String projectType) {
        return Constants.UNIFIED_REVIEWER_TERMS_PAGE;
    }

    /**
     * <p>Gets the IDs of review application roles requested by current user.</p>
     * 
     * @return a <code>long</code> array listing the IDs of review application roles which user wants to apply to. 
     */
    protected long[] getReviewApplicationRoleIds() {
        String[] reviewApplicationRoleIdsParam
            = getRequest().getParameterValues(Constants.REVIEW_APPLICATION_ROLE_ID);
        if (reviewApplicationRoleIdsParam != null) {
            Set<String> uniqueRoleIds = new HashSet<String>(Arrays.asList(reviewApplicationRoleIdsParam));
            long[] reviewApplicationRoleIds = new long[uniqueRoleIds.size()];
            int index = 0;
            for (String roleId : uniqueRoleIds) {
                reviewApplicationRoleIds[index++] = Long.parseLong(roleId);
            }
            return reviewApplicationRoleIds;
        } else {
            return new long[0];
        }
    }
}
