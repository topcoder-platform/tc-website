package com.topcoder.web.tc.controller.request.util;

import com.topcoder.web.common.model.Event;
import com.topcoder.web.common.model.EventRegistration;
import com.topcoder.web.common.model.User;
import com.topcoder.web.tc.controller.request.tournament.RegistrationBase;

public class CSDN07Registration extends RegistrationBase {

    protected void alreadyRegisteredProcessing(EventRegistration er) {
        log.debug("alreadyRegisteredProcessing"); // nothing to do here?
    }

    protected String getEventShortDesc() {
        return "csdn07";
    }

    public boolean isEligible(Event event, User user) throws Exception {
        return user.getHomeAddress().getCountry().getName().equalsIgnoreCase("china");
    }

    protected void regProcessing(Event event, User user) {
        log.debug("regProcessing"); // nothing to do here?
    }

    protected void setNextPage(Event event, User user) {
        setNextPage("/fixme.jsp");
        setIsNextPageInContext(true);
    }

}
