package com.topcoder.web.tc.controller.request.util;

import com.topcoder.web.common.model.Event;
import com.topcoder.web.common.model.EventRegistration;
import com.topcoder.web.common.model.User;

public class CSDN07ViewRegistration extends CSDN07RegistrationBase {

    protected void alreadyRegisteredProcessing(EventRegistration er) {
        setAlreadyRegistered(true);
    }

    protected void regProcessing(Event event, User user) {
      // not registered
    }


}
