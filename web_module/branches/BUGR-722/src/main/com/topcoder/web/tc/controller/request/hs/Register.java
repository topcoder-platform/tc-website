package com.topcoder.web.tc.controller.request.hs;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.topcoder.shared.security.ClassResource;
import com.topcoder.web.common.HSRegistrationHelper;
import com.topcoder.web.common.NavigationException;
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
 * Register an user for the current HS season.
 * 
 * @author cucu
 */
public class Register extends RegistrationBase {

    @SuppressWarnings("unchecked")
    @Override
    protected void dbProcessing() throws Exception {
        if (!userLoggedIn()) {
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));
        } 

        // retrieve the season
        Integer seasonId = new Integer(getRequest().getParameter(com.topcoder.web.tc.Constants.SEASON_ID));
        Season season = DAOUtil.getFactory().getSeasonDAO().find(seasonId);

        if (season == null) {
            throw new NavigationException("Invalid season_id");
        }
        
        HSRegistrationHelper rh = new HSRegistrationHelper(getRequest());

        List<String[]> valResults = rh.validateQuestions(season);
        for (String[] result : valResults) {
            addError(result[0], result[1]);
        }

        Event event = season.getEvent();
        User u = DAOUtil.getFactory().getUserDAO().find(new Long(getUser().getId()));

        
        if (hasErrors()) {
            getRequest().setAttribute("eligible", true);
            getRequest().setAttribute("alreadyRegistered", false);
            getRequest().setAttribute("registeredHs", true);
            getRequest().setAttribute("existSeason", true);
            getRequest().setAttribute("regOpen", true);
            getRequest().setAttribute("season", season);
            
            //setDefaults(responsesMap.values());
            List<Object[]> defaults = rh.getDefaults();
            for (Object[] d : defaults) {
                setDefault((String) d[0], d[1]);
            }                

            getRequest().setAttribute("questions", new ArrayList(season.getEvent().getSurvey().getQuestions()));
            
            setNextPage(com.topcoder.web.tc.Constants.HS_VIEW_REGISTER);
            setIsNextPageInContext(true);
            return;
        }
               

        // Check that the user is eligible, just in case he fakes the URL
        Integer hsStatus = getHSGroupStatus(u);
        
       
        if (!SecurityGroup.ACTIVE.equals(hsStatus) || CoderType.PROFESSIONAL.equals(u.getCoder().getCoderType().getId())) {
            throw new NavigationException("You're not eligible for High School");
        }
        
        
        Date now = new Date();
        if (event.getRegistrationStart().after(now) || event.getRegistrationEnd().before(now)) {
            throw new  NavigationException("Registration not open");
        }
        
        EventRegistration registration = DAOUtil.getFactory().getEventRegistrationDAO().find(u.getId(), event.getId());
        
        if (registration != null) {
            throw new NavigationException("You're not eligible for High School or already registered");            
        }

        boolean eligible = rh.isEligibleHS(season);

        // If the user is not eligible, mark him as inactive in security groups.
        if (eligible) {
            rh.registerForSeason(u, season);            
        } else {
            rh.inactivateUser(u, season);
        }
        
        markForCommit();

        String nextPage = getSessionInfo().getServletPath() + "?" + 
                    Constants.MODULE_KEY + "=HSRegistrationResult&" +
                    Constants.SEASON_ID + "=" + season.getId() + "&" +
                    RegistrationResult.SUCCESS + "=" + (eligible? "1" : "0");

        setNextPage(nextPage);

        setIsNextPageInContext(false);
    } 

}
