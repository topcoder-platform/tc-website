/*
 * Copyright (c) 2001-2012 TopCoder Inc.  All Rights Reserved.
 */
package com.topcoder.web.tc.controller.request.dr;

import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.common.TCWebException;

/**
 * Copyright (c) 2001-2008 TopCoder, Inc. All rights reserved.
 * Only for use in connection with a TopCoder competition.
 *
 * @author pulky
 * @version $Id$
 * Create Date: Jul 4, 2008
 */
public class PointsDetail extends BaseBoardV2 {

    /* (non-Javadoc)
     * @see com.topcoder.web.common.BaseProcessor#businessProcessing()
     */
    @Override
    protected void businessProcessing() throws Exception {

        int trackId = Integer.parseInt(getRequest().getParameter(Constants.TRACK_ID));
        getRequest().setAttribute(Constants.TRACK_ID, trackId);
        int userId = Integer.parseInt(getRequest().getParameter(Constants.CODER_ID));
        getRequest().setAttribute(Constants.CODER_ID, userId);
        boolean potential = (Integer.parseInt(getRequest().getParameter(Constants.POTENTIAL_FLAG_ID)) == 1);
        getRequest().setAttribute(Constants.POTENTIAL_FLAG_ID, potential);

        // As of May 2012 the breakdown by contests for potential DR points is disabled for non-admins
        // to hide the submitters' information for ongoing contests to increase the review anonymity.
        if (potential && !getSessionInfo().isAdmin()) {
            throw new TCWebException("Breakdown by contests for potential DR points is not supported for non-admins.");
        }

        ResultSetContainer rsc = getPointsData(DBMS.TCS_DW_DATASOURCE_NAME, "dr_points_detail", trackId, userId, potential);

        TrackInfo trackInfo = getTrackDetails(trackId);            
        getRequest().setAttribute("trackInfo", trackInfo);

        getRequest().setAttribute("result", rsc);
        getRequest().setAttribute("isDesign", trackInfo.getTrackTypeId() == 1);
        getRequest().setAttribute("isDevelopment", trackInfo.getTrackTypeId() == 2);
        
        setNextPage("/dr/points_detail.jsp");
        setIsNextPageInContext(true);        
    }

}
