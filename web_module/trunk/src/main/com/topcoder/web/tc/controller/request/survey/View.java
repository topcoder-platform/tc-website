package com.topcoder.web.tc.controller.request.survey;

import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.security.ClassResource;
import com.topcoder.web.common.*;
import com.topcoder.web.ejb.survey.Response;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.tc.model.Answer;
import com.topcoder.web.tc.model.Question;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class View extends SurveyData {
    protected void surveyProcessing() throws TCWebException {
        if (getUser().isAnonymous())
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));
        try {
            if (alreadyResponded()) {
                SessionInfo info = (SessionInfo) getRequest().getAttribute(BaseServlet.SESSION_INFO_KEY);
                setNextPage(info.getServletPath() + "?" + Constants.MODULE_KEY + "=SurveyResults&" + Constants.SURVEY_ID + "=" + survey.getId());
                setIsNextPageInContext(false);
            } else if (isSRMSurvey() && !hasSurveyClosed()) {
                throw new NavigationException("Sorry, you can not answer this survey at this time.");
            } else {
                setNextPage(Constants.SURVEY_VIEW);
            }
        } catch (TCWebException e) {
            throw e;
        } catch (Exception e) {
            throw new TCWebException(e);
        }
        setIsNextPageInContext(true);
    }

    protected List makeAnswerInfo(long questionId) throws Exception {
        log.debug("makeAnswerInfo called: " + questionId);
        Request req = new Request();
        DataAccessInt dataAccess = getDataAccess(true);
        req.setContentHandle("answers");
        req.setProperty("qid", String.valueOf(questionId));
        ResultSetContainer rsc = (ResultSetContainer) dataAccess.getData(req).get("answer_info");
        List ret = null;
        if (rsc == null) {
            ret = new ArrayList(0);
        } else {
            ret = new ArrayList(rsc.size());
            ResultSetContainer.ResultSetRow row = null;
            Answer a = null;
            for (Iterator it = rsc.iterator(); it.hasNext();) {
                row = (ResultSetContainer.ResultSetRow) it.next();
                a = new Answer();
                a.setId(row.getLongItem("answer_id"));
                a.setQuestionId(row.getLongItem("question_id"));
                a.setSort(row.getIntItem("sort_order"));
                a.setText(row.getStringItem("answer_text"));
                ret.add(a);
            }
        }

        return ret;
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
