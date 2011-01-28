/*
 * Copyright (C) 2001 - 2009 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.studio.controller.request;

import java.text.DateFormat;
import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
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
import com.topcoder.web.common.dao.DAOFactory;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.model.PermissionType;
import com.topcoder.web.common.model.SpecReview;
import com.topcoder.web.common.model.SpecReviewReviewer;
import com.topcoder.web.common.model.SpecReviewStatus;
import com.topcoder.web.common.model.User;
import com.topcoder.web.common.model.UserPermissionGrant;
import com.topcoder.web.common.model.comp.Project;
import com.topcoder.web.common.model.comp.ProjectPhase;
import com.topcoder.web.common.model.comp.Resource;
import com.topcoder.web.common.model.comp.ResourceInfo;
import com.topcoder.web.ejb.project.ProjectRoleTermsOfUse;
import com.topcoder.web.ejb.project.ProjectRoleTermsOfUseLocator;
import com.topcoder.web.ejb.termsofuse.TermsOfUse;
import com.topcoder.web.ejb.termsofuse.TermsOfUseEntity;
import com.topcoder.web.ejb.termsofuse.TermsOfUseLocator;
import com.topcoder.web.ejb.user.UserTermsOfUse;
import com.topcoder.web.ejb.user.UserTermsOfUseLocator;
import com.topcoder.web.studio.Constants;
import com.topcoder.web.studio.dao.StudioDAOFactory;
import com.topcoder.web.studio.dao.StudioDAOUtil;
import com.topcoder.web.studio.model.Contest;

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
 *              hibernate's transaction because of the race conditions. The check and registration must be atomic,
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
 * @author TCSDEVELOPER, isv
 * @version 1.0
 * @since Studio Release Assembly - Spec Review Sign up page v1.0
 */
public class ReviewRegistration extends ShortHibernateProcessor {

    /**
     * A <code>String</code> constant that stores the query name for the review_board_member query
     */
    private static final String REVIEW_BOARD_MEMBER_QUERY_NAME = "review_board_member";

    /**
     * <p>An <code>int</code> providing the ID for <code>Screening</code> phase type.</p>
     */
    private static final int SCREENING_PHASE_TYPE_ID = 3;

    /**
     * <p>An <code>int</code> providing the ID for <code>Screening</code> phase type.</p>
     */
    private static final int MILESTONE_SCREENING_PHASE_TYPE_ID = 16;

    /**
     * <p>An <code>int</code> providing the ID for <code>Primary Screener</code> resource role.</p>
     */
    private static final int SCREENER_ROLE_ID = 2;

    /**
     * <p>An <code>int</code> providing the ID for <code>Milestone Screener</code> resource role.</p>
     */
    private static final int MILESTONE_SCREENER_ROLE_ID = 19;
    
