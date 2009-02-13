package com.topcoder.web.tc.controller.request.tournament.tchs08;

import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.SurveyHelper;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.dao.UserDAO;
import com.topcoder.web.common.model.Event;
import com.topcoder.web.common.model.Question;
import com.topcoder.web.common.model.RegionType;
import com.topcoder.web.common.model.Response;
import com.topcoder.web.common.model.Survey;
import com.topcoder.web.common.model.User;
import com.topcoder.web.common.tag.AnswerInput;
import com.topcoder.web.tc.controller.request.tournament.SubmitRegistrationBase;

import java.util.Iterator;
import java.util.List;

/**
 * @author dok, pulky
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Jan 16, 2007
 */
public class SubmitRegistration extends SubmitRegistrationBase {

    protected final String getEventShortDesc() {
        return "tchs08";
    }

    protected Boolean validateSurvey(Survey survey, List responses) {
        String ageInput = "";
        String inCollegeInput = "";
        String inHighSchoolInput = "";
        String ageKey = "";
        if (survey!=null) {
            for (Iterator it = survey.getQuestions().iterator(); it.hasNext();) {
                Question q = (Question) it.next();
                Response response = (new SurveyHelper()).findResponse(responses, q.getId());
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

            return (new Boolean(age <= 20 && age >= 13 && !"Yes".equals(inCollegeInput) && "Yes".equals(inHighSchoolInput)));
        } else {
            return true;
        }

    }


    protected void completeRegistration(Event event, User user, Boolean eligible, List responses) {
        UserDAO userDAO = DAOUtil.getFactory().getUserDAO();
        user.addEventRegistration(event, responses, eligible);
        userDAO.saveOrUpdate(user);
        refreshCache(event);

        RegionType rt = new RegionType();
        rt.setId(HIGH_SCHOOL_REGION_TYPE);

        getRequest().setAttribute("assignedRegion", user.getHomeAddress().getCountry().getRegionByType(rt).getName());
        getRequest().setAttribute("eligible", eligible);
    }
}
