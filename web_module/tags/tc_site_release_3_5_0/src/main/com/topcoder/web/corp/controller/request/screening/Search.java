/*
 * Search.java
 *
 * Created on July 13, 2004, 10:54 AM
 */

package com.topcoder.web.corp.controller.request.screening;

import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.corp.common.Constants;
import com.topcoder.web.corp.common.Util;
import com.topcoder.web.corp.model.SearchModel;
import com.topcoder.web.privatelabel.model.DemographicAnswer;
import com.topcoder.web.privatelabel.model.DemographicQuestion;

import java.util.*;

/**
 *
 * @author  rfairfax
 */
public class Search extends BaseScreeningProcessor {

    protected void screeningProcessing() throws com.topcoder.web.common.TCWebException {

        try {

            SearchModel sm = getSearchModel();

            setDefault(Constants.FIRST_NAME, sm.getFirstName());
            setDefault(Constants.LAST_NAME, sm.getLastName());
            setDefault(Constants.EMAIL_ADDRESS, sm.getEmailAddress());

            getRequest().setAttribute("searchResults", sm);

            setNextPage(Constants.SEARCH_PAGE);
            setIsNextPageInContext(true);
        } catch (Exception e) {
            throw new com.topcoder.web.common.TCWebException(e);
        }
    }

    private SearchModel getSearchModel() throws Exception {
        try {

            SearchModel ret = new SearchModel();

            ret.setFirstName(StringUtils.checkNull(getRequest().getParameter(Constants.FIRST_NAME)));
            ret.setLastName(StringUtils.checkNull(getRequest().getParameter(Constants.LAST_NAME)));
            ret.setEmailAddress(StringUtils.checkNull(getRequest().getParameter(Constants.EMAIL_ADDRESS)));

            //load demographic info

            List l = getQuestionList();
            Collections.sort(l);

            ret.setQuestions(l);

            return ret;
        } catch (Exception e) {
            throw e;
        }
    }

    protected final List getQuestionList() throws Exception {
        //in case we need the list before we've populated it.  this is most
        //likely to happen in makeRegInfo()
        Map questions;
        questions = getQuestions(getUser().getId());

        List ret = new ArrayList(questions.size());
        DemographicQuestion q = null;
        for (Iterator it = questions.values().iterator(); it.hasNext();) {
            q = (DemographicQuestion) it.next();
            ret.add(q.clone());
        }
        return ret;
    }

    protected static Map getQuestions(long userId) throws Exception {
        Request r = new Request();
        r.setContentHandle("demographic_question_list_by_user");
        r.setProperty("ct", "2"); //professional
        r.setProperty("uid", String.valueOf(userId)); //professional
        Map qMap = Util.getDataAccess(true).getData(r);
        ResultSetContainer questions = (ResultSetContainer) qMap.get("demographic_question_list_by_user");
        ResultSetContainer.ResultSetRow row = null;

        Map ret = new HashMap();
        DemographicQuestion q = null;
        for (Iterator it = questions.iterator(); it.hasNext();) {
            row = (ResultSetContainer.ResultSetRow) it.next();
            q = makeQuestion(row);
            ret.put(new Long(q.getId()), q);
        }
        return ret;
    }

    private static DemographicQuestion makeQuestion(ResultSetContainer.ResultSetRow row) throws Exception {
        DemographicQuestion ret = new DemographicQuestion();
        ret.setId(row.getLongItem("demographic_question_id"));
        ret.setDesc(row.getStringItem("demographic_question_desc"));
        ret.setText(row.getStringItem("demographic_question_text"));
        ret.setSelectable(row.getStringItem("selectable"));
        ret.setRequired(row.getItem("is_required").getResultData() != null && row.getIntItem("is_required") == 1);
        ret.setSort(row.getIntItem("sort"));

        DataAccessInt dataAccess = Util.getDataAccess(true);
        Request r = new Request();
        r.setContentHandle("demographic_answer_list");
        r.setProperty("dq", String.valueOf(ret.getId()));
        r.setProperty("db", String.valueOf("SCREENING_OLTP"));
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

}
