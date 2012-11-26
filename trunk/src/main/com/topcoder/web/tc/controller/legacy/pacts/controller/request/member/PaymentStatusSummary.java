package com.topcoder.web.tc.controller.legacy.pacts.controller.request.member;

import java.util.Map;

import com.topcoder.shared.dataAccess.DataAccess;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.web.common.CachedDataAccess;

import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.tc.controller.legacy.pacts.common.PactsConstants;

/**
 * @author  VolodymyrK
 */
public class PaymentStatusSummary extends BaseProcessor implements PactsConstants {

    public static final String PAYMENT_STATUS_SUMMARY = "payment_status_summary";
    public static final String CODER = "cr";
    private static final int TYPE_COL = 1;
    private static final int NET_PAYMENT_COL = 2;
    
    protected void businessProcessing() throws TCWebException {
        try {
            // Prepare request for data retrieval
            Request r = new Request();
            r.setProperty(Constants.CODER_ID, String.valueOf(getUser().getId()));
            r.setContentHandle("payment_status_summary");

            DataAccessInt dai = new CachedDataAccess(DBMS.OLTP_DATASOURCE_NAME);

            Map m = dai.getData(r);
            ResultSetContainer summary = (ResultSetContainer) m.get("payment_status_summary");

            getRequest().setAttribute(PAYMENT_STATUS_SUMMARY, summary);
            setNextPage(PactsConstants.PAYMENT_STATUS_SUMMARY_JSP);
            setIsNextPageInContext(true);
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }

}