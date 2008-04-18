package com.topcoder.web.tc.controller.request.search;

import com.topcoder.shared.dataAccess.DataAccessConstants;
import com.topcoder.shared.dataAccess.QueryRequest;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.CachedQueryDataAccess;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.cache.MaxAge;
import com.topcoder.web.common.model.SortInfo;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.tc.controller.request.Base;
import com.topcoder.web.tc.model.MemberSearch;

import java.util.Map;

public class SimpleSearch extends Base {
    protected void businessProcessing() throws TCWebException {

        try {

            MemberSearch results = getResults();
            getRequest().setAttribute("memberSearch", results);
            if (results.getTotal() == 1) {
                long userId = results.getResults().getLongItem(0, "user_id");
                setNextPage("/tc?module=MemberProfile&cr=" + userId);
                setIsNextPageInContext(false);
            } else {
                setNextPage(Constants.SIMPLE_SEARCH_RESULTS);
                setIsNextPageInContext(true);
            }


        } catch (TCWebException e) {
            throw e;
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }


    protected void setDefaults(MemberSearch m) {
        setDefault(Constants.HANDLE, m.getHandle() == null ? "" : m.getHandle());
        setDefault(DataAccessConstants.SORT_COLUMN, getRequest().getParameter(DataAccessConstants.SORT_COLUMN));
        setDefault(DataAccessConstants.SORT_DIRECTION, getRequest().getParameter(DataAccessConstants.SORT_DIRECTION));

    }


    /**
     * pull the info out of the request and do some error checking
     *
     * @return
     * @throws Exception
     */
    protected MemberSearch buildMemberSearch() throws Exception {
        MemberSearch ret = new MemberSearch();

        String start = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.START_RANK));
        if (start.equals(""))
            ret.setStart(1);
        else
            ret.setStart(new Integer(start));

