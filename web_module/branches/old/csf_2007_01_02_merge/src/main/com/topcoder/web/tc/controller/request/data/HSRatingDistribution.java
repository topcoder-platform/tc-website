package com.topcoder.web.tc.controller.request.data;

import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.util.DBMS;


/**
 * @author  cucu
 * @version  $Revision$ $Date$
 * Create Date: May 30, 2006
 */
public class HSRatingDistribution extends RatingDistribution {

    protected Request getDistributionRequest() {
        Request r = new Request();
        r.setContentHandle("dd_hs_algorithm_rating_distribution");
        return r;
    }

    protected String getDb() {
        return DBMS.DW_DATASOURCE_NAME;
    }

}



