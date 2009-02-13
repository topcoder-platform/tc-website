/*
 * Search.java
 *
 * Created on July 13, 2004, 10:54 AM
 */

package com.topcoder.web.corp.controller.request.screening;

import com.topcoder.web.corp.common.Constants;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.corp.controller.request.screening.BaseSessionProcessor;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.corp.model.SearchModel;
import com.topcoder.shared.dataAccess.*;
import com.topcoder.shared.dataAccess.resultSet.*;
import com.topcoder.web.corp.common.Util;
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
        
        getRequest().setAttribute("searchResults", sm);
        
        setNextPage(Constants.SEARCH_RESULTS_PAGE); 
        setIsNextPageInContext(true); 
        } catch (Exception e)
        {
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
        else ret.setStart(Integer.parseInt(start));

        String end = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.END_RANK));
        if (end.equals("")) 
            ret.setEnd(Constants.SEARCH_SCROLL_SIZE); 
        else ret.setEnd(Integer.parseInt(end));

        //make sure we like the size they they're searching for
        if (ret.getEnd()-ret.getStart()>(Constants.SEARCH_SCROLL_SIZE-1)) {
            ret.setEnd(ret.getStart()+(Constants.SEARCH_SCROLL_SIZE-1));
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
	query.append("DATE(s.begin_time) as start_date, ");
	query.append("NVL(TO_CHAR(EXTEND(TODAY) + ");
        query.append("           ((sbm.submit_time - sbm.open_time)/1000) UNITS FRACTION, ");
        query.append("           '%H:%M:%S'),'N/A') as problem_time, ");
	query.append("NVL(cup.level,0) as preference, ");
	query.append("p.problem_id, ");
	query.append("sppx.session_round_id, ");
	query.append("u.user_id, ");
        query.append("s.session_id ");
        query.append("from ");
	query.append("user u, session s, session_profile sp, email e, ");
	query.append("coder c, user_address_xref uax, address a, country ct, coder_type cty, ");
	query.append("session_profile_problem_xref sppx, job_hit jh, job j, ");
	query.append("problem p, OUTER(component_state cs, OUTER( submission sbm)), OUTER(company_user_preference cup) ");
        query.append("where s.user_id = u.user_id ");
	query.append("and sp.session_profile_id = s.session_profile_id ");
	query.append("and e.user_id = u.user_id ");
	query.append("and e.primary = 1 ");
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
	query.append("and sppx.problem_id in (select component_id from session_round_component ");
	query.append("	where session_round_id in ( select session_round_id from company_session_schedule where company_id = sp.company_id ) ) ");
	query.append("and p.problem_id = sppx.problem_id ");
	query.append("and cs.component_id = p.problem_id ");
	query.append("and cs.coder_id = c.coder_id ");
	query.append("and cs.session_id = s.session_id ");
	query.append("and sbm.component_state_id = cs.component_state_id ");
	query.append("and sbm.submission_number = (select max(submission_number) from submission where component_state_id = cs.component_state_id) ");
	query.append("and cup.company_id = sp.company_id ");
	query.append("and cup.user_id = u.user_id ");
	query.append("and sp.company_id = (select company_id from contact where contact_id = ");
        query.append(getUser().getId());
        query.append(") ");
        
        //additional restrictions here
        if(!"".equals(ret.getFirstName().trim()))
        {
            query.append("and u.first_name like '" + ret.getFirstName() + "' ");
        }
        if(!"".equals(ret.getLastName().trim()))
        {
            query.append("and u.last_name like '" + ret.getLastName() + "' ");
        }
        if(!"".equals(ret.getEmailAddress().trim()))
        {
            query.append("and e.address like '" + ret.getEmailAddress() + "' ");
        }
        
        countQuery.append("select count(*) as count from table(multiset( ");
        countQuery.append(query.toString());
        countQuery.append("))");
        
        QueryRequest r = new QueryRequest();
        r.addQuery("search", query.toString());
        r.addQuery("count", countQuery.toString());
        r.setProperty("search"+DataAccessConstants.START_RANK, String.valueOf(ret.getStart()));
        r.setProperty("search"+DataAccessConstants.END_RANK, String.valueOf(ret.getEnd()));

        
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
        if (ret.getTotal()==0) {
            ret.setStart(0);
        }
        
        return ret;
    }
    
}
