/*
 * Search.java
 *
 * Created on July 13, 2004, 10:54 AM
 */

package com.topcoder.web.corp.controller.request.screening;

import com.topcoder.shared.dataAccess.DataAccessConstants;
import com.topcoder.shared.dataAccess.QueryDataAccess;
import com.topcoder.shared.dataAccess.QueryRequest;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.corp.common.Constants;
import com.topcoder.web.corp.model.SearchModel;

import java.util.Map;

/**
 * @author rfairfax
 */
public class SearchResults extends BaseScreeningProcessor {

    protected void screeningProcessing() throws com.topcoder.web.common.TCWebException {

        try {
            SearchModel sm = getSearchModel();

            setDefault(Constants.FIRST_NAME, sm.getFirstName());
            setDefault(Constants.LAST_NAME, sm.getLastName());
            setDefault(Constants.EMAIL_ADDRESS, sm.getEmailAddress());

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
}
