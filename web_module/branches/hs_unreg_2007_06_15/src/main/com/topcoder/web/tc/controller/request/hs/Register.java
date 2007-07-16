package com.topcoder.web.tc.controller.request.hs;

import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import com.topcoder.shared.security.ClassResource;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.model.Event;
import com.topcoder.web.common.model.QuestionStyle;
import com.topcoder.web.common.model.Response;
import com.topcoder.web.common.model.Season;
import com.topcoder.web.common.model.User;
import com.topcoder.web.common.tag.AnswerInput;
import com.topcoder.web.common.validation.StringInput;
import com.topcoder.web.common.validation.ValidationResult;
import com.topcoder.web.reg.Constants;
import com.topcoder.web.reg.validation.AgeValidator;
import com.topcoder.web.reg.validation.AttendingHSValidator;
import com.topcoder.web.tc.controller.request.survey.Helper;

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
        
        Event event = season.getEvent();
        User u = DAOUtil.getFactory().getUserDAO().find(new Long(getUser().getId()));

        
        Map<String,Response> responses = processSurvey(event, u);
        
        String ageStr = responses.get(AGE).getText();
        String ageEndSeasonStr = responses.get(AGE_END_SEASON).getText();
        String attendingStr = responses.get(IN_HIGH_SCHOOL).getAnswer().getText();
        
        // check that the user has filled the fields
        ValidationResult result = new AgeValidator().validate(new StringInput(ageStr));
        if (!result.isValid()) {
            addErrorQuestion(responses, AGE, result.getMessage());
        }
        
        result = new AgeValidator().validate(new StringInput(ageEndSeasonStr));
        if (!result.isValid()) {
            addErrorQuestion(responses, AGE_END_SEASON, result.getMessage());
        }

        result = new AttendingHSValidator().validate(new StringInput(attendingStr));
        if (!result.isValid()) {
            addErrorQuestion(responses, IN_HIGH_SCHOOL, result.getMessage());
        }

        // check that the ages are consistent
        if (!hasErrors()) {
            int age = Integer.parseInt(responses.get(AGE).getText());
            int ageEndSeason = Integer.parseInt(responses.get(AGE_END_SEASON).getText());
            int dif = ageEndSeason - age;
           
            if (dif != 0 && dif != 1) {
                addErrorQuestion(responses, AGE, "Please check the age.");
                addErrorQuestion(responses, AGE_END_SEASON, "Please check the age.");
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
            
            setDefaults(responses.values());
            getRequest().setAttribute("questions", new java.util.ArrayList(event.getSurvey().getQuestions()));
            
            //setDefault(Constants.AGE, getRequest().getParameter(Constants.AGE));
            //setDefault(Constants.AGE_END_SEASON, getRequest().getParameter(Constants.AGE_END_SEASON));
            //setDefault(Constants.ATTENDING_HS, getRequest().getParameter(Constants.ATTENDING_HS));
            setNextPage(com.topcoder.web.tc.Constants.HS_VIEW_REGISTER);
            setIsNextPageInContext(true);
            return;
        }
        
        /*

        // Check that the user is eligible, just in case he fakes the URL
        Integer hsStatus = getHSGroupStatus(u);
        
       
        if (!SecurityGroup.ACTIVE.equals(hsStatus)) {
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
*/
        getRequest().setAttribute("season", season);
        getRequest().setAttribute("confirmRegistration", true);        
//        getRequest().setAttribute("eligible", eligible);        
        getRequest().setAttribute("eligible", true);

        setNextPage(com.topcoder.web.tc.Constants.HS_VIEW_REGISTER);
        setIsNextPageInContext(true);
    } 



    private void addErrorQuestion(Map<String, Response> responses, String field, String message) {
        addError(AnswerInput.PREFIX + responses.get(field).getQuestion().getId(), message);        
    }



    protected Map<String,Response> processSurvey(Event event, User user) {
        Helper helper = new Helper(getRequest());

        List<Response> responses = helper.processResponses(event.getSurvey());
        
        for (Iterator it = responses.iterator(); it.hasNext();) {
            ((Response) it.next()).setUser(user);
        }
    
        helper.checkRequiredQuestions(event.getSurvey(), responses);
        
        if (helper.hasErrors()) {
            for (Iterator it = helper.getErrors().entrySet().iterator(); it.hasNext();) {
                Map.Entry entry = (Map.Entry) it.next();
                addError((String) entry.getKey(), entry.getValue());
            }
        }

        Map<String,Response> m = new HashMap<String,Response>();
        for(Response r : responses) {
            m.put(r.getQuestion().getKeyword(), r);
        }
        
        return m;
    }

    protected void setDefaults(Collection responses) {
        Response r = null;
        for (Iterator it = responses.iterator(); it.hasNext();) {
            r = (Response) it.next();
            if (r.getQuestion().getStyle().getId().intValue() == QuestionStyle.MULTIPLE_CHOICE) {
                setDefault(AnswerInput.PREFIX + r.getQuestion().getId() + "," + r.getAnswer().getId(), "true");
            } else if (r.getAnswer() == null) {
                setDefault(AnswerInput.PREFIX + r.getQuestion().getId(), r.getText());
            } else {
                setDefault(AnswerInput.PREFIX + r.getQuestion().getId(), r.getAnswer().getId());
            }
        }
    }

}
