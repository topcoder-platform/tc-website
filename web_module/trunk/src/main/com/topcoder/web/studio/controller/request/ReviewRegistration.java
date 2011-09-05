/*
 * Copyright (C) 2001 - 2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.studio.controller.request;

import java.text.DateFormat;
import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import com.topcoder.shared.dataAccess.CachedDataAccess;
import com.topcoder.shared.dataAccess.DataAccess;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.security.ClassResource;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.ShortHibernateProcessor;
import com.topcoder.web.ejb.termsofuse.TermsOfUseEntity;
import com.topcoder.web.studio.Constants;
import com.topcoder.web.studio.dao.DAOFactory;
import com.topcoder.web.studio.dao.DAOUtil;
import com.topcoder.web.studio.dto.Project;
import com.topcoder.web.studio.dto.ProjectPhase;
import com.topcoder.web.studio.dto.Resource;
import com.topcoder.web.studio.dto.ResourceInfo;
import com.topcoder.web.studio.dto.ResourceRole;

/**
 * <p>This class will process a review registration request.</p>
 *
 * <p>
 *      Registration process will include the following validations:
 *      <ol>
 *          <li>
 *              That the specified specification review id parameter is correctly formed and the corresponding
 *              Specification Review exists.
 *          </li>
 *          <li>
 *              That the review spot is open and the spot is empty. It is very important to double check this within
 *              hibernate transaction because of the race conditions. The check and registration must be atomic,
 *              otherwise concurrent registrations may overwrite each other.
 *          </li>
 *          <li>
 *              That the associated specification review contest exists.
 *          </li>
 *          <li>
 *              Finally That the user is an active or immune member of the review board for the corresponding contest
 *              type.
 *          </li>
 *      </ol>
 * </p>
 *
 * <p>
 *      If validation process is successful the following is done:
 *      <ol>
 *          <li>
 *              Specification Review status is updated to REVIEWER_ASSIGNED.
 *          </li>
 *          <li>
 *              A specification review - reviewer association is created.
 *          </li>
 *          <li>
 *              User gets PROJECT_READ permission over the associated TC Direct Project if it exists or
 *              CONTEST_READ permission over the contest.
 *          </li>
 *      </ol>
 * </p>
 *
 * <p>
 * Version 1.1 (Re-platforming Studio Release 2 Assembly) Change notes:
 *   <ol>
 *     <li>Updated the logic to support registration to specification reviews.</li>
 *   </ol>
 * </p>
 *
 * <p>
 * Version 1.2 (Re-platforming Studio Release 4 Assembly 1.0) Change notes:
 *   <ol>
 *     <li>Re-factored the logic for terms processing.</li>
 *   </ol>
 * </p>
 *
 * <p>
 * Version 1.3 (Replatforming Studio Release 5) change notes:
 *   <ol>
 *     <li>Using the dto classes in com.topcoder.web.studio.dto package instead of in com.topcoder.web.common.model.comp package.</li>
 *   </ol>
 * </p>
 *
 * @author isv, TCSDEVELOPER
 * @version 1.3
 * @since Studio Release Assembly - Spec Review Sign up page v1.0
 */
public class ReviewRegistration extends ShortHibernateProcessor {

    /**
     * A <code>String</code> constant that stores the query name for the review_board_member query
     */
    private static final String REVIEW_BOARD_MEMBER_QUERY_NAME = "review_board_members";

    /**
     * <p>An <code>int</code> providing the ID for <code>Screening</code> phase type.</p>
     */
    private static final int SCREENING_PHASE_TYPE_ID = 3;

    /**
     * <p>An <code>int</code> providing the ID for <code>Milestone Screening</code> phase type.</p>
     */
    private static final int MILESTONE_SCREENING_PHASE_TYPE_ID = 16;

    /**
     * <p>An <code>int</code> providing the ID for <code>Specification Review</code> phase type.</p>
     * 
     * @since 1.1
     */
    private static final int SPECIFICATION_REVIEW_PHASE_TYPE_ID = 14;

    /**
     * <p>An <code>int</code> providing the ID for <code>Primary Screener</code> resource role.</p>
     */
    private static final int SCREENER_ROLE_ID = 2;

    /**
     * <p>An <code>int</code> providing the ID for <code>Milestone Screener</code> resource role.</p>
     */
    private static final int MILESTONE_SCREENER_ROLE_ID = 19;

    /**
     * <p>An <code>int</code> providing the ID for <code>Specification Reviewer</code> resource role.</p>
     * 
     * @since 1.1
     */
    private static final int SPECIFICATION_REVIEWER_ROLE_ID = 18;
    
