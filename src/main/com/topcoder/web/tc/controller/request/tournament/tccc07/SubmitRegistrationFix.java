package com.topcoder.web.tc.controller.request.tournament.tccc07;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.SurveyHelper;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.dao.UserDAO;
import com.topcoder.web.common.model.Event;
import com.topcoder.web.common.model.EventRegistration;
import com.topcoder.web.common.model.EventType;
import com.topcoder.web.common.model.Question;
import com.topcoder.web.common.model.RegistrationType;
import com.topcoder.web.common.model.Response;
import com.topcoder.web.common.model.Survey;
import com.topcoder.web.common.model.User;
import com.topcoder.web.common.tag.AnswerInput;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.tc.controller.request.tournament.SubmitRegistrationBase;

/**
 * @author dok, pulky
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Jan 16, 2007
 */
public class SubmitRegistrationFix extends SubmitRegistrationBase {

    protected final String getEventShortDesc() {
        String eventType = StringUtils.checkNull(getRequest().getParameter(Constants.EVENT_TYPE));
        if (!"".equals(eventType)) {
            return "tccc07" + getContestTypeUsingEventType(Integer.parseInt(eventType));
        }
        return null;
    }

    protected Boolean validateSurvey(Survey survey, List responses) {
        String pref1 = "";
        String pref2 = "";
        String pref3 = "";
        String pref1Key = "";
        String pref2Key = "";
        String pref3Key = "";
        for (Iterator it = survey.getQuestions().iterator(); it.hasNext();) {
            Question q = (Question) it.next();
            Response response = (new SurveyHelper()).findResponse(responses, q.getId());
            if (q.getKeyword().equals("pref1")) {
                pref1 = (response == null ? "" : StringUtils.checkNull(response.getAnswer().getText()));
                pref1Key = AnswerInput.PREFIX + q.getId();
            } else if (q.getKeyword().equals("pref2")) {
                pref2 = (response == null ? "" : StringUtils.checkNull(response.getAnswer().getText()));
                pref2Key = AnswerInput.PREFIX + q.getId();
            } else if (q.getKeyword().equals("pref3")) {
                pref3 = (response == null ? "" : StringUtils.checkNull(response.getAnswer().getText()));
                pref3Key = AnswerInput.PREFIX + q.getId();
            }
        }

        if (getEventShortDesc().equals("tccc07algorithm")) {
            if ("".equals(pref1)) {
                addError(pref1Key, "Please respond to this question.");
            }
            if ("".equals(pref2)) {
                addError(pref2Key, "Please respond to this question.");
            }
            if ("".equals(pref3)) {
                addError(pref3Key, "Please respond to this question.");
            }
           
            
            if (!"".equals(pref1) && pref1.equals(pref2) && pref2.equals(pref3)) {
                addError(pref1Key, "You can't select the same section more than once.");
                addError(pref2Key, "You can't select the same section more than once.");
                addError(pref3Key, "You can't select the same section more than once.");
            } else {
                if (!"".equals(pref1) && pref1.equals(pref2)) {
                    addError(pref1Key, "You can't select the same section more than once.");
                    addError(pref2Key, "You can't select the same section more than once.");
                }

                if (!"".equals(pref1) && pref1.equals(pref3)) {
                    addError(pref1Key, "You can't select the same section more than once.");
                    addError(pref3Key, "You can't select the same section more than once.");
                }

                if (!"".equals(pref2) && pref2.equals(pref3)) {
                    addError(pref2Key, "You can't select the same section more than once.");
                    addError(pref3Key, "You can't select the same section more than once.");
                }
            }
        }
        
        return (new Boolean (true));
    }

    protected void dbProcessing() throws Exception {
        String eventType = StringUtils.checkNull(getRequest().getParameter(Constants.EVENT_TYPE));
        Integer eventTypeId;
        try {
            eventTypeId = Integer.parseInt(eventType);
        } catch (NumberFormatException nfe) {
            throw new TCWebException("invalid event type parameter.");                
        }
        if (!EventType.ALGORITHM_TOURNAMENT_ID.equals(eventTypeId)) {
            throw new TCWebException("invalid event type parameter.");                
        }
        if ("".equals(eventType) || "".equals(getContestTypeUsingEventType(eventTypeId))) {
            throw new TCWebException("invalid event type parameter. (2)");                
        }
        super.dbProcessing();
    }

    protected void completeRegistration(Event event, User user, Boolean eligible, List responses) {
        UserDAO userDAO = DAOUtil.getFactory().getUserDAO();
                
        // if responses don't exist, add them, otherwise update.
        List addResponses = new ArrayList(3);
        for (Response r : (List<Response>)responses) {
            if (r.getQuestion().getKeyword().equals("pref1") ||
                    r.getQuestion().getKeyword().equals("pref2") ||
                    r.getQuestion().getKeyword().equals("pref3")) {
                
                Response existingResponse = (new SurveyHelper()).findResponse(user.getResponses(), r.getQuestion().getId()); 
                if (existingResponse != null) {
                    // change answer
                    
                    user.removeResponse(existingResponse);
                    existingResponse.setAnswer(r.getAnswer());
                    addResponses.add(existingResponse);
                } else {
                    addResponses.add(r);
                }
            }
        }

        user.addResponse(addResponses);
        userDAO.saveOrUpdate(user);
            
        getRequest().setAttribute("eligible", eligible);
    }

    protected void alreadyRegisteredProcessing(EventRegistration er) {
        regProcessing(er.getId().getEvent(), er.getId().getUser());

        getRequest().setAttribute("eligible", er.isEligible());
    }

    protected void refreshCache(Event e) {
    }

    public boolean isEligible(Event e, User u) throws Exception {
        Set regTypes = u.getRegistrationTypes();
        boolean eligible = false;
        for (Iterator it = regTypes.iterator(); it.hasNext() && !eligible;) {
            RegistrationType rt = (RegistrationType) it.next();
            if (e.getType().getId().equals(EventType.ALGORITHM_TOURNAMENT_ID) ||
                    e.getType().getId().equals(EventType.COMPONENT_TOURNAMENT_ID) ||
                    e.getType().getId().equals(EventType.MARATHON_TOURNAMENT_ID)) {
                if (rt.getId().equals(RegistrationType.COMPETITION_ID)) {
                    eligible = true;
                }
            }
            if (e.getType().getId().equals(EventType.STUDIO_TOURNAMENT_ID)) {
                if (rt.getId().equals(RegistrationType.STUDIO_ID)) {
                    eligible = true;
                }
            }
        }
        return eligible;
    }

    protected List processSurvey(Event event, User user) {
        SurveyHelper helper = new SurveyHelper(getRequest());

        List responses = helper.processResponses(event.getSurvey());
        
        for (Iterator it = responses.iterator(); it.hasNext();) {
            ((Response) it.next()).setUser(user);
        }
    
        return responses;
    }

    protected void setNextPage(Event e, User u) {
        getRequest().setAttribute(Constants.EVENT_TYPE, getRequest().getParameter(Constants.EVENT_TYPE));
        if (hasErrors()) {
            setNextPage("/tournaments/tccc07/termsFix.jsp");
            setIsNextPageInContext(true);
        } else {
            setNextPage("/tc?module=TCCC07ViewRegistration&et=" + getRequest().getParameter(Constants.EVENT_TYPE));
            setIsNextPageInContext(false);
        }
    }
}
