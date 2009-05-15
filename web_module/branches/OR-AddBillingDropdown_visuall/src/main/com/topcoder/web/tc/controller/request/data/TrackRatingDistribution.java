/*
 * Copyright (c) 2009 TopCoder, Inc. All rights reserved.
 */
package com.topcoder.web.tc.controller.request.data;

import com.topcoder.web.tc.Constants;
import com.topcoder.shared.dataAccess.Request;

/**
 * <p>
 * A new generic processor need be created to generate XML response for rating distribution which will
 * be used by flash to draw graph.
 * </p>
 *
 * @author TCSDEVELOPER
 * @version 1.0
 */
public class TrackRatingDistribution extends RatingDistribution {

    /**
     * <p>
     * Get the rating distribution of the given track.
     * </p>
     */
    protected Request getDistributionRequest() {
        Request r = new Request();
        r.setContentHandle("dd_component_rating_distribution");
        r.setProperty(Constants.PHASE_ID, String.valueOf(getRequest().getParameter(Constants.PHASE_ID)));
        return r;
    }

    /**
     * <p>
     * Get the data source id.
     * </p>
     */
    protected int getDb() {
        return Constants.TCS_DW_DATASOURCE_ID;
    }
}
