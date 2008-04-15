package com.topcoder.web.tc.controller.request.data;

import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.datafeed.AllColumns;
import com.topcoder.web.common.datafeed.Column;
import com.topcoder.web.common.datafeed.CommandRunner;
import com.topcoder.web.common.datafeed.DataFeeder;
import com.topcoder.web.common.datafeed.RSCDataFeed;
import com.topcoder.web.common.datafeed.RSCParamDataFeed;
import com.topcoder.web.common.security.TCSAuthorization;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.tc.controller.request.Base;
import com.topcoder.web.common.security.DataResource;

import java.util.Map;


/**
 * @author geldridge
 * @version $Revision$ Date: 2008/04/15 00:00:00
 *          Create Date: Apr 15, 2008
 */
public class DistanceFeed extends Base {

    protected void businessProcessing() throws Exception {
        Request r = new Request();
        r.setContentHandle("dd_fast_overlap");
        r.setProperty("cr", getRequest().getParameter("cr"));
        DataAccessInt da = getDataAccess(DBMS.TCS_DW_DATASOURCE_NAME, false);
        CommandRunner cmd = new CommandRunner(da, r);
	Map<String, ResultSetContainer> dm = cmd.getData();
	
	ResultSetContainer rsc = dm.get("dd_fast_overlap");
        getResponse().setContentType("text/xml");
        getResponse().getOutputStream().println("<map>");


	for (ResultSetContainer.ResultSetRow row : rsc) {
		getResponse().getOutputStream().println("<row>" + row.toString() + "</row>");		
	}
	getResponse().getOutputStream().println("</map>");
        getResponse().flushBuffer();
    }
}
