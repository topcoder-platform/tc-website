package com.topcoder.web.privatelabel.controller.request;

import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.security.SessionPersistor;
import com.topcoder.web.privatelabel.Constants;
import com.topcoder.web.privatelabel.model.*;

import java.util.*;


/**
 * Provides some basic functionality for the different processors
 * involved in a registration process.
 * @author gpaul 06.26.2003
 */
abstract class FullRegBase extends SimpleRegBase {

    protected static Logger log = Logger.getLogger(FullRegBase.class);
    protected Map questions;

    public FullRegBase() {
    }

    protected void businessProcessing() throws TCWebException {
        try {
            p = new SessionPersistor(getRequest().getSession(true));
            //gotta do first just in case makeRegInfo() needs the database
            long companyId = Long.parseLong(getRequestParameter(Constants.COMPANY_ID));
            transDb = getCompanyDb(companyId, Constants.JTS_TRANSACTIONAL);
            db = getCompanyDb(companyId, Constants.TRANSACTIONAL);
            log.debug("trans database set to: " + transDb);
            log.debug("database set to: " + db);

            questions = getQuestions(transDb, companyId);
            regInfo = makeRegInfo();
            p.setObject(Constants.REGISTRATION_INFO, regInfo);
            registrationProcessing();
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }

    protected void setDefaults(SimpleRegInfo info) {
        super.setDefaults(info);
        setDefault(Constants.CODER_TYPE, String.valueOf(((FullRegInfo) info).getCoderType()));
        List responses = ((FullRegInfo) info).getResponses();
        DemographicResponse response = null;
        DemographicQuestion question = null;
        for (Iterator it = responses.iterator(); it.hasNext();) {
            response = (DemographicResponse) it.next();
            question = findQuestion(response.getQuestionId(), questions);
            if (question.getAnswerType() == DemographicQuestion.SINGLE_SELECT) {
                setDefault(Constants.DEMOG_PREFIX + response.getQuestionId(), String.valueOf(response.getAnswerId()));
            } else if (question.getAnswerType() == DemographicQuestion.FREE_FORM) {
                setDefault(Constants.DEMOG_PREFIX + response.getQuestionId(), response.getText());
            } else if (question.getAnswerType() == DemographicQuestion.MULTIPLE_SELECT) {
                //todo handle multiple select
            } else {
                //todo something is wrong, we don't recognize that kind of question
            }
        }

    }

    protected static DemographicQuestion findQuestion(long questionId, Map questions) {
        DemographicQuestion ret = null;
        Long id = new Long(questionId);
        if (questions.containsKey(id)) {
            ret = (DemographicQuestion) ((DemographicQuestion) questions.get(id)).clone();
        }
        return ret;
    }

    protected String getRequestParameter(String name) throws Exception {
        String ret = null;
        ret = getRequest().getParameter(name);
        return ret;
    }

    protected SimpleRegInfo makeRegInfo() throws Exception {
        SimpleRegInfo ret = super.makeRegInfo();
        if (!(ret instanceof FullRegInfo)) {
            ret = new FullRegInfo(ret);
        }
        return ret;
    }

    /**
     * get a map of questions.  key is a Long containing the question id.  value is the
     * DemographicQuestion object.
     * @param db
     * @return
     * @throws Exception
     */
    protected static Map getQuestions(String db, long companyId) throws Exception {
        Request r = new Request();
        r.setContentHandle("demographic_question_list");
        r.setProperty("cm", String.valueOf(companyId));
        Map qMap = getDataAccess(db, true).getData(r);
        ResultSetContainer questions = (ResultSetContainer) qMap.get("demographic_question_list");
        ResultSetContainer.ResultSetRow row = null;

        Map ret = new HashMap();
        DemographicQuestion q = null;
        for (Iterator it = questions.iterator(); it.hasNext();) {
            row = (ResultSetContainer.ResultSetRow) it.next();
            q = makeQuestion(row, db, companyId);
            ret.put(new Long(q.getId()), q);
        }
        return ret;
    }

    private static DemographicQuestion makeQuestion(ResultSetContainer.ResultSetRow row, String db, long companyId) throws Exception {
        DemographicQuestion ret = new DemographicQuestion();
        ret.setId(row.getLongItem("demographic_question_id"));
        ret.setDesc(row.getStringItem("demographic_question_desc"));
        ret.setText(row.getStringItem("demographic_question_text"));
        ret.setSelectable(row.getStringItem("selectable"));
        ret.setRequired(row.getItem("is_required").getResultData() != null && row.getIntItem("is_required") == 1);
        ret.setSort(row.getIntItem("sort"));

        DataAccessInt dataAccess = getDataAccess(db, true);
        Request r = new Request();
        r.setContentHandle("demographic_answer_list");
        r.setProperty("dq", String.valueOf(ret.getId()));
        r.setProperty("cm", String.valueOf(companyId));
        Map aMap = dataAccess.getData(r);
        ResultSetContainer answers = (ResultSetContainer) aMap.get("demographic_answer_list");

        ResultSetContainer.ResultSetRow aRow = null;
        List answerList = new ArrayList(answers.size());
        for (Iterator it = answers.iterator(); it.hasNext();) {
            aRow = (ResultSetContainer.ResultSetRow) it.next();
            answerList.add(makeAnswer(aRow));
        }
        ret.setAnswers(answerList);
        return ret;
    }

    private static DemographicAnswer makeAnswer(ResultSetContainer.ResultSetRow row) {
        DemographicAnswer ret = new DemographicAnswer();
        ret.setAnswerId(row.getLongItem("demographic_answer_id"));
        ret.setText(row.getStringItem("demographic_answer_text"));
        ret.setQuestionId(row.getLongItem("demographic_question_id"));
        ret.setSort(row.getIntItem("sort"));
        return ret;
    }

    protected final List getQuestionList() throws Exception {
        List ret = new ArrayList(questions.size());
        DemographicQuestion q = null;
        for (Iterator it = questions.values().iterator(); it.hasNext();) {
            q = (DemographicQuestion) it.next();
            ret.add(q.clone());
        }
        return ret;
    }

}
