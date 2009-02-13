/*
 * Search.java
 *
 * Created on July 13, 2004, 10:54 AM
 */

package com.topcoder.web.corp.controller.request.screening;

import com.topcoder.shared.dataAccess.*;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.corp.common.Constants;
import com.topcoder.web.corp.common.Util;
import com.topcoder.web.corp.model.SearchModel;
import com.topcoder.web.privatelabel.model.DemographicAnswer;
import com.topcoder.web.privatelabel.model.DemographicQuestion;
import com.topcoder.web.privatelabel.model.DemographicResponse;

import java.util.*;

/**
 *
 * @author  rfairfax
 */
public class SearchResults extends BaseScreeningProcessor {

    protected void screeningProcessing() throws com.topcoder.web.common.TCWebException {

        try {
            SearchModel sm = getSearchModel();

            setDefault(Constants.FIRST_NAME, sm.getFirstName());
            setDefault(Constants.LAST_NAME, sm.getLastName());
            setDefault(Constants.EMAIL_ADDRESS, sm.getEmailAddress());

            //demographic responses
            List responses = sm.getResponses();
            DemographicResponse response = null;
            DemographicQuestion question = null;

            HashMap multiAnswerMap = new HashMap();
            Map questions = getQuestions(getUser().getId());
            for (Iterator it = responses.iterator(); it.hasNext();) {
                response = (DemographicResponse) it.next();
                question = findQuestion(response.getQuestionId(), questions);
                if (question.getAnswerType() == DemographicQuestion.SINGLE_SELECT) {
                    setDefault(Constants.DEMOG_PREFIX + response.getQuestionId(), String.valueOf(response.getAnswerId()));
                } else if (question.getAnswerType() == DemographicQuestion.FREE_FORM) {
                    setDefault(Constants.DEMOG_PREFIX + response.getQuestionId(), response.getText());
                } else if (question.getAnswerType() == DemographicQuestion.MULTIPLE_SELECT) {
                    //todo handle multiple select
                    ArrayList al = new ArrayList();
                    if (multiAnswerMap.containsKey(new Long(response.getQuestionId()))) {
                        al = (ArrayList) multiAnswerMap.get(new Long(response.getQuestionId()));
                    }
                    al.add(String.valueOf(response.getAnswerId()));
                    multiAnswerMap.put(new Long(response.getQuestionId()), al);
                }
            }
            for (Iterator it = multiAnswerMap.keySet().iterator(); it.hasNext();) {
                String s = String.valueOf(((Long) it.next()).longValue());
                setDefault(Constants.DEMOG_PREFIX + s, multiAnswerMap.get(new Long(s)));
            }

            getRequest().setAttribute("searchResults", sm);

            setNextPage(Constants.SEARCH_RESULTS_PAGE);
            setIsNextPageInContext(true);
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }

    private SearchModel getSearchModel() throws Exception {
        SearchModel ret = new SearchModel();

        ret.setFirstName(StringUtils.checkNull(getRequest().getParameter(Constants.FIRST_NAME)));
        ret.setLastName(StringUtils.checkNull(getRequest().getParameter(Constants.LAST_NAME)));
        ret.setEmailAddress(StringUtils.checkNull(getRequest().getParameter(Constants.EMAIL_ADDRESS)));

        ret.setUserId(getUser().getId());

        String start = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.START_RANK));
        if (start.equals(""))
            ret.setStart(1);
        else
            ret.setStart(Integer.parseInt(start));

