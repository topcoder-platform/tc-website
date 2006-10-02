/*
 * Copyright (c) 2006 TopCoder, Inc. All rights reserved.
 */

package com.topcoder.web.tc.controller.request.statistics;


import com.topcoder.shared.dataAccess.CachedDataAccess;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.security.ClassResource;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.tc.Constants;

import java.util.Map;

/**
 * <strong>Purpose</strong>:
 * A processor to retrieve payment summary.
 *
 * @author pulky
 * @version 1.0
 */
public class PaymentSummary extends BaseProcessor {
    /**
     * The logger to log to.
     */
    private static final Logger log = Logger.getLogger(PaymentSummary.class);

    /**
     * Process the payment summary request.
     * Retrieves the totals for each visible payment type.
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
        
        // Prepare request for data retrieval
        Request r = new Request();
        r.setProperty(Constants.CODER_ID, getRequest().getParameter(Constants.CODER_ID));
        r.setContentHandle("payment_summary");

        // retrieves data from DB
        DataAccessInt dai = new CachedDataAccess(DBMS.DW_DATASOURCE_NAME);
        Map m = dai.getData(r);
        ResultSetContainer summary = (ResultSetContainer) m.get("payment_summary");

        if (log.isDebugEnabled()) {
            log.debug("Got " + summary.size() + " rows for payment summary");
        }

        // sets attributes for the jsp
        getRequest().setAttribute("payment_summary", summary);
        setNextPage(Constants.VIEW_PAYMENT_SUMMARY_PAGE);
        setIsNextPageInContext(true);
    }
}
