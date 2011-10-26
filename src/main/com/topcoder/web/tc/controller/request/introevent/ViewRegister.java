package com.topcoder.web.tc.controller.request.introevent;

import com.topcoder.web.common.model.Event;
import com.topcoder.web.common.model.User;

/**
 *  Display a link to register, or if it's not possible to register (too early, too late, already registered or not eligible) it shows that reason.
 *  
 * @author Cucu
 *
 */
public class ViewRegister extends RegistrationBase {

    @Override
    protected void regProcessing(Event event, User user) throws Exception {
                
        getRequest().setAttribute("isEarly", isEarly());
        getRequest().setAttribute("isLate", isLate());
        getRequest().setAttribute("isRegistered", isRegistered());
        
        if (!isEarly() && !isLate() && !isRegistered()) {
            getRequest().setAttribute("isEligible", isEligible());            
        }
                
        setNextIntroEventPage("viewRegister.jsp");
        
    }

}
