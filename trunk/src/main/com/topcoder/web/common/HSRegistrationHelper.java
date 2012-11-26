package com.topcoder.web.common;

import java.text.ParsePosition;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
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
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.model.Event;
import com.topcoder.web.common.model.Question;
import com.topcoder.web.common.model.Response;
import com.topcoder.web.common.model.Season;
import com.topcoder.web.common.model.User;
import com.topcoder.web.common.tag.AnswerInput;
import com.topcoder.web.common.validation.NonEmptyValidator;
import com.topcoder.web.common.validation.StringInput;
import com.topcoder.web.common.validation.ValidationResult;


/**
 * Helper class for registering to a HS season.
 * 
 * @author Cucu
 *
 */
public class HSRegistrationHelper {
    
    private static final String DOB_DATE_FORMAT = "yyyy/MM/dd";

    protected static final Logger log = Logger.getLogger(HSRegistrationHelper.class);
    
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
     * Keyword for the date of birth question.
     */    
    public static final String DOB = "dob";

    /**
     * Keyword for the question of whether the user is pursuing HS education.
     */    
    public static final String IN_HIGH_SCHOOL = "inhs";

    /**
     * Group for HS registration
     */    
    public static final int HS_GROUP_ID = 12;
    
    /**
     * Create a new helper.
     * 
     * @param request
     */
    public HSRegistrationHelper(TCRequest request) {
        this.request = request;
    }

    /**
     * Create a new helper using the provided responses. 
     *
     * @param request
     * @param responsesMap
     */
    public HSRegistrationHelper(TCRequest request,  Map<String,Response> responsesMap) {
        this.request = request;
        this.responsesMap = responsesMap == null? new HashMap<String,Response>() : responsesMap;       
        this.responses = new ArrayList<Response>(this.responsesMap.values());      
    }

    public Map<String,Response> getResponsesMap() {
        return responsesMap;
    }
    
    
    /**
     * Checks that the questions are correctly replied, and if not, returns a list with
     * errors, being the first string the error key and the second the message.
     * The registration is for the current HS season.
     * 
     * @return a list of errors.
     */
    public List<String[]> validateQuestions() {
        if (getCurrentSeason() != null) {
            return validateQuestions(getCurrentSeason());
        }       
        return new ArrayList<String[]>();
    }

    /**
     * Checks that the questions are correctly replied, and if not, returns a list with
     * errors, being the first string the error key and the second the message.
     * The registration is for the specified season
     * 
     * @param season season to validate questions
     * @return a list of errors.
     */
    @SuppressWarnings("unchecked")
    public List<String[]> validateQuestions(Season season) {
        SurveyHelper helper = new SurveyHelper(request);

        List<String[]> results = new ArrayList<String[]>();
        responses = helper.processResponses(season.getEvent().getSurvey());
        
        responsesMap = new HashMap<String,Response>();
        for(Response r : responses) {
            responsesMap.put(r.getQuestion().getKeyword(), r);
        }

        for(Question q : new ArrayList<Question>(season.getEvent().getSurvey().getQuestions())) {
            if (!responsesMap.containsKey(q.getKeyword())) {
                Response r = new Response();
                r.setQuestion(q);
                responsesMap.put(q.getKeyword(), r);
            }            
        }

        String dob = responsesMap.get(DOB).getText();
        
        String attendingStr = responsesMap.get(IN_HIGH_SCHOOL).getAnswer() == null? null : responsesMap.get(IN_HIGH_SCHOOL).getAnswer().getText();
        
        // check that the user has filled the fields

        ValidationResult result = new NonEmptyValidator("You must enter a date.").validate(new StringInput(dob));
        if (!result.isValid()) {
            results.add(new String[]{AnswerInput.PREFIX + responsesMap.get(DOB).getQuestion().getId(), result.getMessage()}); 
        }

        if (result.isValid() && !isValidDate(dob)) {
            results.add(new String[]{AnswerInput.PREFIX + responsesMap.get(DOB).getQuestion().getId(), "You must enter a valid date"}); 
        }
        
        result = new NonEmptyValidator("Please choose yes or no.").validate(new StringInput(attendingStr));
        if (!result.isValid()) {
            results.add(new String[]{AnswerInput.PREFIX + responsesMap.get(IN_HIGH_SCHOOL).getQuestion().getId(), result.getMessage()}); 
        }

        return results;
    }

    /**
     * Get a list with default values (first object is the field name, second the value) for the questions.
     * This is used when the page needs to be reloaded.
     * 
     * @return
     */
    public List<Object[]> getDefaults() {
        List<Object[]> result = new ArrayList<Object[]>();
        
        result.add(new String[] {AnswerInput.PREFIX + responsesMap.get(DOB).getQuestion().getId(), responsesMap.get(DOB).getText()});
        
        if (responsesMap.get(IN_HIGH_SCHOOL).getAnswer() != null) {
            result.add(new Object[] {AnswerInput.PREFIX + responsesMap.get(IN_HIGH_SCHOOL).getQuestion().getId(), responsesMap.get(IN_HIGH_SCHOOL).getAnswer().getId() });
        }

        return result;        
    }
    
    
    /**
     * Set an user as inactive for HS and for the current season.
     * 
     * @param u user to inactivate.
     * @throws Exception
     */
    public void inactivateUser(User u) throws Exception {
        if (getCurrentSeason() != null) {
            inactivateUser(u, getCurrentSeason());
        }       
    }
    
