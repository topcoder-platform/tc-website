package com.topcoder.web.tc.controller.request.tournament.tccc07;

import com.topcoder.shared.util.dwload.CacheClearer;
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

import java.util.Iterator;
import java.util.List;
import java.util.Set;

/**
 * @author dok, pulky
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Jan 16, 2007
 */
public class SubmitRegistration extends SubmitRegistrationBase {

    protected final String getEventShortDesc() {
        String eventType = StringUtils.checkNull(getRequest().getParameter(Constants.EVENT_TYPE));
        if (!"".equals(eventType)) {
            return "tccc07" + getContestTypeUsingEventType(Integer.parseInt(eventType));
        }
        return null;
    }

    protected Boolean validateSurvey(Survey survey, List responses) {
        String ageInput = "";
        String ageKey = "";
        String inCollegeInput = "";
        String pref1 = "";
        String pref2 = "";
        String pref3 = "";
        String pref1Key = "";
        String pref2Key = "";
        String pref3Key = "";
        for (Iterator it = survey.getQuestions().iterator(); it.hasNext();) {
            Question q = (Question) it.next();
            Response response = (new SurveyHelper()).findResponse(responses, q.getId());
            if (response != null) {
                if (q.getKeyword().equals(AGE)) {
                    ageInput = StringUtils.checkNull(response.getText());
                    ageKey = AnswerInput.PREFIX + q.getId();
                } else if (q.getKeyword().equals(IN_COLLEGE)) {
                    inCollegeInput = StringUtils.checkNull(response.getAnswer().getText());
                } else if (q.getKeyword().equals("pref1")) {
                    pref1 = StringUtils.checkNull(response.getAnswer().getText());
                    pref1Key = AnswerInput.PREFIX + q.getId();
                } else if (q.getKeyword().equals("pref2")) {
                    pref2 = StringUtils.checkNull(response.getAnswer().getText());
                    pref2Key = AnswerInput.PREFIX + q.getId();
                } else if (q.getKeyword().equals("pref3")) {
                    pref3 = StringUtils.checkNull(response.getAnswer().getText());
                    pref3Key = AnswerInput.PREFIX + q.getId();
                }
            }
        }

        if (getEventShortDesc().equals("tccc07algorithm")) {
            if (pref1.equals(pref2) && pref2.equals(pref3)) {
                addError(pref1Key, "You can't select the same section more than once.");
                addError(pref2Key, "You can't select the same section more than once.");
                addError(pref3Key, "You can't select the same section more than once.");
            } else {
                if (pref1.equals(pref2)) {
                    addError(pref1Key, "You can't select the same section more than once.");
                    addError(pref2Key, "You can't select the same section more than once.");
                }

                if (pref1.equals(pref3)) {
                    addError(pref1Key, "You can't select the same section more than once.");
                    addError(pref3Key, "You can't select the same section more than once.");
                }

                if (pref2.equals(pref3)) {
                    addError(pref2Key, "You can't select the same section more than once.");
                    addError(pref3Key, "You can't select the same section more than once.");
                }
            }
        }

        if (log.isDebugEnabled()) {
            log.debug("ageInput " + ageInput + " college " + inCollegeInput);
        }
        int age = 0;
        try {
            age = Integer.parseInt(ageInput);
        } catch (NumberFormatException e) {
            addError(ageKey, "Please enter a valid number for your age.");
        }

        return (new Boolean(age >= 18 && age <= 130 && "Yes".equals(inCollegeInput)));
    }

    protected void dbProcessing() throws Exception {
        String eventType = StringUtils.checkNull(getRequest().getParameter(Constants.EVENT_TYPE));
        Integer eventTypeId;
        try {
            eventTypeId = Integer.parseInt(eventType);
        } catch (NumberFormatException nfe) {
            throw new TCWebException("invalid event type parameter.");
        }
        if ("".equals(eventType) || "".equals(getContestTypeUsingEventType(eventTypeId))) {
            throw new TCWebException("invalid event type parameter.");
        }
        super.dbProcessing();
    }

    protected void completeRegistration(Event event, User user, Boolean eligible, List responses) {
        UserDAO userDAO = DAOUtil.getFactory().getUserDAO();
        user.addEventRegistration(event, responses, eligible);
        userDAO.saveOrUpdate(user);

        refreshCache(event);

        getRequest().setAttribute("eligible", eligible);
    }

    protected void alreadyRegisteredProcessing(EventRegistration er) {
        getRequest().setAttribute("eligible", er.isEligible());
    }

    protected void refreshCache(Event e) {
        try {
//            CacheClient cc = CacheClientFactory.create();
//            Request r = new Request();
            log.debug("removing " + e.getShortDescription() + "_registrants" + " from cache.");
            CacheClearer.removelike(e.getShortDescription() + "_registrants");

//            r.setContentHandle(e.getShortDescription() + "_registrants");
//            log.debug(Constants.EVENT_ID + " : " + String.valueOf(e.getId().intValue()));
//            r.setProperty(Constants.EVENT_ID, String.valueOf(e.getId().intValue()));
//            cc.remove(r.getCacheKey());
        } catch (Exception ignore) {
            ignore.printStackTrace();
        }
    }

    public boolean isEligible(Event e, User u) throws Exception {
        Set regTypes = u.getRegistrationTypes();
        boolean eligible = false;
        for (Iterator it = regTypes.iterator(); it.hasNext() && !eligible;) {
            RegistrationType rt = (RegistrationType) it.next();
            if (e.getType().getId().equals(EventType.ALGORITHM_TOURNAMENT_ID) ||
                    e.getType().getId().equals(EventType.COMPONENT_TOURNAMENT_ID) ||
                    e.getType().getId().equals(EventType.SPONSOR_TRACK_ID) ||
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

    protected void setNextPage(Event e, User u) {
        getRequest().setAttribute(Constants.EVENT_TYPE, getRequest().getParameter(Constants.EVENT_TYPE));
        if (hasErrors()) {
            setNextPage("/tournaments/tccc07/terms.jsp");
            setIsNextPageInContext(true);
        } else {
            setNextPage("/tc?module=TCCC07ViewRegistration&et=" + getRequest().getParameter(Constants.EVENT_TYPE));
            setIsNextPageInContext(false);
//            setNextPage("/tournaments/tccc07/termsSuccess.jsp");
        }
    }
}
