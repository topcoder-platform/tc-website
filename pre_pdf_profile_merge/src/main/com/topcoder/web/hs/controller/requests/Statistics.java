package com.topcoder.web.hs.controller.requests;

import com.topcoder.common.web.util.Data;
import com.topcoder.shared.dataAccess.CachedDataAccess;
import com.topcoder.shared.dataAccess.DataAccessConstants;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.TCWebException;

import javax.servlet.http.HttpUtils;
import java.util.Map;

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
        } catch (Exception e) {
            log.error("call from static initializer in statistics processor to Data.initializeDataTypes() failed", e);
        }
    }

    protected void businessProcessing() throws TCWebException {

        String cmd = getRequest().getParameter(DataAccessConstants.COMMAND);

        /* we do this here so that if the query fails, we still keep our place in the menus */
        nav.setAll("stats", cmd);
        try {
            Request dataRequest = new Request(HttpUtils.parseQueryString(getRequest().getQueryString()));
            getRequest().setAttribute("REQUEST_BEAN", dataRequest);

            DataAccessInt dai = new CachedDataAccess(DBMS.HS_DW_DATASOURCE_NAME);
            Map dataMap = dai.getData(dataRequest);
            getRequest().setAttribute("QUERY_RESPONSE", dataMap);

        } catch (TCWebException e) {
            throw e;
        } catch (Exception e) {
            throw(new TCWebException(e));
        }

        setNextPage("/stats/" + cmd + ".jsp");
        setIsNextPageInContext(true);
    }
}
