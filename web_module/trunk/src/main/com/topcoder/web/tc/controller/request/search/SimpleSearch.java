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

        try {

            getRequest().setAttribute("memberSearch", getResults());
            setNextPage(Constants.SIMPLE_SEARCH_RESULTS);
            setIsNextPageInContext(true);


        } catch (TCWebException e) {
            throw e;
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }


    protected void setDefaults(MemberSearch m) {
        if (m.getHandle()!=null) setDefault(Constants.HANDLE, m.getHandle());
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
        Request r = new Request();
        r.setContentHandle("member_search");
        r.setProperty(DataAccessConstants.START_RANK, m.getStart().toString());
        r.setProperty(DataAccessConstants.END_RANK, m.getEnd().toString());
        if (m.getHandle()!=null) r.setProperty(Constants.HANDLE, m.getHandle());
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
        return m;
    }

}
