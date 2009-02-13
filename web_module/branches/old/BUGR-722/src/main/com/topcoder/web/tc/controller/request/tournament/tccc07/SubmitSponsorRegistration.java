package com.topcoder.web.tc.controller.request.tournament.tccc07;

import com.topcoder.web.common.model.Event;
import com.topcoder.web.common.model.Survey;
import com.topcoder.web.common.model.User;
import com.topcoder.web.tc.Constants;

import java.util.List;

/**
 * @author dok
 * @version $Revision: 64395 $ Date: 2005/01/01 00:00:00
 *          Create Date: Jul 30, 2007
 */
public class SubmitSponsorRegistration extends SubmitRegistration {

    protected Boolean validateSurvey(Survey survey, List responses) {
/*
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
*/
        //we don't care, anyone can participate
        return true;
    }


    protected void setNextPage(Event e, User u) {
        if (hasErrors()) {
            getRequest().setAttribute(Constants.EVENT_TYPE, getRequest().getParameter(Constants.EVENT_TYPE));
            setNextPage("/tournaments/tccc07/sponsortrack/terms.jsp");
            setIsNextPageInContext(true);
        } else {
            setNextPage("/tc?module=TCCC07ViewSponsorRegistration&et=" + getRequest().getParameter(Constants.EVENT_TYPE));
            setIsNextPageInContext(false);
        }
    }
}
