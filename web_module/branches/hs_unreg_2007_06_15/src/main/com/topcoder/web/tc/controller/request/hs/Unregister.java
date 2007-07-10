package com.topcoder.web.tc.controller.request.hs;

import java.util.List;

import com.topcoder.shared.security.ClassResource;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.model.Event;
import com.topcoder.web.common.model.EventRegistration;
import com.topcoder.web.common.model.Season;
import com.topcoder.web.common.model.User;
import com.topcoder.web.tc.Constants;


/**
 * Unregister a coder from HS and the current HS season.
 * 
 * @author cucu
 */
public class Unregister extends RegistrationBase {

    @SuppressWarnings("unchecked")
    @Override
    protected void dbProcessing() throws Exception {
        if (!userLoggedIn()) {
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));
        } 

        // Check that the user is eligible, just in case he fakes the URL
        User u = DAOUtil.getFactory().getUserDAO().find(new Long(getUser().getId()));
       
        List<Season> seasons = DAOUtil.getFactory().getSeasonDAO().findCurrentAndUpcoming(Season.HS_SEASON);
        for (Season season : seasons) {
            Event event =  season.getEvent(); 
            EventRegistration registration = DAOUtil.getFactory().getEventRegistrationDAO().find(u.getId(), event.getId());
            
            // If he was eligible for the current season, mark him as uneligible.
            if (registration != null && registration.isEligible()) {
                registration.setEligible(false);
                DAOUtil.getFactory().getUserDAO().saveOrUpdate(u);
                markForCommit();
            }
        }
                    
        inactivateHsUser(u);
        
        setNextPage(Constants.HS_UNREGISTER);
        setIsNextPageInContext(true);
    } 


}
