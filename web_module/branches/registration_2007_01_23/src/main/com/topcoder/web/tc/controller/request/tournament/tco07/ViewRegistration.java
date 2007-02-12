package com.topcoder.web.tc.controller.request.tournament.tco07;

import com.topcoder.web.common.model.Event;
import com.topcoder.web.common.model.EventRegistration;
import com.topcoder.web.common.model.User;
import com.topcoder.web.tc.controller.request.tournament.ViewRegistrationBase;

/**
 * @author dok, pulky
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Jan 16, 2007
 */
public class ViewRegistration extends ViewRegistrationBase {
    
    protected final String getEventShortDesc() {
        return "tco07" + getRequest().getParameter("ct");
    }

    protected void alreadyRegisteredProcessing(EventRegistration er) {
        getRequest().setAttribute("ct", getRequest().getParameter("ct"));
    }
    
    public boolean isEligible(Event e, User u) throws Exception{
        return true;
    }
}
