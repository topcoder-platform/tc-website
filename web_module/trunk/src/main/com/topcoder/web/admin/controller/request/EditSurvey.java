package com.topcoder.web.admin.controller.request;

import com.topcoder.web.admin.Constants;
import com.topcoder.web.ejb.termsofuse.TermsOfUse;
import com.topcoder.web.ejb.survey.Survey;
import com.topcoder.web.ejb.survey.SurveyQuestion;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.dataAccess.Request;

/**
 * @author dok
 * @version $Revision$ $Date$
 *          Create Date: Nov 9, 2005
 */
public class EditSurvey extends Base {


    protected void businessProcessing() throws Exception {
        String sId = getRequest().getParameter(Constants.SURVEY_ID);
        if (sId !=null) {
            long id = Long.parseLong(sId);
            Survey survey = (Survey) createEJB(getInitialContext(), Survey.class);
            getRequest().setAttribute(Constants.SURVEY_ID, sId);
            loadQuestions(id);
            setDefault(Constants.SURVEY_ID, sId);
            setDefault(Constants.SURVEY_END, survey.getEndDate(id, DBMS.OLTP_DATASOURCE_NAME));
            setDefault(Constants.SURVEY_START, survey.getStartDate(id, DBMS.OLTP_DATASOURCE_NAME));
            setDefault(Constants.SURVEY_NAME, survey.getName(id, DBMS.OLTP_DATASOURCE_NAME));
            setDefault(Constants.SURVEY_STATUS, String.valueOf(survey.getStatusId(id, DBMS.OLTP_DATASOURCE_NAME)));
            setDefault(Constants.SURVEY_TEXT, survey.getText(id, DBMS.OLTP_DATASOURCE_NAME));
            setDefault(Constants.RESULTS_VIEWABLE, survey.areResultsViewable(id, DBMS.OLTP_DATASOURCE_NAME)?"on":"");
        }
        loadStatusList();
        setNextPage("/editSurvey.jsp");
        setIsNextPageInContext(true);
    }

    protected void loadStatusList() throws Exception {
        Request r = new Request();
        r.setContentHandle("status_list");
        getRequest().setAttribute("status_list", getDataAccess().getData(r).get("status_list"));
    }

    protected void loadQuestions(long surveyId) throws Exception {
        SurveyQuestion sq = (SurveyQuestion)createEJB(getInitialContext(), SurveyQuestion.class);
        getRequest().setAttribute("questions", sq.getQuestions(surveyId, DBMS.OLTP_DATASOURCE_NAME));
    }



}
