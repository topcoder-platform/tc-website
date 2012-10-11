/*
 * Copyright (C) 2012 TopCoder Inc., All Rights Reserved.
 */

package com.topcoder.web.tc.controller.request.bugrace;

import com.topcoder.shared.dataAccess.DataAccessConstants;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer.ResultSetRow;
import com.topcoder.shared.util.ApplicationServer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.TCResourceBundle;
import com.topcoder.web.common.model.SortInfo;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.ejb.email.Email;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.tc.controller.request.Static;

import java.io.PrintWriter;
import java.util.Map;
import java.util.MissingResourceException;
import java.util.HashMap;
import java.util.Iterator;

/**
 * <p>
 * This class is used to retrieve active bug races.
 * </p>
 *
 * @author TrePe
 * @version 1.0
 */
public class ViewActiveBugRaces extends Static {

    /**
     * <p>
     * Processes the request, fills data and gives control to jsp.
     * </p>
     */
    protected void businessProcessing() throws Exception {
        // Gets sort parameters.
        String sortDir = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.SORT_DIRECTION));
        String sortCol = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.SORT_COLUMN));

        setDefault(DataAccessConstants.SORT_DIRECTION, getRequest().getParameter(DataAccessConstants.SORT_DIRECTION));
        setDefault(DataAccessConstants.SORT_COLUMN, getRequest().getParameter(DataAccessConstants.SORT_COLUMN));

        Request dataRequest = new Request();
        dataRequest.setContentHandle("active_bugraces");
        if (!sortCol.equals("") && !sortDir.equals("")) {
            dataRequest.setProperty(DataAccessConstants.SORT_DIRECTION, sortDir);
            dataRequest.setProperty(DataAccessConstants.SORT_COLUMN, sortCol);
        }
        dataRequest.setProperty(DataAccessConstants.SORT_QUERY, "active_bugraces");

        // defines column's default sort.
        SortInfo s = new SortInfo();
        s.addDefault(1, "asc");   // Contest
        s.addDefault(2, "desc");  // Payment
        s.addDefault(3, "desc");  // TCO Points
        s.addDefault(4, "asc");   // Registrants
        s.addDefault(5, "desc");  // Active Since
        getRequest().setAttribute(SortInfo.REQUEST_KEY, s);

        DataAccessInt dai = getDataAccess(DBMS.JIRA_DATASOURCE_NAME, true);
        Map result = dai.getData(dataRequest);

        ResultSetContainer rsc = (ResultSetContainer) result.get(dataRequest.getContentHandle());
        getRequest().setAttribute("contests", rsc);

        setNextPage(Constants.ACTIVE_BUGRACE_COMPETITIONS);
        setIsNextPageInContext(true);

    }
}
