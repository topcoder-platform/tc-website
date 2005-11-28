package com.topcoder.web.admin.controller.request;

import com.topcoder.web.admin.Constants;
import com.topcoder.web.ejb.survey.Survey;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.BaseServlet;
import com.topcoder.web.common.SessionInfo;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.ApplicationServer;

import javax.transaction.TransactionManager;
import javax.transaction.Status;
import java.util.Arrays;
import java.util.Date;
import java.text.SimpleDateFormat;
import java.text.ParsePosition;
import java.sql.Timestamp;

/**
 * @author dok
 * @version $Revision$ $Date$
 *          Create Date: Nov 9, 2005
 */
public class UpdateSurvey extends EditSurvey {

    protected void businessProcessing() throws Exception {

        String sId = getRequest().getParameter(Constants.SURVEY_ID);
        String surveyEnd = StringUtils.checkNull(getRequest().getParameter(Constants.SURVEY_END));
        String surveyStart = StringUtils.checkNull(getRequest().getParameter(Constants.SURVEY_START));
        String surveyName = StringUtils.checkNull(getRequest().getParameter(Constants.SURVEY_NAME));
        String surveyStatus = StringUtils.checkNull(getRequest().getParameter(Constants.SURVEY_STATUS));
        String surveyText = StringUtils.checkNull(getRequest().getParameter(Constants.SURVEY_TEXT));
        String surveyResultsViewable = StringUtils.checkNull(getRequest().getParameter(Constants.RESULTS_VIEWABLE));

        if (surveyEnd.equals("")) {
            addError(Constants.SURVEY_END, "You must fill in an end date");
        } else if (!isValidDate(surveyEnd)) {
            addError(Constants.SURVEY_END, "You must fill in a valid date string");
        }
        if (surveyStart.equals("")) {
            addError(Constants.SURVEY_START, "You must fill in a start date");
        } else if (!isValidDate(surveyStart)) {
            addError(Constants.SURVEY_START, "You must fill in a valid date string");
        }
        if (surveyName.equals("")) {
            addError(Constants.SURVEY_NAME, "You must fill in a name");
        }
        if (surveyStatus.equals("")) {
            addError(Constants.SURVEY_STATUS, "You must fill in a status");
        } else {
            if (StringUtils.isNumber(surveyStatus)) {
                int status = Integer.parseInt(surveyStatus);
                if (!(Arrays.binarySearch(Constants.ACTIVE_STATUSES, status) >= 0
                        || Arrays.binarySearch(Constants.INACTIVE_STATUSES, status) >= 0)) {
                    addError(Constants.SURVEY_STATUS, "Invalid status provided");
                }
            } else {
                addError(Constants.SURVEY_STATUS, "Invalid status provided");
            }
        }

        if (hasErrors()) {
            setDefault(Constants.SURVEY_ID, sId);
            setDefault(Constants.SURVEY_END, surveyEnd);
            setDefault(Constants.SURVEY_START, surveyStart);
            setDefault(Constants.SURVEY_NAME, surveyName);
            setDefault(Constants.SURVEY_STATUS, surveyStatus);
            setDefault(Constants.SURVEY_TEXT, surveyText);
            setDefault(Constants.RESULTS_VIEWABLE, surveyResultsViewable);
            loadStatusList();
            if (StringUtils.isNumber(sId)) {
                loadQuestions(Long.parseLong(sId));
            }
            setNextPage("/editSurvey.jsp");
            setIsNextPageInContext(true);
        } else {
            TransactionManager tm = null;
            try {

                Survey survey = (Survey) createEJB(getInitialContext(), Survey.class);
                tm = (TransactionManager) getInitialContext().lookup(ApplicationServer.TRANS_MANAGER);
                tm.begin();
                long surveyId = 0;
                if (StringUtils.checkNull(sId).equals("")) {
                    surveyId = survey.createSurvey(surveyName, new Timestamp(parseDate(surveyStart).getTime()),
                            new Timestamp(parseDate(surveyEnd).getTime()), Integer.parseInt(surveyStatus),
                            "on".equals(surveyResultsViewable), DBMS.JTS_OLTP_DATASOURCE_NAME);
                } else {
                    surveyId = Long.parseLong(sId);
                    survey.setEndDate(surveyId, new Timestamp(parseDate(surveyEnd).getTime()), DBMS.JTS_OLTP_DATASOURCE_NAME);
                    survey.setStartDate(surveyId, new Timestamp(parseDate(surveyStart).getTime()), DBMS.JTS_OLTP_DATASOURCE_NAME);
                    survey.setName(surveyId, surveyName, DBMS.JTS_OLTP_DATASOURCE_NAME);
                    survey.setResultsViewable(surveyId, "on".equals(surveyResultsViewable), DBMS.JTS_OLTP_DATASOURCE_NAME);
                    survey.setText(surveyId, surveyText, DBMS.JTS_OLTP_DATASOURCE_NAME);
                }

                tm.commit();

                SessionInfo info = (SessionInfo) getRequest().getAttribute(BaseServlet.SESSION_INFO_KEY);
                setNextPage(info.getServletPath() + "?module=EditSurvey&" + Constants.SURVEY_ID + "=" + surveyId);
                setIsNextPageInContext(false);
            } catch (Exception e) {
                if (tm != null && tm.getStatus() == Status.STATUS_ACTIVE) {
                    tm.rollback();
                }
                throw e;
            }
        }
    }

    protected boolean isValidDate(String s) {
        return parseDate(s) != null;
    }

    protected Date parseDate(String s) {
        //yyyy.MM.dd HH:mm
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd HH:mm");
        ParsePosition pp = new ParsePosition(0);
        return sdf.parse(s, pp);
    }
}