package com.topcoder.web.tc.controller.request.tournament;

import com.topcoder.shared.util.dwload.CacheClearer;
import com.topcoder.web.common.SurveyHelper;
import com.topcoder.web.common.model.Event;
import com.topcoder.web.common.model.EventRegistration;
import com.topcoder.web.common.model.Question;
import com.topcoder.web.common.model.Response;
import com.topcoder.web.common.model.Survey;
import com.topcoder.web.common.model.User;
import com.topcoder.web.common.tag.AnswerInput;
import com.topcoder.web.tc.Constants;

import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

/**
 * @author dok, pulky
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Jan 16, 2007
 */
public abstract class SubmitRegistrationBase extends ViewRegistrationBase {

    protected abstract Boolean validateSurvey(Survey survey, List responses);
    
    protected abstract void completeRegistration(Event event, User user, Boolean eligible, List responses);

    protected void regProcessing(Event event, User user) {
        List responses = processSurvey(event, user);
        Boolean eligible = validateSurvey(event.getSurvey(), responses);
        
        String termsAgree = getRequest().getParameter(Constants.TERMS_AGREE);
        if (!"on".equals(termsAgree)) {
            addError(Constants.TERMS_AGREE, "You must agree to the terms in order to continue.");
        }

        if (hasErrors()) {
            setDefaults(responses);
            setDefault(Constants.TERMS_AGREE, String.valueOf("on".equals(termsAgree)));
        } else {
            completeRegistration(event, user, eligible, responses);
        }

    }

    protected void setDefaults(List responses) {
        Response r = null;
        for (Iterator it = responses.iterator(); it.hasNext();) {
            r = (Response) it.next();
            if (r.getQuestion().getStyle().getId().intValue() == Question.MULTIPLE_CHOICE) {
                setDefault(AnswerInput.PREFIX + r.getQuestion().getId() + "," + r.getAnswer().getId(), "true");
            } else if (r.getAnswer() == null) {
                setDefault(AnswerInput.PREFIX + r.getQuestion().getId(), r.getText());
            } else {
                setDefault(AnswerInput.PREFIX + r.getQuestion().getId(), r.getAnswer().getId());
            }
        }
    }
    
    protected void refreshCache(Event e) {
        try {
            CacheClearer.removelike(e.getShortDescription() + "_registrants");
        } catch (Exception ignore) {
            ignore.printStackTrace();
        }
    }
    
    protected void setNextPage(Event e, User u) {
        if (hasErrors()) {
            setNextPage("/tournaments/" + e.getShortDescription() + "/terms.jsp");
            setIsNextPageInContext(true);
        } else {
            setNextPage("/tournaments/" + e.getShortDescription() + "/termsSuccess.jsp");
            setIsNextPageInContext(true);
        }
    }

    protected List processSurvey(Event event, User user) {
        if (event.getSurvey()!=null) {
            SurveyHelper helper = new SurveyHelper(getRequest());

            List responses = helper.processResponses(event.getSurvey());

            for (Object response1 : responses) {
                ((Response) response1).setUser(user);
            }

            helper.checkRequiredQuestions(event.getSurvey(), responses);

            if (helper.hasErrors()) {
                for (Object o : helper.getErrors().entrySet()) {
                    Map.Entry entry = (Map.Entry) o;
                    addError((String) entry.getKey(), entry.getValue());
                }
            }

            return responses;
        } else {
            return Collections.EMPTY_LIST;
        }
    }

    protected void alreadyRegisteredProcessing(EventRegistration er) {
        // nothing to do
    }
}
