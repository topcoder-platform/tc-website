package com.topcoder.web.tc.controller.request.data;

import com.topcoder.shared.dataAccess.Request;
import com.topcoder.web.common.model.SoftwareComponent;
import com.topcoder.web.tc.Constants;

/**
 * @author dok
 * @version $Revision: 70545 $ $Date$
 *          Create Date: Jul 27, 2005
 * @deprecated this class has been moved to its own module and will be removed in the future
 */
public class DevRatingDistribution extends RatingDistribution {

    protected Request getDistributionRequest() {
        Request r = new Request();
        r.setContentHandle("dd_component_rating_distribution");
        r.setProperty(Constants.PHASE_ID, String.valueOf(SoftwareComponent.DEV_PHASE));
        return r;
    }

    protected int getDb() {
        return Constants.TCS_DW_DATASOURCE_ID;
    }

}



