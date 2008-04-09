package com.topcoder.web.tc.controller.request.data;

import com.topcoder.shared.dataAccess.Request;
import com.topcoder.web.common.model.SoftwareComponent;
import com.topcoder.web.tc.Constants;

/**
 * @author dok
 * @version $Revision$ $Date$
 *          Create Date: Jul 27, 2005
 */
public class DesignRatingDistribution extends RatingDistribution {

    protected Request getDistributionRequest() {
        Request r = new Request();
        r.setContentHandle("dd_component_rating_distribution");
        r.setProperty(Constants.PHASE_ID, String.valueOf(SoftwareComponent.DESIGN_PHASE));
        return r;
    }

    protected int getDb() {
        return Constants.TCS_DW_DATASOURCE_ID;
    }

}



