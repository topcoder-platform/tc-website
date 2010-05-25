/*
 * Copyright (c) 2006 TopCoder, Inc. All rights reserved.
 */

package com.topcoder.web.tc.controller.request.statistics;


import com.topcoder.shared.dataAccess.DataAccessConstants;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultFilter;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer.ResultSetRow;
import com.topcoder.shared.security.ClassResource;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.*;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.model.Preference;
import com.topcoder.web.common.model.SortInfo;
import com.topcoder.web.common.model.UserPreference;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.tc.controller.legacy.pacts.common.PactsConstants;

import java.util.HashMap;
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
        
        setDefault(Constants.CODER_ID, getRequest().getParameter(Constants.CODER_ID));

        // Payment type ID is required.
        if (!hasParameter(Constants.PAYMENT_TYPE_ID)) {
            throw new TCWebException("parameter " + Constants.PAYMENT_TYPE_ID + " expected.");
        }
        int typeId = Integer.parseInt(getRequest().getParameter(Constants.PAYMENT_TYPE_ID));

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
            endRank = String.valueOf(Integer.parseInt(startRank) + 20 - 1); //Constants.DEFAULT_HISTORY);
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

        if (typeId == PactsConstants.COMPONENT_PAYMENT) {
            // Add all the non Dev Support payment references to refIds list
            Map refIds = new HashMap();
            Map devSupport = new HashMap();
            //int []childs = new int[rsc.size()];

            // First pass: add all non dev support to the map
            for (int i = 0; i < details.size(); i++) {
                if (details.getStringItem(i, "payment_desc").contains("- Design") &&
                        details.getItem(i, "reference_id").getResultData() != null) {
                    refIds.put(new Long(details.getLongItem(i, "reference_id")), new Integer(i));
                }
            }
            // Second pass: process the dev supports
            for (int i = 0; i < details.size(); i++) {
                if (details.getStringItem(i, "payment_desc").contains("- Development Support")) {
                    Integer parent = (Integer) refIds.get(new Long(details.getLongItem(i, "reference_id")));
                    if (parent != null) {
                        devSupport.put(new Long(details.getLongItem(i, "reference_id")), details.getRow(i));
                    }
                }
            }

            details = new ResultSetContainer(details, new DevSupportFilter(devSupport));
            getRequest().setAttribute("dev_support", devSupport);
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

    private static class DevSupportFilter implements ResultFilter {

        private Map devSupport;

        public DevSupportFilter(Map devSupport) {
            this.devSupport = devSupport;
        }

        public boolean include(ResultSetRow rsr) {
            return !(rsr.getStringItem("payment_desc").contains("- Development Support") &&
                    devSupport.containsKey(new Long(rsr.getLongItem("reference_id"))));

        }

    }
}
