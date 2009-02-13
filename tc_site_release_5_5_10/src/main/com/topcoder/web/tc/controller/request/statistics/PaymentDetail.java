/*
 * Copyright (c) 2006 TopCoder, Inc. All rights reserved.
 */

package com.topcoder.web.tc.controller.request.statistics;


import com.topcoder.shared.dataAccess.CachedDataAccess;
import com.topcoder.shared.dataAccess.DataAccessConstants;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.security.ClassResource;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.model.SortInfo;
import com.topcoder.web.tc.Constants;

import java.util.Map;

/**
 * <strong>Purpose</strong>:
 * A processor to retrieve payment details.
 *
 * @author pulky
 * @version 1.0
 */
public class PaymentDetail extends BaseProcessor {
    /**
     * The logger to log to.
     */
    private static final Logger log = Logger.getLogger(PaymentDetail.class);

    /**
     * Process the payment details request.
     * Retrieves the payments of the selected payment type.
     */
    protected void businessProcessing() throws Exception {
        // user should be authenticated.
        if (getUser().isAnonymous()) {
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));
        }

        // Coder ID is required.
        if (!hasParameter(Constants.CODER_ID)) {
            throw new TCWebException("parameter " + Constants.CODER_ID + " expected.");
        }
        
        setDefault(Constants.CODER_ID, getRequest().getParameter(Constants.CODER_ID));

        // Payment type ID is required.
        if (!hasParameter(Constants.PAYMENT_TYPE_ID)) {
            throw new TCWebException("parameter " + Constants.PAYMENT_TYPE_ID + " expected.");
        }
        
        setDefault(Constants.PAYMENT_TYPE_ID, getRequest().getParameter(Constants.PAYMENT_TYPE_ID));

        // Gets the rest of the optional parameters.
        String startRank = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.START_RANK));
        String endRank = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.END_RANK));
        String sortDir = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.SORT_DIRECTION));
        String sortCol = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.SORT_COLUMN));


        // Normalizes optional parameters and sets defaults
        if ("".equals(startRank) || Integer.parseInt(startRank) <= 0) {
            startRank = "1";
        }
        setDefault(DataAccessConstants.START_RANK, startRank);

        if ("".equals(endRank)) {
            endRank = String.valueOf(Integer.parseInt(startRank) + 20); //Constants.DEFAULT_HISTORY);
        } else if (Integer.parseInt(endRank) - Integer.parseInt(startRank) > Constants.MAX_HISTORY) {
            endRank = String.valueOf(Integer.parseInt(startRank) + Constants.MAX_HISTORY);
        }
        setDefault(DataAccessConstants.END_RANK, endRank);

        setDefault(DataAccessConstants.SORT_DIRECTION, getRequest().getParameter(DataAccessConstants.SORT_DIRECTION));
        setDefault(DataAccessConstants.SORT_COLUMN, getRequest().getParameter(DataAccessConstants.SORT_COLUMN));

        // Prepare request for data retrieval
        Request r = new Request();
        if (!(sortCol.equals("") || sortDir.equals(""))) {
            r.setProperty(DataAccessConstants.SORT_DIRECTION, sortDir);
            r.setProperty(DataAccessConstants.SORT_COLUMN, sortCol);
        } else {
            r.setProperty(DataAccessConstants.SORT_DIRECTION, "desc");
            r.setProperty(DataAccessConstants.SORT_COLUMN, "3"); // date_due
        }
        r.setProperty(DataAccessConstants.SORT_QUERY, "payment_detail");
        r.setProperty(Constants.CODER_ID, getRequest().getParameter(Constants.CODER_ID));
        r.setProperty(Constants.PAYMENT_TYPE_ID, getRequest().getParameter(Constants.PAYMENT_TYPE_ID));
        r.setContentHandle("payment_detail");

        // retrieves data from DB
        DataAccessInt dai = new CachedDataAccess(DBMS.DW_DATASOURCE_NAME);
        Map m = dai.getData(r);
        ResultSetContainer details = (ResultSetContainer) m.get("payment_detail");
        if (log.isDebugEnabled()) {
            log.debug("Got " + details.size() + " rows for payment details");
        }

        // crops data
        ResultSetContainer rsc = new ResultSetContainer(details, Integer.parseInt(startRank),
                Integer.parseInt(endRank));

        // sets attributes for the jsp
        SortInfo s = new SortInfo();
        s.addDefault(3, "desc"); //due_date
        getRequest().setAttribute(SortInfo.REQUEST_KEY, s);
        
        getRequest().setAttribute("payment_detail", rsc);
        setNextPage(Constants.VIEW_PAYMENT_DETAIL_PAGE);
        setIsNextPageInContext(true);
    }
}
