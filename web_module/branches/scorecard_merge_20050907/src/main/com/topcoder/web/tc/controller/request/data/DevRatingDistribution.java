package com.topcoder.web.tc.controller.request.data;

import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.tc.model.SoftwareComponent;

/**
 * @author  dok
 * @version  $Revision$ $Date$
 * Create Date: Jul 27, 2005
 */
public class DevRatingDistribution extends RatingDistribution {

    protected Request getDistributionRequest() {
        Request r = new Request();
        r.setContentHandle("dd_component_rating_distribution");
        r.setProperty("pi", String.valueOf(SoftwareComponent.DEV_PHASE));
        return r;
    }

    protected String getDb() {
        return DBMS.TCS_DW_DATASOURCE_NAME;
    }

}



