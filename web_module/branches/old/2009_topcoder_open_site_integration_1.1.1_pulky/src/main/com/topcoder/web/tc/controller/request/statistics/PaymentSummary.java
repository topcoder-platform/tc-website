/*
 * Copyright (c) 2006 TopCoder, Inc. All rights reserved.
 */

package com.topcoder.web.tc.controller.request.statistics;


import com.topcoder.shared.dataAccess.DataAccessConstants;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.security.ClassResource;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.*;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.model.Preference;
import com.topcoder.web.common.model.SortInfo;
import com.topcoder.web.common.model.UserPreference;
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

        // don't check privacy if the user is looking at his own info
        if (getUser().getId() != Long.parseLong(getRequest().getParameter(Constants.CODER_ID))) {
            if (!DAOUtil.useQueryToolFactory) {
                HibernateUtils.getSession().beginTransaction();
            }
            UserPreference up = DAOUtil.getQueryToolFactory().getUserPreferenceDAO().find(Long.parseLong(getRequest().getParameter(Constants.CODER_ID)), Preference.SHOW_EARNINGS_PREFERENCE_ID);
            if (up != null && "hide".equals(up.getValue())) {
                throw new NavigationException("Sorry, " + up.getId().getUser().getHandle() + " has chosen to hide this information.");
            }
        }
        
        // Gets the rest of the optional parameters.
        String sortDir = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.SORT_DIRECTION));
        String sortCol = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.SORT_COLUMN));

        setDefault(DataAccessConstants.SORT_DIRECTION, getRequest().getParameter(DataAccessConstants.SORT_DIRECTION));
        setDefault(DataAccessConstants.SORT_COLUMN, getRequest().getParameter(DataAccessConstants.SORT_COLUMN));

        // Prepare request for data retrieval
        Request r = new Request();
        if (!(sortCol.equals("") || sortDir.equals(""))) {
            r.setProperty(DataAccessConstants.SORT_DIRECTION, sortDir);
            r.setProperty(DataAccessConstants.SORT_COLUMN, sortCol);
        } else {
            r.setProperty(DataAccessConstants.SORT_DIRECTION, "asc");
            r.setProperty(DataAccessConstants.SORT_COLUMN, "0"); // payment_type_desc
        }
        r.setProperty(DataAccessConstants.SORT_QUERY, "payment_summary");
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
        SortInfo s = new SortInfo();
        s.addDefault(0, "asc"); //due_date
        getRequest().setAttribute(SortInfo.REQUEST_KEY, s);

        getRequest().setAttribute("payment_summary", summary);
        setNextPage(Constants.VIEW_PAYMENT_SUMMARY_PAGE);
        setIsNextPageInContext(true);
    }
}
