package com.topcoder.web.tc.controller.request.util;

import com.topcoder.web.common.model.Event;
import com.topcoder.web.common.model.User;
import com.topcoder.web.tc.controller.request.tournament.RegistrationBase;

public abstract class CSDN07RegistrationBase extends RegistrationBase {

    protected String getEventShortDesc() {
        return "csdn07";
    }

    public boolean isEligible(Event event, User user) throws Exception {
        return user.getHomeAddress().getCountry().getName().equalsIgnoreCase("china");
    }

    protected void setNextPage(Event event, User user) {
        setNextPage("/csdn07/viewRegistration.jsp");
        setIsNextPageInContext(true);
    }

}
