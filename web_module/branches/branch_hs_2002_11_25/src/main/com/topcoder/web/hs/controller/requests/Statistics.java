package com.topcoder.web.hs.controller.requests;

import java.util.*;
import javax.servlet.*;
import com.topcoder.web.hs.model.*;
import com.topcoder.shared.dataAccess.*;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.TCContext;
import com.topcoder.common.web.util.Data;

/**
 * A RequestProcessor which handles statistics pages.  It uses the dataAccess
 * engine to process the query, and then the page named with the same command
 * to render the results.
 *
 * @author Ambrose Feinstein
 */
public class Statistics extends Base {

    protected void businessProcessing() throws Exception {

        Data.initializeDataTypes();
        request.setAttribute("CODER_COLORS", new CoderRatingStyleBean());

        Map map = getParameterMap(request);
        Request dataRequest = new Request(map);
        request.setAttribute("REQUEST_BEAN", dataRequest);

        DataAccessInt dai = new CachedDataAccess((javax.sql.DataSource)TCContext.getInitial().lookup(DBMS.DW_DATASOURCE_NAME));
        Map dataMap = dai.getData(dataRequest);
        request.setAttribute("QUERY_RESPONSE", dataMap);

        String cmd = request.getParameter(DataAccessConstants.COMMAND);

        nav.setFolder(0, "stats");
        nav.setFolder(1, cmd);

        setNextPage("/stats/"+cmd+".jsp");
        setIsNextPageInContext(true);
    }

    /** This exists as a request method, but only in 2.3 or later of the servlet API. */
    private static Map getParameterMap(ServletRequest r) {
        Map m = new HashMap();
        Enumeration e = r.getParameterNames();
        while(e.hasMoreElements()) {
            String s = (String)e.nextElement();
            m.put(s, r.getParameter(s));
        }
        return m;
    }
}
