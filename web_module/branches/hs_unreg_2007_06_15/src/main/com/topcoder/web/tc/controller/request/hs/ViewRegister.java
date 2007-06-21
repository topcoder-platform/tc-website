package com.topcoder.web.tc.controller.request.hs;

import java.util.Set;

import com.topcoder.web.common.ShortHibernateProcessor;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.model.Event;
import com.topcoder.web.common.model.EventRegistration;
import com.topcoder.web.common.model.Season;
import com.topcoder.web.common.model.SecurityGroup;
import com.topcoder.web.common.model.User;
import com.topcoder.web.common.model.UserGroup;
import com.topcoder.web.tc.Constants;

/**
 *
 * @author cucu
 */
public class ViewRegister extends ShortHibernateProcessor {

    @SuppressWarnings("unchecked")
    @Override
    protected void dbProcessing() throws Exception {
        // if (userIdentified()) check
        
        boolean eligible = true;
        boolean alreadyRegistered = false;
        boolean registeredHs = true;
        boolean existSeason = true;
        
        User u = DAOUtil.getFactory().getUserDAO().find(new Long(getUser().getId()));

        Integer hsStatus = null;
        for (UserGroup sg : (Set<UserGroup>) u.getSecurityGroups()) {
            if (sg.getSecurityGroup().getGroupId() == 12) { // use constants!
                hsStatus = sg.getSecurityStatusId();
                break;
            }
        }
        
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
