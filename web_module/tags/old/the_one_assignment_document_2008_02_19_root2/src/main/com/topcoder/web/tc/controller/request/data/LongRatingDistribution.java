package com.topcoder.web.tc.controller.request.data;

import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.util.DBMS;


/**
 * @author  cucu
 */
public class LongRatingDistribution extends RatingDistribution {

    protected Request getDistributionRequest() {
        Request r = new Request();
        r.setContentHandle("dd_marathon_rating_distribution");
        return r;
    }

    protected String getDb() {
        return DBMS.DW_DATASOURCE_NAME;
    }

}



