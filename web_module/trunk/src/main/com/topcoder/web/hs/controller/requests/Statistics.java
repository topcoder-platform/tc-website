package com.topcoder.web.hs.controller.requests;

import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;
import com.topcoder.web.hs.model.*;
import com.topcoder.shared.dataAccess.*;
import com.topcoder.shared.util.*;
import com.topcoder.common.web.util.Data;

/**
 * A RequestProcessor which handles statistics pages.  It uses the dataAccess
 * engine to process the query, and then the page named with the same command
 * to render the results.
 *
 * @author Ambrose Feinstein
 */
public class Statistics extends Base {

    static {
        try {
            /* this is only needed once per JVM before calling ProblemParser */
            Data.initializeDataTypes();
        } catch(Exception e) {
            log.error("call from static initializer in statistics processor to Data.initializeDataTypes() failed", e);
        }
    }

    protected void businessProcessing() throws Exception {

        String cmd = request.getParameter(DataAccessConstants.COMMAND);

        /* we do this here so that if the query fails, we still keep our place in the menus */
        nav.setAll("stats", cmd);

        Request dataRequest = new Request(HttpUtils.parseQueryString(((HttpServletRequest)request).getQueryString()));
        request.setAttribute("REQUEST_BEAN", dataRequest);

        DataAccessInt dai = new CachedDataAccess((javax.sql.DataSource)TCContext.getInitial().lookup(DBMS.HS_DW_DATASOURCE_NAME));
        Map dataMap = dai.getData(dataRequest);
        request.setAttribute("QUERY_RESPONSE", dataMap);

        setNextPage("/stats/"+cmd+".jsp");
        setIsNextPageInContext(true);
    }
}
