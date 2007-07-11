package com.topcoder.web.tc.controller.request.hs;

import java.util.Date;

import com.topcoder.shared.security.ClassResource;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.model.Event;
import com.topcoder.web.common.model.EventRegistration;
import com.topcoder.web.common.model.Season;
import com.topcoder.web.common.model.SecurityGroup;
import com.topcoder.web.common.model.User;
import com.topcoder.web.reg.Constants;

/**
 * Register an user for the current HS season.
 * @author cucu
 */
public class Register extends RegistrationBase {

    @SuppressWarnings("unchecked")
    @Override
    protected void dbProcessing() throws Exception {
        if (!userLoggedIn()) {
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));
        } 

        Integer seasonId = null;
        if (getRequest().getParameter(com.topcoder.web.tc.Constants.SEASON_ID) != null) {
            seasonId = new Integer(getRequest().getParameter(com.topcoder.web.tc.Constants.SEASON_ID));
        }

        // Check that the user is eligible, just in case he fakes the URL
        User u = DAOUtil.getFactory().getUserDAO().find(new Long(getUser().getId()));

        Integer hsStatus = getHSGroupStatus(u);
        
       
        if (!SecurityGroup.ACTIVE.equals(hsStatus)) {
            throw new NavigationException("You're not eligible for High School");
        }
        
        Season season;
        if (seasonId == null) {
            season = DAOUtil.getFactory().getSeasonDAO().findCurrent(Season.HS_SEASON);
        } else {
            season = DAOUtil.getFactory().getSeasonDAO().find(seasonId);
        }

        if (season == null) {
            throw new NavigationException("Invalid season_id");
        }
        Event event = season.getEvent();
        
        Date now = new Date();
        if (event.getRegistrationStart().after(now) || event.getRegistrationEnd().before(now)) {
            throw new  NavigationException("Registration not open");
        }
        
        EventRegistration registration = DAOUtil.getFactory().getEventRegistrationDAO().find(u.getId(), event.getId());
        
        if (registration != null) {
            throw new NavigationException("You're not eligible for High School or already registered");            
        }
                                
        int ageHs = Integer.parseInt(getRequest().getParameter(Constants.AGE_FOR_HS));

        boolean eligible = "yes".equals(getRequest().getParameter(Constants.ATTENDING_HS)) && ageHs < Constants.MAX_AGE_FOR_HS;

        u.addEventRegistration(event, null, eligible);
        DAOUtil.getFactory().getUserDAO().saveOrUpdate(u);            

        // If the user is not eligible, mark him as inactive in security groups.
        if (!eligible) {
            inactivateHsUser(u);
        }
        
        markForCommit();

        getRequest().setAttribute("season", season);
        getRequest().setAttribute("confirmRegistration", true);        

        setNextPage(com.topcoder.web.tc.Constants.HS_VIEW_REGISTER);
        setIsNextPageInContext(true);
    } 


}
