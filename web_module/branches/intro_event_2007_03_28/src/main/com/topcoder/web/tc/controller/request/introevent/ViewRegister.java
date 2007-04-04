package com.topcoder.web.tc.controller.request.introevent;

import com.topcoder.web.common.model.Event;
import com.topcoder.web.common.model.EventType;
import com.topcoder.web.common.model.User;

public class ViewRegister extends RegistrationBase {

    @Override
    protected void regProcessing(Event event, User user) throws Exception {
        
        getRequest().setAttribute("isComp", getEvent().equals(EventType.INTRO_EVENT_COMP_ID));
        getRequest().setAttribute("isAlgo", getEvent().equals(EventType.INTRO_EVENT_ALGO_ID));
        
        getRequest().setAttribute("isEarly", isEarly());
        getRequest().setAttribute("isLate", isLate());
        getRequest().setAttribute("isRegistered", isRegistered());
        
        if (!isEarly() && !isLate() && !isRegistered()) {
            getRequest().setAttribute("isEligible", isEligible());            
        }
                
        setNextIntroEventPage("viewRegister.jsp");
        
    }

}
