package com.topcoder.web.tc.controller.request.survey;

import java.util.Date;
import java.util.Iterator;

import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.security.ClassResource;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.model.Question;
import com.topcoder.web.common.tag.AnswerInput;
import com.topcoder.web.ejb.survey.Response;
import com.topcoder.web.tc.Constants;

public class View extends SurveyData {
    protected void surveyProcessing() throws TCWebException {
        if (getUser().isAnonymous())
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));
        try {
            if (alreadyResponded()) {
                // we'll display user's response.
                log.debug("Already responded...");
                
                // sets all defaults
                setResponseDefaults(getUser().getId(), survey.getId());
                getRequest().setAttribute("alreadyResponded", new Boolean("true"));

                setNextPage(Constants.SURVEY_VIEW);
            } else if (isSRMSurvey() && !hasSurveyClosed()) {
                throw new NavigationException("Sorry, you can not answer this survey at this time.");
            } else if (survey.getEndDate().before(new Date()) || survey.getStartDate().after(new Date())) {
                throw new NavigationException("Sorry, you can not answer this survey at this time.");
            } else {
                getRequest().setAttribute("alreadyResponded", new Boolean("false"));
                setNextPage(Constants.SURVEY_VIEW);
            }
        } catch (TCWebException e) {
            throw e;
        } catch (Exception e) {
            throw new TCWebException(e);
        }
        setIsNextPageInContext(true);
    }

    /**
     * First processing of the board
     *
     * @param userId the user id
     * @param surveyId the survey id
     */
    private void setResponseDefaults(long userId, long surveyId) throws Exception {
        log.debug("Setting defaults...");
        Request req = new Request();
        DataAccessInt dataAccess = getDataAccess(true);
        req.setContentHandle("response_detail");
        req.setProperty("cr", String.valueOf(userId));
        req.setProperty("sid", String.valueOf(surveyId));
        ResultSetContainer rsc = (ResultSetContainer) dataAccess.getData(req).get("response_detail");

        ResultSetContainer.ResultSetRow row = null;
        for (Iterator it = rsc.iterator(); it.hasNext();) {
            row = (ResultSetContainer.ResultSetRow) it.next();

            int styleId = row.getIntItem("question_style_id");
            if  (styleId == Question.LONG_ANSWER || styleId == Question.SHORT_ANSWER) {
                setDefault(AnswerInput.PREFIX + row.getLongItem("question_id"), row.getStringItem("response"));
                log.debug("setDefault: " + AnswerInput.PREFIX + row.getLongItem("question_id"));
                log.debug("value: " + row.getStringItem("response"));
            } else if (styleId == Question.SINGLE_CHOICE) {
                setDefault(AnswerInput.PREFIX + row.getLongItem("question_id"), new Long(row.getLongItem("answer_id")));
                log.debug("setDefault: " + AnswerInput.PREFIX + row.getLongItem("question_id"));
                log.debug("value: " + row.getLongItem("answer_id"));
            } else if (styleId == Question.MULTIPLE_CHOICE) {
                setDefault(AnswerInput.PREFIX + row.getLongItem("question_id") + 
                    "," + row.getLongItem("answer_id"), "true");
                log.debug("setDefault: " + AnswerInput.PREFIX + row.getLongItem("question_id"));
                log.debug("value: " + "true");
            }
        }
    }

    protected final boolean isSRMSurvey() {
        Question q = null;
        boolean found = false;
        for (Iterator it = questionInfo.iterator(); it.hasNext() && !found;) {
            q = (Question) it.next();
            found |= q.getTypeId() == Constants.SRM_SURVEY_QUESTION;
        }
        return found;
    }

    /**
     * this refers to whether or not is has closed as far as
     * the srm round registration is concerned.  we don't
     * want people answering the survey on the site and in the applet
     *
     * @return
     * @throws TCWebException
     */
    protected final boolean hasSurveyClosed() throws TCWebException {
        boolean found = false;

        try {
            Request r = new Request();
            //we're assuming that the survey_list command only includes surveys that have closed
            //as far as round registration is concerned.
            r.setContentHandle("survey_list");
            r.setProperty("cr", String.valueOf(getUser().getId()));
            ResultSetContainer rsc = (ResultSetContainer) getDataAccess().getData(r).get("survey_list");
            ResultSetContainer.ResultSetRow row = null;
            for (Iterator it = rsc.iterator(); it.hasNext() && !found;) {
                row = (ResultSetContainer.ResultSetRow) it.next();
                found |= row.getLongItem("survey_id") == survey.getId();
            }
        } catch (Exception e) {
            throw new TCWebException(e);
        }

        return found;
    }


    protected final boolean alreadyResponded() throws Exception {
        boolean ret = false;
        Question q = null;
        Response response = (Response) createEJB(getInitialContext(), Response.class);
        for (Iterator it = questionInfo.iterator(); it.hasNext();) {
            q = (Question) it.next();
            ret |= response.exists(getUser().getId(), q.getId());
        }
        return ret;
    }
}