        String end = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.END_RANK));
        if (end.equals(""))
            ret.setEnd(Constants.SEARCH_SCROLL_SIZE);
        else
            ret.setEnd(Integer.parseInt(end));

        //make sure we like the size they they're searching for
        if (ret.getEnd() - ret.getStart() > (Constants.SEARCH_SCROLL_SIZE - 1)) {
            ret.setEnd(ret.getStart() + (Constants.SEARCH_SCROLL_SIZE - 1));
        }

        StringBuffer query = new StringBuffer(1000);
        StringBuffer countQuery = new StringBuffer(1000);
        //generate results
        query.append("select distinct u.first_name || ' ' || u.last_name as name, ");
        query.append("e.address as email_address, ");
        query.append("case when a.state_code is null then a.province else a.state_code end as state, ");
        query.append("ct.country_name, ");
        query.append("cty.coder_type_desc as coder_type, ");
        query.append("j.job_desc as job, ");
        query.append("p.name as problem_name, ");
        query.append("s.begin_time as start_date, ");
        query.append("NVL(TO_CHAR(EXTEND(TODAY) + ");
        query.append("           ((sbm.submit_time - sbm.open_time)/1000) UNITS FRACTION, ");
        query.append("           '%H:%M:%S'),'N/A') as problem_time, ");
        query.append("NVL(cup.level,0) as preference, ");
        query.append("p.problem_id, ");
        query.append("sppx.session_round_id, ");
        query.append("u.user_id, ");
        query.append("s.session_id, ");
        query.append("CASE WHEN (SELECT count(*) ");
        query.append("FROM user_note_xref unx ");
        query.append("    , note n ");
        query.append("WHERE unx.user_id = u.user_id ");
        query.append("  AND unx.note_id = n.note_id ");
        query.append("  AND n.submitted_by IN (SELECT c2.contact_id  ");
        query.append("                           FROM contact c2 ");
        query.append("                          WHERE c2.company_id = sp.company_id)) = 0 THEN 'none' else 'view' end as note_text, ");
        query.append("CASE WHEN (NVL(TO_CHAR(EXTEND(TODAY) +  ");
        query.append("           ((sbm.submit_time - sbm.open_time)/1000) UNITS FRACTION, ");
        query.append("           '%H:%M:%S'),'N/A')) = 'N/A' then 'details' else 'results' end as problem_text ");
        query.append(", t.timezone_desc ");
        query.append("from ");
        query.append("user u, session s, session_profile sp, email e, ");
        query.append("coder c, user_address_xref uax, address a, country ct, coder_type cty, ");
        query.append("session_profile_problem_xref sppx, job_hit jh, job j, ");
        query.append("problem p, component cm, OUTER(component_state cs, OUTER( submission sbm)), OUTER(company_user_preference cup) ");
        query.append(", timezone_lu t ");
        query.append(", company co ");
        query.append("where s.user_id = u.user_id ");
        query.append("and sp.session_profile_id = s.session_profile_id ");
        query.append("and e.user_id = u.user_id ");
        query.append("and e.primary_ind = 1 ");
        query.append("and c.coder_id = u.user_id ");
        query.append("and uax.user_id = u.user_id ");
        query.append("and a.address_id = uax.address_id ");
        query.append("and a.address_type_id = 2 ");
        query.append("and ct.country_code = a.country_code ");
        query.append("and cty.coder_type_id = c.coder_type_id ");
        query.append("and jh.user_id = u.user_id ");
        query.append("and j.job_id = jh.job_id ");
        query.append("and sppx.session_profile_id = s.session_profile_id ");
        query.append("and sppx.problem_type_id = 4 ");
        query.append("and sppx.problem_id in (select problem_id from session_round_component sr, component cp ");
        query.append("	where sr.component_id = cp.component_id and sr.session_round_id in ( select session_round_id from company_session_schedule where company_id = sp.company_id ) ) ");
        query.append("and p.problem_id = sppx.problem_id ");
        query.append("and cm.problem_id = p.problem_id ");
        query.append("and cs.component_id = cm.component_id ");
        query.append("and cs.coder_id = c.coder_id ");
        query.append("and cs.session_id = s.session_id ");
        query.append("and sbm.component_state_id = cs.component_state_id ");
        query.append("and sbm.submission_number = (select max(submission_number) from submission where component_state_id = cs.component_state_id) ");
        query.append("and cup.company_id = sp.company_id ");
        query.append("and cup.user_id = u.user_id ");
        query.append("and co.timezone_id = t.timezone_id ");
        query.append("and co.company_id = sp.company_id ");
        query.append("and cs.company_id = sp.company_id ");
        query.append("and sp.company_id = (select company_id from contact where contact_id = ");

        query.append(getUser().getId());
        query.append(") ");

        //additional restrictions here
        if (!"".equals(ret.getFirstName().trim())) {
            query.append("and lower(u.first_name) like '" + ret.getFirstName().toLowerCase() + "' ");
        }
        if (!"".equals(ret.getLastName().trim())) {
            query.append("and lower(u.last_name) like '" + ret.getLastName().toLowerCase() + "' ");
        }
        if (!"".equals(ret.getEmailAddress().trim())) {
            query.append("and lower(e.address) like '" + ret.getEmailAddress().toLowerCase() + "' ");
        }

        //load demographic info
        List l = getQuestionList();
        Collections.sort(l);

        ret.setQuestions(l);

        //get the demographic responses
        DemographicQuestion q = null;
        String[] values = null;
        DemographicResponse rs = null;
        String key = null;
        List questionList = getQuestionList();
        //loop through all the questions
        List responses = new ArrayList();

        for (Iterator it = questionList.iterator(); it.hasNext();) {
            q = (DemographicQuestion) it.next();
            key = Constants.DEMOG_PREFIX + q.getId();
            values = getRequest().getParameterValues(key);
            if (values != null) {
                String value = null;
                //loop through all the responses in the request
                for (int i = 0; i < values.length; i++) {
                    value = StringUtils.checkNull(values[i]).trim();
                    if (value.length() > 0) {
                        rs = new DemographicResponse();
                        rs.setQuestionId(q.getId());
                        if (q.getAnswerType() == DemographicQuestion.FREE_FORM) {
                            rs.setText(values[i]);
                            rs.setSort(q.getSort());
                            responses.add(rs);
                            query.append("and exists(select coder_id from demographic_response where coder_id = u.user_id and demographic_question_id = " + q.getId() + " and demographic_response like '" + values[i].toLowerCase() + "') ");
                        } else if (q.getAnswerType() == DemographicQuestion.SINGLE_SELECT ||
                                q.getAnswerType() == DemographicQuestion.MULTIPLE_SELECT) {
                            try {
                                rs.setAnswerId(Long.parseLong(values[i]));
                                rs.setSort(q.getSort());
                                responses.add(rs);
                                query.append("and exists(select coder_id from demographic_response where coder_id = u.user_id and demographic_question_id = " + q.getId() + " and demographic_answer_id in (" + values[i].toLowerCase() + ")) ");
                            } catch (NumberFormatException e) {
                                //skip it, it's invalid, checking will have to pick it up later
                            }
                        } else {
                            throw new Exception("invalid answer type found: " + q.getAnswerType() + " for question " + q.getId());
                        }
                    }
                }
            }
        }

        ret.setResponses(responses);

        countQuery.append("select count(*) as count from table(multiset( ");
        countQuery.append(query.toString());
        countQuery.append("))");

        QueryRequest r = new QueryRequest();
        r.addQuery("search", query.toString());
        r.addQuery("count", countQuery.toString());
        r.setProperty("search" + DataAccessConstants.START_RANK, String.valueOf(ret.getStart()));
        r.setProperty("search" + DataAccessConstants.END_RANK, String.valueOf(ret.getEnd()));


        QueryDataAccess cda = new QueryDataAccess(Constants.DATA_SOURCE);
        //cda.setExpireTime(1); //cache for 15 minutes
        Map res = cda.getData(r);
        ResultSetContainer rsc = (ResultSetContainer) res.get("search");
        ResultSetContainer rscCount = (ResultSetContainer) res.get("count");

        ret.setResults(rsc);
        ret.setTotal(rscCount.getIntItem(0, "count"));
        if (ret.getEnd() > ret.getTotal()) {
            ret.setEnd(ret.getTotal());
        }
        if (ret.getTotal() == 0) {
            ret.setStart(0);
        }

        return ret;
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

    protected static DemographicQuestion findQuestion(long questionId, Map questions) {
        DemographicQuestion ret = null;
        Long id = new Long(questionId);
        if (questions.containsKey(id)) {
            ret = (DemographicQuestion) ((DemographicQuestion) questions.get(id)).clone();
        }
        return ret;
    }

}
