package com.topcoder.web.privatelabel.controller.request;

import com.topcoder.web.privatelabel.model.FullRegInfo;
import com.topcoder.web.privatelabel.model.SimpleRegInfo;
import com.topcoder.web.privatelabel.model.DemographicQuestion;
import com.topcoder.web.privatelabel.model.DemographicAnswer;
import com.topcoder.web.privatelabel.Constants;
import com.topcoder.web.common.TCWebException;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;

import java.util.List;
import java.util.Map;
import java.util.ArrayList;
import java.util.Iterator;


/**
 * Provides some basic functionality for the different processors
 * involved in a registration process.
 * @author gpaul 06.26.2003
 */
abstract class FullRegBase extends SimpleRegBase {

    protected static Logger log = Logger.getLogger(FullRegBase.class);

    protected abstract void registrationProcessing() throws TCWebException;

    public FullRegBase() {
    }


    protected void setDefaults(FullRegInfo info) {
        super.setDefaults(info);
        setDefault(Constants.CODER_TYPE, String.valueOf(info.getCoderType()));
    }

    protected void checkFullRegInfo(FullRegInfo info) throws TCWebException {
        super.checkRegInfo(info);
    }

    protected String getRequestParameter(String name) throws Exception {
        String ret = null;
        ret = getRequest().getParameter(name);
        return ret;
    }

    protected SimpleRegInfo makeRegInfo() throws Exception {
        return new FullRegInfo(super.makeRegInfo());
    }

    protected List getQuestions() throws Exception {
        Request r = new Request();
        r.setContentHandle("demographic_question_list");
        Map qMap = getDataAccess(true).getData(r);
        ResultSetContainer questions = (ResultSetContainer)qMap.get("demographic_question_list");
        ResultSetContainer.ResultSetRow row = null;

        List ret = new ArrayList(questions.size());
        for (Iterator it = questions.iterator(); it.hasNext();) {
            row = (ResultSetContainer.ResultSetRow)it.next();
            ret.add(makeQuestion(row));
        }
        return ret;
    }

    protected DemographicQuestion makeQuestion(ResultSetContainer.ResultSetRow row) throws Exception {
        DemographicQuestion ret = new DemographicQuestion();
        ret.setId(row.getLongItem("demographic_question_id"));
        ret.setDesc(row.getStringItem("demographic_question_desc"));
        ret.setText(row.getStringItem("demographic_question_text"));
        ret.setSelectable(row.getStringItem("selectable"));
        ret.setRequired(row.getItem("is_required").getResultData()!=null && row.getIntItem("is_required")==1);

        DataAccessInt dataAccess = getDataAccess(true);
        Request r = new Request();
        r.setContentHandle("demographic_answer_list");
        r.setProperty("dq", String.valueOf(ret.getId()));
        Map aMap = dataAccess.getData(r);
        ResultSetContainer answers = (ResultSetContainer)aMap.get("demographic_answer_list");

        ResultSetContainer.ResultSetRow aRow = null;
        List answerList = new ArrayList(answers.size());
        for (Iterator it = answers.iterator(); it.hasNext();) {
            aRow = (ResultSetContainer.ResultSetRow)it.next();
            answerList.add(makeAnswer(aRow));
        }
        ret.setAnswers(answerList);
        return ret;
    }

    protected DemographicAnswer makeAnswer(ResultSetContainer.ResultSetRow row) {
        DemographicAnswer ret = new DemographicAnswer();
        ret.setAnswerId(row.getLongItem("demographic_answer_id"));
        ret.setText(row.getStringItem("demographic_answer_text"));
        ret.setQuestionId(row.getLongItem("demographic_question_id"));
        return ret;
    }


}
