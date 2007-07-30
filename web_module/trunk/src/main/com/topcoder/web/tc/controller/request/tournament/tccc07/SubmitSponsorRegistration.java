package com.topcoder.web.tc.controller.request.tournament.tccc07;

import com.topcoder.shared.util.dwload.CacheClearer;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.SurveyHelper;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.dao.UserDAO;
import com.topcoder.web.common.model.Event;
import com.topcoder.web.common.model.EventRegistration;
import com.topcoder.web.common.model.Question;
import com.topcoder.web.common.model.Response;
import com.topcoder.web.common.model.Survey;
import com.topcoder.web.common.model.User;
import com.topcoder.web.common.tag.AnswerInput;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.tc.controller.request.tournament.SubmitRegistrationBase;

import java.util.List;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Jul 30, 2007
 */
public class SubmitSponsorRegistration extends SubmitRegistrationBase {

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
        for (Object o : survey.getQuestions()) {
            Question q = (Question) o;
            Response response = (new SurveyHelper()).findResponse(responses, q.getId());
            if (response != null) {
                if (q.getKeyword().equals(AGE)) {
                    ageInput = StringUtils.checkNull(response.getText());
                    ageKey = AnswerInput.PREFIX + q.getId();
                } else if (q.getKeyword().equals(IN_COLLEGE)) {
                    inCollegeInput = StringUtils.checkNull(response.getAnswer().getText());
                } else if (q.getKeyword().equals(Constants.COMPANY_NAME)) {
                    if ("".equals(StringUtils.checkNull(response.getText()))) {
                        addError(AnswerInput.PREFIX + q.getId(), "Please supply the name of the sponsor company you work for.");
                    }
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

        return (age >= 18 && age <= 130 && "Yes".equals(inCollegeInput));
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
            log.debug("removing " + e.getShortDescription() + "_registrants" + " from cache.");
            CacheClearer.removelike(e.getShortDescription() + "_registrants");
        } catch (Exception ignore) {
            ignore.printStackTrace();
        }
    }

    public boolean isEligible(Event e, User u) throws Exception {
        return u.getRegistrationTypes().contains(DAOUtil.getFactory().getRegistrationTypeDAO().getCompetitionType());
    }

    protected void setNextPage(Event e, User u) {
        if (hasErrors()) {
            getRequest().setAttribute(Constants.EVENT_TYPE, getRequest().getParameter(Constants.EVENT_TYPE));
            setNextPage("/tournaments/tccc07/terms.jsp");
            setIsNextPageInContext(true);
        } else {
            setNextPage("/tc?module=TCCC07ViewRegistration&et=" + getRequest().getParameter(Constants.EVENT_TYPE));
            setIsNextPageInContext(false);
        }
    }
}
