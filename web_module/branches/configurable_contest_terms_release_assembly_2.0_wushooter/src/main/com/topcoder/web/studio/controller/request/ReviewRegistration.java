/*
 * Copyright (C) 2001 - 2009 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.studio.controller.request;

import java.util.Date;

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
 * @author TCSDEVELOPER
 * @version 1.0
 * @since Studio Release Assembly - Spec Review Sign up page v1.0
 */
public class ReviewRegistration extends ShortHibernateProcessor {

    /**
     * A <code>String</code> constant that stores the query name for the review_board_member query
     */
    private static final String REVIEW_BOARD_MEMBER_QUERY_NAME = "review_board_member";

    /**
     * This method executes the actual business logic for this processor.
     *
     * @throws Exception if any error occurs
     * @see com.topcoder.web.common.LongHibernateProcessor#dbProcessing()
     */
    protected void dbProcessing() throws Exception {
        // user must be logged in
        if (userLoggedIn()) {
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
        } else {
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));
        }

        setNextPage(getSessionInfo().getServletPath() + "?" + Constants.MODULE_KEY + "=" +
            ViewReviewOpportunities.MODULE_NAME);
        setIsNextPageInContext(false);
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
}