    /**
     * This method executes the actual business logic for this processor.
     *
     * @throws Exception if any error occurs
     * @see com.topcoder.web.common.LongHibernateProcessor#dbProcessing()
     */
    protected void dbProcessing() throws Exception {
        // user must be logged in
        if (userLoggedIn()) {
            boolean isSpecReview = getRequest().getParameter(Constants.MODULE_KEY).equals("SpecReviewRegistration");
            if (isSpecReview) {
                registerReviewer(new int[] {SPECIFICATION_REVIEWER_ROLE_ID}, 
                                 new int[] {SPECIFICATION_REVIEW_PHASE_TYPE_ID}, "Specification", 0.0);
            } else {
                registerReviewer(new int[] {SCREENER_ROLE_ID, MILESTONE_SCREENER_ROLE_ID}, 
                                 new int[] {SCREENING_PHASE_TYPE_ID, MILESTONE_SCREENING_PHASE_TYPE_ID}, "Screening", 0.0);
            }
        } else {
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));
        }

        setNextPage(getSessionInfo().getServletPath() + "?" + Constants.MODULE_KEY + "=" 
                    + ViewReviewOpportunities.MODULE_NAME);
        setIsNextPageInContext(false);
    }

    /**
     * <p>Creates new screener resource of specified role.</p>
     * 
     * @param factory a <code>DAOFactory</code> providing the DAO factory. 
     * @param project a <code>Project</code>  
     * @param userId a <code>long</code> providing the user ID.
     * @param phase a <code>ProjectPhase</code> referencing the project phase. 
     * @param roleId a <code>long</code> providing the role ID.
     * @param payment a <code>double</code> providing the payment amount. 
     */
    private void createResource(DAOFactory factory, Project project, long userId, ProjectPhase phase, int roleId, 
                                double payment) {
        Date now = new Date();
        if (phase != null) {
            Resource resource = new Resource();
            resource.setProjectId(project.getId().longValue());
            ResourceRole role = new ResourceRole();
            role.setId((int) roleId);
            resource.setRole(role);
            resource.setPhaseId(phase.getId());
            resource.setCreateUser(String.valueOf(userId));
            resource.setCreateDate(now);
            resource.setModifyUser(String.valueOf(userId));
            resource.setModifyDate(now);
            
            ResourceInfo userIdResourceInfo = new ResourceInfo();
            userIdResourceInfo.setId(new ResourceInfo.Identifier(resource, 1L));
            userIdResourceInfo.setValue(String.valueOf(userId));
            userIdResourceInfo.setCreateUser(String.valueOf(userId));
            userIdResourceInfo.setCreateDate(now);
            userIdResourceInfo.setModifyUser(String.valueOf(userId));
            userIdResourceInfo.setModifyDate(now);
            
            ResourceInfo userNameResourceInfo = new ResourceInfo();
            userNameResourceInfo.setId(new ResourceInfo.Identifier(resource, 2L));
            userNameResourceInfo.setValue(getLoggedInUser().getUserName());
            userNameResourceInfo.setCreateUser(String.valueOf(userId));
            userNameResourceInfo.setCreateDate(now);
            userNameResourceInfo.setModifyUser(String.valueOf(userId));
            userNameResourceInfo.setModifyDate(now);
            
            DateFormat df = new SimpleDateFormat("MM.dd.yyyy hh:mm aa");
            ResourceInfo regDateResourceInfo = new ResourceInfo();
            regDateResourceInfo.setId(new ResourceInfo.Identifier(resource, 6L));
            regDateResourceInfo.setValue(df.format(now));
            regDateResourceInfo.setCreateUser(String.valueOf(userId));
            regDateResourceInfo.setCreateDate(now);
            regDateResourceInfo.setModifyUser(String.valueOf(userId));
            regDateResourceInfo.setModifyDate(now);
            
            NumberFormat nf = new DecimalFormat("##0.0");
            ResourceInfo paymentResourceInfo = new ResourceInfo();
            paymentResourceInfo.setId(new ResourceInfo.Identifier(resource, 7L));
            paymentResourceInfo.setValue(nf.format(payment));
            paymentResourceInfo.setCreateUser(String.valueOf(userId));
            paymentResourceInfo.setCreateDate(now);
            paymentResourceInfo.setModifyUser(String.valueOf(userId));
            paymentResourceInfo.setModifyDate(now);
            
            ResourceInfo paymentStatusResourceInfo = new ResourceInfo();
            paymentStatusResourceInfo.setId(new ResourceInfo.Identifier(resource, 8L));
            paymentStatusResourceInfo.setValue("No");
            paymentStatusResourceInfo.setCreateUser(String.valueOf(userId));
            paymentStatusResourceInfo.setCreateDate(now);
            paymentStatusResourceInfo.setModifyUser(String.valueOf(userId));
            paymentStatusResourceInfo.setModifyDate(now);

            Set<ResourceInfo> infos = new HashSet<ResourceInfo>();
            infos.add(userIdResourceInfo);
            infos.add(userNameResourceInfo);
            infos.add(regDateResourceInfo);
            infos.add(paymentResourceInfo);
            infos.add(paymentStatusResourceInfo);
            resource.setInfo(infos);
            
            factory.getResourceDAO().createResource(resource);
        }
    }

    /**
     * Private helper method to check if a user is in the review board of a certain contest type in Online Review 
     * system.
     *
     * @param userId the user id to query.
     * @param projectCategoryId the project category id to query.
     * @return true if the user is an active or immune reviewer for the specified contest type.
     * @throws Exception if an error occurs in the underlying layer.
     */
    private boolean userInORReviewBoard(long userId, int projectCategoryId) throws Exception {
        if (log.isDebugEnabled()) {
            log.debug("checking if userId " + userId + " can perform reviews for project category id: "
                      + projectCategoryId);
        }

        DataAccess da = new CachedDataAccess(DBMS.TCS_OLTP_DATASOURCE_NAME);
        Request r = new Request();
        r.setContentHandle(REVIEW_BOARD_MEMBER_QUERY_NAME);
        r.setProperty("pt", String.valueOf(projectCategoryId));

        ResultSetContainer rsc = da.getData(r).get("review_board_members");
        boolean isReviewBoardMember = false;
        for (ResultSetContainer.ResultSetRow row : rsc) {
            if (userId == row.getLongItem("user_id")) {
                isReviewBoardMember = true;
                break;
            }
        }

        if (log.isDebugEnabled()) {
            log.debug("userId: " + userId + " can" + (isReviewBoardMember ? "" : " not") 
                      + " perform reviews for contest type id: " + projectCategoryId);
        }
        
        return isReviewBoardMember;
    }

    /**
     * <p>Attempts to register the current user as reviewer of specified roles for specified phase types for the project
     * in <code>tcs_catalog</code> database referenced by the {@link Constants#CONTEST_ID} parameter of incoming
     * request.</p>
     * 
     * @param reviewerRoleIds a <code>int</code> array listing the IDs for roles for resources to be created for 
     *        assigning current user as reviewer for desired <code>Studio</code> project.  
     * @param phaseTypeIds a <code>int</code> array listing the IDs for types of phases to assigning current user as 
     *        reviewer for desired <code>Studio</code> project.
     * @param reviewType a <code>String</code> providing the textual description of the review type to be included into
     *        error messages.
     * @param payment a <code>double</code> providing the amount of payment for review to be set for resource. 
     * @throws Exception if an unexpected error occurs.
     */
    private void registerReviewer(int[] reviewerRoleIds, int[] phaseTypeIds, String reviewType, double payment) 
        throws Exception {
        // get contest id from the request
        long contestId;
        try {
            contestId = new Long(getRequest().getParameter(Constants.CONTEST_ID));
        } catch (NumberFormatException e) {
            throw new NavigationException("Invalid Contest Id Specified");
        }

        DAOFactory factory = DAOUtil.getFactory();
        
        // Check project for presence
        Project project = factory.getProjectDAO().find((int) contestId);
        if (project == null) {
            throw new NavigationException("The specified project doesn't exist");
        }
        
        // check if the user is part of the review board
        if (!userInORReviewBoard(getUser().getId(), project.getCategoryId())) {
            throw new NavigationException("Sorry, you are not a member of the review board.");
        }
        
        // Get current user ID
        long userId = getLoggedInUser().getId();

        List<TermsOfUseEntity> termsPending 
            = RegistrationHelper.getPendingTermsOfUse(reviewerRoleIds, project.getId(), userId);

        // If there are terms of use which are not accepted by user yet then raise an error
        if (!termsPending.isEmpty()) {
            StringBuilder b = new StringBuilder();
            for (TermsOfUseEntity terms : termsPending) {
                b.append(terms.getTitle()).append("<br/>");
            }
            throw new NavigationException("You have to accept following terms of use first: " + b);
        }

        // double check that this spot is not taken (we need this again in the transaction)
        Set<Resource> resources = project.getResources();
        for (Resource resource : resources) {
            for (int i = 0; i < reviewerRoleIds.length; i++) {
                int reviewerRoleId = reviewerRoleIds[i];
                if (resource.getRole().getId().intValue() == reviewerRoleId) {
                    throw new NavigationException("The specified " + reviewType + " review position is already taken");
                }
            }
        }
        
        for (int i = 0; i < reviewerRoleIds.length; i++) {
            int reviewerRoleId = reviewerRoleIds[i];
            ProjectPhase reviewPhase = project.getPhase(phaseTypeIds[i]);
            createResource(DAOUtil.getFactory(), project, userId, reviewPhase, reviewerRoleId, payment);
        }
        factory.getNotificationDAO().setTimelineNotification(project.getId(), userId);
    }
}
