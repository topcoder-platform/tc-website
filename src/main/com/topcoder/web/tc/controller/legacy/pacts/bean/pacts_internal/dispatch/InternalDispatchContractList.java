/******************************************************************************\
 *
 * File:          InternalDispatchContrctList.java
 * Creation date: March 11, 2002 19:32
 * Author:        Matt Murphy
 *
 * Modifications: @INSERT_MODIFICATIONS(* )
 *
 * Copyright 2002, TopCoder, Inc
 * All rights are reserved. Reproduction in whole or part is prohibited
 * without the written consent of the copyright owner.
 *
 \******************************************************************************/

package com.topcoder.web.tc.controller.legacy.pacts.bean.pacts_internal.dispatch;

import com.topcoder.web.tc.controller.legacy.pacts.bean.DataInterfaceBean;
import com.topcoder.web.tc.controller.legacy.pacts.common.ContractHeader;
import com.topcoder.web.tc.controller.legacy.pacts.common.ContractHeaderList;
import com.topcoder.web.tc.controller.legacy.pacts.common.PactsConstants;
import com.topcoder.web.tc.controller.legacy.pacts.common.TCData;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Hashtable;
import java.util.Map;

public class InternalDispatchContractList implements PactsConstants {
    HttpServletRequest request;
    HttpServletResponse response;

    public InternalDispatchContractList(HttpServletRequest request,
                                        HttpServletResponse response) {

        this.request = request;
        this.response = response;
    }

    /**
     *
     * This method returns an array of AffidavitHeaders that match the search criteria.
     * The criteria are found in the cgi variables of request.
     * Method assumes at least one search parameter exists.
     *
     * @Args    - none
     * @Returns - ContractHeader[]
     *
     */
    public ContractHeader[] get() throws Exception {
        Map query = new Hashtable();
        String param;

/*
    public static final String EARLIEST_START_DATE = "earliest_start_date";
    public static final String LATEST_START_DATE = "latest_start_date";
    public static final String EARLIEST_END_DATE = "earliest_end_date";
    public static final String LATEST_END_DATE = "latest_end_date";
    // dpecora - these are duplicates of above start/end date searches
    // (EARLIEST_ACTIVE_DATE = LATEST_END_DATE, LATEST_ACTIVE_DATE = EARLIEST_START_DATE)
    // public static final String EARLIEST_ACTIVE_DATE = "earliest_active_date";
    // public static final String LATEST_ACTIVE_DATE = "latest_active_date";
    public static final String CONTRACT_NAME = "contract_name";
*/

        param = request.getParameter(STATUS_CODE);
        if (param != null && !param.equals("")) query.put(STATUS_CODE, param);
        param = request.getParameter(TYPE_CODE);
        if (param != null && !param.equals("")) query.put(TYPE_CODE, param);
        param = request.getParameter(EARLIEST_CREATION_DATE);
        if (param != null && !param.equals("")) query.put(EARLIEST_CREATION_DATE, TCData.dateForm(param));
        param = request.getParameter(LATEST_CREATION_DATE);
        if (param != null && !param.equals("")) query.put(LATEST_CREATION_DATE, TCData.dateForm(param));
        param = request.getParameter(PAYMENT_ID);
        if (param != null && !param.equals("")) query.put(PAYMENT_ID, param);
        param = request.getParameter(CONTRACT_ID);
        if (param != null && !param.equals("")) query.put(CONTRACT_ID, param);
        param = request.getParameter(USER_ID);
        if (param != null && !param.equals("")) query.put(USER_ID, param);
        param = request.getParameter(HANDLE);
        if (param != null && !param.equals("")) query.put(HANDLE, param);
        param = request.getParameter(EARLIEST_START_DATE);
        if (param != null && !param.equals("")) query.put(EARLIEST_START_DATE, TCData.dateForm(param));
        param = request.getParameter(EARLIEST_END_DATE);
        if (param != null && !param.equals("")) query.put(EARLIEST_END_DATE, TCData.dateForm(param));
        param = request.getParameter(LATEST_START_DATE);
        if (param != null && !param.equals("")) query.put(LATEST_START_DATE, TCData.dateForm(param));
        param = request.getParameter(LATEST_END_DATE);
        if (param != null && !param.equals("")) query.put(LATEST_END_DATE, TCData.dateForm(param));
        param = request.getParameter(CONTRACT_NAME);
        if (param != null && !param.equals("")) query.put(CONTRACT_NAME, param);


        DataInterfaceBean bean = new DataInterfaceBean();

        Map results = bean.findContracts(query);

        if (results == null) return new ContractHeader[0];

        ContractHeaderList chl = new ContractHeaderList(results);

        return chl.headerList;
    }
}

;
