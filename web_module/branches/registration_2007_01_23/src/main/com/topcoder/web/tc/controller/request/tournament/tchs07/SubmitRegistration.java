package com.topcoder.web.tc.controller.request.tournament.tchs07;

import java.util.Iterator;

import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.distCache.CacheClient;
import com.topcoder.shared.distCache.CacheClientFactory;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.dao.UserDAO;
import com.topcoder.web.common.model.Event;
import com.topcoder.web.common.model.EventRegistration;
import com.topcoder.web.common.model.Question;
import com.topcoder.web.common.model.Response;
import com.topcoder.web.common.model.User;
import com.topcoder.web.tc.Constants;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Jan 16, 2007
 */
public class SubmitRegistration extends ViewRegistration {

    protected void regProcessing(Event event, User user) throws Exception {
        String termsAgree = getRequest().getParameter(Constants.TERMS_AGREE);

        responses = getResponses(event.getSurvey());
        
        for (Iterator it = responses.iterator(); it.hasNext();) {
            ((Response) it.next()).setUser(user);
        }

        checkRequiredQuestions(event.getSurvey(), responses);
        
        if (!"on".equals(termsAgree)) {
            addError(Constants.TERMS_AGREE, "You must agree to the terms in order to continue.");
        }
        
        String ageInput = "";
        String inCollegeInput = "";
        String inHighSchoolInput = "";
        for (Iterator it = event.getSurvey().getQuestions().iterator(); it.hasNext(); ) {
            Question q = (Question) it.next();
            Response response = findResponse(responses, q.getId());
            if (q.getKeyword().equals(AGE)) {
                ageInput = StringUtils.checkNull(response.getText());
            } else if (q.getKeyword().equals(IN_COLLEGE)) {
                inCollegeInput = StringUtils.checkNull(response.getAnswer().getText());
            } else if (q.getKeyword().equals(IN_HIGH_SCHOOL)) {
                inHighSchoolInput = StringUtils.checkNull(response.getAnswer().getText());
            }
        }
        
        if (log.isDebugEnabled()) {
            log.debug("ageInput " + ageInput + " college " + inCollegeInput + " highschool " + inHighSchoolInput);
        }
        int age = 0;
        try {
            age = Integer.parseInt(ageInput);
        } catch (NumberFormatException e) {
            addError(AGE, "Please enter a valid number for your age.");
        }

        if ("".equals(inCollegeInput)) {
            addError(IN_COLLEGE, "Please respond to this question.");
        }

        if ("".equals(inHighSchoolInput)) {
            addError(IN_HIGH_SCHOOL, "Please respond to this question.");
        }

        if (hasErrors()) {
            setDefaults (responses);
            setDefault(Constants.TERMS_AGREE, String.valueOf("on".equals(termsAgree)));
        } else {
            //todo store all their answers about age etc.
            UserDAO userDAO = DAOUtil.getFactory().getUserDAO();

            EventRegistration er = new EventRegistration();
            er.getId().setUser(user);
            er.getId().setEvent(event);
            er.setEligible(age <= 20 && age >= 13 && !"Yes".equals(inCollegeInput) && "Yes".equals(inHighSchoolInput));

            user.addEventRegistration(er);
            user.addTerms(event.getTerms());
            user.addResponse(responses);

            userDAO.saveOrUpdate(user);
            refreshCache();
        }

    }

    protected void setNextPage(Event event, User u) throws Exception {
        if (hasErrors()) {
            setNextPage("/tournaments/tchs07/terms.jsp");
            setIsNextPageInContext(true);
        } else {
            setNextPage("/tournaments/tchs07/termsSuccess.jsp");
            setIsNextPageInContext(true);
        }
    }

    protected void refreshCache() {
        try {
            CacheClient cc = CacheClientFactory.createCacheClient();
            Request r = new Request();
            r.setContentHandle("tchs07_registrants");
            cc.remove(r.getCacheKey());
        } catch (Exception ignore) {
            ignore.printStackTrace();
        }
    }


}
