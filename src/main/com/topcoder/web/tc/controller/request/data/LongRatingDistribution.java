package com.topcoder.web.tc.controller.request.data;

import com.topcoder.shared.dataAccess.Request;
import com.topcoder.web.tc.Constants;


/**
 * @author cucu
 * @deprecated this class has been moved to its own module and will be removed in the future
 */
public class LongRatingDistribution extends RatingDistribution {

    protected Request getDistributionRequest() {
        Request r = new Request();
        r.setContentHandle("dd_marathon_rating_distribution");
        return r;
    }

    protected int getDb() {
        return Constants.DW_DATASOURCE_ID;
    }

}



