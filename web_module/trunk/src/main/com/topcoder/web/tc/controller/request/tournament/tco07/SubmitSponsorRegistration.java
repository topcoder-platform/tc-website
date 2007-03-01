package com.topcoder.web.tc.controller.request.tournament.tco07;

import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.distCache.CacheClient;
import com.topcoder.shared.distCache.CacheClientFactory;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.dao.UserDAO;
import com.topcoder.web.common.model.*;
import com.topcoder.web.common.tag.AnswerInput;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.tc.controller.request.survey.Helper;
import com.topcoder.web.tc.controller.request.tournament.SubmitRegistrationBase;

import java.util.Iterator;
import java.util.List;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Mar 1, 2007
 */
public class SubmitSponsorRegistration extends SubmitRegistrationBase {

    protected final String getEventShortDesc() {
        return getEvent().getShortDescription();
    }

    protected Boolean validateSurvey(Survey survey, List responses) {
        String ageInput = "";
        String ageKey = "";
        for (Iterator it = survey.getQuestions().iterator(); it.hasNext();) {
            Question q = (Question) it.next();
            Response response = (new Helper()).findResponse(responses, q.getId());
            if (response != null) {
                if (q.getKeyword().equals(AGE)) {
                    ageInput = StringUtils.checkNull(response.getText());
                    ageKey = AnswerInput.PREFIX + q.getId();
                } else if (q.getKeyword().equals(Constants.COMPANY_NAME)) {
                    if ("".equals(StringUtils.checkNull(response.getText()))) {
                        addError(AnswerInput.PREFIX + q.getId(), "Please supply the name of the sponsor company you work for.");
                    }
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

        return Boolean.valueOf(age >= 18 && age <= 130);
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
            CacheClient cc = CacheClientFactory.createCacheClient();
            Request r = new Request();
            log.debug("removing " + e.getShortDescription() + "_registrants" + " from cache.");
            r.setContentHandle(e.getShortDescription() + "_registrants");
            r.setProperty("eid", String.valueOf(e.getId().intValue()));
            cc.remove(r.getCacheKey());
        } catch (Exception ignore) {
            ignore.printStackTrace();
        }
    }

    public boolean isEligible(Event e, User u) throws Exception {
        return u.getRegistrationTypes().contains(DAOUtil.getFactory().getRegistrationTypeDAO().getCompetitionType());
    }


    protected void setNextPage(Event e, User u) {
        if (hasErrors()) {
            setNextPage("/tournaments/tco07/sponsorTerms.jsp");
        } else {
            setNextPage("/tournaments/tco07/sponsorTermsSuccess.jsp");
        }
        setIsNextPageInContext(true);
    }
}