    /**
     * Set an user as inactive for HS and for the specified season.
     * 
     * @param u user to inactivate.
     * @param season the season where the user will 
     * @throws Exception
     */
    public void inactivateUser(User u, Season season) throws Exception {
        Context ctx = null;
        try {
            ctx = TCContext.getContext(ApplicationServer.SECURITY_CONTEXT_FACTORY, ApplicationServer.SECURITY_PROVIDER_URL);
            TCSubject tcs = new TCSubject(132456);
            PrincipalMgrRemoteHome pmrh = (PrincipalMgrRemoteHome) ctx.lookup(PrincipalMgrRemoteHome.EJB_REF_NAME);
            PrincipalMgrRemote pmr = pmrh.create();
            
            UserPrincipal user = new UserPrincipal("", u.getId().longValue());
            GroupPrincipal group = new GroupPrincipal("", HS_GROUP_ID); 
            
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

        for(Response r : responses) {
            r.setUser(u);
        }
        
        // Mark in event_registration table that the user tried to register but was not eligible.
        u.addEventRegistration(season.getEvent(), responses, false, getAgeNote(season));
    }

    private String getAgeNote(Season season) {
        Date dob = parseDate(responsesMap.get(DOB).getText()); 
        int ageHs = calculateAge(dob, new Date(season.getStartDate().getTime()));
        int ageEndSeason = calculateAge(dob, season.getEndDate());
        boolean attendingHS = "yes".equalsIgnoreCase(responsesMap.get(IN_HIGH_SCHOOL).getAnswer().getText());

        return "Attending HS: " + attendingHS + ", Start age: " + ageHs + ", End age: " + ageEndSeason; 
    }

    /**
     * Register the user for the current season.
     * 
     * @param u user to register
     */
    public void registerForSeason(User u) {
        if (getCurrentSeason() != null) {
            registerForSeason(u, getCurrentSeason());
        }
    }
    
    /**
     * Register a user for the specified season.
     * 
     * @param u user to register
     * @param season season where the user will be registered
     */
    public void registerForSeason(User u, Season season) {
        Event event = season.getEvent();
        log.debug("register for season, responses: " + responses + (responses == null? "" : " size " +responses.size()));
        
        for(Response r : responses) {
            r.setUser(u);
        }
        
        u.addEventRegistration(event, responses, true);

        DAOUtil.getFactory().getUserDAO().saveOrUpdate(u);
    }
    
    /**
     * Get the current HS season.
     * 
     * @return the current HS season.
     */
    private Season getCurrentSeason() {
        if (currentSeason == null) {
            currentSeason = DAOUtil.getFactory().getSeasonDAO().findCurrent(Season.HS_SEASON); 
        }
        return currentSeason;
    }
    
    /**
     * Return whether a user is eligible for participating in the current season.
     * 
     * @return true if the user is eligible.
     */
    public boolean isEligibleHS() {
        return isEligibleHS(getCurrentSeason());
    }

    /**
     * Return whether a user is eligible for participating in High School competitions in the specified season
     * 
     * @return true if the user is eligible.
     */
    public boolean isEligibleHS(Season season) {
        Date dob = parseDate(responsesMap.get(DOB).getText()); 
        int ageHs = calculateAge(dob, new Date(season.getStartDate().getTime()));
        int ageEndSeason = calculateAge(dob, season.getEndDate());
        
        log.debug("Season: (" + season.getStartDate() + " - " + season.getEndDate() + ")");
        log.debug("DOB: " + dob);
        log.debug("ageHS: " + ageHs);
        log.debug("ageEndSeason: " + ageEndSeason);
        
        boolean attendingHS = "yes".equalsIgnoreCase(responsesMap.get(IN_HIGH_SCHOOL).getAnswer().getText());
            
        if (!attendingHS) return false;
        if (ageHs < WebConstants.HS_MIN_REG_AGE || ageHs > WebConstants.HS_MAX_REG_AGE) return false;
        if (ageEndSeason < WebConstants.HS_MIN_REG_AGE || ageEndSeason > WebConstants.HS_MAX_REG_AGE) return false;
        
        return true;
    }

    private static int calculateAge(Date dob, Date date) {
        GregorianCalendar dobCal = new GregorianCalendar();
        dobCal.setTime(dob);
        
        GregorianCalendar dateCal = new GregorianCalendar();
        dateCal.setTime(date);
        
        int yearDif = dateCal.get(Calendar.YEAR) - dobCal.get(Calendar.YEAR);

        dobCal.set(Calendar.YEAR, dateCal.get(Calendar.YEAR));
        boolean takeOne = (dateCal.before(dobCal));
        
        return yearDif - (takeOne ? 1 : 0);
    }

    protected boolean isValidDate(String s) {
        return parseDate(s) != null;
    }

    protected Date parseDate(String s) {
        SimpleDateFormat sdf = new SimpleDateFormat(DOB_DATE_FORMAT);
        ParsePosition pp = new ParsePosition(0);
        return sdf.parse(s, pp);
    }

}
