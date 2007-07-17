package com.topcoder.web.common.hs;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.naming.Context;

import com.topcoder.security.GroupPrincipal;
import com.topcoder.security.TCSubject;
import com.topcoder.security.UserPrincipal;
import com.topcoder.security.admin.PrincipalMgrRemote;
import com.topcoder.security.admin.PrincipalMgrRemoteHome;
import com.topcoder.shared.util.ApplicationServer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.TCContext;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.SecurityHelper;
import com.topcoder.web.common.TCRequest;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.model.Event;
import com.topcoder.web.common.model.Question;
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
 * Helper class for registering to a HS season.
 * 
 * @author Cucu
 *
 */
public class RegistrationHelper {
    
    protected static final Logger log = Logger.getLogger(RegistrationHelper.class);
    
    private TCRequest request;
    
    /**
     * Holds the current HS season.
     */
    private Season currentSeason = null;
    
    /**
     * Stores a map between the question keywords and their responses.
     */
    private Map<String,Response> responsesMap;
    
    /**
     * List of responses
     */
    private List<Response> responses; 
    
    /**
     * Keyword for the current age question.
     */    
    public static final String AGE = "age";

    
    /**
     * Keyword for the age at the end of the season question.
     */    
    public static final String AGE_END_SEASON = "agees";

    /**
     * Keyword for the question of whether the user is pursuing HS education.
     */    
    public static final String IN_HIGH_SCHOOL = "inhs";

    
    public RegistrationHelper(TCRequest request) {
        this.request = request;
    }

    public RegistrationHelper(TCRequest request,  Map<String,Response> responsesMap) {
        this.request = request;
        this.responsesMap = responsesMap;       
        this.responses = new ArrayList<Response>(responsesMap.values());      
    }

    public Map<String,Response> getResponsesMap() {
        return responsesMap;
    }
    
    
    public List<String[]> validateQuestions() {
        if (getCurrentSeason() != null) {
            return validateQuestions(getCurrentSeason());
        }       
        return new ArrayList<String[]>();
    }

    public List<String[]> validateQuestions(Season season) {
        Helper helper = new Helper(request);

        List<String[]> results = new ArrayList<String[]>();
        responses = helper.processResponses(season.getEvent().getSurvey());
        
        responsesMap = new HashMap<String,Response>();
        for(Response r : responses) {
            log.debug("add response for question " + r.getQuestion().getKeyword());
            responsesMap.put(r.getQuestion().getKeyword(), r);
        }
        for(Question q : new ArrayList<Question>(season.getEvent().getSurvey().getQuestions())) {
        log.debug("question: " + q.getId() + ", " + q.getKeyword());
            if (!responsesMap.containsKey(q.getKeyword())) {
                log.debug("not in list!");
                Response r = new Response();
                r.setQuestion(q);
                responsesMap.put(q.getKeyword(), r);
            }            
        }

        String ageStr = responsesMap.get(AGE).getText();
        String ageEndSeasonStr = responsesMap.get(AGE_END_SEASON).getText();
        String attendingStr = responsesMap.get(IN_HIGH_SCHOOL).getAnswer() == null? null : responsesMap.get(IN_HIGH_SCHOOL).getAnswer().getText();
        
        // check that the user has filled the fields
        ValidationResult result = new AgeValidator().validate(new StringInput(ageStr));
        if (!result.isValid()) {
            results.add(new String[]{AnswerInput.PREFIX + responsesMap.get(AGE).getQuestion().getId(), result.getMessage()}); 
        }
        
        result = new AgeValidator().validate(new StringInput(ageEndSeasonStr));
        if (!result.isValid()) {
            results.add(new String[]{AnswerInput.PREFIX + responsesMap.get(AGE_END_SEASON).getQuestion().getId(), result.getMessage()}); 
        }

        result = new AttendingHSValidator().validate(new StringInput(attendingStr));
        if (!result.isValid()) {
            log.debug("in_high_school: " + IN_HIGH_SCHOOL);
            log.debug("d1" + responsesMap.get(IN_HIGH_SCHOOL));
            log.debug("d2" + responsesMap.get(IN_HIGH_SCHOOL).getQuestion());
            log.debug("d3" + responsesMap.get(IN_HIGH_SCHOOL).getQuestion().getId());
            
            results.add(new String[]{AnswerInput.PREFIX + responsesMap.get(IN_HIGH_SCHOOL).getQuestion().getId(), result.getMessage()}); 
        }

        // check that the ages are consistent
        if (results.isEmpty()) {
            int age = Integer.parseInt(ageStr);
            int ageEndSeason = Integer.parseInt(ageEndSeasonStr);
            int dif = ageEndSeason - age;
           
            if (dif != 0 && dif != 1) {
                results.add(new String[]{AnswerInput.PREFIX + responsesMap.get(AGE).getQuestion().getId(), "Please check the age."}); 
                results.add(new String[]{AnswerInput.PREFIX + responsesMap.get(AGE_END_SEASON).getQuestion().getId(), "Please check the age."}); 
            }            
        }
        
        return results;
    }

