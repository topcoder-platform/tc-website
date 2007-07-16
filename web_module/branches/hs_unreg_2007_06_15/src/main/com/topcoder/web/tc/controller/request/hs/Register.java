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
import com.topcoder.web.common.validation.StringInput;
import com.topcoder.web.common.validation.ValidationResult;
import com.topcoder.web.reg.Constants;
import com.topcoder.web.reg.controller.request.Secondary;
import com.topcoder.web.reg.validation.AgeValidator;
import com.topcoder.web.reg.validation.AttendingHSValidator;

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

        // retrieve the season
        Integer seasonId = new Integer(getRequest().getParameter(com.topcoder.web.tc.Constants.SEASON_ID));
        Season season = DAOUtil.getFactory().getSeasonDAO().find(seasonId);

        if (season == null) {
            throw new NavigationException("Invalid season_id");
        }
        
        // check that the user has filled the fields
        ValidationResult result = new AgeValidator().validate(new StringInput(getRequest().getParameter(Constants.AGE)));
        if (!result.isValid()) {
            addError(Constants.AGE, result.getMessage());
        }
        
        result = new AgeValidator().validate(new StringInput(getRequest().getParameter(Constants.AGE_END_SEASON)));
        if (!result.isValid()) {
            addError(Constants.AGE_END_SEASON, result.getMessage());
        }

        result = new AttendingHSValidator().validate(new StringInput(getRequest().getParameter(Constants.ATTENDING_HS)));
        if (!result.isValid()) {
            addError(Constants.ATTENDING_HS, result.getMessage());
        }

        if (!hasError(Constants.AGE) && !hasError(Constants.AGE_END_SEASON)) {
            int age = Integer.parseInt((String) getRequest().getParameter(Constants.AGE));
            int ageEndSeason = Integer.parseInt((String) getRequest().getParameter(Constants.AGE_END_SEASON));
            int dif = ageEndSeason - age;
           
            if (dif != 0 && dif != 1) {
                addError(Constants.AGE, "Please check the age.");
                addError(Constants.AGE_END_SEASON, "Please check the age.");
            }
            
        }

        
        if (hasErrors()) {
            getRequest().setAttribute("confirmRegistration", false);        
            getRequest().setAttribute("eligible", true);
            getRequest().setAttribute("alreadyRegistered", false);
            getRequest().setAttribute("registeredHs", true);
            getRequest().setAttribute("existSeason", true);
            getRequest().setAttribute("regOpen", true);
            getRequest().setAttribute("season", season);
            
            setDefault(Constants.AGE, getRequest().getParameter(Constants.AGE));
            setDefault(Constants.AGE_END_SEASON, getRequest().getParameter(Constants.AGE_END_SEASON));
            setDefault(Constants.ATTENDING_HS, getRequest().getParameter(Constants.ATTENDING_HS));
            setNextPage(com.topcoder.web.tc.Constants.HS_VIEW_REGISTER);
            setIsNextPageInContext(true);
            return;
        }
        
        

        // Check that the user is eligible, just in case he fakes the URL
        User u = DAOUtil.getFactory().getUserDAO().find(new Long(getUser().getId()));

        Integer hsStatus = getHSGroupStatus(u);
        
       
        if (!SecurityGroup.ACTIVE.equals(hsStatus)) {
            throw new NavigationException("You're not eligible for High School");
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

        int ageHs = Integer.parseInt(getRequest().getParameter(Constants.AGE));
        int ageEndSeason = Integer.parseInt(getRequest().getParameter(Constants.AGE_END_SEASON));
        boolean attendingHS = "yes".equals(getRequest().getParameter(Constants.ATTENDING_HS));
        
        boolean eligible = Secondary.isEligibleHS(ageHs, ageEndSeason, attendingHS);
        
        EventRegistration er = new EventRegistration();
        er.setId(new EventRegistration.Identifier(u,event));
        er.setEligible(eligible);

        if (!eligible) {
           er.setNotes("From HS Register: Age: " + ageHs + ", age at the end of season: " + ageEndSeason + ", attending HS: " + attendingHS);
        }
       
        u.addEventRegistration(er);

        DAOUtil.getFactory().getUserDAO().saveOrUpdate(u);            

        // If the user is not eligible, mark him as inactive in security groups.
        if (!eligible) {
            log.info("user " + u.getId()+  " is not eligible. Age: " + ageHs + ", age at the end of season: " + ageEndSeason +
                    ", attending HS: " + attendingHS);
            inactivateHsUser(u);
        }
        
        markForCommit();

        getRequest().setAttribute("season", season);
        getRequest().setAttribute("confirmRegistration", true);        
        getRequest().setAttribute("eligible", eligible);        

        setNextPage(com.topcoder.web.tc.Constants.HS_VIEW_REGISTER);
        setIsNextPageInContext(true);
    } 


}
