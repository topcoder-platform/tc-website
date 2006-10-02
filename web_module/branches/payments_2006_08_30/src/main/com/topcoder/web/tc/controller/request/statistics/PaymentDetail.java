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
public class PaymentDetail extends BaseProcessor {
    /**
     * The logger to log to.
     */
    private static final Logger log = Logger.getLogger(PaymentDetail.class);

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
        
        // Payment type ID is required.
        if (!hasParameter(Constants.PAYMENT_TYPE_ID)) {
            throw new TCWebException("parameter " + Constants.PAYMENT_TYPE_ID + " expected.");
        }
        
        String paymentType = getRequest().getParameter(Constants.PAYMENT_TYPE_ID);
        
        // Payment type should be viewable and admit details
        if (!validPaymentType(paymentType)) {
            throw new TCWebException("invalid parameter " + Constants.PAYMENT_TYPE_ID);
        }
        
        // Prepare request for data retrieval
        Request r = new Request();
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

        // sets attributes for the jsp
        getRequest().setAttribute("payment_detail", details);
        setNextPage(Constants.VIEW_PAYMENT_DETAIL_PAGE);
        setIsNextPageInContext(true);
    }

    private boolean validPaymentType(String paymentType) throws Exception {
        Request r = new Request();
        r.setProperty(Constants.PAYMENT_TYPE_ID, paymentType);
        r.setContentHandle("valid_payment_type");

        // retrieves data from DB
        DataAccessInt dai = new CachedDataAccess(DBMS.DW_DATASOURCE_NAME);
        Map m = dai.getData(r);
        if (((ResultSetContainer) m.get("valid_payment_type")).getRowCount() > 0){
            return true;            
        } else {
            return false;
        }
    }
}
