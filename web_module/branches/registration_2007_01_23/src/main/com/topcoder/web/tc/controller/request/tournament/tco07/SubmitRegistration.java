package com.topcoder.web.tc.controller.request.tournament.tco07;

import java.util.Iterator;
import java.util.List;

import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.model.Event;
import com.topcoder.web.common.model.Question;
import com.topcoder.web.common.model.Response;
import com.topcoder.web.common.model.Survey;
import com.topcoder.web.common.model.User;
import com.topcoder.web.common.tag.AnswerInput;
import com.topcoder.web.tc.controller.request.survey.Helper;
import com.topcoder.web.tc.controller.request.tournament.SubmitRegistrationBase;

/**
 * @author dok, pulky
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Jan 16, 2007
 */
public class SubmitRegistration extends SubmitRegistrationBase {    
    
    protected final String getEventShortDesc() {
        return "tco07" + getRequest().getParameter("ct");
    }
    
    protected Boolean validateSurvey(Survey survey, List responses) {
        String ageInput = "";
        String ageKey = "";
        for (Iterator it = survey.getQuestions().iterator(); it.hasNext(); ) {
            Question q = (Question) it.next();
            Response response = (new Helper()).findResponse(responses, q.getId());
            if (response != null) {
                if (q.getKeyword().equals(AGE)) {
                    ageInput = StringUtils.checkNull(response.getText());
                    ageKey = AnswerInput.PREFIX + q.getId();
                }
            }
        }
        
        if (log.isDebugEnabled()) {
            log.debug("ageInput " + ageInput);
        }
        int age = 0;
        try {
            age = Integer.parseInt(ageInput);
        } catch (NumberFormatException e) {
            addError(ageKey, "Please enter a valid number for your age.");
        }
        
        return (new Boolean (age >= 18));
    }
    
    
    protected void completeRegistration(Event event, User user, Boolean eligible, List responses) {
        getRequest().setAttribute("ct", getRequest().getParameter("ct"));
    }
    
    public boolean isEligible(Event e, User u) throws Exception{
        // every TopCoder user is elegible.
        return true;
    }

    protected void setNextPage(Event e, User u) {
        if (hasErrors()) {
            setNextPage("/tournaments/tco07/terms.jsp");
        } else {
            setNextPage("/tournaments/tco07/termsSuccess.jsp");
        }
        setIsNextPageInContext(true);
    }
}
