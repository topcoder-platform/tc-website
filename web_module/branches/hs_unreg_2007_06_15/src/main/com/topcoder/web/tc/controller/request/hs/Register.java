package com.topcoder.web.tc.controller.request.hs;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import com.topcoder.shared.security.ClassResource;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.hs.RegistrationHelper;
import com.topcoder.web.common.model.Event;
import com.topcoder.web.common.model.EventRegistration;
import com.topcoder.web.common.model.QuestionStyle;
import com.topcoder.web.common.model.Response;
import com.topcoder.web.common.model.Season;
import com.topcoder.web.common.model.SecurityGroup;
import com.topcoder.web.common.model.User;
import com.topcoder.web.common.tag.AnswerInput;
import com.topcoder.web.common.validation.AgeValidator;
import com.topcoder.web.common.validation.StringInput;
import com.topcoder.web.common.validation.ValidationResult;
import com.topcoder.web.reg.controller.request.Secondary;
import com.topcoder.web.tc.controller.request.survey.Helper;

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
        
        RegistrationHelper rh = new RegistrationHelper(getRequest());

        List<String[]> valResults = rh.validateQuestions(season);
        for (String[] result : valResults) {
            addError(result[0], result[1]);
        }

        Event event = season.getEvent();
        User u = DAOUtil.getFactory().getUserDAO().find(new Long(getUser().getId()));

        /*        

        
        List<Response> responses = processSurvey(event, u);
        Map<String,Response> responsesMap = new HashMap<String,Response>();
        for(Response r : responses) {
            responsesMap.put(r.getQuestion().getKeyword(), r);
        }

        String ageStr = responsesMap.get(AGE).getText();
        String ageEndSeasonStr = responsesMap.get(AGE_END_SEASON).getText();
        String attendingStr = responsesMap.get(IN_HIGH_SCHOOL) == null? null : responsesMap.get(IN_HIGH_SCHOOL).getAnswer().getText();
        
        // check that the user has filled the fields
        ValidationResult result = new AgeValidator().validate(new StringInput(ageStr));
        if (!result.isValid()) {
            addErrorQuestion(responsesMap, AGE, result.getMessage());
        }
        
        result = new AgeValidator().validate(new StringInput(ageEndSeasonStr));
        if (!result.isValid()) {
            addErrorQuestion(responsesMap, AGE_END_SEASON, result.getMessage());
        }

        result = new AttendingHSValidator().validate(new StringInput(attendingStr));
        if (!result.isValid()) {
            addErrorQuestion(responsesMap, IN_HIGH_SCHOOL, result.getMessage());
        }

        // check that the ages are consistent
        if (!hasErrors()) {
            int age = Integer.parseInt(ageStr);
            int ageEndSeason = Integer.parseInt(ageEndSeasonStr);
            int dif = ageEndSeason - age;
           
            if (dif != 0 && dif != 1) {
                addErrorQuestion(responsesMap, AGE, "Please check the age.");
                addErrorQuestion(responsesMap, AGE_END_SEASON, "Please check the age.");
            }
            
        }
*/
        
        if (hasErrors()) {
            getRequest().setAttribute("confirmRegistration", false);        
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

        boolean eligible = rh.isEligibleHS();
        /*
        int ageHs = Integer.parseInt(ageStr);
        int ageEndSeason = Integer.parseInt(ageEndSeasonStr);
        boolean attendingHS = "yes".equalsIgnoreCase(attendingStr);
        
        boolean eligible = Secondary.isEligibleHS(ageHs, ageEndSeason, attendingHS);
        */       
        //u.addEventRegistration(event, responses, eligible);

//        DAOUtil.getFactory().getUserDAO().saveOrUpdate(u);            

        // If the user is not eligible, mark him as inactive in security groups.
        if (eligible) {
            rh.registerForSeason(u, season);            
        } else {
            //inactivateHsUser(u);
            rh.inactivateUser(u, season);
        }
        
        markForCommit();

        getRequest().setAttribute("season", season);
        getRequest().setAttribute("confirmRegistration", true);        
        getRequest().setAttribute("eligible", eligible);        

        setNextPage(com.topcoder.web.tc.Constants.HS_VIEW_REGISTER);
        setIsNextPageInContext(true);
    } 

/*

    private void addErrorQuestion(Map<String, Response> responses, String field, String message) {
        addError(AnswerInput.PREFIX + responses.get(field).getQuestion().getId(), message);        
    }



    protected List<Response> processSurvey(Event event, User user) {
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

        
        return responses;
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
    */

}
