package com.topcoder.web.tc.controller.request.hs;

import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.model.Event;
import com.topcoder.web.common.model.EventRegistration;
import com.topcoder.web.common.model.Season;
import com.topcoder.web.common.model.User;
import com.topcoder.web.tc.Constants;


/**
 *
 * @author cucu
 */
public class Unregister extends RegistrationBase {

    @SuppressWarnings("unchecked")
    @Override
    protected void dbProcessing() throws Exception {

        // Check that the user is eligible, just in case he fakes the URL
        User u = DAOUtil.getFactory().getUserDAO().find(new Long(getUser().getId()));
       
        Event event =  DAOUtil.getFactory().getSeasonDAO().findCurrent(Season.HS_SEASON).getEvent(); 
        EventRegistration registration = DAOUtil.getFactory().getEventRegistrationDAO().find(u.getId(), event.getId());
        
        if (registration != null && registration.isEligible()) {
            registration.setEligible(false);
            DAOUtil.getFactory().getUserDAO().saveOrUpdate(u);
            markForCommit();
        }
                                
        inactivateHsUser(u);
        
        setNextPage(Constants.HS_UNREGISTER);
        setIsNextPageInContext(true);
    } 


}
