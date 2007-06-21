package com.topcoder.web.tc.controller.request.hs;

import com.topcoder.shared.security.ClassResource;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.model.Event;
import com.topcoder.web.common.model.EventRegistration;
import com.topcoder.web.common.model.Season;
import com.topcoder.web.common.model.SecurityGroup;
import com.topcoder.web.common.model.User;
import com.topcoder.web.tc.Constants;

/**
 * Check if the user is in conditions for registering to an hs season and if so,
 * displays a page asking the age and if he'll be in school at the end of the season.
 * Then, if he's eligible he'll be registered.
 * 
 * @author cucu
 */
public class ViewRegister extends RegistrationBase {

    @SuppressWarnings("unchecked")
    @Override
    protected void dbProcessing() throws Exception {
        if (!userIdentified()) {
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));
        } 
        
        boolean eligible = true;
        boolean alreadyRegistered = false;
        boolean registeredHs = true;
        boolean existSeason = true;
        
        User u = DAOUtil.getFactory().getUserDAO().find(new Long(getUser().getId()));
        Integer hsStatus = getHSGroupStatus(u);

        if (SecurityGroup.ACTIVE.equals(hsStatus)) {
            Season season =  DAOUtil.getFactory().getSeasonDAO().findCurrent(Season.HS_SEASON); 
            if (season == null) {
                existSeason = false;
            } else {
                Event e = season.getEvent();
                EventRegistration registration = DAOUtil.getFactory().getEventRegistrationDAO().find(u.getId(), e.getId());
                
                if (registration != null) {
                    if (registration.isEligible()) {
                        alreadyRegistered = true;
                    } else {
                        eligible = false;
                    }
                }
                
                getRequest().setAttribute("season", season);
            }                        
        } else if (SecurityGroup.INACTIVE.equals(hsStatus)) {
            eligible = false;
        } else {
            registeredHs = false;
        }

        getRequest().setAttribute("eligible", eligible);
        getRequest().setAttribute("alreadyRegistered", alreadyRegistered);
        getRequest().setAttribute("registeredHs", registeredHs);
        getRequest().setAttribute("existSeason", existSeason);
        
        setNextPage(Constants.HS_VIEW_REGISTER);
        setIsNextPageInContext(true);
    } 

}
