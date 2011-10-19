/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.studio.controller.request;

import java.util.HashMap;
import java.util.Map;

import com.topcoder.shared.dataAccess.DataAccess;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.security.ClassResource;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.ShortHibernateProcessor;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.TCRequest;
import com.topcoder.web.common.WebConstants;
import com.topcoder.web.studio.Constants;
import com.topcoder.web.studio.dao.DAOUtil;
import com.topcoder.web.studio.dto.Resource;
import com.topcoder.web.studio.dto.ResourceInfo;
import com.topcoder.web.studio.dto.Review;
import com.topcoder.web.studio.dto.ReviewItem;
import com.topcoder.web.studio.util.Util;

/**
 * <p>This class will process a view scorecard details request.</p>
 * 
 * @author TCSASSEBMER
 * @version 1.0
 * @since Replatforming Studio Release 5
 */
public class ViewScorecardDetails extends ShortHibernateProcessor {
    /**
     * The name of the query used to check whether a user has permission to view a scorecard in studio site.
     */
    private static final String CAN_VIEW_SCORECARD_DETAILS_QUERY_NAME = "studio_can_view_scorecard_details";
    
    /**
     * The id of the resource info type representing the user id of the resource. 
     */
    private static final long EXTERNAL_REFERENCE_ID_RESOURCE_INFO_TYPE_ID = 1;
    
    /**
     * A <code>String</code> constant that stores the review scorecard details jsp file path
     */
    private static final String REVIEW_SCORECARD_DETAILS_JSP = "/scorecardDetails.jsp";
    
    /**
     * Empty constructor.
     */
    public ViewScorecardDetails() {
        super();
    }
    
    /**
     * This method executes the actual business logic for this processor.
     * 
     * @throws Exception if any error occurs
     */
    @Override
    protected void dbProcessing() throws Exception {
        TCRequest request = getRequest();
        String reviewId = request.getParameter(WebConstants.REVIEW_ID);
        if ("".equals(StringUtils.checkNull(reviewId))) {
            throw new NavigationException("No review specified");
        }
        
        Long rid;
        try {
            rid = new Long(reviewId);
        } catch (NumberFormatException e) {
            throw new NavigationException("Invalid review specified");
        }
        
        if (!userLoggedIn()) {
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));
        }
        
        Review review = DAOUtil.getFactory().getReviewDAO().find(rid);
        if (review == null) {
            throw new NavigationException("Cannot find the review");
        }
        
        // check whether the user has permission to view the review
        checkPermission(review);
        
        Map<Long, ReviewItem> questionReviewItemMap = new HashMap<Long, ReviewItem>();
        for (ReviewItem reviewItem : review.getItems()) {
            questionReviewItemMap.put(reviewItem.getQuestionId(), reviewItem);
        }
        
        // Submitter id of the review
        request.setAttribute("submitter", getResourceUserId(review.getSubmission().getUpload().getResource()));
        // reviewer owner id
        request.setAttribute("reviewer", getResourceUserId(review.getAuthor()));
        request.setAttribute("review", review);
        request.setAttribute("questionReviewItemMap", questionReviewItemMap);
        
        setNextPage(REVIEW_SCORECARD_DETAILS_JSP);
        setIsNextPageInContext(true);
    }

    /**
     * Gets the user id of a specified resource.
     * 
     * @param resource the specified resource
     * @return the user id of a specified resource
     */
    private static Long getResourceUserId(Resource resource) {
        for (ResourceInfo info : resource.getInfo()) {
            if (info.getId().getTypeId().longValue() == EXTERNAL_REFERENCE_ID_RESOURCE_INFO_TYPE_ID) {
                return new Long(info.getValue());
            }
        }
        return 0L;
    }
    
    /**
     * Checks whether the user has permission to view a specified review.
     *
     * @param review the specified review.
     * @throws Exception if any error occrus
     */
    private void checkPermission(Review review) throws Exception {
        if (!review.getCommitted()) {
            throw new NavigationException("Cannot view the uncommitted review");
        }
        
        // only Screening scorecard and Milestone Screening scorecard can be viewed in Studio site
        String scorecardType = review.getScorecard().getType().getName();
        if (!("Screening".equals(scorecardType) || "Milestone Screening".equals(scorecardType))) {
            throw new NavigationException(scorecardType + " scorecard can't be viewed in Studio");
        }
        
        long userId = getUser().getId();
        if (Util.isAdmin(userId)) {
            // Admin can view all the reviews
            return;
        }
        
        // using query to check the permission
        DataAccess da = new DataAccess(DBMS.TCS_OLTP_DATASOURCE_NAME);
        Request r = new Request();
        r.setContentHandle(CAN_VIEW_SCORECARD_DETAILS_QUERY_NAME);
        r.setProperty(Constants.USER_ID, String.valueOf(userId));
        r.setProperty(Constants.REVIEW_ID, String.valueOf(review.getId()));
        ResultSetContainer rsc = da.getData(r).get(CAN_VIEW_SCORECARD_DETAILS_QUERY_NAME);
        if (rsc.size() > 0) {
            return;
        }
        
        throw new NavigationException("You have no permission to view the review");
    }
}
