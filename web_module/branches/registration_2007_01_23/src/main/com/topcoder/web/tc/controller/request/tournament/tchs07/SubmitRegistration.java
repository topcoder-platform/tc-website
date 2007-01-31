package com.topcoder.web.tc.controller.request.tournament.tchs07;

import java.util.Iterator;
import java.util.List;

import com.topcoder.shared.dataAccess.DataAccess;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.distCache.CacheClient;
import com.topcoder.shared.distCache.CacheClientFactory;
import com.topcoder.shared.util.DBMS;
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
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Jan 16, 2007
 */
public class SubmitRegistration extends SubmitRegistrationBase {

    protected boolean validateSurvey(Survey survey, List responses) {
        String ageInput = "";
        String inCollegeInput = "";
        String inHighSchoolInput = "";
        String ageKey = "";
        for (Iterator it = survey.getQuestions().iterator(); it.hasNext(); ) {
            Question q = (Question) it.next();
            Response response = (new Helper()).findResponse(responses, q.getId());
            if (response != null) {
                if (q.getKeyword().equals(AGE)) {
                    ageInput = StringUtils.checkNull(response.getText());
                    ageKey = AnswerInput.PREFIX + q.getId();
                } else if (q.getKeyword().equals(IN_COLLEGE)) {
                    inCollegeInput = StringUtils.checkNull(response.getAnswer().getText());
                } else if (q.getKeyword().equals(IN_HIGH_SCHOOL)) {
                    inHighSchoolInput = StringUtils.checkNull(response.getAnswer().getText());
                }
            }
        }
        
        if (log.isDebugEnabled()) {
            log.debug("ageInput " + ageInput + " college " + inCollegeInput + " highschool " + inHighSchoolInput);
        }
        int age = 0;
        try {
            age = Integer.parseInt(ageInput);
        } catch (NumberFormatException e) {
            addError(ageKey, "Please enter a valid number for your age.");
        }
        
        return (age <= 20 && age >= 13 && !"Yes".equals(inCollegeInput) && "Yes".equals(inHighSchoolInput));
    }
    
/*    protected void setNextPage(Event event, User u) throws Exception {
        if (hasErrors()) {
            setNextPage("/tournaments/tchs07/terms.jsp");
            setIsNextPageInContext(true);
        } else {
            setNextPage("/tournaments/tchs07/termsSuccess.jsp");
            setIsNextPageInContext(true);
        }
    }*/
/*
    protected void refreshCache() {
        try {
            CacheClient cc = CacheClientFactory.createCacheClient();
            Request r = new Request();
            r.setContentHandle("tchs07_registrants");
            cc.remove(r.getCacheKey());
        } catch (Exception ignore) {
            ignore.printStackTrace();
        }
    }*/
    
/*    public boolean isEligible() throws Exception {
        Request r = new Request();
        r.setContentHandle("tchs07_eligibility");
        r.setProperty("cr", String.valueOf(getUser().getId()));
        ResultSetContainer rsc =
                (ResultSetContainer) new DataAccess(DBMS.OLTP_DATASOURCE_NAME).getData(r).get("tchs07_eligibility");
        if (log.isDebugEnabled()) {
            log.debug("they " + (rsc.isEmpty() ? "are not" : "are") + " eligible");
        }
        return !rsc.isEmpty();
    }*/
}
