/*
 * Copyright (C) 2013 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc.controller.request.cs;

import com.topcoder.shared.dataAccess.DataAccess;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.ShortHibernateProcessor;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

/**
 * <p>
 * Show spin results page.
 * </p>
 *
 * <p>
 * Thread safety: The controller instances will be created for the new requests, thus there won't be multiple
 * threads using the same controller instance.Thus there's no thread-safety concern.
 * </p>
 *
 * <p>
 *   Version 1.0 (Release Assembly - Porting CS Mashathon pages to TopCoder website) Change notes:
 *   <ol>
 *      <li>The first version of this processor.</li>
 *   </ol>
 * </p>
 *
 * @author TCSASSEMBLER
 * @version 1.0
 */
public class SpinResults extends ShortHibernateProcessor {
    /**
     * The class name.
     */
    private final static String CLASS_NAME = SpinResults.class.getName();

    /**
     * The query name of retrieving all spin results.
     */
    private final static String SPIN_RESULT_QUERY = "spin_results";

    /**
     * The process method. Retrieving all spin results here.
     *
     * @throws Exception if error occurs when write to response.
     */
    protected void dbProcessing() throws Exception {
        log.debug("Enter method " + CLASS_NAME + "#dbProcessing().");

        Map<String, String> spinResults = new TreeMap<String, String>();

        Request r = new Request();
        r.setContentHandle(SPIN_RESULT_QUERY);
        ResultSetContainer rsc = new DataAccess(DBMS.OLTP_DATASOURCE_NAME).getData(r).get(SPIN_RESULT_QUERY);
        for (int i = 0; i < rsc.getRowCount(); i++) {
            ResultSetContainer.ResultSetRow row = rsc.getRow(i);
            String handle = row.getStringItem("handle");
            Long userId = row.getLongItem("user_id");
            String apiName = row.getStringItem("api_name");

            if (!spinResults.containsKey(handle)) {
                spinResults.put(handle, String.valueOf(userId) + "=");
            }
            spinResults.put(handle, spinResults.get(handle) + ", " + apiName);
        }

        List<Long> users = new ArrayList<Long>();
        List<String> apis = new ArrayList<String>();

        for (String v : spinResults.values()) {
            String[] items = v.split("=");
            users.add(Long.parseLong(items[0]));
            apis.add(items[1].substring(", ".length()));
        }
        getRequest().setAttribute("users", users);
        getRequest().setAttribute("apis", apis);
        setNextPage("/cs/spin_results.jsp");
        setIsNextPageInContext(true);

        log.debug("Leave method " + CLASS_NAME + "#dbProcessing().");
    }
}
