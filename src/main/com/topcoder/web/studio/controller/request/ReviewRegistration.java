/*
 * Copyright (C) 2001 - 2009 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.studio.controller.request;

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
import com.topcoder.web.common.model.SpecReview;
import com.topcoder.web.common.model.SpecReviewReviewer;
import com.topcoder.web.common.model.SpecReviewStatus;
import com.topcoder.web.common.model.User;
import com.topcoder.web.studio.Constants;
import com.topcoder.web.studio.dao.StudioDAOFactory;
import com.topcoder.web.studio.dao.StudioDAOUtil;
import com.topcoder.web.studio.model.Contest;

/**
 * <p>This class will process a review registration request.</p>
 *
 * <p>ToDo.</p>
 *
 * @author TCSDEVELOPER
 * @version 1.0
 * @since Studio Release Assembly - Spec Review Sign up page v1.0
 */
public class ReviewRegistration extends ShortHibernateProcessor {

    /**
     * This method executes the actual business logic for this processor.
     *
     * @throws Exception if any error occurs
     * @see com.topcoder.web.common.LongHibernateProcessor#dbProcessing()
     */
    protected void dbProcessing() throws Exception {
        if (userLoggedIn()) {
            Long specReviewId;
            try {
                specReviewId = new Long(getRequest().getParameter(Constants.SPEC_REVIEW_ID));
            } catch (NumberFormatException e) {
                throw new NavigationException("Invalid Specification Review Id Specified");
            }

            // get Specification Review
            StudioDAOFactory cFactory = StudioDAOUtil.getFactory();
            DAOFactory factory = DAOUtil.getFactory();
            SpecReview specReview = factory.getSpecReviewDAO().find(specReviewId);
            if (specReview == null) {
                throw new NavigationException("Specification Review Specified doesn't exist");                
            }

            // get associated studio contest
            Contest c = cFactory.getContestDAO().find(specReview.getContestId());
            if (c == null) {
                throw new NavigationException("Invalid Specification Review Specified");                
            }

            // check if the user is part of the review board
            if (userInReviewBoard(getUser().getId(), c.getType().getId())) {
                // we are all set, register the user for this review
                // update specification review status to REVIEWER_ASSIGNED
                specReview.setSpecReviewStatus(new SpecReviewStatus(SpecReviewStatus.REVIEWER_ASSIGNED));
                
                // create spec_review_reviewer_xref row
                User u = factory.getUserDAO().find(getUser().getId());
                SpecReviewReviewer specReviewReviewer = new SpecReviewReviewer(specReview, u, 
                    SpecReviewReviewer.ACTIVE);
                specReview.getSpecReviewers().add(specReviewReviewer);
                
                // insert to user_permission_grant
                // ToDo pulky!!!
            } else {
                throw new NavigationException("Sorry, you are not authorized to perform specification reviews for " + 
                    c.getType().getDescription() + " contests.");
            }
        } else {
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));
        }

        setNextPage("/reviewOpportunities.jsp");
        setIsNextPageInContext(true);
    }

    /**
     * Private helper method to check if a user is in the review board of a certain contest type
     * 
     * @param userId the user id to query
     * @param contestTypeId the contest type id to query
     * @return true if the user is an active reviewer for the specified contest type
     * @throws Exception if an error occurs in the underlying layer
     */
    private boolean userInReviewBoard(long userId, Integer contestTypeId) throws Exception {
        DataAccess da = new CachedDataAccess(DBMS.STUDIO_DATASOURCE_NAME);
        Request r = new Request();
        r.setContentHandle("review_board_member");

        r.setProperty(Constants.USER_ID, String.valueOf(userId));
        r.setProperty(Constants.CONTEST_TYPE, contestTypeId.toString());

        ResultSetContainer rsc = da.getData(r).get("review_board_member");
        
        if (rsc.size() == 0) {
            return false;
        }

        return true;
    }
}
