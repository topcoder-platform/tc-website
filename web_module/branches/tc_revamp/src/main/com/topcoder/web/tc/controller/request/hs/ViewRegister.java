package com.topcoder.web.tc.controller.request.hs;

import java.util.Date;

import com.topcoder.shared.security.ClassResource;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.model.CoderType;
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
        if (!userLoggedIn()) {
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));
        } 
        
        Integer seasonId = null;
        if (getRequest().getParameter(Constants.SEASON_ID) != null) {
            seasonId = new Integer(getRequest().getParameter(Constants.SEASON_ID));
        }
        
        boolean eligible = true;
        boolean alreadyRegistered = false;
        boolean registeredHs = true;
        boolean existSeason = true;
        boolean regOpen = true;
        
        User u = DAOUtil.getFactory().getUserDAO().find(new Long(getUser().getId()));
        Integer hsStatus = getHSGroupStatus(u);

        Season season;
        if (seasonId == null) {
            season = DAOUtil.getFactory().getSeasonDAO().findCurrent(Season.HS_SEASON);
        } else {
            season = DAOUtil.getFactory().getSeasonDAO().find(seasonId);
        }
        
        getRequest().setAttribute("season", season);

        if (SecurityGroup.INACTIVE.equals(hsStatus) ||
                CoderType.PROFESSIONAL.equals(u.getCoder().getCoderType().getId())) {
            eligible = false;
        } else if (SecurityGroup.ACTIVE.equals(hsStatus)) {
            if (season == null) {
                existSeason = false;
            } else {
                Event e = season.getEvent();
                Date now = new Date();

                getRequest().setAttribute("questions", new java.util.ArrayList(e.getSurvey().getQuestions()));
              
                if (e.getRegistrationStart().after(now) || e.getRegistrationEnd().before(now)) {
                    regOpen = false;
                } else {                    
                    EventRegistration registration = DAOUtil.getFactory().getEventRegistrationDAO().find(u.getId(), e.getId());
                    
                    if (registration != null) {
                        if (registration.isEligible()) {
                            alreadyRegistered = true;
                        } else {
                            eligible = false;
                        }
                    }                    
                }
            }                        
        } else {
            registeredHs = false;
        }

        getRequest().setAttribute("eligible", eligible);
        getRequest().setAttribute("alreadyRegistered", alreadyRegistered);
        getRequest().setAttribute("registeredHs", registeredHs);
        getRequest().setAttribute("existSeason", existSeason);
        getRequest().setAttribute("regOpen", regOpen);
        
        setNextPage(Constants.HS_VIEW_REGISTER);
        setIsNextPageInContext(true);
    } 

}
