package com.topcoder.web.tc.controller.request.tournament;

import com.topcoder.shared.dataAccess.Request;
import com.topcoder.web.common.cache.CacheClient;
import com.topcoder.web.common.cache.CacheClientFactory;
import com.topcoder.web.common.model.*;
import com.topcoder.web.common.tag.AnswerInput;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.tc.controller.request.survey.Helper;

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
            CacheClient cc = CacheClientFactory.create();
            Request r = new Request();
            log.debug("removing " + e.getShortDescription() + "_registrants" + " from cache.");
            r.setContentHandle(e.getShortDescription() + "_registrants");
            cc.remove(r.getCacheKey());
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
        Helper helper = new Helper(getRequest());

        List responses = helper.processResponses(event.getSurvey());
        
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

    protected void alreadyRegisteredProcessing(EventRegistration er) {
        // nothing to do
    }
}
