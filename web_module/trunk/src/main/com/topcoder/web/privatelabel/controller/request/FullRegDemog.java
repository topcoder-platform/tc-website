package com.topcoder.web.privatelabel.controller.request;

import com.topcoder.web.privatelabel.Constants;
import com.topcoder.web.privatelabel.model.DemographicQuestion;
import com.topcoder.web.privatelabel.model.DemographicAnswer;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.resume.ejb.ResumeServices.ResumeServices;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.util.logging.Logger;

import javax.naming.InitialContext;
import java.util.List;
import java.util.Map;
import java.util.Iterator;
import java.util.ArrayList;

/**
 *
 * @author gpaul 07.02.2003
 */
public class FullRegDemog extends FullRegBase {
    protected static Logger log = Logger.getLogger(FullRegDemog.class);

    protected void registrationProcessing() throws TCWebException {

        checkRegInfo(regInfo);

        if (hasErrors()) {
            getRequest().setAttribute("countryList", getCountryList());
            getRequest().setAttribute("stateList", getStateList());
            setNextPage(Constants.VERIZON_REG_PAGE);
            setDefaults(regInfo);
        } else {
            try {
                getRequest().setAttribute("fileTypeList", getFileTypes());
                getRequest().setAttribute("questionList", getQuestions());
            } catch (Exception e) {
                throw new TCWebException(e);
            }
            setNextPage(Constants.VERIZON_REG_DEMOG_PAGE);
        }
        setIsNextPageInContext(true);
    }

    protected ResultSetContainer getFileTypes() throws Exception {
        InitialContext ctx = null;
        ResultSetContainer ret = null;
        try {
            ctx = new InitialContext();
            ResumeServices resume = (ResumeServices) createEJB(ctx, ResumeServices.class);
            ret = resume.getFileTypes();
        } finally {
            close(ctx);
        }
        return ret;
    }

    private List getQuestions() throws Exception {
        DataAccessInt dataAccess = getDataAccess(true);
        Request r = new Request();
        r.setContentHandle("demographic_question_list");
        Map qMap = dataAccess.getData(r);
        ResultSetContainer questions = (ResultSetContainer)qMap.get("demographic_question_list");
        ResultSetContainer.ResultSetRow row = null;

        List ret = new ArrayList(questions.size());
        for (Iterator it = questions.iterator(); it.hasNext();) {
            row = (ResultSetContainer.ResultSetRow)it.next();
            ret.add(makeQuestion(row));
        }
        return ret;
    }

    private DemographicQuestion makeQuestion(ResultSetContainer.ResultSetRow row) throws Exception {
        DemographicQuestion ret = new DemographicQuestion();
        ret.setDemographicQuestionId(row.getLongItem("demographic_question_id"));
        ret.setDemographicQuestionDesc(row.getStringItem("demographic_question_desc"));
        ret.setDemographicQuestionText(row.getStringItem("demographic_question_text"));
        ret.setSelectable(row.getStringItem("selectable"));

        DataAccessInt dataAccess = getDataAccess(true);
        Request r = new Request();
        r.setContentHandle("demographic_answer_list");
        r.setProperty("dq", String.valueOf(ret.getDemographicQuestionId()));
        Map aMap = dataAccess.getData(r);
        ResultSetContainer answers = (ResultSetContainer)aMap.get("demographic_answer_list");

        ResultSetContainer.ResultSetRow aRow = null;
        List answerList = new ArrayList(answers.size());
        for (Iterator it = answers.iterator(); it.hasNext();) {
            aRow = (ResultSetContainer.ResultSetRow)it.next();
            answerList.add(makeAnswer(aRow));
        }
        return ret;
    }

    private DemographicAnswer makeAnswer(ResultSetContainer.ResultSetRow row) {
        DemographicAnswer ret = new DemographicAnswer();
        ret.setDemographicAnswerId(row.getLongItem("demographic_answer_id"));
        ret.setDemographicAnswerText(row.getStringItem("demographic_answer_text"));
        ret.setDemographicQuestionId(row.getLongItem("demographic_question_id"));
        return ret;
    }
}