        String end = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.END_RANK));
        if (end.equals("")) {
            ret.setEnd(new Integer(Constants.SEARCH_SCROLL_SIZE));
        } else
            ret.setEnd(new Integer(end));

        //make sure we like the size they they're searching for
        if (ret.getEnd().intValue() - ret.getStart().intValue() > (Constants.SEARCH_SCROLL_SIZE - 1)) {
            ret.setEnd(ret.getStart().intValue() + (Constants.SEARCH_SCROLL_SIZE - 1));
        }

        String sortCol = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.SORT_COLUMN));
        if (!sortCol.equals("")) {
            ret.setSortCol(new Integer(sortCol));
            ret.setSortAsc("asc".equals(getRequest().getParameter(DataAccessConstants.SORT_DIRECTION)));
        }
        
        String handle = StringUtils.checkNull(getRequest().getParameter(Constants.HANDLE));
        if (!handle.equals(""))
            ret.setHandle(handle);

        return ret;
    }


    protected ResultSetContainer getCountryList() throws TCWebException {
        try {
            Request request = new Request();
            request.setContentHandle("country_list");
            Map map = getDataAccess(DBMS.OLTP_DATASOURCE_NAME, true).getData(request);
            if (map == null)
                throw new Exception("error getting country list from db");
            else
                return (ResultSetContainer) map.get("country_list");
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }

    protected ResultSetContainer getStateList() throws TCWebException {
        try {
            Request request = new Request();
            request.setContentHandle("state_list");
            Map map = getDataAccess(DBMS.OLTP_DATASOURCE_NAME, true).getData(request);
            if (map == null)
                throw new Exception("error getting state list from db");
            else
                return (ResultSetContainer) map.get("state_list");
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }

    protected MemberSearch getResults() throws Exception {
        MemberSearch m = buildMemberSearch();

        StringBuffer queryBottom = new StringBuffer(300);
        queryBottom.append(" FROM coder c");

        boolean needsRating = true;
        boolean needsHSRating = true;
        boolean needsMarRating = true;

        if (m.getMinRating() == null && m.getMaxRating() == null &&
                m.getMinNumRatings() == null && m.getMaxNumRatings() == null &&
                m.getMaxDaysSinceLastComp() == null) {
            queryBottom.append(" , OUTER (algo_rating r, OUTER round ro)");
            needsRating = false;
        } else {
            queryBottom.append(" , algo_rating r");

            if (m.getMaxDaysSinceLastComp() != null) {
                queryBottom.append(" , round ro");
                queryBottom.append(" , calendar cal");
            } else {
                queryBottom.append(" , OUTER round ro");
            }
        }

        if (m.getMinHSRating() == null && m.getMaxHSRating() == null &&
                m.getMinNumHSRatings() == null && m.getMaxNumHSRatings() == null &&
                m.getMaxDaysSinceLastHSComp() == null) {
            queryBottom.append(" , OUTER (algo_rating hsr, OUTER round hsro)");
            needsHSRating = false;
        } else {
            queryBottom.append(" , algo_rating hsr");

            if (m.getMaxDaysSinceLastHSComp() != null) {
                queryBottom.append(" , round hsro");
                queryBottom.append(" , calendar hscal");
            } else {
                queryBottom.append(" , OUTER round hsro");
            }
        }

        if (m.getMinMarRating() == null && m.getMaxMarRating() == null &&
                m.getMinNumMarRatings() == null && m.getMaxNumMarRatings() == null &&
                m.getMaxDaysSinceLastMarComp() == null) {
            queryBottom.append(" , OUTER (algo_rating mmr, OUTER round mmro)");
            needsMarRating = false;
        } else {
            queryBottom.append(" , algo_rating mmr");

            if (m.getMaxDaysSinceLastMarComp() != null) {
                queryBottom.append(" , round mmro");
                queryBottom.append(" , calendar mmcal");
            } else {
                queryBottom.append(" , OUTER round mmro");
            }
        }

        queryBottom.append(" , outer country co");
        if (m.getSchoolName() != null) {
            queryBottom.append(" , school s");
            queryBottom.append(" , current_school cs");
        } else {
            queryBottom.append(" , outer (school s, current_school cs)");
        }
        if (m.getMinDesignRating() == null && m.getMaxDesignRating() == null) {
            queryBottom.append(", outer (tcs_dw:user_rating desr)");
        } else {
            queryBottom.append(", tcs_dw:user_rating desr");
        }
        if (m.getMinDevRating() == null && m.getMaxDevRating() == null) {
            queryBottom.append(", outer (tcs_dw:user_rating devr)");
        } else {
            queryBottom.append(", tcs_dw:user_rating devr");
        }
        queryBottom.append(" WHERE c.coder_id = r.coder_id");
        queryBottom.append(" AND c.coder_id = hsr.coder_id");
        queryBottom.append(" AND c.coder_id = mmr.coder_id");
        queryBottom.append(" AND c.status = 'A'");
        if (m.getStateCode() != null)
            queryBottom.append(" AND c.state_code like '").append(StringUtils.replace(m.getStateCode(), "'", "''")).append("'");
        if (m.getHandle() != null)
            queryBottom.append(" AND c.handle_lower like '").append(StringUtils.replace(m.getHandle(), "'", "''").toLowerCase()).append("'");
        queryBottom.append(" AND r.last_rated_round_id = ro.round_id");
        queryBottom.append(" AND hsr.last_rated_round_id = hsro.round_id");
        queryBottom.append(" AND mmr.last_rated_round_id = mmro.round_id");
        queryBottom.append(betweenFilter("r.rating", m.getMinRating(), m.getMaxRating()));
        queryBottom.append(betweenFilter("hsr.rating", m.getMinHSRating(), m.getMaxHSRating()));
        queryBottom.append(betweenFilter("mmr.rating", m.getMinMarRating(), m.getMaxMarRating()));
        queryBottom.append(betweenFilter("desr.rating", m.getMinDesignRating(), m.getMaxDesignRating()));
        queryBottom.append(betweenFilter("devr.rating", m.getMinDevRating(), m.getMaxDevRating()));
        queryBottom.append(betweenFilter("r.num_ratings", m.getMinNumRatings(), m.getMaxNumRatings()));
        queryBottom.append(betweenFilter("hsr.num_ratings", m.getMinNumHSRatings(), m.getMaxNumHSRatings()));
        queryBottom.append(betweenFilter("mmr.num_ratings", m.getMinNumMarRatings(), m.getMaxNumMarRatings()));
        if (m.getCountryCode() != null)
            queryBottom.append(" AND c.comp_country_code like '").append(StringUtils.replace(m.getCountryCode(), "'", "''")).append("'");
        if (m.getMaxDaysSinceLastComp() != null) {
            queryBottom.append(" AND cal.calendar_id = ro.calendar_id");
            queryBottom.append(" AND cal.date > CURRENT - ").append(m.getMaxDaysSinceLastComp()).append(" UNITS DAY");
        }
        if (m.getMaxDaysSinceLastHSComp() != null) {
            queryBottom.append(" AND hscal.calendar_id = hsro.calendar_id");
            queryBottom.append(" AND hscal.date > CURRENT - ").append(m.getMaxDaysSinceLastHSComp()).append(" UNITS DAY");
        }
        if (m.getMaxDaysSinceLastMarComp() != null) {
            queryBottom.append(" AND mmcal.calendar_id = mmro.calendar_id");
            queryBottom.append(" AND mmcal.date > CURRENT - ").append(m.getMaxDaysSinceLastMarComp()).append(" UNITS DAY");
        }
        queryBottom.append(" AND c.comp_country_code = co.country_code");
        queryBottom.append(" AND s.school_id = cs.school_id");
        queryBottom.append(" AND cs.viewable = 1");
        queryBottom.append(" AND cs.coder_id = c.coder_id");
        if (m.getSchoolName() != null) {
            queryBottom.append(" AND lower(s.name) like lower('").append(StringUtils.replace(m.getSchoolName(), "'", "''")).append("')");
            queryBottom.append(" AND c.coder_type_id = 1");
        }
        queryBottom.append(" AND c.coder_id = desr.user_id");
        queryBottom.append(" AND desr.phase_id = 112");
        queryBottom.append(" AND c.coder_id = devr.user_id");
        queryBottom.append(" AND devr.phase_id = 113");
        queryBottom.append(" AND r.algo_rating_type_id=1");
        queryBottom.append(" AND hsr.algo_rating_type_id=2");
        queryBottom.append(" AND mmr.algo_rating_type_id=3");

        StringBuffer searchQuery = new StringBuffer(400);
        searchQuery.append(" SELECT c.coder_id AS user_id");
        searchQuery.append(" , c.handle");
        searchQuery.append(" , c.handle_lower lower_handle");
        searchQuery.append(" , r.rating as rating");
        searchQuery.append(" , case when co.country_code = '840' then c.state_code else case when c.state_code='ZZ' then '' else c.state_code end end as state_code");
        searchQuery.append(" , r.num_ratings ");
        searchQuery.append(" , (SELECT date FROM calendar cal WHERE cal.calendar_id = ro.calendar_id) AS last_competed");
        searchQuery.append(" , CASE WHEN r.rating > 0 THEN 1 ELSE 2 END AS rating_order");
        searchQuery.append(" , co.country_name");
        searchQuery.append(" , CASE WHEN c.coder_type_id = 2 then null else s.name end as school_name ");
        searchQuery.append(" , desr.rating as design_rating");
        searchQuery.append(" , devr.rating as dev_rating ");
        searchQuery.append(" , hsr.rating as hs_rating");
        searchQuery.append(" , hsr.num_ratings as num_hs_ratings");
        searchQuery.append(" , (SELECT date FROM calendar cal WHERE cal.calendar_id = hsro.calendar_id) AS last_hs_competed");
        searchQuery.append(" , mmr.rating as mm_rating");
        searchQuery.append(" , mmr.num_ratings as num_mm_ratings");
        searchQuery.append(" , (SELECT date FROM calendar cal WHERE cal.calendar_id = mmro.calendar_id) AS last_mm_competed");
        searchQuery.append(" , (select max(num_ratings) from tcs_dw:project_result pr, tcs_dw:project p "); 
        searchQuery.append("      where p.project_id = pr.project_id  ");
        searchQuery.append("      and phase_id = 112 ");
        searchQuery.append("      and user_id = c.coder_id) as num_des_ratings ");       
        searchQuery.append(" , (select max(rating_date)  from tcs_dw:project_result pr, tcs_dw:project p "); 
        searchQuery.append("     where p.project_id = pr.project_id "); 
        searchQuery.append("     and phase_id = 112 ");
        searchQuery.append("     and rating_ind = 1 ");
        searchQuery.append("     and user_id = c.coder_id) as last_des_competed ");
        searchQuery.append(" , (select max(num_ratings) from tcs_dw:project_result pr, tcs_dw:project p "); 
        searchQuery.append("      where p.project_id = pr.project_id  ");
        searchQuery.append("      and phase_id = 113 ");
        searchQuery.append("      and user_id = c.coder_id) as num_dev_ratings ");       
        searchQuery.append(" , (select max(rating_date)  from tcs_dw:project_result pr, tcs_dw:project p "); 
        searchQuery.append("     where p.project_id = pr.project_id "); 
        searchQuery.append("     and phase_id = 113 ");
        searchQuery.append("     and rating_ind = 1 ");
        searchQuery.append("     and user_id = c.coder_id) as last_dev_competed ");
        
        searchQuery.append(queryBottom.toString());
        if (m.getSortCol() == null) {
            searchQuery.append(" ORDER BY rating_order, lower_handle");
        } else {
            searchQuery.append(" ORDER BY " + (m.getSortCol() + 1)  + (m.isSortAsc()? " asc" : " desc") + ", rating_order, lower_handle");
        }

        StringBuffer filter = new StringBuffer(400);
        filter.append(" WHERE c.status = 'A'");

        StringBuffer countQuery = new StringBuffer(400);
        countQuery.append(" SELECT count(*) as count ");
        countQuery.append(" FROM coder c");

        if (needsRating) {
            countQuery.append(" , algo_rating r");

            filter.append(" AND r.algo_rating_type_id=1");
            filter.append(" AND c.coder_id = r.coder_id");
        }

        if (m.getMaxDaysSinceLastComp() != null) {
            countQuery.append(" , round ro");
            countQuery.append(" , calendar cal");

            filter.append(" AND r.last_rated_round_id = ro.round_id");
            filter.append(" AND cal.calendar_id = ro.calendar_id");
            filter.append(" AND cal.date > CURRENT - ").append(m.getMaxDaysSinceLastComp()).append(" UNITS DAY");
        }

        if (m.getMaxDaysSinceLastHSComp() != null) {
            countQuery.append(" , round hsro");
            countQuery.append(" , calendar hscal");

            filter.append(" AND hsr.last_rated_round_id = hsro.round_id");
            filter.append(" AND hscal.calendar_id = hsro.calendar_id");
            filter.append(" AND hscal.date > CURRENT - ").append(m.getMaxDaysSinceLastHSComp()).append(" UNITS DAY");
        }

        if (m.getMaxDaysSinceLastMarComp() != null) {
            countQuery.append(" , round mmro");
            countQuery.append(" , calendar mmcal");

            filter.append(" AND mmr.last_rated_round_id = mmro.round_id");
            filter.append(" AND mmcal.calendar_id = mmro.calendar_id");
            filter.append(" AND mmcal.date > CURRENT - ").append(m.getMaxDaysSinceLastMarComp()).append(" UNITS DAY");
        }

        
        if (needsHSRating) {
            countQuery.append(" , algo_rating hsr");
            filter.append(" AND c.coder_id = hsr.coder_id");
            filter.append(" AND hsr.algo_rating_type_id=2");
        }

        if (needsMarRating) {
            countQuery.append(" , algo_rating mmr");
            filter.append(" AND c.coder_id = mmr.coder_id");
            filter.append(" AND mmr.algo_rating_type_id=3");
        }

        if (m.getSchoolName() != null) {
            countQuery.append(" , school s");
            countQuery.append(" , current_school cs");

            filter.append(" AND s.school_id = cs.school_id");
            filter.append(" AND cs.viewable = 1");
            filter.append(" AND cs.coder_id = c.coder_id");
            filter.append(" AND lower(s.name) like lower('").append(StringUtils.replace(m.getSchoolName(), "'", "''")).append("')");
            filter.append(" AND c.coder_type_id = 1");
        }

        if (!(m.getMinDesignRating() == null && m.getMaxDesignRating() == null)) {
            countQuery.append(", tcs_dw:user_rating desr");
            filter.append(" AND c.coder_id = desr.user_id");
            filter.append(" AND desr.phase_id = 112");
        }

        if (!(m.getMinDevRating() == null && m.getMaxDevRating() == null)) {
            countQuery.append(", tcs_dw:user_rating devr");
            filter.append(" AND c.coder_id = devr.user_id");
            filter.append(" AND devr.phase_id = 113");
        }

        if (m.getStateCode() != null)
            filter.append(" AND c.state_code like '").append(StringUtils.replace(m.getStateCode(), "'", "''")).append("'");

        if (m.getHandle() != null)
            filter.append(" AND c.handle_lower like '").append(StringUtils.replace(m.getHandle(), "'", "''").toLowerCase()).append("'");


        filter.append(betweenFilter("r.rating", m.getMinRating(), m.getMaxRating()));
        filter.append(betweenFilter("hsr.rating", m.getMinHSRating(), m.getMaxHSRating()));
        filter.append(betweenFilter("mmr.rating", m.getMinMarRating(), m.getMaxMarRating()));
        filter.append(betweenFilter("desr.rating", m.getMinDesignRating(), m.getMaxDesignRating()));
        filter.append(betweenFilter("devr.rating", m.getMinDevRating(), m.getMaxDevRating()));
        filter.append(betweenFilter("r.num_ratings", m.getMinNumRatings(), m.getMaxNumRatings()));
        filter.append(betweenFilter("hsr.num_ratings", m.getMinNumHSRatings(), m.getMaxNumHSRatings()));
        filter.append(betweenFilter("mmr.num_ratings", m.getMinNumMarRatings(), m.getMaxNumMarRatings()));
        if (m.getCountryCode() != null)
            filter.append(" AND c.comp_country_code like '").append(StringUtils.replace(m.getCountryCode(), "'", "''")).append("'");

        countQuery.append(filter);

        log.debug("count query: " + countQuery.toString());
        log.debug("search query: " + searchQuery.toString());
        
        QueryRequest r = new QueryRequest();
        r.addQuery("member_search", searchQuery.toString());
        r.addQuery("count", countQuery.toString());
        r.setProperty("member_search" + DataAccessConstants.START_RANK, m.getStart().toString());
        r.setProperty("member_search" + DataAccessConstants.END_RANK, m.getEnd().toString());


        CachedQueryDataAccess cda = new CachedQueryDataAccess(MaxAge.QUARTER_HOUR, DBMS.DW_DATASOURCE_NAME);
        Map<String, ResultSetContainer> res = cda.getData(r);
        ResultSetContainer rsc = res.get("member_search");
                
        ResultSetContainer count = res.get("count");
        m.setResults(rsc);
        m.setTotal(count.getIntItem(0, "count"));
        if (m.getEnd() > m.getTotal()) {
            m.setEnd(m.getTotal());
        }
        if (m.getTotal() == 0) {
            m.setStart(0);
        }
        
        SortInfo s = new SortInfo();
        s.addDefault(rsc.getColumnIndex("rating"), "desc");            
        s.addDefault(rsc.getColumnIndex("num_ratings"), "desc");            
        s.addDefault(rsc.getColumnIndex("last_competed"), "desc");            
        s.addDefault(rsc.getColumnIndex("design_rating"), "desc");            
        s.addDefault(rsc.getColumnIndex("num_des_ratings"), "desc");            
        s.addDefault(rsc.getColumnIndex("last_des_competed"), "desc");            
        s.addDefault(rsc.getColumnIndex("dev_rating"), "desc");            
        s.addDefault(rsc.getColumnIndex("num_dev_ratings"), "desc");            
        s.addDefault(rsc.getColumnIndex("last_dev_competed"), "desc");            
        s.addDefault(rsc.getColumnIndex("hs_rating"), "desc");            
        s.addDefault(rsc.getColumnIndex("num_hs_ratings"), "desc");            
        s.addDefault(rsc.getColumnIndex("last_hs_competed"), "desc");            
        s.addDefault(rsc.getColumnIndex("mm_rating"), "desc");            
        s.addDefault(rsc.getColumnIndex("num_mm_ratings"), "desc");            
        s.addDefault(rsc.getColumnIndex("last_mm_competed"), "desc");            
        getRequest().setAttribute(SortInfo.REQUEST_KEY, s);

        
        return m;
    }

    private String betweenFilter(String field, Integer from, Integer to) {
        if (from == null && to == null) return "";

        StringBuffer str = new StringBuffer(100);
        str.append(" AND ").append(field).append(" BETWEEN ");
        str.append(from == null ? "0" : from.toString());
        str.append(" AND ");
        str.append(to == null ? String.valueOf(Integer.MAX_VALUE) : to.toString());
        return str.toString();
    }
}
