package com.topcoder.web.tc.controller.request.tournament.tchs07;

import com.topcoder.web.common.model.Event;
import com.topcoder.web.common.model.RegionType;
import com.topcoder.web.common.model.User;
import com.topcoder.web.tc.controller.request.tournament.ViewRegistrationBase;

/**
 * @author dok, pulky
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Jan 16, 2007
 */
public class ViewRegistration extends ViewRegistrationBase {
    
    protected final String getEventShortDesc() {
        return "tchs07";
    }

    protected void regProcessing(Event event, User user) throws Exception {
        RegionType rt = new RegionType();
        rt.setId(HIGH_SCHOOL_REGION_TYPE);
        
        getRequest().setAttribute("assignedRegion", user.getHomeAddress().getCountry().getRegionByType(rt).getName());
    }
}
