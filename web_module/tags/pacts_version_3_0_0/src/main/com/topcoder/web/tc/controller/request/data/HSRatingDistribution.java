package com.topcoder.web.tc.controller.request.data;

import com.topcoder.shared.dataAccess.Request;
import com.topcoder.web.tc.Constants;


/**
 * @author cucu
 * @version $Revision$ $Date$
 *          Create Date: May 30, 2006
 */
public class HSRatingDistribution extends RatingDistribution {

    protected Request getDistributionRequest() {
        Request r = new Request();
        r.setContentHandle("dd_hs_algorithm_rating_distribution");
        return r;
    }

    protected int getDb() {
        return Constants.DW_DATASOURCE_ID;
    }

}



