package com.topcoder.web.tc.controller.request.search;

import com.topcoder.web.tc.controller.request.Base;
import com.topcoder.web.tc.model.MemberSearch;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.StringUtils;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.DataAccessConstants;
import com.topcoder.shared.dataAccess.CachedDataAccess;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;

import java.util.Map;

public class SimpleSearch extends Base {
    protected void businessProcessing() throws TCWebException {

        Request r = new Request();
        r.setContentHandle("member_search");
        try {

            MemberSearch m = buildMemberSearch();

            r.setProperty(DataAccessConstants.START_RANK, m.getStart().toString());
            r.setProperty(DataAccessConstants.END_RANK, m.getEnd().toString());
            if (m.getHandle()!=null) r.setProperty(Constants.HANDLE, m.getHandle());
            if (m.getStateCode()!=null) r.setProperty(Constants.STATE_CODE, m.getStateCode());
            if (m.getMinRating()!=null) r.setProperty(Constants.MIN_RATING, m.getMinRating().toString());
            if (m.getMaxRating()!=null) r.setProperty(Constants.MAX_RATING, m.getMaxRating().toString());
            if (m.getMinNumRatings()!=null) r.setProperty(Constants.MIN_NUM_RATINGS, m.getMinNumRatings().toString());
            if (m.getMaxNumRatings()!=null) r.setProperty(Constants.MAX_NUM_RATINGS, m.getMaxNumRatings().toString());

            CachedDataAccess cda = (CachedDataAccess)getDataAccess(DBMS.DW_DATASOURCE_NAME, true);
            cda.setExpireTime(15*60*1000); //cache for 15 minutes
            Map res = cda.getData(r);

            ResultSetContainer rsc = (ResultSetContainer)res.get("member_search");
            ResultSetContainer count = (ResultSetContainer)res.get("count");
            m.setResults(rsc);
            m.setTotal(count.getIntItem(0, "count"));
            if (m.getEnd().intValue()>m.getTotal()) {
                m.setEnd(new Integer(m.getTotal()));
            }
            getRequest().setAttribute("memberSearch", m);

            setNextPage(Constants.SIMPLE_SEARCH_RESULTS);
            setIsNextPageInContext(true);


        } catch (TCWebException e) {
            throw e;
        } catch (Exception e) {
            throw new TCWebException(e);
        }
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
        else ret.setStart(new Integer(start));

        String end = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.END_RANK));
        if (end.equals(""))
            ret.setEnd(new Integer(Constants.SEARCH_SCROLL_SIZE));
        else ret.setEnd(new Integer(end));

        //make sure we like the size they they're searching for
        if (ret.getEnd().intValue()-ret.getStart().intValue()>(Constants.SEARCH_SCROLL_SIZE-1)) {
            ret.setEnd(new Integer(ret.getStart().intValue()+(Constants.SEARCH_SCROLL_SIZE-1)));
        }

        String handle = StringUtils.checkNull(getRequest().getParameter(Constants.HANDLE));
        if (!handle.equals(""))
            ret.setHandle(handle);

        String stateCode = StringUtils.checkNull(getRequest().getParameter(Constants.STATE_CODE));
        if (!stateCode.equals(""))
            ret.setStateCode(stateCode);

        String minRating = StringUtils.checkNull(getRequest().getParameter(Constants.MIN_RATING));
        if (!minRating.equals(""))
            ret.setMinRating(new Integer(minRating));

        String maxRating = StringUtils.checkNull(getRequest().getParameter(Constants.MAX_RATING));
        if (!maxRating.equals(""))
            ret.setMaxRating(new Integer(maxRating));

        String minNumRatings = StringUtils.checkNull(getRequest().getParameter(Constants.MIN_NUM_RATINGS));
        if (!minNumRatings.equals(""))
            ret.setMinNumRatings(new Integer(minNumRatings));

        String maxNumRatings = StringUtils.checkNull(getRequest().getParameter(Constants.MAX_NUM_RATINGS));
        if (!maxNumRatings.equals(""))
            ret.setMaxNumRatings(new Integer(maxNumRatings));

        ret.setStateList(getStateList());
        ret.setCountryList(getCountryList());

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

}
