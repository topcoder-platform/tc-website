package com.topcoder.web.tc.controller.request.survey;

import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.SessionInfo;
import com.topcoder.web.common.BaseServlet;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.tc.model.Answer;
import com.topcoder.web.tc.model.Question;
import com.topcoder.web.ejb.survey.Response;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.security.ClassResource;

import javax.naming.InitialContext;
import java.util.List;
import java.util.Iterator;
import java.util.ArrayList;

public class View extends SurveyData {
    protected void surveyProcessing() throws TCWebException {
        if (getUser().isAnonymous())
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));
        try {
            if (alreadyResponded()) {
                SessionInfo info = (SessionInfo)getRequest().getAttribute(BaseServlet.SESSION_INFO_KEY);
                setNextPage(info.getServletPath() + "?" + Constants.MODULE_KEY + "=SurveyResults&" + Constants.SURVEY_ID + "=" + survey.getId());
                setIsNextPageInContext(false);
            } else {
                setNextPage(Constants.SURVEY_VIEW);
            }
        } catch (Exception e) {
            throw new TCWebException(e);
        }
        setIsNextPageInContext(true);
    }

    protected List makeAnswerInfo(long questionId) throws Exception {
        log.debug("makeAnswerInfo called");
        Request req = new Request();
        DataAccessInt dataAccess = getDataAccess(true);
        req.setContentHandle("answers");
        req.setProperty("qid", String.valueOf(questionId));
        ResultSetContainer rsc = (ResultSetContainer)dataAccess.getData(req).get("answer_info");
        List ret = null;
        if (rsc==null) {
            ret = new ArrayList(0);
        } else {
            ret = new ArrayList(rsc.size());
            ResultSetContainer.ResultSetRow row = null;
            Answer a = null;
            for (Iterator it = rsc.iterator(); it.hasNext();) {
                row = (ResultSetContainer.ResultSetRow)it.next();
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

    protected final boolean alreadyResponded() throws Exception {
        boolean ret = false;
        Question q = null;
        InitialContext ctx = null;
        try {
            ctx = new InitialContext();
            Response response = (Response) createEJB(ctx, Response.class);
            for (Iterator it = questionInfo.iterator(); it.hasNext();) {
                q = (Question) it.next();
                ret |= response.exists(getUser().getId(), q.getId());
            }
        } finally {
            close(ctx);
        }
        return ret;
    }
}
