package com.topcoder.web.privatelabel.controller.request;

import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.StringUtils;
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
            db = getCompanyDb(companyId);

            questions = getQuestions(db);
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
            question = findQuestion(response.getQuestionId());
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

    protected DemographicQuestion findQuestion(long questionId) {
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
        FullRegInfo info = new FullRegInfo(super.makeRegInfo());

        //get the rest from the request
        if (hasRequestParameter(Constants.CODER_TYPE)) {
            String sCoderType = getRequestParameter(Constants.CODER_TYPE);
            info.setCoderType(Integer.parseInt(sCoderType == null ? "-1" : sCoderType));
        }

        //get the demographic responses
        DemographicQuestion q = null;
        String[] values = null;
        DemographicResponse r = null;
        String key = null;
        List questionList = getQuestionList();
        //loop through all the questions
        for (Iterator it = questionList.iterator(); it.hasNext();) {
            q = (DemographicQuestion) it.next();
            key = Constants.DEMOG_PREFIX + q.getId();
            values = getRequest().getParameterValues(key);
            if (q.isRequired() && !hasRequestParameter(key) && !info.hasResponse(q.getId())) {
                //this is cheating, cuz really it should be done in the data checking method.
                addError(key, "Please enter a valid answer, this question is required.");
            } else if (values != null) {
                //if they've responded in this request, replace whatever was there in persitor with this new stuff
                if (values.length > 0) {
                    info.removeResponses(q.getId());
                }
                String value = null;
                //loop through all the responses in the request
                for (int i = 0; i < values.length; i++) {
                    value = StringUtils.checkNull(values[i]).trim();
                    if (value.length() > 0) {
                        r = new DemographicResponse();
                        r.setQuestionId(q.getId());
                        if (q.getAnswerType() == DemographicQuestion.FREE_FORM) {
                            r.setText(values[i]);
                            info.addResponse(r);
                        } else if (q.getAnswerType() == DemographicQuestion.SINGLE_SELECT ||
                                q.getAnswerType() == DemographicQuestion.MULTIPLE_SELECT) {
                            try {
                                r.setAnswerId(Long.parseLong(values[i]));
                                info.addResponse(r);
                            } catch (NumberFormatException e) {
                                //skip it, it's invalid, checking will have to pick it up later
                            }
                        } else {
                            throw new Exception("invalid answer type found: " + q.getAnswerType() + " for question " + q.getId());
                        }
                    } else if (q.isRequired()) {
                        /* at this point, we know that the parameter was included in the request, but the value
                         * was empty.  we'll complain to them and ask them to fill in the question
                         */
                        addError(key, "Please enter a valid answer, this question is required.");
                    }
                }
            }

        }

        return info;


    }

    /**
     * get a map of questions.  key is a Long containing the question id.  value is the
     * DemographicQuestion object.
     * @param db
     * @return
     * @throws Exception
     */
    static Map getQuestions(String db) throws Exception {
        Request r = new Request();
        r.setContentHandle("demographic_question_list");
        Map qMap = getDataAccess(db, true).getData(r);
        ResultSetContainer questions = (ResultSetContainer) qMap.get("demographic_question_list");
        ResultSetContainer.ResultSetRow row = null;

        Map ret = new HashMap();
        DemographicQuestion q = null;
        for (Iterator it = questions.iterator(); it.hasNext();) {
            row = (ResultSetContainer.ResultSetRow) it.next();
            q = makeQuestion(row, db);
            ret.put(new Long(q.getId()), q);
        }
        return ret;
    }

    private static DemographicQuestion makeQuestion(ResultSetContainer.ResultSetRow row, String db) throws Exception {
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
