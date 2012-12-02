/*
 * Copyright (C) 2012 TopCoder Inc., All Rights Reserved.
 */

package com.topcoder.web.tc.controller.request.statistics;

import com.topcoder.json.object.JSONObject;
import com.topcoder.shared.dataAccess.DataAccessConstants;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer.ResultSetRow;
import com.topcoder.shared.util.ApplicationServer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.TCResourceBundle;
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
 * This class is used to retrieve software achievements for given user.
 * Also creates and sends JSON structure for Mozilla Open Badge.
 * </p>
 *
 * <p>
 *   Version 1.1 (TopCoder Mozilla Open Badge Integration 1.0) Change notes:
 *   <ol>
 *     <li>Added creation of JSON structure for given user and badge.</li>
 *   </ol>
 * </p>
 * @author unknown, TrePe
 * @version 1.1
 */
public class Simple extends Static {

    private static TCResourceBundle bundle = new TCResourceBundle("TC");

    public static final String TRANS_FLAG = "trans";

   /**
     * <p>A <code>String</code> representing name of HTTP request parameter to retrieve JSON for badge.</p>
     *
     * @since 1.1
     */
    public static final String EARNED_BADGE_FLAG = "earnedBadge";

    protected void businessProcessing() throws Exception {
        Request dataRequest = new Request();

        Map map = getRequest().getParameterMap();
        HashMap filteredMap = new HashMap();
        Map.Entry me = null;
        for (Iterator it = map.entrySet().iterator(); it.hasNext();) {
            me = (Map.Entry)it.next();
            if (!me.getKey().equals(Constants.MODULE_KEY)&&
                    !me.getKey().equals(DataAccessConstants.SORT_COLUMN)&&
                    !me.getKey().equals(DataAccessConstants.SORT_DIRECTION)) {
                filteredMap.put(me.getKey(), me.getValue());
            }
        }

        dataRequest.setProperties(filteredMap);
        DataAccessInt dai = getDataAccess(getDb(), true);
        Map result = dai.getData(dataRequest);

        ResultSetContainer rsc = (ResultSetContainer) result.get(dataRequest.getContentHandle());

        // if EARNED_BADGE_FLAG parameter is specified, send JSON for MOB
        String earnedBadge = getRequest().getParameter(EARNED_BADGE_FLAG);
        if (earnedBadge != null) {
            // lookup email address for specified user (parameter "cr")
            Long userId = Long.valueOf(getRequest().getParameter("cr"));
            Email emailbean = (Email) createEJB(getInitialContext(), Email.class);
            String email = "";
            long emailId = emailbean.getPrimaryEmailId(userId, DBMS.COMMON_OLTP_DATASOURCE_NAME);
            email = emailbean.getAddress(emailId, DBMS.COMMON_OLTP_DATASOURCE_NAME);

            // find badge for user by id (column 4)
            Iterator<ResultSetRow> iterator = rsc.iterator();
            ResultSetRow found = null;
            Long badgeId = Long.valueOf(earnedBadge);
            while (iterator.hasNext()) {
                ResultSetRow row = iterator.next();
                if (row.getLongItem(4) == badgeId) {
                    found = row;
                    break;
                }
            }

            setIsNextPageInContext(false); // we finish request processing in this method

            getResponse().setContentType("application/json"); // set valid MIME type
            PrintWriter out = getResponse().getWriter();
            if (found == null) {
                // if the badge was not earned by this user
                // it is not specified what to return in this situation
                // but anything else than valid assertion should suffice
                out.print("{ \"error\": \"Badge not earned\" }");
            } else {
                // create the JSON object with assertion
                JSONObject assertion = new JSONObject();
                JSONObject badge = new JSONObject();
                JSONObject issuer = new JSONObject();

                assertion.setString("recipient", email);

                badge.setString("version", "0.0.1");
                badge.setString("name", found.getStringItem(1));
                badge.setString("image", "http://" + ApplicationServer.SERVER_NAME + "/i/badges/badge_" + earnedBadge + ".png");
                badge.setString("description", found.getStringItem(2));
                badge.setString("criteria", "http://topcoder.com/wiki/display/tc/Achievement+Badges");

                issuer.setString("origin", "http://" + ApplicationServer.SERVER_NAME);
                issuer.setString("name", "TopCoder Inc.");

                badge.setNestedObject("issuer", issuer);
                assertion.setNestedObject("badge", badge);

                out.print(assertion.toJSONString().toCharArray());
            }
            out.flush();
            return;
        }

        String sortCol = getRequest().getParameter(DataAccessConstants.SORT_COLUMN);
        String sortDir = getRequest().getParameter(DataAccessConstants.SORT_DIRECTION);
        if (sortCol != null && sortDir != null && rsc != null)
            rsc.sortByColumn(sortCol, sortDir.trim().toLowerCase().equals("asc"));

        getRequest().setAttribute("resultMap", result);

        try {
            String nextPage = bundle.getProperty(dataRequest.getContentHandle());
            setNextPage(nextPage);
            setIsNextPageInContext(true);
        } catch (MissingResourceException e) {
            super.businessProcessing();
        }

    }

    protected String getDb() {
        String ret = DBMS.DW_DATASOURCE_NAME;
        String flag = StringUtils.checkNull(getRequest().getParameter(TRANS_FLAG));
        if (flag.toLowerCase().trim().equals("true")) {
            ret = DBMS.OLTP_DATASOURCE_NAME;
        }
        return ret;
    }


}