    /**
     * This method executes the actual business logic for this processor.
     *
     * @throws Exception if any error occurs
     * @see com.topcoder.web.common.LongHibernateProcessor#dbProcessing()
     */
    protected void dbProcessing() throws Exception {
        // user must be logged in
        if (userLoggedIn()) {
            String specReviewIdParam = getRequest().getParameter(Constants.SPEC_REVIEW_ID);
            if (specReviewIdParam != null) {
                performReviewRegistrationForStudioDBContest();
            } else {
                performReviewRegistrationForOnlineReviewDBContest();
            }

        } else {
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));
        }

        setNextPage(getSessionInfo().getServletPath() + "?" + Constants.MODULE_KEY + "=" +
            ViewReviewOpportunities.MODULE_NAME);
        setIsNextPageInContext(false);
    }

    /**
     * <p>Performs reviewer registration for contests maintained in <code>studio_oltp</code> database.</p>
     * 
     * @throws Exception if an unexpected error occurs.
     */
    private void performReviewRegistrationForStudioDBContest() throws Exception {
        // get specification review id from the request
        Long specReviewId;
        try {
            specReviewId = new Long(getRequest().getParameter(Constants.SPEC_REVIEW_ID));
        } catch (NumberFormatException e) {
            throw new NavigationException("Invalid Specification Review Id Specified");
        }

        // get Specification Review
        DAOFactory factory = DAOUtil.getFactory();
        SpecReview specReview = factory.getSpecReviewDAO().find(specReviewId);
        if (specReview == null) {
            throw new NavigationException("The Specified Specification Review doesn't exist");
        }

        // double check that this spot is open (we need this again in the transaction)
        if (!specReview.getSpecReviewStatus().getId().equals(SpecReviewStatus.READY)) {
            throw new NavigationException("The Specified Specification Review is not open for review");
        }

        // double check that this spot is not taken (we need this again in the transaction)
        for (SpecReviewReviewer specReviewReviewer : specReview.getSpecReviewers()) {
            if (specReviewReviewer.getIsActive().equals(SpecReviewReviewer.TRUE)) {
                throw new NavigationException("The Specified Specification Review is already taken");
            }
        }

        // get associated studio contest
        StudioDAOFactory cFactory = StudioDAOUtil.getFactory();
        Contest c = cFactory.getContestDAO().find(specReview.getContestId());
        if (c == null) {
            throw new NavigationException("Invalid Specification Review Specified");
        }

        // check if the user is part of the review board
        if (userInReviewBoard(getUser().getId(), c.getType().getId())) {
            // we are all set, register the user for this review
            User u = factory.getUserDAO().find(getUser().getId());
            Date now = new Date();

            // update specification review status to REVIEWER_ASSIGNED
            specReview.setSpecReviewStatus(new SpecReviewStatus(SpecReviewStatus.REVIEWER_ASSIGNED));
            specReview.setModificationTime(now);
            specReview.setModificationUser(u.getHandle());

            // create spec_review_reviewer_xref row
            SpecReviewReviewer specReviewReviewer = new SpecReviewReviewer(specReview, u, now,
                SpecReviewReviewer.TRUE, u.getHandle(), now);
            specReview.getSpecReviewers().add(specReviewReviewer);

            // insert to user_permission_grant
            UserPermissionGrant permission = new UserPermissionGrant();
            // if there is an associated direct project id, add PROJECT_READ permission for that resource_id
            if (c.getDirectProjectId() != null) {
                permission.setPermissionType(new PermissionType(PermissionType.PROJECT_READ));
                permission.setResourceId(new Long(c.getDirectProjectId()));
            } else {
                // otherwise, add CONTEST_READ permission for the contest_id
                permission.setPermissionType(new PermissionType(PermissionType.CONTEST_READ));
                permission.setResourceId(new Long(c.getId()));
            }
            permission.setUser(u);
            permission.setIsStudio(UserPermissionGrant.TRUE);
            factory.getUserPermissionGrantDAO().saveOrUpdate(permission);
        } else {
            throw new NavigationException("Sorry, you are not authorized to perform specification reviews for " +
                c.getType().getDescription() + " contests.");
        }
    }

    /**
     * Private helper method to check if a user is in the review board of a certain contest type
     *
     * @param userId the user id to query
     * @param contestTypeId the contest type id to query
     * @return true if the user is an active or immune reviewer for the specified contest type
     * @throws Exception if an error occurs in the underlying layer
     */
    private boolean userInReviewBoard(long userId, int contestTypeId) throws Exception {
        if (log.isDebugEnabled()) {
            log.debug("checking if userId " + userId + " can perform reviews for contest type id: " + contestTypeId);
        }

        DataAccess da = new CachedDataAccess(DBMS.STUDIO_DATASOURCE_NAME);
        Request r = new Request();
        r.setContentHandle(REVIEW_BOARD_MEMBER_QUERY_NAME);

        r.setProperty(Constants.USER_ID, String.valueOf(userId));
        r.setProperty(Constants.CONTEST_TYPE, String.valueOf(contestTypeId));

        ResultSetContainer rsc = da.getData(r).get(REVIEW_BOARD_MEMBER_QUERY_NAME);

        if (rsc.size() == 0) {
            if (log.isDebugEnabled()) {
                log.debug("userId: " + userId + " can perform reviews for contest type id: " + contestTypeId);
            }
            return false;
        }

        if (log.isDebugEnabled()) {
            log.debug("userId: " + userId + " cannot perform reviews for contest type id: " + contestTypeId);
        }
        return true;
    }

    /**
     * <p>Performs reviewer registration for contests maintained in <code>tcs_catalog</code> database.</p>
     * 
     * @throws Exception if an unexpected error occurs.
     */
    private void performReviewRegistrationForOnlineReviewDBContest() throws Exception {
        // get specification review id from the request
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
        
        // Get current user ID
        long userId = getLoggedInUser().getId();
        
        // Check user's terms of use acceptance
        ProjectRoleTermsOfUse projectRoleTermsOfUse = ProjectRoleTermsOfUseLocator.getService();
        UserTermsOfUse userTermsOfUse = UserTermsOfUseLocator.getService();
        TermsOfUse termsOfUse = TermsOfUseLocator.getService();
        
        List<Long>[] necessaryTerms = projectRoleTermsOfUse.getTermsOfUse(project.getId(),
                                                                          new int[] {SCREENER_ROLE_ID, 
                                                                                     MILESTONE_SCREENER_ROLE_ID}, 
                                                                          DBMS.COMMON_OLTP_DATASOURCE_NAME);
        List<TermsOfUseEntity> termsPending = new ArrayList<TermsOfUseEntity>();
        
        for (int i = 0; i < necessaryTerms.length; i++) {
            if (necessaryTerms[i] != null) {
                for (int j = 0; j < necessaryTerms[i].size(); j++) {
                    Long termsId = necessaryTerms[i].get(j);
                    TermsOfUseEntity terms =  termsOfUse.getEntity(termsId, DBMS.COMMON_OLTP_DATASOURCE_NAME);
                    if (!userTermsOfUse.hasTermsOfUse(userId, termsId, DBMS.COMMON_OLTP_DATASOURCE_NAME)) {
                        termsPending.add(terms);
                    }
                }
            }
        }
        
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
            if ((resource.getRoleId() == SCREENER_ROLE_ID) || (resource.getRoleId() == MILESTONE_SCREENER_ROLE_ID)) {
                throw new NavigationException("The specified Screening review position is already taken");
            }
        }

        // check if the user is part of the review board
        if (userInORReviewBoard(getUser().getId(), project.getCategoryId())) {
            ProjectPhase milestoneScreeningPhase = project.getPhase(MILESTONE_SCREENING_PHASE_TYPE_ID);
            createResource(factory, project, userId, milestoneScreeningPhase, MILESTONE_SCREENER_ROLE_ID);
            
            ProjectPhase screeningPhase = project.getPhase(SCREENING_PHASE_TYPE_ID);
            createResource(factory, project, userId, screeningPhase, SCREENER_ROLE_ID);

            // insert to user_permission_grant
            UserPermissionGrant permission = new UserPermissionGrant();
            
            // if there is an associated direct project id, add PROJECT_READ permission for that resource_id
            if (project.getTcDirectProjectId() != null) {
                permission.setPermissionType(new PermissionType(PermissionType.PROJECT_READ));
                permission.setResourceId(new Long(project.getTcDirectProjectId()));
            } else {
                // otherwise, add CONTEST_READ permission for the contest_id
                permission.setPermissionType(new PermissionType(PermissionType.CONTEST_READ));
                permission.setResourceId(new Long(project.getId()));
            }
            
            User u = factory.getUserDAO().find(getUser().getId());
            permission.setUser(u);
            permission.setIsStudio(UserPermissionGrant.TRUE);
            factory.getUserPermissionGrantDAO().saveOrUpdate(permission);
        } else {
            throw new NavigationException("Sorry, you are not authorized to perform screening reviews for contests of " 
                                          + "this type.");
        }
    }

    /**
     * <p>Creates new screener resource of specified role.</p>
     * 
     * @param factory a <code>DAOFactory</code> providing the DAO factory. 
     * @param project a <code>Project</code>  
     * @param userId a <code>long</code> providing the user ID.
     * @param phase a <code>ProjectPhase</code> referencing the project phase. 
     * @param roleId a <code>long</code> providing the role ID.
     */
    private void createResource(DAOFactory factory, Project project, long userId, ProjectPhase phase, int roleId) {
        Date now = new Date();
        if (phase != null) {
            Resource resource = new Resource();
            resource.setProjectId(project.getId().longValue());
            resource.setRoleId(new Long(roleId));
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
            paymentResourceInfo.setValue(nf.format(Constants.SCREENING_REVIEW_PAYMENT_AMOUNT));
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
        r.setContentHandle("review_board_members");
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
}
