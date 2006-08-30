package com.topcoder.web.tc.controller.request.data;

import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.util.DBMS;


/**
 * @author  dok
 * @version  $Revision$ $Date$
 * Create Date: Jul 26, 2005
 */
public class AlgRatingDistribution extends RatingDistribution {

    protected Request getDistributionRequest() {
        Request r = new Request();
        r.setContentHandle("dd_algorithm_rating_distribution");
        return r;
    }

    protected String getDb() {
        return DBMS.DW_DATASOURCE_NAME;
    }

}



