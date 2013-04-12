/*
 * Copyright (C) 2012 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.studio.controller.request;

import com.topcoder.shared.security.ClassResource;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.studio.Constants;
import com.topcoder.web.studio.dao.DAOUtil;
import com.topcoder.web.studio.dto.Project;

/**
 * <p>This class will show the required terms of use when user try to register a review position.</p>
 *
 * @author flexme
 * @version 1.0
 */
public class ViewReviewTerms extends ReviewRegistration {
    /**
     * This method executes the actual business logic for this processor.
     *
     * @throws Exception if any error occurs
     * @see com.topcoder.web.common.LongHibernateProcessor#dbProcessing()
     */
    protected void dbProcessing() throws Exception {
        // user must be logged in
        if (userLoggedIn()) {
            boolean isSpecReview = getRequest().getParameter(Constants.MODULE_KEY).equals("SpecViewReviewTerms");
            getRequest().setAttribute("isSpecReview", isSpecReview);
            
            long contestId;
            try {
                contestId = new Long(getRequest().getParameter(Constants.CONTEST_ID));
            } catch (NumberFormatException e) {
                throw new NavigationException("Invalid Contest Id Specified");
            }
            
            // Check project for presence
            Project project = DAOUtil.getFactory().getProjectDAO().find((int) contestId);
            if (project == null) {
                throw new NavigationException("The specified project doesn't exist");
            }
            
            // check if the user is part of the review board
            if (!userInORReviewBoard(getUser().getId(), project.getCategoryId())) {
                throw new NavigationException("Sorry, you are not a member of the review board.");
            }
            
            getRequest().setAttribute("contest", project);
            // Get current user ID
            long userId = getUser().getId();
            
            String termsOfUseId = StringUtils.checkNull(getRequest().getParameter(Constants.TERMS_OF_USE_ID));
            processTermsOfUse(String.valueOf(contestId), userId,
                    isSpecReview ? new Integer[] {SPECIFICATION_REVIEWER_ROLE_ID} : new Integer[] {SCREENER_ROLE_ID, CHECKPOINT_SCREENER_ROLE_ID},
                    "".equals(termsOfUseId) ? -1 : Long.parseLong(termsOfUseId));

            setNextPage("/reviewerReg.jsp");
            setIsNextPageInContext(true);
        } else {
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));
        }
    }
}
