package com.topcoder.web.tc.controller.request.search;

import com.topcoder.shared.dataAccess.CachedQueryDataAccess;
import com.topcoder.shared.dataAccess.DataAccessConstants;
import com.topcoder.shared.dataAccess.QueryRequest;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.TCWebException;
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
                setNextPage("/stat?c=member_profile&cr=" + userId);
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
    }


    /**
     * pull the info out of the request and do some error checking
     * @return
     * @throws Exception
     */
    protected MemberSearch buildMemberSearch() throws Exception {
        MemberSearch ret = new MemberSearch();

        String start = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.START_RANK));
        if (start.equals(""))
            ret.setStart(new Integer(1));
        else
            ret.setStart(new Integer(start));

        String end = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.END_RANK));
        if (end.equals(""))
            ret.setEnd(new Integer(Constants.SEARCH_SCROLL_SIZE));
        else
            ret.setEnd(new Integer(end));

        //make sure we like the size they they're searching for
        if (ret.getEnd().intValue() - ret.getStart().intValue() > (Constants.SEARCH_SCROLL_SIZE - 1)) {
            ret.setEnd(new Integer(ret.getStart().intValue() + (Constants.SEARCH_SCROLL_SIZE - 1)));
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
        queryBottom.append(" , rating r");
        if (m.getMaxDaysSinceLastComp() != null) {
            queryBottom.append(" , round ro");
            queryBottom.append(" , calendar cal");
        } else {
            queryBottom.append(" , OUTER round ro");
        }
        queryBottom.append(" , country co");
        queryBottom.append(" WHERE c.coder_id = r.coder_id");
        queryBottom.append(" AND c.status = 'A'");
        if (m.getStateCode() != null)
            queryBottom.append(" AND c.state_code like '").append(StringUtils.replace(m.getStateCode(), "'", "''")).append("'");
        if (m.getHandle() != null)
            queryBottom.append(" AND LOWER(c.handle) like LOWER('").append(StringUtils.replace(m.getHandle(), "'", "''")).append("')");
        queryBottom.append(" AND r.last_rated_round_id = ro.round_id");
        queryBottom.append(" AND r.rating BETWEEN ");
        queryBottom.append(m.getMinRating() == null ? "0" : m.getMinRating().toString());
        queryBottom.append(" AND ");
        queryBottom.append(m.getMaxRating() == null ? String.valueOf(Integer.MAX_VALUE) : m.getMaxRating().toString());
        queryBottom.append(" AND r.num_ratings BETWEEN ");
        queryBottom.append(m.getMinNumRatings() == null ? "0" : m.getMinNumRatings().toString());
        queryBottom.append(" AND ");
        queryBottom.append(m.getMaxNumRatings() == null ? String.valueOf(Integer.MAX_VALUE) : m.getMaxNumRatings().toString());
        if (m.getCountryCode() != null)
            queryBottom.append(" AND c.comp_country_code like '").append(StringUtils.replace(m.getCountryCode(), "'", "''")).append("'");
        if (m.getMaxDaysSinceLastComp() != null) {
            queryBottom.append(" AND cal.calendar_id = ro.calendar_id");
            queryBottom.append(" AND cal.date > CURRENT - ").append(m.getMaxDaysSinceLastComp()).append(" UNITS DAY");
        }
        queryBottom.append(" AND c.comp_country_code = co.country_code");


        StringBuffer searchQuery = new StringBuffer(400);
        searchQuery.append(" SELECT c.coder_id AS user_id");
        searchQuery.append(" , c.handle");
        searchQuery.append(" , LOWER(c.handle) lower_handle");
        searchQuery.append(" , r.rating");
        searchQuery.append(" , case when co.country_code = '840' then c.state_code else case when c.state_code='ZZ' then '' else c.state_code end end as state_code");
        searchQuery.append(" , r.num_ratings");
        searchQuery.append(" , (SELECT date FROM calendar cal WHERE cal.calendar_id = ro.calendar_id) AS last_competed");
        searchQuery.append(" , CASE WHEN r.rating > 0 THEN 1 ELSE 2 END AS rating_order");
        searchQuery.append(" , co.country_name");
        searchQuery.append(queryBottom.toString());
        searchQuery.append(" ORDER BY rating_order, lower_handle");

        StringBuffer countQuery = new StringBuffer(400);
        countQuery.append(" SELECT count(*) as count ");
        countQuery.append(queryBottom.toString());

        QueryRequest r = new QueryRequest();
        r.addQuery("member_search", searchQuery.toString());
        r.addQuery("count", countQuery.toString());
        r.setProperty("member_search" + DataAccessConstants.START_RANK, m.getStart().toString());
        r.setProperty("member_search" + DataAccessConstants.END_RANK, m.getEnd().toString());


        CachedQueryDataAccess cda = new CachedQueryDataAccess(DBMS.DW_DATASOURCE_NAME);
        cda.setExpireTime(15 * 60 * 1000); //cache for 15 minutes
        Map res = cda.getData(r);
        ResultSetContainer rsc = (ResultSetContainer) res.get("member_search");
        ResultSetContainer count = (ResultSetContainer) res.get("count");
        m.setResults(rsc);
        m.setTotal(count.getIntItem(0, "count"));
        if (m.getEnd().intValue() > m.getTotal()) {
            m.setEnd(new Integer(m.getTotal()));
        }
        if (m.getTotal() == 0) {
            m.setStart(new Integer(0));
        }
        return m;
    }

}
