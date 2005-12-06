package com.topcoder.web.tc.controller.request.collegetour;

import com.topcoder.shared.dataAccess.Request;
import com.topcoder.web.tc.Constants;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Dec 5, 2005
 */
public class Registrants extends Base {

    protected void collegeTourProcessing() throws Exception {
        Request r = new Request();
        r.setContentHandle("college_tour_registrants");
        r.setProperty(Constants.COLLEGE_TOUR_EVENT_ID, String.valueOf(getEventId()));
        getRequest().setAttribute("registrants", getDataAccess().getData(r).get("college_tour_registrants"));
        setNextPage("/collegetour/registrants.jsp");
        setIsNextPageInContext(true);
    }
}