    public List<String[]> getDefaults() {
        List<String[]> result = new ArrayList<String[]>();
        
        result.add(new String[] {AnswerInput.PREFIX + responsesMap.get(AGE).getQuestion().getId(), responsesMap.get(AGE).getText()});
        result.add(new String[] {AnswerInput.PREFIX + responsesMap.get(AGE_END_SEASON).getQuestion().getId(), responsesMap.get(AGE_END_SEASON).getText()});
        
        if (responsesMap.get(IN_HIGH_SCHOOL).getAnswer() != null) {
            result.add(new String[] {AnswerInput.PREFIX + responsesMap.get(IN_HIGH_SCHOOL).getQuestion().getId(), responsesMap.get(IN_HIGH_SCHOOL).getAnswer().getId() + ""});
        }

        return result;        
    }
    
    
    public void inactivateUser(User u) throws Exception {
        if (getCurrentSeason() != null) {
            inactivateUser(u, getCurrentSeason());
        }       
    }
    
    public void inactivateUser(User u, Season season) throws Exception {
        Context ctx = null;
        try {
            ctx = TCContext.getContext(ApplicationServer.SECURITY_CONTEXT_FACTORY, ApplicationServer.SECURITY_PROVIDER_URL);
            TCSubject tcs = new TCSubject(132456);
            PrincipalMgrRemoteHome pmrh = (PrincipalMgrRemoteHome) ctx.lookup(PrincipalMgrRemoteHome.EJB_REF_NAME);
            PrincipalMgrRemote pmr = pmrh.create();
            
            UserPrincipal user = new UserPrincipal("", u.getId().longValue());
            GroupPrincipal group = new GroupPrincipal("", 12); // HS group
            
            // Add the user to the HS group; if the user already belongs it will throw an exception
            try {
                pmr.addUserToGroup(group, user, tcs, DBMS.JTS_OLTP_DATASOURCE_NAME);
            } catch(Exception e) {}
            
            pmr.removeUserFromGroup(group, user, tcs, DBMS.JTS_OLTP_DATASOURCE_NAME);

            //refresh the cached object
            SecurityHelper.getUserSubject(u.getId().longValue(), true, DBMS.JTS_OLTP_DATASOURCE_NAME);
            
        } finally {
            BaseProcessor.close(ctx);
        }

        // Mark in event_registration table that the user tried to register but was not eligible.
        u.addEventRegistration(season.getEvent(), responses, false);
    }

    
    public void registerForSeason(User u) {
        if (getCurrentSeason() != null) {
            registerForSeason(u, getCurrentSeason());
        }
    }
    

    public void registerForSeason(User u, Season season) {
        Event event = season.getEvent();
        log.debug("register for season, responses: " + responses + (responses == null? "" : " size " +responses.size()));
        
        u.addEventRegistration(event, responses, true);

        DAOUtil.getFactory().getUserDAO().saveOrUpdate(u);
    }
    
    private Season getCurrentSeason() {
        if (currentSeason == null) {
            currentSeason = DAOUtil.getFactory().getSeasonDAO().findCurrent(Season.HS_SEASON); 
        }
        return currentSeason;
    }
    
    /**
     * Return whether a user is eligible for participating in High School competitions.
     * 
     * @return true if the user is eligible.
     */
    public boolean isEligibleHS() {
        int ageHs = Integer.parseInt(responsesMap.get(AGE).getText()); 
        int ageEndSeason = Integer.parseInt(responsesMap.get(AGE_END_SEASON).getText()); 
        boolean attendingHS = "yes".equalsIgnoreCase(responsesMap.get(IN_HIGH_SCHOOL).getAnswer().getText());
            
        if (!attendingHS) return false;
        if (ageHs < Constants.MIN_AGE_FOR_HS || ageHs > Constants.MAX_AGE_FOR_HS) return false;
        if (ageEndSeason < Constants.MIN_AGE_FOR_HS || ageEndSeason > Constants.MAX_AGE_FOR_HS) return false;
        
        return true;
    }
    

}
