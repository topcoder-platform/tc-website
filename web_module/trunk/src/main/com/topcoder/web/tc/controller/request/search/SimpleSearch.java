package com.topcoder.web.tc.controller.request.search;

import com.topcoder.web.tc.controller.request.Base;
import com.topcoder.web.tc.model.MemberSearch;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.common.TCWebException;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.DataAccessConstants;
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

            //todo perhaps we should cache it for a short period of time depending on how paging works
            Map res = getDataAccess(DBMS.DW_DATASOURCE_NAME, false).getData(r);
            ResultSetContainer rsc = (ResultSetContainer)res.get("member_search");
            m.setResults(rsc);
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

        String start = getRequest().getParameter(DataAccessConstants.START_RANK);
        if (start == null)
            ret.setStart(new Integer(1));
        else ret.setStart(new Integer(start));

        String end = getRequest().getParameter(DataAccessConstants.END_RANK);
        if (end == null)
            ret.setEnd(new Integer(Constants.SEARCH_SCROLL_SIZE));
        else ret.setEnd(new Integer(end));

        //make sure we like the size they they're searching for
        if (ret.getEnd().intValue()-ret.getStart().intValue()>(Constants.SEARCH_SCROLL_SIZE-1)) {
            ret.setEnd(new Integer(ret.getStart().intValue()+(Constants.SEARCH_SCROLL_SIZE-1)));
        }

        String handle = getRequest().getParameter(Constants.HANDLE);
        if (handle != null)
            ret.setHandle(handle);

        String stateCode = getRequest().getParameter(Constants.STATE_CODE);
        if (stateCode != null)
            ret.setStateCode(stateCode);

        String minRating = getRequest().getParameter(Constants.MIN_RATING);
        if (minRating != null)
            ret.setMinRating(new Integer(minRating));

        String maxRating = getRequest().getParameter(Constants.MAX_RATING);
        if (maxRating != null)
            ret.setMaxRating(new Integer(maxRating));

        String minNumRatings = getRequest().getParameter(Constants.MIN_NUM_RATINGS);
        if (minNumRatings != null)
            ret.setMinNumRatings(new Integer(minNumRatings));

        String maxNumRatings = getRequest().getParameter(Constants.MAX_NUM_RATINGS);
        if (maxNumRatings != null)
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
